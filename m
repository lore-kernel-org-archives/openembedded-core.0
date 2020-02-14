Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC7B6111B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:21:22 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id x123so6942175vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lGwgYydmUuQLTKCIher67sLCipFnQyYJ6yA2q4+prYs=;
	b=Sjhase435sKzWiz+IGkSOwWHgT5w9EsYzub0dDbEM0BoTEgVLzG+w6l0vMVaCVemFP
	mhL36AYJdfqhoXuXHWxabj1wxoWeP68gcjKC8k0Zu7pAckK3pSW6QVnBB3n8E8P5eHaO
	bDkU5cfNhdnlFumUBLr1fO49Kt+c9URAA4FrLjU8Em+v+FrGAvMJ49FNFi/5S6dlc9F+
	Ondmbz8jLkQ7xply7Gl2ZCMsYiTxE0rkssoS2eBHt3jPInRpNhy0oYnOUnWUH5SgXCsr
	EmpsTuoiXKVX+rJbrC+IfnbKeAmUIdP+KFca9WEDq6MuIg9EZhpZpLI023baXvE7f1sW
	xaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lGwgYydmUuQLTKCIher67sLCipFnQyYJ6yA2q4+prYs=;
	b=RVb6VUkKzuxVvFJuhfN/MeD8WKFp8h9TYL+41gaEVSyjXROWUBTomHY58akU25YGNd
	k5jbpL/2DPMw2ozL0Gh1+2sUFUWZgt3eNlt3jSvbGEOFA5ea7B58pKlxmESa0m8nyS4r
	xphCAaqj+cvtkreXz+WEqog21jdjWtbw5uCV85B19iwDFnsUQx/RxEjcvemz78rV5sHp
	eVdCvckAjPUSjtedDyLvYbyGDh/7LAdUJUyZVccST1SzjhuF66h9aCp74JstI4f4tV2v
	OTA5KqdSQO3/GaB8yDY6Ju/6ogz8ktXXYeqZ1ECVB+LEf5PXZmZMru/mDZSMA//YmoSr
	sq/g==
X-Gm-Message-State: APjAAAUasDnKmJ7LDEP0ZGgey4k+6BR0F5WgpZLPxd7lxJZg4/7D+L+f
	OAFwpALfJ4bWLUBv8S8WtKmTimU8yvaSwFHbyVY=
X-Google-Smtp-Source: APXvYqw3NiMnUmAwcrrDm5NLUvu/7G61EXL2Tj6SjKg3fP/JEuzrI5BKOpNTlWT04Z7xH8lwml/FTEp8LW8+9oiP4Hw=
X-Received: by 2002:a05:6102:757:: with SMTP id
	v23mr2387599vsg.35.1581708083462; 
	Fri, 14 Feb 2020 11:21:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
	<CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
	<CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
	<CAMKF1spgO92JJAaVCP26veEsedY_FAziNn6zi9cbpuy2_ofmSg@mail.gmail.com>
	<CANNYZj-7Aidoy4Y6P7ZzXNuGtUCcKddF4B3oeBMrcmmNAceDtQ@mail.gmail.com>
	<CAMKF1soWY20D8HwCEQK8pTsxcR8Bxc7y3aE2mnx2_XdFVJW4Og@mail.gmail.com>
	<CANNYZj-MhZhZ1QANwkQxiqCU8dtt5Mn3LzPTtqkB5-BCekDU3w@mail.gmail.com>
In-Reply-To: <CANNYZj-MhZhZ1QANwkQxiqCU8dtt5Mn3LzPTtqkB5-BCekDU3w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Feb 2020 20:21:12 +0100
Message-ID: <CANNYZj_bCoU-NzoKqzjTvjOr=g6LKECDPE7S7i2xpsrfYeHsKQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Fri, 14 Feb 2020 19:21:22 -0000
Content-Type: multipart/alternative; boundary="000000000000740552059e8e1cd4"

--000000000000740552059e8e1cd4
Content-Type: text/plain; charset="UTF-8"

I got to it finally. Normally /var/lib/rpm is absent when opkg is in use,
but when /usr/bin/rpm is present, python3's ptest involves distutils test
creating rpm packages (and presumably installing them too), which creates a
database in /var/lib/rpm, which then triggers rpm tests to run and fail. So
a check for /var/lib/rpm in rpm tests isn't always sufficient to determine
which packaging system is in use, and there should be a stronger one.

I'm fine with adjusting libsolv to not pull in rpm, but please use
EXCLUDE_FROM_WORLD instead of PNBLACKLIST, so that just that specific
problem is solved, rather than banning libdnf/dnf altogether from builds.

Making libdnf to not require rpm-enabled libsolv is not feasible sadly,
it's basically built around that assumption.

Alex

On Fri, 14 Feb 2020 at 13:19, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Fri, 14 Feb 2020 at 08:15, Khem Raj <raj.khem@gmail.com> wrote:
>
>> local.conf I have
>>
>> DISTRO_FEATURES_append = " largefile opengl ptest multiarch wayland pam
>> polkit "
>> IMAGE_CLASSES += "testimage testsdk"
>>
>
> Right, I'm running this now, it's a bit tricky because I have to do it on
> the Yocto AB. Big company's bureaucracy is causing delays in getting me a
> build machine :(
>
> Alex
>

--000000000000740552059e8e1cd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I got to it finally. Normally /var/lib/rpm is absent =
when opkg is in use, but when /usr/bin/rpm is present, python3&#39;s ptest =
involves distutils test creating rpm packages (and presumably installing th=
em too), which creates a database in /var/lib/rpm, which then triggers rpm =
tests to run and fail. So a check for /var/lib/rpm in rpm tests isn&#39;t a=
lways sufficient to determine which packaging system is in use, and there s=
hould be a stronger one.</div><div><br></div><div>I&#39;m fine with adjusti=
ng libsolv to not pull in rpm, but please use EXCLUDE_FROM_WORLD instead of=
 PNBLACKLIST, so that just that specific problem is solved, rather than ban=
ning libdnf/dnf altogether from builds.</div><div><br></div><div>Making lib=
dnf to not require rpm-enabled libsolv is not feasible sadly, it&#39;s basi=
cally built around that assumption.<br></div><div></div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 14 Feb 2020 at 13:19, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr">On Fri, 14 Feb 2020 at 08:15, Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">local.conf I have<br>
<br>
DISTRO_FEATURES_append =3D &quot; largefile opengl ptest multiarch wayland =
pam polkit &quot;<br>
IMAGE_CLASSES +=3D &quot;testimage testsdk&quot;<br></blockquote><div><br><=
/div><div>Right, I&#39;m running this now, it&#39;s a bit tricky because I =
have to do it on the Yocto AB. Big company&#39;s bureaucracy is causing del=
ays in getting me a build machine :(</div><div><br></div><div>Alex</div></d=
iv></div>
</blockquote></div>

--000000000000740552059e8e1cd4--
