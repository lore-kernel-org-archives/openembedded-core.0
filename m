Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BB1C41535
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 15:07:23 +0000 (UTC)
Received: from 4.mo561.mail-out.ovh.net (4.mo561.mail-out.ovh.net [178.33.46.10])
 by mx.groups.io with SMTP id smtpd.web11.37990.1702480039228163137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 07:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 178.33.46.10, mailfrom: jonathan@joggee.fr)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.25.233])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 3406E266AD
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-s8sv4 (unknown [10.110.178.109])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E2FDA1FE91
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:16 +0000 (UTC)
Received: from joggee.fr ([37.59.142.102])
	by ghost-submission-6684bf9d7b-s8sv4 with ESMTPSA
	id y/SrNqTIeWXXtQAAm3lx3g
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:16 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R00405fd93e6-8dec-489c-8b25-e52f4743e9ac,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
Message-Id: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 13 Dec 2023 15:07:14 +0000
Subject: [PATCH v2 0/3] lib/oe/package: allow to scan extra directories for
 locale files
X-Ovh-Tracer-Id: 14457962178843643003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepvdegudetgefhleeiledtheeltefgjefhgeefveehhfffiedutddvveetkeetkeffnecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192300

Ok, let's try it one more time with suggestions proposed:
- Add "Signed-off-by" to the commits ;
- Fix the subject of the cover letter.

----

Just playing with cups and observe the main packages includes localized HTML templates in /usr/share/cups/templates. Locale packages were only looking for files in /usr/locale. This serie of patches allows to add extra directories to be scanned.
For a next patch, I would also like possible FILES:${PN}-locale-* variables defined in recipe not to be overriden by the split_locales() function.

It is my first patch proposal on this project. Thanks in advance for your feedbacks.

Regards,
Jonathan GUILLOT

Jonathan GUILLOT (3):
  lib/oe/package: replace in place PN-locale-* packages in PACKAGES
  lib/oe/package: add LOCALEEXTRADIRS to define extra locations for
    locales
  cups: use LOCALEEXTRADIRS to split localized HTML templates

 meta/lib/oe/package.py              | 33 ++++++++++++++++++++++-------
 meta/recipes-extended/cups/cups.inc |  2 ++
 2 files changed, 27 insertions(+), 8 deletions(-)


base-commit: 41390f5202a6ee7472cb82d12c7c32f89d6e52ff
-- 
2.43.0

