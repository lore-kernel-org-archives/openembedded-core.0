Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D86CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 23:16:36 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3882.1758582991869728959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 16:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KFvd1OrP;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MNGJNT866482;
	Mon, 22 Sep 2025 18:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758582979;
	bh=Ce5CUs4Mex0CfQndh7B2zGSygKHvZ+vfLqNkZTgWBYw=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=KFvd1OrPUtd+5381rY4M6K6f/4AalZM40gRfjF3/6zjsmyAnSyXQjo/IdPfKpoCEx
	 dHDRKI83J+jOPP8ru8Ffdsi1CrCg1aPk7vBCTPlzNJ8rDiN9U9YXdZIt2ZWA5Qpy18
	 DwA/6dK8TV1yUsCNgyeooBj+g6FD4uofvd0xvTS4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MNGIff641946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 18:16:19 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 18:16:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 18:16:18 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MNGIhd3277673;
	Mon, 22 Sep 2025 18:16:18 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Sep 2025 18:16:18 -0500
Message-ID: <DCZPMZBQPTOP.2OZDXN58O263N@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250918214903.341452-1-rs@ti.com>
 <DCYH5V5GB1LB.1KAPRIVKZGTWO@bootlin.com>
 <1867B951D10D3F9C.23856@lists.openembedded.org>
 <1867BAF5F353054B.23856@lists.openembedded.org>
In-Reply-To: <1867BAF5F353054B.23856@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223860

On Mon Sep 22, 2025 at 5:21 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Mon Sep 22, 2025 at 4:51 PM CDT, Randolph Sapp via lists.openembedded.=
org wrote:
>> On Sun Sep 21, 2025 at 7:25 AM CDT, Mathieu Dubois-Briand wrote:
>>> On Thu Sep 18, 2025 at 11:48 PM CEST, rs wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> We've recently run into some issues with weston-init attempting to sta=
rt Weston
>>>> prior to all drm devices being registered. There's not really a good, =
scriptable
>>>> mechanism to listen in to device registration events that works with t=
he
>>>> existing weston-init package. Well, at least one that doesn't involve =
polling
>>>> files or introducing more dependency on the init system being used.
>>>>
>>>> I also see there is also a lot of scripting around starting X11,
>>>> xserver-nodm-init, that (from my limited review) should experience the=
 same
>>>> issue.
>>>>
>>>> I'd like to introduce the following display manager for oe-core, emptt=
y [1].
>>>> This display manager is, as described upstream, a "Dead simple CLI Dis=
play
>>>> Manager on TTY". It supports both x11 and wayland sessions, with toggl=
able build
>>>> parameters to completely remove x11 and pam dependencies. It's license=
d MIT,
>>>> which shouldn't be an issue for any users. (It is written in Go, if yo=
u have
>>>> opinions about that.)
>>>>
>>>> With this, both weston-init and the xserver-nodm-init packages can be =
re-tuned
>>>> to leverage this display manager and simply add a user and emptty conf=
ig for an
>>>> autologin session. This can resolve the current behavior across init s=
ystems
>>>> without additional scripting, and move some development out of this la=
yer.
>>>>
>>>> This lists myself as a maintainer of emptty as well as xserver-nodm-in=
it and
>>>> xuser-account since these are currently unassigned and I've reworked t=
hem
>>>> significantly here.
>>>>
>>>> Sorry for the delay on this series. I found a few bugs in emptty that =
I wanted
>>>> to address before submitting this officially.
>>>>
>>>
>>> Hi Randolph,
>>>
>>> Thanks for your patch.
>>>
>>> I took this series, but it looks like we have a build issue, maybe only
>>> with altcfg distro:
>>>
>>> Traceback (most recent call last):
>>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/cor=
e/decorator/__init__.py", line 35, in wrapped_f
>>>     return func(*args, **kwargs)
>>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/cor=
e/decorator/__init__.py", line 35, in wrapped_f
>>>     return func(*args, **kwargs)
>>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/cor=
e/decorator/__init__.py", line 35, in wrapped_f
>>>     return func(*args, **kwargs)
>>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/run=
time/cases/xorg.py", line 31, in test_xorg_running
>>>     self.assertEqual(status, 0, msg=3Dmsg)
>>> AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USE=
R       VSZ STAT COMMAND
>>> ...
>>> 2025/09/21 11:59:34 Closing PAM auth
>>> 2025/09/21 11:59:34 Failure setting user credentials
>>> 2025/09/21 11:59:34 Authentication failure
>>> ...
>>> RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.41s)
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2402
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2407
>>>
>>> Can you have a look at it please?
>>>
>>> Thanks,
>>> Mathieu
>>
>> In the past auth issues can occur if the user was created after the curr=
ent
>> system time (of which the default would be the kernel build time if it i=
s unable
>> to get a value from NTP).
>>
>> I've already tested this series with an equivalent config to poky-altcfg=
, with
>> both root and rootless x11. I reset my cache and did another local build=
 to
>> match that CICD failure and it still works for me.
>>
>> My local.conf for my test build was:
>>
>> MACHINE ??=3D "qemux86"
>> DISTRO ??=3D "poky-altcfg"
>> BBMULTICONFIG ?=3D ""
>> IMAGE_CLASSES +=3D "testimage"
>>
>> Other variables were dictated by templateconf.cfg:
>>
>> meta-poky/conf/templates/default
>>
>> Is that automation setting anything that could possibly play with the bu=
ild time
>> or system time values for the testimage? I'm not seeing anything in the =
logs,
>> but I'm also not seeing anything that reports the current config outrigh=
t.
>>
>> I guess I should add some messages for that as part of the test function
>> regardless.
>
> Whoops, I see the issue now. v10 inbound.

Well, I know what the issue is, but I guess I should ask how people want to
address it. Currently, that test expect a root x11 instance to autostart. I=
 have
it attempt to do that currently, and my old test images were being built wi=
th
"empty-root-password allow-empty-password allow-root-login" features enable=
d,
allowing it to proceed as usual. The password auth is what is currently fai=
ling.

1. We can do passwordless root auth for these by adjusting the pam rule for
emptty to allow auth as root for that application.

2. I would suggest that we instead make sure the root user is in the
nopasswdlogin group, as it makes it clear that the user has unprotected GUI
access.

I'm not sure either of these should really be allowed in a production
environment though. Technically we can disable this behavior outright when
ROOTLESS_X is set, but it's still a little odd to me.

3. Should the test images explicitly enable the empty-root-password
allow-empty-password? That means the x11 test will have to move from an
arbitrary runtime test to something like the way locales are currently test=
ed.

Seems like solution 2 is the easiest and preserves the expected behavior fo=
r
that test, assuming people are okay with that behavior.

- Randolph

