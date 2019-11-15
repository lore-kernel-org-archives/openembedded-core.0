Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 364E360685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 11:48:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l7so10656760wrp.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 03:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MJlLTFiaJIxWOzfP4uyZuHb00jbBuagjdge6fStgkno=;
	b=VoasXoJ8oHieAxGpG3ylKAB225/iNhflICsITrQrIX/ZKw4LSv8J6sdbG42Yr1GOQP
	45v2E03bTC0/pe28NUheemEheZfYO3ZlOHXJ9okUgne4AEFBB/phDyVxim+diRs/imRE
	kFdgOVr9ShK/eIFFsJDhfnM0qEFQjcbUxaqpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MJlLTFiaJIxWOzfP4uyZuHb00jbBuagjdge6fStgkno=;
	b=P33AGKZKt73gbwHQjUWEPWw+7lF3BErGP79Aja+ATWHfg4QV30hcBUmW1jwO2xsV21
	Ja6DrOk5wFQRC4XL1dCjdfpJeX+yzPuIfoO/CvwL0Q0PxoULU0AzCj2Jhd3YoGtU5sXA
	9+TN2qi7BngVthbmLmobwf1a1Trao3RtAJl3UnJNcghjDBp3rVaxUgv7YKRMbYrzR0/9
	FoETXllNnzC/NjxRRfxOjWxxjbc07Un2KdD6u61Q5ejqzAqn25wfellXsAsVSuRSFPWu
	6aPtRSKm0sXJ1Q5/xY3/FcuIK62ofKsv3FxIsbUVwPetH54stGIz19rjUkiKuc9Uezci
	WFag==
X-Gm-Message-State: APjAAAV1icJ4T0EsfeLjVEIdOkOUcuGIXdgnO/8fJ5QVKHxEgwLWKVRe
	2ez70WmT5YL5PzBTKsIfBpPk0g==
X-Google-Smtp-Source: APXvYqwr4WiswaXneGTlFKCOTcO42lBUctkyW9sRyiFFwQlr2a0HYB1+QZ9assy4sd19Q82Du+daTg==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr14232358wru.195.1573818530863;
	Fri, 15 Nov 2019 03:48:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g5sm10332749wmf.37.2019.11.15.03.48.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 03:48:50 -0800 (PST)
Message-ID: <03665cc9587d5d3a096b8eb101e6a9262d2024aa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chee.yang.lee@intel.com, openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2019 11:48:49 +0000
In-Reply-To: <49217ee67206623b1c491c3deb13a5f7dd697f88.camel@linuxfoundation.org>
References: <1573783128-17519-1-git-send-email-chee.yang.lee@intel.com>
	<1573783128-17519-2-git-send-email-chee.yang.lee@intel.com>
	<49217ee67206623b1c491c3deb13a5f7dd697f88.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] wic: rm with -r flag support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2019 11:48:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-15 at 11:47 +0000, Richard Purdie wrote:
> On Fri, 2019-11-15 at 09:58 +0800, chee.yang.lee@intel.com wrote:
> > From: Chee Yang Lee <chee.yang.lee@intel.com>
> > 
> > wic currently unable to remove non-empty directory in ext*
> > partition.
> > enable wic rm to remove non-empty directory and all the sub-content
> > with -r flag.
> > update help documents for 'wic rm'.
> > [YOCTO #12404]
> 
> This kind of new functionality means we need new tests. Could you
> resend this with new tests for the new functionality being added
> please?

Sorry, I see this is in a different patch. The two patches probably
should be together as the tests in one doesn't work without the new
code (or at least needs to come after the new code).

Cheers,

Richard


