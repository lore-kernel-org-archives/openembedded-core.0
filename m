Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A24CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:04:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.4400.1758650670516058179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JPTQOLyq;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NI4CVE1042501;
	Tue, 23 Sep 2025 13:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758650652;
	bh=VyuKXJrUPuNd2sqSqOFxaPJcK0iDUjiMZekcbHw0cLE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JPTQOLyq6TqpciHQ2F91ZCJ0NnG/ulo7wnhTMkrngWTZyNgVhBLYSvsa89+9okZKp
	 OWsJPNH2EfdE6x4f0KtiPW8v8fXUNTZCAAXWEPSjkKrl3NLYfHB3O9OPf0y1miv3W3
	 9bA4F6BteP/K/FdWJ/UrL4l70kgdHg/z6Yh8ca1o=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NI4BEU2965504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 13:04:11 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 13:04:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 13:04:11 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NI4Bju700303;
	Tue, 23 Sep 2025 13:04:11 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 23 Sep 2025 13:04:11 -0500
Message-ID: <DD0DMJUIN3JE.1Z24P0IZR2CFL@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250918214903.341452-1-rs@ti.com>
 <DCYH5V5GB1LB.1KAPRIVKZGTWO@bootlin.com>
 <1867B951D10D3F9C.23856@lists.openembedded.org>
 <1867BAF5F353054B.23856@lists.openembedded.org>
 <DCZPMZBQPTOP.2OZDXN58O263N@ti.com>
 <cee4b39698f8607acf3f396e06d94a713a66d134.camel@linuxfoundation.org>
 <1867FB133639FF67.16927@lists.openembedded.org>
In-Reply-To: <1867FB133639FF67.16927@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 18:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223907

On Tue Sep 23, 2025 at 12:56 PM CDT, Randolph Sapp via lists.openembedded.o=
rg wrote:
> On Tue Sep 23, 2025 at 4:03 AM CDT, Richard Purdie wrote:
>> On Mon, 2025-09-22 at 18:16 -0500, Randolph Sapp wrote:
>>> On Mon Sep 22, 2025 at 5:21 PM CDT, Randolph Sapp via lists.openembedde=
d.org wrote:
>>> > On Mon Sep 22, 2025 at 4:51 PM CDT, Randolph Sapp via lists.openembed=
ded.org wrote:
>>> > > On Sun Sep 21, 2025 at 7:25 AM CDT, Mathieu Dubois-Briand wrote:
>>> > > > On Thu Sep 18, 2025 at 11:48 PM CEST, rs wrote:
>>> > > > > From: Randolph Sapp <rs@ti.com>
>>> > > > >=20
>>> > > > > We've recently run into some issues with weston-init attempting=
 to start Weston
>>> > > > > prior to all drm devices being registered. There's not really a=
 good, scriptable
>>> > > > > mechanism to listen in to device registration events that works=
 with the
>>> > > > > existing weston-init package. Well, at least one that doesn't i=
nvolve polling
>>> > > > > files or introducing more dependency on the init system being u=
sed.
>>> > > > >=20
>>> > > > > I also see there is also a lot of scripting around starting X11=
,
>>> > > > > xserver-nodm-init, that (from my limited review) should experie=
nce the same
>>> > > > > issue.
>>> > > > >=20
>>> > > > > I'd like to introduce the following display manager for oe-core=
, emptty [1].
>>> > > > > This display manager is, as described upstream, a "Dead simple =
CLI Display
>>> > > > > Manager on TTY". It supports both x11 and wayland sessions, wit=
h togglable build
>>> > > > > parameters to completely remove x11 and pam dependencies. It's =
licensed MIT,
>>> > > > > which shouldn't be an issue for any users. (It is written in Go=
, if you have
>>> > > > > opinions about that.)
>>> > > > >=20
>>> > > > > With this, both weston-init and the xserver-nodm-init packages =
can be re-tuned
>>> > > > > to leverage this display manager and simply add a user and empt=
ty config for an
>>> > > > > autologin session. This can resolve the current behavior across=
 init systems
>>> > > > > without additional scripting, and move some development out of =
this layer.
>>> > > > >=20
>>> > > > > This lists myself as a maintainer of emptty as well as xserver-=
nodm-init and
>>> > > > > xuser-account since these are currently unassigned and I've rew=
orked them
>>> > > > > significantly here.
>>> > > > >=20
>>> > > > > Sorry for the delay on this series. I found a few bugs in emptt=
y that I wanted
>>> > > > > to address before submitting this officially.
>>> > > > >=20
>>> > > >=20
>>> > > > Hi Randolph,
>>> > > >=20
>>> > > > Thanks for your patch.
>>> > > >=20
>>> > > > I took this series, but it looks like we have a build issue, mayb=
e only
>>> > > > with altcfg distro:
>>> > > >=20
>>> > > > Traceback (most recent call last):
>>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/l=
ib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>>> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
>>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/l=
ib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>>> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
>>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/l=
ib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>>> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
>>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/l=
ib/oeqa/runtime/cases/xorg.py", line 31, in test_xorg_running
>>> > > > =C2=A0=C2=A0=C2=A0 self.assertEqual(status, 0, msg=3Dmsg)
>>> > > > AssertionError: 1 !=3D 0 : Xorg does not appear to be running=C2=
=A0=C2=A0 PID USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VSZ STAT COMMAND
>>> > > > ...
>>> > > > 2025/09/21 11:59:34 Closing PAM auth
>>> > > > 2025/09/21 11:59:34 Failure setting user credentials
>>> > > > 2025/09/21 11:59:34 Authentication failure
>>> > > > ...
>>> > > > RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.41s)
>>> > > >=20
>>> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/build=
s/2402
>>> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds=
/2407
>>> > > >=20
>>> > > > Can you have a look at it please?
>>> > > >=20
>>> > > > Thanks,
>>> > > > Mathieu
>>> > >=20
>>> > > In the past auth issues can occur if the user was created after the=
 current
>>> > > system time (of which the default would be the kernel build time if=
 it is unable
>>> > > to get a value from NTP).
>>> > >=20
>>> > > I've already tested this series with an equivalent config to poky-a=
ltcfg, with
>>> > > both root and rootless x11. I reset my cache and did another local =
build to
>>> > > match that CICD failure and it still works for me.
>>> > >=20
>>> > > My local.conf for my test build was:
>>> > >=20
>>> > > MACHINE ??=3D "qemux86"
>>> > > DISTRO ??=3D "poky-altcfg"
>>> > > BBMULTICONFIG ?=3D ""
>>> > > IMAGE_CLASSES +=3D "testimage"
>>> > >=20
>>> > > Other variables were dictated by templateconf.cfg:
>>> > >=20
>>> > > meta-poky/conf/templates/default
>>> > >=20
>>> > > Is that automation setting anything that could possibly play with t=
he build time
>>> > > or system time values for the testimage? I'm not seeing anything in=
 the logs,
>>> > > but I'm also not seeing anything that reports the current config ou=
tright.
>>> > >=20
>>> > > I guess I should add some messages for that as part of the test fun=
ction
>>> > > regardless.
>>> >=20
>>> > Whoops, I see the issue now. v10 inbound.
>>>=20
>>> Well, I know what the issue is, but I guess I should ask how people wan=
t to
>>> address it. Currently, that test expect a root x11 instance to autostar=
t. I have
>>> it attempt to do that currently, and my old test images were being buil=
t with
>>> "empty-root-password allow-empty-password allow-root-login" features en=
abled,
>>> allowing it to proceed as usual. The password auth is what is currently=
 failing.
>>>=20
>>> 1. We can do passwordless root auth for these by adjusting the pam rule=
 for
>>> emptty to allow auth as root for that application.
>>>=20
>>> 2. I would suggest that we instead make sure the root user is in the
>>> nopasswdlogin group, as it makes it clear that the user has unprotected=
 GUI
>>> access.
>>>=20
>>> I'm not sure either of these should really be allowed in a production
>>> environment though. Technically we can disable this behavior outright w=
hen
>>> ROOTLESS_X is set, but it's still a little odd to me.
>>>=20
>>> 3. Should the test images explicitly enable the empty-root-password
>>> allow-empty-password? That means the x11 test will have to move from an
>>> arbitrary runtime test to something like the way locales are currently =
tested.
>>>=20
>>> Seems like solution 2 is the easiest and preserves the expected behavio=
r for
>>> that test, assuming people are okay with that behavior.
>>
>> Ideally, we'd create a normal user and have the tests use that normal
>> user. The "root" based tests are historical and were done as testing
>> something was better than nothing. The world expects better security
>> practises and it would be good to ideally update the tests to better
>> match real world usage.
>>
>> I say ideally since I appreciate it sometimes can be too much work but
>> in this case it might not be, I haven't dug into the details though and
>> I'm a bit distracted. I just thought that info might be helpful for
>> direction.
>>
>> Cheers,
>>
>> Richard
>
> Thanks for the feedback Richard. There is currently already an xuser acco=
unt
> that is pulled in when ROOTLESS_X =3D 0. I assume the default behavior of=
 x11
> running as root is a holdover from that period before rootless x was poss=
ible.
>
> I can rework these tests and drop the root x11 compatibility path if ever=
yone is
> alright with that.
>
> - Randolph

Ah, should have proof read that a little more.
... when ROOTLESS_X =3D 1 ...

Point still stands. I'll drop the root x11 path unless anyone objects.

