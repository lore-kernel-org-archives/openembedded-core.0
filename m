Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ABFC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 20:43:02 +0000 (UTC)
Subject: Re: [PATCH] patchtest: Add test for deprecated CVE_CHECK_IGNORE
To: openembedded-core@lists.openembedded.org
From: simone.p.weiss@posteo.com
X-Originating-Location: Georgsmarienhuette, Lower Saxony, DE (31.19.221.127)
X-Originating-Platform: Linux Firefox 115
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 Dec 2023 12:42:53 -0800
References: <878d9666-9b33-4058-853e-081181f46c74@baylibre.com>
In-Reply-To: <878d9666-9b33-4058-853e-081181f46c74@baylibre.com>
Message-ID: <4872.1702932173537517107@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bq9YX4GubSnPqPs6gOkG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 20:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192677

--bq9YX4GubSnPqPs6gOkG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> I agree,=C2=A0 this would be a good change to make for long-term
> maintainability. LGTM otherwise.

I have tried to implement such a check as well, and while this check is fin=
e
and works, the test of a patch with patchtest containing a variable from
BB_RENAMED_VARIABLES that is not a pretest, i.e. the patch is already merge=
d,
the tinfoil setup and the subsequent parsing of the recipes while raise an =
issue for this test.

e.g.

ERROR: Variable SDK_LOCAL_CONF_BLACKLIST has been renamed to
ESDK_LOCALCONF_REMOVE
...

So on the one hand the issues is already cached by other parts of the
buildsystem and on the other hand this will cause tests not related to
renamed variables to fail.

It was suggested on bugzilla by Trevor to merge this original test and open
an issue in bugzilla to address the question of
BB_RENAMED_VARIABLES separately. See [1]

If you do agree, please tell me if a rebased version of the patch would be
needed or not.

- Cheers,
Simone

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15311#c5

--bq9YX4GubSnPqPs6gOkG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>I agree,&nbsp; this would be a good change to make for long-ter=
m maintainability. LGTM otherwise.</blockquote>
I have tried to implement such a check as well, and while this check is fin=
e<br />and works, the test of a patch with patchtest containing a variable =
from<br />BB_RENAMED_VARIABLES that is not a pretest, i.e. the patch is alr=
eady merged,<br />the tinfoil setup and the subsequent parsing of the recip=
es while raise an issue for this test.<br /><br />e.g. <br /><br />ERROR: V=
ariable SDK_LOCAL_CONF_BLACKLIST has been renamed to <br />ESDK_LOCALCONF_R=
EMOVE<br />...<br /><br />So on the one hand the issues is already cached b=
y other parts of the<br />buildsystem and on the other hand this will cause=
 tests not related to<br />renamed variables to fail.<br /><br />It was sug=
gested on bugzilla by Trevor to merge this original test and open<br />an i=
ssue in bugzilla to address the question of<br />BB_RENAMED_VARIABLES separ=
ately. See [1]<br /><br />If you do agree, please tell me if a rebased vers=
ion of the patch would be<br />needed or not.<br /><br />- Cheers,<br />Sim=
one<br /><br />[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1531=
1#c5

--bq9YX4GubSnPqPs6gOkG--

