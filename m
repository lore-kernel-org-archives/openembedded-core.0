Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6218AC3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 18:20:26 +0000 (UTC)
Subject: Re: [PATCH 1/2] gcc: Oe-selftest failure analysis - fix for host key verfication & kex exchange identification failures
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.196.22.143)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Jul 2024 11:20:16 -0700
References: <9e2d9685c9d39d04cc58ae3f8a9e24cdf4b9d8ea.camel@linuxfoundation.org>
In-Reply-To: <9e2d9685c9d39d04cc58ae3f8a9e24cdf4b9d8ea.camel@linuxfoundation.org>
Message-ID: <24889.1721154016244458489@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ieiDNXxa7eJjlO1YVYEJ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 18:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202127

--ieiDNXxa7eJjlO1YVYEJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In fedora distro while running oe-selftest for gcc, owner permessions of fi=
les in /etc/ssh/ is getting changed to "nobody nobody" as following "-rw-r-=
-r--. 1 nobody nobody 581 Jan 10 =C2=A02024 /etc/ssh/ssh_config.d/50-redhat=
.conf". Because of this we are getting bad owner permission's on /etc/ssh/s=
sh-config.d/5-redhat.conf.
But in Ubuntu while running oe-selftest for gcc, owner permissions of files=
 in /etc/ssh/ =C2=A0are =C2=A0"root root" that why its working in Ubuntu.

when checked with upstream they suggested this can happen if the tests run =
through systemd unit and if systemd unit have ProtectHome=3Dyes or PrivateU=
sers=3Dyes then this can make the ownership of the file appear to be nobody=
 instead of root .
https://www.reddit.com/r/Fedora/comments/1dimh0i/bad_owner_or_permissions_o=
n_etcsshssh/

we have tried in fedora docker and there also while running oe-selftest for=
 gcc, we are having owner permissions of files in /etc/ssh/ =C2=A0are =C2=
=A0"root root".

May be this is to be changed on fedora host machine(autobuilder?).

Thanks,
Harish

--ieiDNXxa7eJjlO1YVYEJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>In fedora distro while running oe-selftest for gcc, owner permessions =
of files in /etc/ssh/ is getting changed to "nobody nobody" as following "-=
rw-r--r--. 1 nobody nobody 581 Jan 10 &nbsp;2024 /etc/ssh/ssh_config.d/50-r=
edhat.conf". Because of this we are getting bad owner permission's on /etc/=
ssh/ssh-config.d/5-redhat.conf.&nbsp;</div>
<div>But in Ubuntu while running oe-selftest for gcc, owner permissions of =
files in /etc/ssh/ &nbsp;are &nbsp;"root root" that why its working in Ubun=
tu.&nbsp;</div>
<div><br />when checked with upstream they suggested this can happen if the=
 tests run through systemd unit and if systemd unit have ProtectHome=3Dyes =
or PrivateUsers=3Dyes then this can make the ownership of the file appear t=
o be nobody instead of root .<br /><a href=3D"https://www.reddit.com/r/Fedo=
ra/comments/1dimh0i/bad_owner_or_permissions_on_etcsshssh/" target=3D"_blan=
k" rel=3D"noopener">https://www.reddit.com/r/Fedora/comments/1dimh0i/bad_ow=
ner_or_permissions_on_etcsshssh/</a></div>
<div><br />we have tried in fedora docker and there also while running oe-s=
elftest for gcc, we are having owner permissions of files in /etc/ssh/ &nbs=
p;are &nbsp;"root root".</div>
<div><br />May be this is to be changed on fedora host machine(autobuilder?=
).&nbsp;<br /><br />Thanks,<br />Harish</div>

--ieiDNXxa7eJjlO1YVYEJ--

