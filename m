Return-Path: <mohammedaqdam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D731C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 14:31:38 +0000 (UTC)
Subject: Re: Not able to install chrony on zeus
To: openembedded-core@lists.openembedded.org
From: "mohammed aqdam" <mohammedaqdam@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (157.45.74.156)
X-Originating-Platform: Windows Chrome 95
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 Nov 2021 06:31:37 -0800
References: 
 <CAMKF1so3tisSD4DK7L5WuyC0FJQZ_+VzY3xf+jknJnbEyrnoRQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so3tisSD4DK7L5WuyC0FJQZ_+VzY3xf+jknJnbEyrnoRQ@mail.gmail.com>
Message-ID: <32437.1638282697718151473@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Yl1ZoX94a17zDxufyvbI"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 14:31:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158975

--Yl1ZoX94a17zDxufyvbI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Khem Raj, Found jamvm class with update-alternative option.
jamvm.inc\jamvm\recipes-core - meta-java - Layer containing recipes for Ope=
nJDK and other open source Java- (yoctoproject.org) ( https://git.yoctoproj=
ect.org/meta-java/tree/recipes-core/jamvm/jamvm.inc?h=3Dmaster )

I see chrony is trying to fetch ntp_4.2.8p13-r0 but r0 is not present in ( =
Index of /~ntp/ntp_spool/ntp4/ntp-4.2 (udel.edu) ( https://www.eecis.udel.e=
du/~ntp/ntp_spool/ntp4/ntp-4.2/ ) ).
Also in chrony folder(meta-openembedded/meta-networking/recipes-support/chr=
ony/),I could not find where we are assigning this version of ntp.

Please let me know how we can resolve this dependency or how can we add chr=
ony in some other way.

Thanks,
Aqdam

--Yl1ZoX94a17zDxufyvbI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Khem Raj, Found jamvm class with update-alternative option.<br /><a =
href=3D"https://git.yoctoproject.org/meta-java/tree/recipes-core/jamvm/jamv=
m.inc?h=3Dmaster">jamvm.inc\jamvm\recipes-core - meta-java - Layer containi=
ng recipes for OpenJDK and other open source Java- (yoctoproject.org)</a><b=
r /><br />I see chrony is trying to fetch ntp_4.2.8p13-r0 but r0 is not pre=
sent in (<a href=3D"https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/=
">Index of /~ntp/ntp_spool/ntp4/ntp-4.2 (udel.edu)</a>).<br />Also in chron=
y folder(meta-openembedded/meta-networking/recipes-support/chrony/),I could=
 not find where we are assigning this version of ntp.<br /><br />Please let=
 me know how we can resolve this dependency or how can we add chrony in som=
e other way.<br /><br />Thanks,<br />Aqdam<br />

--Yl1ZoX94a17zDxufyvbI--

