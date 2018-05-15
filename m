Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 87F037498E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 15:43:31 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id u8-v6so411054vku.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KqRGD2IF/6UwKESLSJgEkS3zPgw0vsw2ZHrVnhsYwUk=;
	b=lwb6+bwNC7ENxp3n5jaq1oQ14+tZUzBkzAhYoupsmb3EL+jMOEcg4xUtMhVP/V0904
	XoSlZspE6KhGCHDv6eyOp6bwScRb3poO8vrnCDZM9Ylk17eSdBjArWElsTwkMA1UeL4f
	pthXEtoTdzTnxrndO4XdH6CIIX4bGaKq98CeK39Xt369NSK/9MI4IPImJ3yGKMNZGb9P
	cy4r6DOuJRaWtJHb5tavuqok9sQrngevBBkne3w93A5H6++qa3RZLRI5QxT7rHdhu15z
	md50+IOXhFExORcXk+KlLdQ/6yP/9Pz210qU2IRPH7DYjAmwm6vbw0ex1XNsVSl4Znd4
	MHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KqRGD2IF/6UwKESLSJgEkS3zPgw0vsw2ZHrVnhsYwUk=;
	b=T0FkbXLqXago6kQNIRv8uYEJFD2X1r8TQdPj/hnQsEgM9og/4Npmr7TSY7xjduQ06p
	YSAwxrY0v6Pes9+i3i3gNhgDVV25K5rlWRSC59rnU/HoDPff+RjeKc2EHa3jAkYc8x/F
	+9LT6vNrjhzDbcEmbtBRb58xsBGNsd78XTi1Vr3hYb9TEQ201y7TaMA4i+lNnvOPVSi+
	bIfjN0o2Ha1ptqknKh34kGJAmWenJRo/uXmcXDsquW/u3DIRT/xC7YoDiSF/0YT5ZVIC
	39dsvnayHOvmgy02ZuMZvIYYu873bGgI8uegEoJm33x8khrNEMXwDCUMwIkeDT1qAmZx
	OC4w==
X-Gm-Message-State: ALKqPwduOqdOLJ6KdBeKuHrJIFfzwDfNzAFx2/2H6RPFVNzJoEtyWV6/
	2waUJW2oeVb0Afjfide1CnV+n05KSxDyNLdvINY=
X-Google-Smtp-Source: AB8JxZqkyNHu5ztJaJVtne/bJjbPUvvuLXOxicu67K766XuVJyY6HkrGRXKs4RkT7OuTrLGvLN/Y7Efwspdtj1nEuGg=
X-Received: by 2002:a1f:a8d2:: with SMTP id
	r201-v6mr15036293vke.39.1526399012005; 
	Tue, 15 May 2018 08:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <BN6PR1201MB019576F9685E3FFFC5E183E08B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<1526286006.5720.113.camel@linuxfoundation.org>
In-Reply-To: <1526286006.5720.113.camel@linuxfoundation.org>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 15 May 2018 17:43:18 +0200
Message-ID: <CAC+thW1r84j-+k_6xU3hESZnjwLYTUc3nWQFpca+=zkLU-ORNw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Running BitBake multiple times without rechecking upstream AUTOREV versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 15:43:31 -0000
Content-Type: multipart/alternative; boundary="000000000000e56d7f056c4076f3"

--000000000000e56d7f056c4076f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il 14 mag 2018 10:20 AM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> ha scritto:

On Fri, 2018-05-11 at 18:23 +0000, Chris Laplante via Openembedded-core
wrote:

> Hi all,
>
> I=E2=80=99m working on using Jenkins to host our Yocto build. One of the
> things that would be nice is to be able to do a =E2=80=9Cbitbake our-user=
-
> image=E2=80=9D, upload the artifacts to our network file storage, and the=
n do
> a =E2=80=9Cbitbake our-user-image -c populate_sdk_ext=E2=80=9D. I=E2=80=
=99d like to do these
> separately so that developers are not waiting around for the eSDK to
> be generated if all they care about is the kernel, for example. My
> concern is that the second bitbake invocation could end up building
> different stuff if someone were to check in code in between when the
> two =E2=80=9Cbitbake=E2=80=9Ds are run. This is primarily a concern with =
recipes that
> use AUTOREV (as we do for development purposes).
>
> Is there a way to essentially =E2=80=9Cfreeze=E2=80=9D the BitBake data s=
tore and re-
> use it across multiple bitbake invocations?

Have you tried BB_SRCREV_POLICY =3D "cache"?


Out of curiosity and probably unrelated to the OP's issue with images/SDK
SRCREVs consistency issue.... Could setting this variable be of any help
even for building usable eSDKs when AUTOREV is around? There's an issue in
bugzilla (don't have id at hand) dealing with eSDK / AUTOREV
incompatibility...


Cheers,

Richard

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--000000000000e56d7f056c4076f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">Il 14 mag 2018 10:20 AM, &quot;Richard Purdie&quot; &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; ha scritto:<br type=3D"attribution"><blockquote class=3D"quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Fri, 2018-05-11 at 18:23 +0000, Chris Laplante via Openembedded-core <b=
r>
wrote:<div class=3D"quoted-text"><br>
&gt; Hi all,<br>
&gt; =C2=A0<br>
&gt; I=E2=80=99m working on using Jenkins to host our Yocto build. One of t=
he<br>
&gt; things that would be nice is to be able to do a =E2=80=9Cbitbake our-u=
ser-<br>
&gt; image=E2=80=9D, upload the artifacts to our network file storage, and =
then do<br>
&gt; a =E2=80=9Cbitbake our-user-image -c populate_sdk_ext=E2=80=9D. I=E2=
=80=99d like to do these<br>
&gt; separately so that developers are not waiting around for the eSDK to<b=
r>
&gt; be generated if all they care about is the kernel, for example. My<br>
&gt; concern is that the second bitbake invocation could end up building<br=
>
&gt; different stuff if someone were to check in code in between when the<b=
r>
&gt; two =E2=80=9Cbitbake=E2=80=9Ds are run. This is primarily a concern wi=
th recipes that<br>
&gt; use AUTOREV (as we do for development purposes).<br>
&gt; =C2=A0<br>
&gt; Is there a way to essentially =E2=80=9Cfreeze=E2=80=9D the BitBake dat=
a store and re-<br>
&gt; use it across multiple bitbake invocations?<br>
<br></div>
Have you tried=C2=A0BB_SRCREV_POLICY =3D &quot;cache&quot;?<br></blockquote=
></div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Out of cur=
iosity and probably unrelated to the OP&#39;s issue with images/SDK SRCREVs=
 consistency issue.... Could setting this variable be of any help even for =
building usable eSDKs when AUTOREV is around? There&#39;s an issue in bugzi=
lla (don&#39;t have id at hand) dealing with eSDK / AUTOREV incompatibility=
...</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<div class=3D"elided-text"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</div></blockquote></div><br></div></div></div>

--000000000000e56d7f056c4076f3--
