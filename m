Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347E7C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 07:30:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.4857.1665646220469024441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 00:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AB4Ikrmc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 02AB624001B;
	Thu, 13 Oct 2022 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665646218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfxFRoyg4MDPsLo6D0YQqHRdkVFHqwvPDrW7Kr6ZkGs=;
	b=AB4IkrmcI3tIwQdev1lTcrCMT19BBDnjGgbwQJGqkbc+zSBasxkdpVA42ODuEIoOLF4WMy
	FnO4XquuZIO8W73G0iv9hC1jyEM6/QCpJ1xaEEx+dNUlOKP3Jh5bepcxwXAZbFZIdcbOuw
	o26X+/WsA1tP24ZbORv+M88wGvEsaSCEEZ+w88NogoKprHWLJrF5d7ir7lQBmYjM9nRiUV
	wvCP01SgAuBqA6sZMy3DMPk81YgAk5aBixQJ9FixEha8IEY/8gVd/4pvW+bGjW+Edsa+Dx
	R2ZVSq4+qgc4tYMA80mXC7T1ZeHX4xhX54InTa8zLkXDSLBlnXKZ/mU2HI2v5Q==
Date: Thu, 13 Oct 2022 09:30:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.50.10 -> 1.50.11
Message-ID: <Y0e+ifOc5Wq4ortM@mail.local>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
 <1665475558-16409-4-git-send-email-wangmy@fujitsu.com>
 <D47A4D61-C059-4AE3-A08F-89D4BC7F429B@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D47A4D61-C059-4AE3-A08F-89D4BC7F429B@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 07:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171682

On 12/10/2022 16:46:44+0000, Ross Burton wrote:
> We only have 1.50.9 in oe-core master, please ensure that you sent patches based on master, or if they’re based on another staging branch please make that clear.
> 

this applied fine on master-next because we carry your 1.50.10 upgrade

> Ross
> 
> > On 11 Oct 2022, at 09:05, wangmy via lists.openembedded.org <wangmy=fujitsu.com@lists.openembedded.org> wrote:
> > 
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> > .../pango/{pango_1.50.10.bb => pango_1.50.11.bb}                | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > rename meta/recipes-graphics/pango/{pango_1.50.10.bb => pango_1.50.11.bb} (94%)
> > 
> > diff --git a/meta/recipes-graphics/pango/pango_1.50.10.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
> > similarity index 94%
> > rename from meta/recipes-graphics/pango/pango_1.50.10.bb
> > rename to meta/recipes-graphics/pango/pango_1.50.11.bb
> > index 95209889a8..1120e053b8 100644
> > --- a/meta/recipes-graphics/pango/pango_1.50.10.bb
> > +++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
> > @@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
> >             file://0001-Skip-running-test-layout-test.patch \
> > "
> > 
> > -SRC_URI[archive.sha256sum] = "7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966"
> > +SRC_URI[archive.sha256sum] = "8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae"
> > 
> > DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
> > 
> > -- 
> > 2.25.1
> > 
> > 
> > 
> > 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171672): https://lists.openembedded.org/g/openembedded-core/message/171672
> Mute This Topic: https://lists.openembedded.org/mt/94254215/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

