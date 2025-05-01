Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1DAC5B548
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1822.1746113638667162503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jNLavHAj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rthcnQ2D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101968c7baf47-882c09f4-9230-4844-9583-740690ff65d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kOeJLzFh/heaIuuLZ9ebXNoRLv8wiQfVsx/4CtUuJeo=;
	b=jNLavHAj2N6eqQq7TMOu46sXklfRME0eFwTEs/N3Ua+6TtBR1uay4AWY4HDkdMIE
	vfkK8Y68P6usoKYX+nM938A0odJjZNZw0uo+Fnjnp+YgmDZxmWp3LXp0GbkEMeG3gC/
	tQQeWoY/Acn74fCrPU0tt+GaX84FIon3tnKtj8c0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kOeJLzFh/heaIuuLZ9ebXNoRLv8wiQfVsx/4CtUuJeo=;
	b=rthcnQ2Dhy0XLks/G858VZKW9eXdeMMK6ajHYi8nUeTzHyZXd6HJtLyO12Jx+1I+
	GKnhj+Fv1l67xQy51H3yMwJIBGgXDeQ9n8e6SuAPBi+ckgFJfdYWP56bEHJyr65SRYG
	CKAZ+yvF6I6RGB2m8Hxtz/FF+f/Srd7VCg7QwjPE=
Content-Type: multipart/mixed; boundary="===============3979128919625429848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.88.0 SUCCEEDED
Message-ID: <010101968c7baf47-882c09f4-9230-4844-9583-740690ff65d1-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215883

--===============3979128919625429848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.88.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.87.0-1.88.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2e48262c018fabe3762623b9ec0494b4e43ea53b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 13:55:23 +0000
Subject: [PATCH] boost-build-native: upgrade 1.87.0 -> 1.88.0

---
 ...{boost-build-native_1.87.0.bb => boost-build-native_1.88.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.88.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.88.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.88.0.bb
-- 
2.47.1


--===============3979128919625429848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.87.0-1.88.0.patch"

RnJvbSAyZTQ4MjYyYzAxOGZhYmUzNzYyNjIzYjllYzA0OTRiNGU0M2VhNTNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMzo1NToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJv
b3N0LWJ1aWxkLW5hdGl2ZTogdXBncmFkZSAxLjg3LjAgLT4gMS44OC4wCgotLS0KIC4uLntib29z
dC1idWlsZC1uYXRpdmVfMS44Ny4wLmJiID0+IGJvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg4LjAuYmJ9
IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC97Ym9vc3QtYnVpbGQtbmF0aXZlXzEuODcu
MC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS44OC4wLmJifSAoMTAwJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC1idWlsZC1uYXRpdmVfMS44Ny4wLmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODguMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Ym9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODguMC5iYgotLSAKMi40Ny4xCgo=

--===============3979128919625429848==--

