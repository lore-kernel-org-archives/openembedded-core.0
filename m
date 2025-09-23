Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A44CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:57:22 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4209.1758650239181653943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HrO5F2Ry;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NHuofO1527312;
	Tue, 23 Sep 2025 12:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758650210;
	bh=7Iff4P9Dl9aJoxsofLRYkmojJd4wsnEa34q+SNcoqj4=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=HrO5F2Rygt1oGpdID1Qrjze5fdRSgVHK/bKCyqQv/+pQo896IxFZFlsTgnf8zS70w
	 CbW/8QiM/WdYwxsGwZnlZgrodwMYdsh87l05u3YNQEFPubpshvcFStGcwyaqH3Fdmf
	 13fjYZ04Se+Op+db7z3pivVJjg3mfwoHwCP8e3eA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NHunMU2960720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 12:56:49 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 12:56:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 12:56:49 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NHunxZ430389;
	Tue, 23 Sep 2025 12:56:49 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 23 Sep 2025 12:56:49 -0500
Message-ID: <DD0DGWS9IFBX.1HVT0NAJL6UVQ@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randolph Sapp
	<rs@ti.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250918214903.341452-1-rs@ti.com>
 <DCYH5V5GB1LB.1KAPRIVKZGTWO@bootlin.com>
 <1867B951D10D3F9C.23856@lists.openembedded.org>
 <1867BAF5F353054B.23856@lists.openembedded.org>
 <DCZPMZBQPTOP.2OZDXN58O263N@ti.com>
 <cee4b39698f8607acf3f396e06d94a713a66d134.camel@linuxfoundation.org>
In-Reply-To: <cee4b39698f8607acf3f396e06d94a713a66d134.camel@linuxfoundation.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 17:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223906

On Tue Sep 23, 2025 at 4:03 AM CDT, Richard Purdie wrote:
> On Mon, 2025-09-22 at 18:16 -0500, Randolph Sapp wrote:
>> On Mon Sep 22, 2025 at 5:21 PM CDT, Randolph Sapp via lists.openembedded=
.org wrote:
>> > On Mon Sep 22, 2025 at 4:51 PM CDT, Randolph Sapp via lists.openembedd=
ed.org wrote:
>> > > On Sun Sep 21, 2025 at 7:25 AM CDT, Mathieu Dubois-Briand wrote:
>> > > > On Thu Sep 18, 2025 at 11:48 PM CEST, rs wrote:
>> > > > > From: Randolph Sapp <rs@ti.com>
>> > > > >=20
>> > > > > We've recently run into some issues with weston-init attempting =
to start Weston
>> > > > > prior to all drm devices being registered. There's not really a =
good, scriptable
>> > > > > mechanism to listen in to device registration events that works =
with the
>> > > > > existing weston-init package. Well, at least one that doesn't in=
volve polling
>> > > > > files or introducing more dependency on the init system being us=
ed.
>> > > > >=20
>> > > > > I also see there is also a lot of scripting around starting X11,
>> > > > > xserver-nodm-init, that (from my limited review) should experien=
ce the same
>> > > > > issue.
>> > > > >=20
>> > > > > I'd like to introduce the following display manager for oe-core,=
 emptty [1].
>> > > > > This display manager is, as described upstream, a "Dead simple C=
LI Display
>> > > > > Manager on TTY". It supports both x11 and wayland sessions, with=
 togglable build
>> > > > > parameters to completely remove x11 and pam dependencies. It's l=
icensed MIT,
>> > > > > which shouldn't be an issue for any users. (It is written in Go,=
 if you have
>> > > > > opinions about that.)
>> > > > >=20
>> > > > > With this, both weston-init and the xserver-nodm-init packages c=
an be re-tuned
>> > > > > to leverage this display manager and simply add a user and emptt=
y config for an
>> > > > > autologin session. This can resolve the current behavior across =
init systems
>> > > > > without additional scripting, and move some development out of t=
his layer.
>> > > > >=20
>> > > > > This lists myself as a maintainer of emptty as well as xserver-n=
odm-init and
>> > > > > xuser-account since these are currently unassigned and I've rewo=
rked them
>> > > > > significantly here.
>> > > > >=20
>> > > > > Sorry for the delay on this series. I found a few bugs in emptty=
 that I wanted
>> > > > > to address before submitting this officially.
>> > > > >=20
>> > > >=20
>> > > > Hi Randolph,
>> > > >=20
>> > > > Thanks for your patch.
>> > > >=20
>> > > > I took this series, but it looks like we have a build issue, maybe=
 only
>> > > > with altcfg distro:
>> > > >=20
>> > > > Traceback (most recent call last):
>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/li=
b/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/li=
b/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/li=
b/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
>> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/li=
b/oeqa/runtime/cases/xorg.py", line 31, in test_xorg_running
>> > > > =C2=A0=C2=A0=C2=A0 self.assertEqual(status, 0, msg=3Dmsg)
>> > > > AssertionError: 1 !=3D 0 : Xorg does not appear to be running=C2=
=A0=C2=A0 PID USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VSZ STAT COMMAND
>> > > > ...
>> > > > 2025/09/21 11:59:34 Closing PAM auth
>> > > > 2025/09/21 11:59:34 Failure setting user credentials
>> > > > 2025/09/21 11:59:34 Authentication failure
>> > > > ...
>> > > > RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.41s)
>> > > >=20
>> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds=
/2402
>> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/=
2407
>> > > >=20
>> > > > Can you have a look at it please?
>> > > >=20
>> > > > Thanks,
>> > > > Mathieu
>> > >=20
>> > > In the past auth issues can occur if the user was created after the =
current
>> > > system time (of which the default would be the kernel build time if =
it is unable
>> > > to get a value from NTP).
>> > >=20
>> > > I've already tested this series with an equivalent config to poky-al=
tcfg, with
>> > > both root and rootless x11. I reset my cache and did another local b=
uild to
>> > > match that CICD failure and it still works for me.
>> > >=20
>> > > My local.conf for my test build was:
>> > >=20
>> > > MACHINE ??=3D "qemux86"
>> > > DISTRO ??=3D "poky-altcfg"
>> > > BBMULTICONFIG ?=3D ""
>> > > IMAGE_CLASSES +=3D "testimage"
>> > >=20
>> > > Other variables were dictated by templateconf.cfg:
>> > >=20
>> > > meta-poky/conf/templates/default
>> > >=20
>> > > Is that automation setting anything that could possibly play with th=
e build time
>> > > or system time values for the testimage? I'm not seeing anything in =
the logs,
>> > > but I'm also not seeing anything that reports the current config out=
right.
>> > >=20
>> > > I guess I should add some messages for that as part of the test func=
tion
>> > > regardless.
>> >=20
>> > Whoops, I see the issue now. v10 inbound.
>>=20
>> Well, I know what the issue is, but I guess I should ask how people want=
 to
>> address it. Currently, that test expect a root x11 instance to autostart=
. I have
>> it attempt to do that currently, and my old test images were being built=
 with
>> "empty-root-password allow-empty-password allow-root-login" features ena=
bled,
>> allowing it to proceed as usual. The password auth is what is currently =
failing.
>>=20
>> 1. We can do passwordless root auth for these by adjusting the pam rule =
for
>> emptty to allow auth as root for that application.
>>=20
>> 2. I would suggest that we instead make sure the root user is in the
>> nopasswdlogin group, as it makes it clear that the user has unprotected =
GUI
>> access.
>>=20
>> I'm not sure either of these should really be allowed in a production
>> environment though. Technically we can disable this behavior outright wh=
en
>> ROOTLESS_X is set, but it's still a little odd to me.
>>=20
>> 3. Should the test images explicitly enable the empty-root-password
>> allow-empty-password? That means the x11 test will have to move from an
>> arbitrary runtime test to something like the way locales are currently t=
ested.
>>=20
>> Seems like solution 2 is the easiest and preserves the expected behavior=
 for
>> that test, assuming people are okay with that behavior.
>
> Ideally, we'd create a normal user and have the tests use that normal
> user. The "root" based tests are historical and were done as testing
> something was better than nothing. The world expects better security
> practises and it would be good to ideally update the tests to better
> match real world usage.
>
> I say ideally since I appreciate it sometimes can be too much work but
> in this case it might not be, I haven't dug into the details though and
> I'm a bit distracted. I just thought that info might be helpful for
> direction.
>
> Cheers,
>
> Richard

Thanks for the feedback Richard. There is currently already an xuser accoun=
t
that is pulled in when ROOTLESS_X =3D 0. I assume the default behavior of x=
11
running as root is a holdover from that period before rootless x was possib=
le.

I can rework these tests and drop the root x11 compatibility path if everyo=
ne is
alright with that.

- Randolph

