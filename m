Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC9360557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 12:40:19 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so4049030qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 05:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nRCgzaCI4qWgRyYtD1edylQNsy/pTn29kkB6Ot88izQ=;
	b=erOC9DQt6/EgIV8tkdNzDMeZkeGHHWAP+HQ3zDsS/bkDmm0h9UR/0K5L+9mpJ6IMKL
	ZoQBwn21tPwLiRMfQYATc5sJGs+17oqeG/Dt0pD5Ysf/bZSB1cLZw3am/sPHTxfSG10s
	XBkf4dMO/f63Unbqu3B+u2elBqP7A6igN8G/LPpOxCpUzCjhRATuDHvNjcpe2YsGQnZ6
	M4OkthQBfchBK5VfI2FGTxck00YBYkP/LNa4AGmXKSRkhFw40gwqQUBp/++KNXvrOCAF
	kdXc15jXWzJhvkrS1tVyLyubV5m9zDV2G3f+ap9EBsda07MpWUcCX75cxWF8CGorj9IS
	z8Iw==
X-Gm-Message-State: ALoCoQkb1CANIPSz1JtH7pjnpFmIK9Kk/Vs19iYUBQGX7ZHPg3WoJctaci1zPurDEMFtosNqy+ul
X-Received: by 10.140.96.101 with SMTP id j92mr24421847qge.87.1414672820275;
	Thu, 30 Oct 2014 05:40:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 30 Oct 2014 05:39:55 -0700 (PDT)
In-Reply-To: <5450E937.7040501@hundeboll.net>
References: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
	<1414581527-5448-2-git-send-email-martin@hundeboll.net>
	<CANyK_8d3=cmQ0aDxwDtzGZcqHvaL1fhasnS2kimBia0WhJgSuw@mail.gmail.com>
	<5450E937.7040501@hundeboll.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Oct 2014 12:39:55 +0000
Message-ID: <CAJTo0Lb0H8X1Ycr0h=KhnT3k=xVGBcG=+sAu0upx9WfizbSTDg@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@hundeboll.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] scripts: use python2 explicitly in shebangs
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
X-List-Received-Date: Thu, 30 Oct 2014 12:40:33 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8aed41a00506a32ee9

--001a113a9d8aed41a00506a32ee9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 October 2014 13:18, Martin Hundeb=C3=B8ll <martin@hundeboll.net> wrot=
e:

> I used to use a virtualenv to temporarily set Python 2 as the default
>> for the shell in which I ran bitbake commands. That was a while ago
>> though, all my current builds are running on Ubuntu 12.04/14.04 server
>> instances which I access via ssh from my Arch Linux box.
>>
>
> Using a compatible distro-install is of course the easiest way to get
> going. Could also work with a virtual machine.


Paul meant the Python tool virtualenv,
http://virtualenv.readthedocs.org/en/latest/virtualenv.html.  This can be
used to create an environment where "python" on the search path is python
2, on a system where /usr/bin/ is python 3.

I admit that I'm leaning towards thinking that we just say bitbake requires
"python" to be 2.7+ and if your host distribution uses python 3 by default,
use virtualenv.  The logic being added to the V2 series to generate
symlinks and drop them into the bitbake source tree isn't very elegant.

Obviously using virtualenv means you need to use /usr/bin/env in the
shebangs, so that part of the series is still needed.

Ross

--001a113a9d8aed41a00506a32ee9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
9 October 2014 13:18, Martin Hundeb=C3=B8ll <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin@hundeboll.net" target=3D"_blank">martin@hundeboll.net</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><span><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex">I used to use=
 a virtualenv to temporarily set Python 2 as the default<br>
for the shell in which I ran bitbake commands. That was a while ago<br>
though, all my current builds are running on Ubuntu 12.04/14.04 server<br>
instances which I access via ssh from my Arch Linux box.<br>
</blockquote>
<br></span>
Using a compatible distro-install is of course the easiest way to get going=
. Could also work with a virtual machine.</blockquote></div><br>Paul meant =
the Python tool virtualenv,=C2=A0<a href=3D"http://virtualenv.readthedocs.o=
rg/en/latest/virtualenv.html" target=3D"_blank">http://virtualenv.readthedo=
cs.org/en/latest/virtualenv.html</a>.=C2=A0 This can be used to create an e=
nvironment where &quot;python&quot; on the search path is python 2, on a sy=
stem where /usr/bin/ is python 3.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">I admit that I&#39;m leaning towards thinking t=
hat we just say bitbake requires &quot;python&quot; to be 2.7+ and if your =
host distribution uses python 3 by default, use virtualenv.=C2=A0 The logic=
 being added to the V2 series to generate symlinks and drop them into the b=
itbake source tree isn&#39;t very elegant.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Obviously using virtualenv means you n=
eed to use /usr/bin/env in the shebangs, so that part of the series is stil=
l needed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a113a9d8aed41a00506a32ee9--
