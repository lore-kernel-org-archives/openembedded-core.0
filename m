Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B58C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 10:22:06 +0000 (UTC)
Subject: Re: [PATCH V4] meta: rust - Bug fix for target definitions returning
 'NoneType' for arm
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Belgaum, Karnataka, IN (103.197.112.156)
X-Originating-Platform: Windows Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 May 2022 03:21:58 -0700
References: 
 <b7357d18166022d50cb688d03bf076bd39d79fb6.camel@linuxfoundation.org>
In-Reply-To: 
 <b7357d18166022d50cb688d03bf076bd39d79fb6.camel@linuxfoundation.org>
Message-ID: <10389.1653387718015832235@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dkgGT3qzMjwrz60rMyhL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 10:22:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166054

--dkgGT3qzMjwrz60rMyhL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

The patch you sent in rust-common.bbclass fixing the ' oe-selftest -r sstat=
etests.SStateTests.test_sstate_allarch_samesigs' test issue but the regress=
ion test shows that the 'sstatetests.SStateTests.test_sstate_32_64_same_has=
h' is getting failed. So, I think this change is not correct. With this pat=
ch, the diffsigs shows 'rust-native' sigdata is changed based on the change=
d value for RUST_TARGET_SYS variable (in x86_64 :: x86_64-unknown-linux-gnu=
 & in i686 :: i686-unknown-linux-gnu). I tried several attempts to fix it b=
ut nothing worked out yet.

@Alex.
Did you get sometime to look into this 'arm' issue introduced with your com=
mit?

Thanks,
Sundeep K.

--dkgGT3qzMjwrz60rMyhL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,<br /><br />The patch you sent in&nbsp;<em><span style=3D"whi=
te-space: pre-wrap;">rust-common.bbclass </span></em><span style=3D"white-s=
pace: pre-wrap;">fixing the '</span><span style=3D"white-space: pre-wrap;">=
oe-selftest -r </span><span style=3D"white-space: pre-wrap;">sstatetests.SS=
tateTests.test_sstate_allarch_samesigs' test issue but the regression test =
shows that the 'sstatetests.SStateTests.test_sstate_32_64_same_hash' is get=
ting failed. So, I think this change is not correct. With this patch, the d=
iffsigs shows 'rust-native' sigdata is changed based on the changed value f=
or RUST_TARGET_SYS variable (in x86_64 :: x86_64-unknown-linux-gnu &amp; in=
 i686 :: i686-unknown-linux-gnu). I tried several attempts to fix it but no=
thing worked out yet.<br /><br /><br /></span>@Alex.<br />Did you get somet=
ime to look into this 'arm' issue introduced with your commit?<br /><br /><=
br /><br /><span style=3D"white-space: pre-wrap;">Thanks,</span><br /><span=
 style=3D"white-space: pre-wrap;">Sundeep K.</span>

--dkgGT3qzMjwrz60rMyhL--

