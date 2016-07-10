Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 436B8601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 09:53:26 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f6so35172166ith.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1+vRpHBJxgf6KSyI8PkmVZhy9MgXUJ8r99VSZ5MOnYI=;
	b=m5/rxx8meabrlPJCrO92oelbL/tdkte9utupY2FYmVOhr387B6yccV/zlB9P17qvLA
	kODSeAneTf55iDf9erwT1ovNGuqqrjqykfpeRrMOvla0AvPPaC7RUnUezdfhq6nY++r8
	WdASVilff+8jaFNyRi8Y9gd3EAqWkolXiPQ8+nLazBfIG8u+wL4LzCABgsm/VVB9lCHv
	6hG5j/IDhVx0dpDjI2jbjZN98Uquq1HQYfx8AsLB6WHZGRoibhIUc5T1pUy9o6/D5KVX
	pykGeb/sAKw62z+ynwQiJU2ZNpJcqrEeQZpVFpONgLwggt5ScpMG1+ezQ3J6RBt5KKes
	PcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1+vRpHBJxgf6KSyI8PkmVZhy9MgXUJ8r99VSZ5MOnYI=;
	b=B+RRy4mMyEh+ybMoR8ow9z4JW7poTzYysMuJ/N4WFK1RrZu9dK8D8B8nFKi9N2wK2G
	iu46lR3uclkAUYWTRWtU79GENg60bejiIb76n4iH4YQ/JAfR3avp5ogy0ONS02Tn6Mym
	5aYh8XxQPT0C82pr4o4QWEl57X5H4YLNKphPNM50QVwcHn5e5q7Eg1WevAE1ufC/Ng6Z
	Le78ASqPFQlI6Fxa8gdm9iwY3yWog+xt4iwrNFJw11iRizkBDevSY3V0u5uXhYJDLGOP
	rDCKYQNzc4eJrB3uJXYU5pLvyJ0uoUiLdtptYIC7WmktctSdcN+kr0ohbfKmBRkW6oBJ
	YZPQ==
X-Gm-Message-State: ALyK8tKTtpKAOpehxV39fo3aiAEiGjrOFtNRrjpxlzGlaX8ntuQLN5Z5q/TlmW+q+dNUTNgfDEFuEuNA2IApirXV
X-Received: by 10.36.120.74 with SMTP id p71mr5866498itc.22.1468144407639;
	Sun, 10 Jul 2016 02:53:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Sun, 10 Jul 2016 02:53:08 -0700 (PDT)
In-Reply-To: <20160709232717.22380-1-raj.khem@gmail.com>
References: <20160709232717.22380-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 10 Jul 2016 10:53:08 +0100
Message-ID: <CAJTo0LbkQBgu89Ow79weX5mVPwtWewtkUeDzkc39+Mz9VHN85w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] v86d: Accept aarch64 as build host
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
X-List-Received-Date: Sun, 10 Jul 2016 09:53:30 -0000
Content-Type: multipart/alternative; boundary=001a114aa394e58ef205374501a6

--001a114aa394e58ef205374501a6
Content-Type: text/plain; charset=UTF-8

On 10 July 2016 at 00:27, Khem Raj <raj.khem@gmail.com> wrote:

> +       local m=`uname -m`
> +       if [ "$m" = "i686" -o "$m" = "i586" -o "$m" = "i486" -o "$m" =
> "i386" ]; then
> +               echo "n";
> +-      elif [ "$m" = "x86_64" ]; then
> ++      elif [ "$m" = "x86_64" -o "$m" = "aarch64" ]; then
> +               echo "y";
> +       else
>

Surely this entire block is wrong for cross-compilation - looking at uname
to determine what to build for the target?

Ross

--001a114aa394e58ef205374501a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 July 2016 at 00:27, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":167" class=3D"a3s aXjCH m=
155d1fd7c1bb7d55">+=C2=A0 =C2=A0 =C2=A0 =C2=A0local m=3D`uname -m`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$m&quot; =3D &quot;i686&quot; -o &qu=
ot;$m&quot; =3D &quot;i586&quot; -o &quot;$m&quot; =3D &quot;i486&quot; -o =
&quot;$m&quot; =3D &quot;i386&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;n&quot;;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 elif [ &quot;$m&quot; =3D &quot;x86_64&quot; ]; then=
<br>
++=C2=A0 =C2=A0 =C2=A0 elif [ &quot;$m&quot; =3D &quot;x86_64&quot; -o &quo=
t;$m&quot; =3D &quot;aarch64&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;y&quot;;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else</div></blockquote></div><br>Surely this en=
tire block is wrong for cross-compilation - looking at uname to determine w=
hat to build for the target?</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a114aa394e58ef205374501a6--
