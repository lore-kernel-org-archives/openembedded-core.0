Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB1AC25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 03:54:05 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by mx.groups.io with SMTP id smtpd.web12.51162.1660881244463374178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 20:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=k+yWj9gL;
 spf=pass (domain: mediatek.com, ip: 210.61.82.184,
 mailfrom: yang.xu@mediatek.com)
X-UUID: dee75da79d8c4090bb0b696a7d2abfb7-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JoppFLnnB+j0XYLC4k3jI657p08LhEuGR82KZv7RCSE=;
	b=k+yWj9gLkXjaL9railq/Pg47inl82/OLgeAirhUEZPYz14adXqAJkB/0cmfX3MY4ebXGyEdz55ZQnwzWoFW8uuMsrQYWxXxTnoe192xbmyzToGSbw8G3nCOmWW4B/VVLXFKDR+RV0SwKo9ilojumyN6JRSzWA0VNmTjZVNN6XeY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:eb05c61f-2fa8-4483-bded-8b3340371dd2,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:966bc0fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: dee75da79d8c4090bb0b696a7d2abfb7-20220819
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1305314055; Fri, 19 Aug 2022 11:53:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 19 Aug 2022 11:53:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 19 Aug 2022 11:53:57 +0800
Message-ID: <cc444757aa8fed6d4e182209aecd47f6face963e.camel@mediatek.com>
Subject: Re: [OE-core] [PATCH v2] insane.bbclass: Skip patches not in
 oe-core by full path
From: Yang Xu <yang.xu@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2022 03:53:55 +0000
In-Reply-To: <Yv0kTr/PBCFaj2k8@mail.local>
References: <20220815053935.15950-1-yang.xu@mediatek.com>
	 <Yv0kTr/PBCFaj2k8@mail.local>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 03:54:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169570

Hi Alexandre,

Sorry for my neglience. Error caused by the last "/" was eaten by
os.path.abspath.

I have fixed and submitted PATCH v3.

Thank you

On Wed, 2022-08-17 at 19:24 +0200, Alexandre Belloni wrote:
> Hello,
> 
> This doesn't seem to work as expected:
> 
> 
https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/typhoon/*/builders/120/builds/1599/steps/12/logs/stdio__;Iw!!CTRNKA9wMg0ARbw!w2oEYTVQJHnJaZ1uIyOM8anxM71iSFQOOkD0yUlbiPPnPzMEZNzYT-4fATdVatAd$
>  
> 
> 
https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/typhoon/*/builders/100/builds/3296/steps/12/logs/stdio__;Iw!!CTRNKA9wMg0ARbw!w2oEYTVQJHnJaZ1uIyOM8anxM71iSFQOOkD0yUlbiPPnPzMEZNzYT-4fAS5I-4JV$
>  
> 
> 
https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/typhoon/*builders/128/builds/495/steps/13/logs/stdio__;Iw!!CTRNKA9wMg0ARbw!w2oEYTVQJHnJaZ1uIyOM8anxM71iSFQOOkD0yUlbiPPnPzMEZNzYT-4fAWjB-itS$
>  
> 
> On 15/08/2022 05:39:35+0000, Yang Xu via lists.openembedded.org
> wrote:
> > The full path of patch may contain '/meta/' but not in oe-core,
> > skip
> > patches by checking it starts with oe-core full path or not.
> > 
> > Signed-off-by: Yang Xu <yang.xu@mediatek.com>
> > ---
> >  meta/classes-global/insane.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-
> > global/insane.bbclass
> > index 46ea41e271..42daf4388e 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -1214,11 +1214,12 @@ python do_qa_patch() {
> >      import re
> >      from oe import patch
> >  
> > +    coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta/')
> >      for url in patch.src_patches(d):
> >         (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
> >  
> >         # skip patches not in oe-core
> > -       if '/meta/' not in fullpath:
> > +       if not
> > os.path.abspath(fullpath).startswith(os.path.abspath(coremeta_path)
> > ):
> >             continue
> >  
> >         kinda_status_re = re.compile(r"^.*upstream.*status.*$",
> > re.IGNORECASE | re.MULTILINE)
> > -- 
> > 2.25.1
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169350): 
> > https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/169350__;!!CTRNKA9wMg0ARbw!w2oEYTVQJHnJaZ1uIyOM8anxM71iSFQOOkD0yUlbiPPnPzMEZNzYT-4fARANYK9G$
> >  
> > Mute This Topic: 
> > https://urldefense.com/v3/__https://lists.openembedded.org/mt/93030817/3617179__;!!CTRNKA9wMg0ARbw!w2oEYTVQJHnJaZ1uIyOM8anxM71iSFQOOkD0yUlbiPPnPzMEZNzYT-4fARYBjDjv$
> >  
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: 
> > https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!CTRNKA9wMg0ARbw!w2oEYTVQJHnJaZ1uIyOM8anxM71iSFQOOkD0yUlbiPPnPzMEZNzYT-4fAQIdRTcQ$
> > $  [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 


