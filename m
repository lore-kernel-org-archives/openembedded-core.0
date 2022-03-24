Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B959FC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 09:45:01 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.8873.1648115100063136735
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 02:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44,
 mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 720379C0244;
	Thu, 24 Mar 2022 05:44:58 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10032)
	with ESMTP id uZz9bgDgKmoP; Thu, 24 Mar 2022 05:44:57 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C0A819C024D;
	Thu, 24 Mar 2022 05:44:57 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10026)
	with ESMTP id 7LF-dqMQRdTd; Thu, 24 Mar 2022 05:44:57 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9B97C9C0244;
	Thu, 24 Mar 2022 05:44:57 -0400 (EDT)
Date: Thu, 24 Mar 2022 05:44:57 -0400 (EDT)
From: Enguerrand de Ribaucourt
  <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: 
 <784707888.393251.1648115097590.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <Yjs+RGCl6mjOAoSN@piout.net>
References: 
 <20220323085009.11573-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <Yjs+RGCl6mjOAoSN@piout.net>
Subject: Re: [OE-core][PATCH] mobile-broadband-provider-info: update branch
 name
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - FF97
 (Linux)/8.8.15_GA_4232)
Thread-Topic: mobile-broadband-provider-info: update branch name
Thread-Index: aThRZjJ4yvaEMmK3HXY6yOpFKDNjjg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 09:45:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163602

----- Original Message -----
> From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
> To: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairelinux.com>
> Cc: openembedded-core@lists.openembedded.org
> Sent: Wednesday, March 23, 2022 4:35:32 PM
> Subject: Re: [OE-core][PATCH] mobile-broadband-provider-info: update branch name

> Hello Enguerrand,

> This was already fixed in master in:
> https://git.openembedded.org/openembedded-core/commit/?id=ed02ee8f20094f598448d58875cb7be8a24a019f

> Is this for another branch?

Hello Alexandre,

Yes, this patch is for honister. The issue is also yet unfixed in the dunfell branch.

Thank you for your time.

> On 23/03/2022 09:50:10+0100, Enguerrand de Ribaucourt wrote:
> > The master branch was renamed main, resulting in do_fetch failure.
> > This patch updates SRC_URI with the new branch name.

>> Signed-off-by: Enguerrand de Ribaucourt
> > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > ---
> > .../mobile-broadband-provider-info_git.bb | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)

>> diff --git
>> a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> > b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> > index 4246f4dcbd..3b170f4fdd 100644
>> ---
> > a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
>> +++
> > b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> > @@ -8,7 +8,7 @@ SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
> > PV = "20210805"
> > PE = "1"

>> -SRC_URI =
> > "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
>> +SRC_URI =
> > "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
> > S = "${WORKDIR}/git"

> > inherit autotools
> > --
> > 2.25.1



> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
>> View/Reply Online (#163581):
> > https://lists.openembedded.org/g/openembedded-core/message/163581
> > Mute This Topic: https://lists.openembedded.org/mt/89971498/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-


> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

