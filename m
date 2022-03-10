Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67913C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 08:25:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.7398.1646900718243043742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 00:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fGbJP7Di;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso2897422wmr.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 00:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wUd5ZZE6Cwl3h5kE7YTeTAm4QkGa1LvLpZT3Znml8LM=;
        b=fGbJP7Di6cSF3PgO7tKQtGX5KTuC90N6M6UDWvecYAGJslkJBL0yNBoveNx6onSj3H
         zyQUY7K6t7y/6tfOrSPg2VG+eiuOxfFhx7iG2mfkN47LmnBG5UOOwDK+K9SutxkzagNZ
         AoIXPV0t4ndDflV3RehOCcjKLpG2T9gUoOVQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wUd5ZZE6Cwl3h5kE7YTeTAm4QkGa1LvLpZT3Znml8LM=;
        b=DwuI7ETFliDSWZnuG+Me7mIkLPjEYTPAC5mLd8npLX663/bDZNgFPcyFbUEU22NN7M
         MSRN25rwsw9lyqAqx20SUkHdVSNI1t10A1j/lz8R61r8T2fw3CC/WtwSF5WfHQNNtdh+
         iKf+G8VDLjhUBngJ5BAWaW2oZ5EcxxNSJr5D7N1Gz14zaGc5NETyvB0IW6BmnLdW1DIX
         SvoJG/5hJOeNe5RgsHRWK2P9B7bKrm+2Xox1nEgkc3eu3gr3DuuwkG49knTN/nyM/bnF
         2jSImhBerfNo1RIXTd57NtSXIwWYQbWnqqmtVMwljOqyA4hLFA8bKYPwcKiBBzalb+rE
         b8Tg==
X-Gm-Message-State: AOAM533Cy+I1RfEwv9bhEq/J7yWQzy8I03on8KXD2I3y/ir0e91HIjqb
	Dx+jxXfYAws8smdCruC/vvpcCg==
X-Google-Smtp-Source: 
 ABdhPJyCL7KsejsGut/iHs6EKFx0WLo/FFitIva5+So/Ho+1KXFSTZE5XIVk6aBSUalOWJ+CnZjG+w==
X-Received: by 2002:a7b:cf30:0:b0:389:89bd:6d32 with SMTP id
 m16-20020a7bcf30000000b0038989bd6d32mr2588643wmg.12.1646900716551;
        Thu, 10 Mar 2022 00:25:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4dd4:e08f:40b6:a45e?
 ([2001:8b0:aba:5f3c:4dd4:e08f:40b6:a45e])
        by smtp.gmail.com with ESMTPSA id
 k17-20020a05600c1c9100b00386bb6e9c50sm10825578wms.45.2022.03.10.00.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 00:25:16 -0800 (PST)
Message-ID: 
 <ea6111ffd8b81d40a4460ab581f0fcffd1b8dca7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.50.4 -> 1.50.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2022 08:25:13 +0000
In-Reply-To: <16DAC87E48F5147E.10252@lists.openembedded.org>
References: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
	 <1646735675-58918-2-git-send-email-wangmy@fujitsu.com>
	 <16DAC87E48F5147E.10252@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 08:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163004

On Wed, 2022-03-09 at 18:04 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Tue, 2022-03-08 at 18:34 +0800, wangmy wrote:
> > Changelog:
> > =========
> > * Fix compiler warnings
> > * Enable cairo by default
> > * pango-view: Show more baselines
> > * layout: Handle baselines
> > * Windows: build cleanups
> > 
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.5.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.5.bb} (94%)
> > 
> > diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.5.bb
> > similarity index 94%
> > rename from meta/recipes-graphics/pango/pango_1.50.4.bb
> > rename to meta/recipes-graphics/pango/pango_1.50.5.bb
> > index 0ea621bf67..3a0cbd57f0 100644
> > --- a/meta/recipes-graphics/pango/pango_1.50.4.bb
> > +++ b/meta/recipes-graphics/pango/pango_1.50.5.bb
> > @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
> >  
> >  SRC_URI += "file://run-ptest"
> >  
> > -SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
> > +SRC_URI[archive.sha256sum] = "6d136872da6207fe88c5cd2c95c36bcaf4ed29402b854663a86cd7efe99b0cf5"
> >  
> >  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
> 
> 
> I worry this may be causing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3211

Failed on arm too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2950/steps/12/logs/stdio

and didn't fail on a build without this upgrade.

Cheers,

Richard


