Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974A0C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 11:53:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.13791.1748433212505207427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 04:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c4/6tGG+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FB3241DE2;
	Wed, 28 May 2025 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748433210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Y4FvpXVnNY0Q68otFMvKqtMS5jgEGcCKbb/D14OrYY=;
	b=c4/6tGG+YR+DLpBWWmxptx9QwrAX33IHerm9yiEd422tHQC00T81xlhqytNgg8tOPbDOya
	ml/y6jZH8wDYohK2tESTZAV4dEUELmQvw1RB5l8dNXuknjq+mZtMciF6q4srDiRHKwZjfG
	TRix1s5T1cmXBVvDoPUwBOsdxZrxLN0IeVFX9wXH5iXydzlz1YRlYYZawuX478+Zi4wQWK
	zxp0GeDWw/LvSRp8u/imEDb3B+Zcn5xvsz97vDkuceu465+gJ438CFJdrh1c775BEAwnrI
	7o8sdMJb4syt1B4UFTlWV24SrkBzBW83zqyp44ypPBZ96fCYyzjC+QewGUMHMA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 13:53:27 +0200
Message-Id: <DA7RUET7783J.484RLJVMFOCZ@bootlin.com>
Subject: Re: [oe-core][PATCHv6 0/5] Display manager proposal for x11 and
 wayland
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Randolph Sapp" <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250520233935.740242-1-rs@ti.com>
 <DA1YOI4L8TYX.ALF8S230UTO1@bootlin.com> <DA7AGREX7HJ9.33KJKYJPO1A3N@ti.com>
In-Reply-To: <DA7AGREX7HJ9.33KJKYJPO1A3N@ti.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeduleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffgveevteeuteefffefhedtkedvieffffdujedvffehueekuedtkedugeekfedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhssehtihdrtghom
 hdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhtrghvihhosehoshhshihsthgvmhhsrdgtohhmrdgsrhdprhgtphhtthhopehkvgigihhnrdhhrghoseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepuggvthhhvghrihgughgvsehtihdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 11:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217342

On Wed May 28, 2025 at 12:16 AM CEST, Randolph Sapp wrote:
> On Wed May 21, 2025 at 10:58 AM CDT, Mathieu Dubois-Briand wrote:
>> On Wed May 21, 2025 at 1:39 AM CEST, rs wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> We've recently run into some issues with weston-init attempting to star=
t Weston
>>> prior to all drm devices being registered. There's not really a good, s=
criptable
>>> mechanism to listen in to device registration events that works with th=
e
>>> existing weston-init package. Well, at least one that doesn't involve p=
olling
>>> files or introducing more dependency on the init system being used.
>>>
>>> I also see there is also a lot of scripting around starting X11,
>>> xserver-nodm-init, that (from my limited review) should experience the =
same
>>> issue.
>>>
>>> I'd like to introduce the following display manager for oe-core, emptty=
 [1].
>>> This display manager is, as described upstream, a "Dead simple CLI Disp=
lay
>>> Manager on TTY". It supports both x11 and wayland sessions, with toggla=
ble build
>>> parameters to completely remove x11 and pam dependencies. It's licensed=
 MIT,
>>> which shouldn't be an issue for any users. (It is written in Go, if you=
 have
>>> opinions about that.)
>>>
>>> With this, both weston-init and the xserver-nodm-init packages can be r=
e-tuned
>>> to leverage this display manager and simply add a user and emptty confi=
g for an
>>> autologin session. This can resolve the current behavior across init sy=
stems
>>> without additional scripting, and move some development out of this lay=
er.
>>>
>>> This lists myself as a maintainer of emptty as well as xserver-nodm-ini=
t and
>>> xuser-account since these are currently unassigned and I've reworked th=
em
>>> significantly here.
>>>
>>> Sorry for the delay on this series. I found a few bugs in emptty that I=
 wanted
>>> to address before submitting this officially.
>>>
>>> [1] https://github.com/tvrzna/emptty
>>>
>>> v2:
>>> 	- Address spelling issues in commit messages
>>> 	- Attempt to resolve some test related issues with weston
>>> 	- Add additional logs to X11 related tests
>>> v3:
>>> 	- Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When running
>>> 	  under QEMU the first auth attempt almost always fails.
>>> v4:
>>> 	- Add a tmpfile entry for the x11 domain socket directory.
>>> 	- Remove some scripts associated with weston-init that were being
>>> 	  shipped with weston
>>> v5:
>>> 	- Move tmpfile data to individual files
>>> 	- Add explicit entries for these in the FILES variable
>>> v6:
>>> 	- Do not attempt to ship a tmpfiles.d entry in libx11
>>>
>>
>> Hi Randolph,
>>
>> Thanks for the version, but again a previously seen error. Sorry for
>> the bad news :(
>>
>> RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.31s)
>> ...
>> AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER=
       VSZ STAT COMMAND
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1637
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/1638
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1649
>>
>> I will drop the patch on my side, but I will keep the a-full build
>> running, we might see some other failures in the coming hours:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1630
>
> Ah, the auth failures persist. Normally this is caused when the user atte=
mpts to
> login before the user account was created or something unusual like that.=
 I
> don't suppose there's any way this could be happening on the test machine=
s?
>
> I'm not able to reproduce this locally, but my build config is different.=
 I tend
> to use oe-core and nodistro instead of poky. They aren't playing around w=
ith the
> reproducible build date stuff or anything like that are they?
>
> Well, I mean I did see this on occasion. The first login attempt almost a=
lways
> failed, but the subsequent attempts were fine. Bumping the attempt count =
back up
> the default (2) was enough to resolve it on my end, but evidently it's no=
t
> enough here.
>
> This is not happening on hardware from what I'm seeing.

Hi Randolph,

I was able to reproduce it locally, with the following configuration:
- https://git.yoctoproject.org/poky-ci-archive on tag
  autobuilder.yoctoproject.org/valkyrie/a-full-1630.
- template local.conf, with the following modifications:
  MACHINE =3D "qemux86"
  DISTRO =3D "poky-altcfg"
  SDKMACHINE =3D "x86_64"
  PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
  INHERIT +=3D 'image-buildinfo'
  IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
  PACKAGE_CLASSES =3D 'package_ipk package_rpm package_deb'
  IMAGE_ROOTFS_EXTRA_SPACE:append =3D '${@bb.utils.contains('IMAGE_FEATURES=
', 'package-management', ' + 262144', '', d)}'
  IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
  SANITY_TESTED_DISTROS =3D ''
  OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuil=
der/autobuilder-resource-constraints'
  # (Plus my own sstate cache and downloads dir).
- bitbake core-image-sato
- bitbake core-image-sato:do_testimage

Of course using the tag from poky-ci-archive is not mandatory, you
should see the same behaviour with master branch and your patches.

I saw some oe-selftest was also failing on the autobuilder, with an
error related to emptty. You can reproduce it with:

oe-selftest -r sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesig=
s

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


