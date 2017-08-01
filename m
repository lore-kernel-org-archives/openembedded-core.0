Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9289D783BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 11:12:48 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g13so6826625ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ij/353b9fUJj8Reedt4eOzUds9gOXxyHE3VvKvbyz34=;
	b=jrd0H/L+UfZtwUXKshEeTJREsK3isr4iWiaUcOEPYKmxawrPI4/SaBYKomDB0IjM63
	V9Enii6Hj33gF4/E8unl3q223lkOZ8S64xNcMuGc0F9As0+LlnvzcHp4x8zqz6ha67qF
	UKhodqKzflCNUtOmISovjevVGd/K9o97IdHBwoI6DLykiOSOXl+lRYm7x8CzzUgmXhfu
	FaRA3j6Aa+ipDy6yAOKaS5Js0yrVhIN2YvJVxaqZy+i1Fd/XGeEZVrq9toDFpb5GRUqA
	3VyqeSEDU8RAEmp4VUQlmIUbZU/eT34d8S+Cwzv0h4uQZLuyvyRR6UFnNeRnAsLKCI44
	gdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ij/353b9fUJj8Reedt4eOzUds9gOXxyHE3VvKvbyz34=;
	b=B/up8cxaGomoYAw5FQZlcd56QOI1Xh6VodAmc77dKAv9vi8s74YLWnspgnbUw/pEkT
	dUNV4wUkCRC89R06i7XU4DJlfvgfGlQyR4F8jxv1EYb0tW9hSb0vpbC7bgdjH6MOzUfg
	KLkcBUyx62z+Qq7Gc9rkigAAocNmQORK0eMTHykRw6sEDmQUykZ+TggljYD7CfcetIKM
	/dyKAb8Pmv7RkH28Lezy/PMKthDmSn3PeYoJ8GFXjtb7b8pH4olRQIIS+vFB2tKUDFih
	fVvQCxCxwEQIPcwabjmnuf21IVKFfAt+jzDGnH/DYNd7zpNXKwWD4o/2RRLY67EphJfx
	NAzA==
X-Gm-Message-State: AIVw111QysiGqTajdG4jTfdBzZsAE1O4AvJGA+2HH1TnN9IpwH4+fgeK
	zYmBmKi0CH22Dp5oSfq7PfiCEh4iPchN
X-Received: by 10.107.170.170 with SMTP id g42mr23612122ioj.19.1501585969679; 
	Tue, 01 Aug 2017 04:12:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 1 Aug 2017 04:12:29 -0700 (PDT)
In-Reply-To: <1501144856-17637-4-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1501144856-17637-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1501144856-17637-4-git-send-email-rebecca.swee.fun.chang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Aug 2017 12:12:29 +0100
Message-ID: <CAJTo0LYWsOAXP5U_knyc6wVHHKjYvEW6x9kiE4-ajskLFwooqg@mail.gmail.com>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>, 
	"Phoong, Stanley Cheong Kwan" <stanley.cheong.kwan.phoong@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 3/4] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Tue, 01 Aug 2017 11:12:48 -0000
Content-Type: multipart/alternative; boundary="001a114260ba52a6a30555af3ae9"

--001a114260ba52a6a30555af3ae9
Content-Type: text/plain; charset="UTF-8"

The eSDK tests are failing with this applied:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '.
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/environment-setup-core2-64-poky-linux
> /dev/null;

devtool add myapp
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/myapp;

returned non-zero exit status 1

Standard Output: NOTE: Starting bitbake server...
NOTE: Starting bitbake server...
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/scripts/recipetool",
line 121, in <module>
    ret = main()
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/scripts/recipetool",
line 110, in main
    ret = args.func(args)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/scripts/lib/recipetool/create.py",
line 662, in create_recipe
    if (branch and not append_branch) or storeTagName:
UnboundLocalError: local variable 'storeTagName' referenced before
assignment

Ross

--001a114260ba52a6a30555af3ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The eSDK tests are failing with this applied:<br><br>oeqa.=
utils.subprocesstweak.OETestCalledProcessError: Command &#39;. /home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemu=
x86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/environment-setup-co=
re2-64-poky-linux &gt; /dev/null;<div><br></div><div>devtool add myapp /hom=
e/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/w=
ork/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/myapp;</div>=
<div><br></div><div>returned non-zero exit status 1</div><div><br></div><di=
v>Standard Output: NOTE: Starting bitbake server...<br>NOTE: Starting bitba=
ke server...<br>Traceback (most recent call last):<br>=C2=A0 File &quot;/ho=
me/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/=
work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/buil=
d/scripts/recipetool&quot;, line 121, in &lt;module&gt;<br>=C2=A0 =C2=A0 re=
t =3D main()<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-w=
orker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-=
minimal/1.0-r0/testsdkext/layers/build/scripts/recipetool&quot;, line 110, =
in main<br>=C2=A0 =C2=A0 ret =3D args.func(args)<br>=C2=A0 File &quot;/home=
/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/wo=
rk/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/=
scripts/lib/recipetool/create.py&quot;, line 662, in create_recipe<br>=C2=
=A0 =C2=A0 if (branch and not append_branch) or storeTagName:<br>UnboundLoc=
alError: local variable &#39;storeTagName&#39; referenced before assignment=
<br><br></div><div>Ross</div></div>

--001a114260ba52a6a30555af3ae9--
