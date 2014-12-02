Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6C40C60673
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 17:11:12 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so10684794qcw.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 09:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UD7nvdDGk3+ZGcTwnCbtlE7w4BpVkic5yYPZRjBrKp0=;
	b=eHrA6WdRC7hQPIUEB1KsDeVrTvzq//trOUAk2sHUL5qOjkOgEIxOSbCkYqGnk7luWV
	i+16tJBYZZXkkbpP4Pv9iC9bXe/KQ/Sf9UL8nHHDMFt+ilMWAe94mFvaV/xxnjsk6O3G
	yYojShReaMqq6aVd9NKugpU/4LPM9bQC8BMSl1ThyeLKRhorkDjq5mHu9NuNTGFX2nSD
	GL1xgnCIyuCWpWxCdYbYapGwctWbSPFUZt88sOfu5+Cnvt1kPtVERLCPQz1DM1fSUQWK
	ro8oPkj9eyvDZCVrAAMPC7dvOzVgFuiDZHzNnS6Yv1dQDeWk5xa0db4vuFsNtdld6UqN
	b8Nw==
X-Gm-Message-State: ALoCoQmkvWQnWeJ6O4D2MfsXElRU0UzlGGtOUguTwBFWC3siHhdI8XslUnytUjeVuKP54R4bDHpe
X-Received: by 10.224.3.137 with SMTP id 9mr452056qan.64.1417540272971; Tue,
	02 Dec 2014 09:11:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 2 Dec 2014 09:10:52 -0800 (PST)
In-Reply-To: <547DF0C1.4020608@windriver.com>
References: <cover.1417535164.git.ross.burton@intel.com>
	<547DF0C1.4020608@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Dec 2014 17:10:52 +0000
Message-ID: <CAJTo0LYvMw+ptJJw-OCj_W1d19qwf+=t3dPC7SC3r=fy07dgmw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4][RFC] Change libexecdir to ${prefix}/libexec
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
X-List-Received-Date: Tue, 02 Dec 2014 17:11:15 -0000
Content-Type: multipart/alternative; boundary=001a11c2480a6cfbb805093ed09b

--001a11c2480a6cfbb805093ed09b
Content-Type: text/plain; charset=UTF-8

On 2 December 2014 at 17:02, Mark Hatle <mark.hatle@windriver.com> wrote:

> Personally I think using "${exec_prefix}/libexec" is incorrect.  This does
> not support a multilib configuration where you may have both a 64-bit and
> 32-bit version of the libexec program on the system.  (perhaps this isn't a
> real problem, but we ran into some conflicts in the past.)
>

Are any of these conflicts actually a problem?  Can you give an example?  I
know there's been several attempts to "fix" GConf multilib installation
which were generally breaking GConf instead of fixing a test case...


> So moving to the libdir, ensures that we are unique per multilib.. and the
> BPN ensures that we're unique per recipe.
>

A libexecdir that isn't global is a problem because some packages want to
run *other recipes* binaries, and they can't just do
$libexecdir/some-binary.

Ross

--001a11c2480a6cfbb805093ed09b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2014 at 17:02, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6s8" cla=
ss=3D"a3s" style=3D"overflow:hidden">Personally I think using &quot;${exec_=
prefix}/libexec&quot; is incorrect.=C2=A0 This does not support a multilib =
configuration where you may have both a 64-bit and 32-bit version of the li=
bexec program on the system.=C2=A0 (perhaps this isn&#39;t a real problem, =
but we ran into some conflicts in the past.)<br></div></blockquote><div><br=
></div><div>Are any of these conflicts actually a problem?=C2=A0 Can you gi=
ve an example?=C2=A0 I know there&#39;s been several attempts to &quot;fix&=
quot; GConf multilib installation which were generally breaking GConf inste=
ad of fixing a test case...</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":6s8" class=3D"a3s" style=3D"overflow:hidden">
So moving to the libdir, ensures that we are unique per multilib.. and the =
BPN ensures that we&#39;re unique per recipe.<div></div></div></blockquote>=
</div><br>A libexecdir that isn&#39;t global is a problem because some pack=
ages want to run *other recipes* binaries, and they can&#39;t just do $libe=
xecdir/some-binary. =C2=A0</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a11c2480a6cfbb805093ed09b--
