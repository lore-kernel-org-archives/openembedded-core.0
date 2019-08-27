Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id EDE807E993
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 14:18:49 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g67so3257649wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=dcExEu0C/jgSCgJSZXCVFJtJ6sMvGHVL7BhidC/HWDg=;
	b=U7Xzh07vIK4UVGDJb2aJpkXBIKC6K+vT9AOnfND6PIiaEkK7JRBG32KaS4FLni0rGb
	YlsN9eBagaGBHTw6Ek3PQaKwc/AbMjfJs0lvHJ4AfxUpVDOPRJ1CyceiXValCd+tN4Y2
	2mQglCOm2i8hevJONtF5Py6T8ivDosN6RKoi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dcExEu0C/jgSCgJSZXCVFJtJ6sMvGHVL7BhidC/HWDg=;
	b=c8208G7iQwaKTVRkwoHiqr6ouRLsLg28jpgaJfbG7GNfRJvZPmBGR0KAZBKn9Uvldm
	mXd+CapTKkx2sn3/P6/MyXBf26NSpIITNQlIc1W0TsS/3O9uWd/gZLzommdYKjQJwgx1
	FpYkys8/R76Xt42OxLeZHu8VR6f1BaH4Vm0gvWIhIMfLxn1sSV8GFUgecfuELRHKYyzN
	Qqdwf7G3Yk7yJcBBUbtz6dJ8bxHvVRhd2LAodBtamPTsrpAF8mvObsdU8I8G/CQz78o7
	60wPMkb31ZXHGfuTOS79FnvNEqs66AZkFzyhOfxmxO5iuCCo63FFsunltDau6LhAcsCm
	KsQQ==
X-Gm-Message-State: APjAAAVEamogy2Z6zfqrnbUHwC5+S4+/KjHMhhgzXTzGbCsUTESYOe7D
	Nx0FzCZK2ZiwUmVvYArdjwt9HzJSb2Ymcg==
X-Google-Smtp-Source: APXvYqz6getOONPTZptdQvjfOJG7teZ6BCOMOKuRP77fkiAHiENyUo9mbyvvIKlXx1EGOoOFFuY0HQ==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr29584298wml.169.1566915530422;
	Tue, 27 Aug 2019 07:18:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a141sm4717797wmd.0.2019.08.27.07.18.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 07:18:49 -0700 (PDT)
Message-ID: <f9f38015ad533c2df644492e149f5ae93d7463ac.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Date: Tue, 27 Aug 2019 15:18:47 +0100
In-Reply-To: <20190827132105.GA17139@localhost>
References: <20190826053238.28912-1-zangrc.fnst@cn.fujitsu.com>
	<20190827132105.GA17139@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] libxcrypt:upgrade 4.4.6 -> 4.4.7
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
X-List-Received-Date: Tue, 27 Aug 2019 14:18:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 16:21 +0300, Adrian Bunk wrote:
> On Mon, Aug 26, 2019 at 01:32:38PM +0800, Zang Ruochen wrote:
> > -License-Update: Many individual files are under other
> > licenses,update their information.
> > 
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  .../libxcrypt/{libxcrypt_4.4.6.bb =>
> > libxcrypt_4.4.7.bb}            | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.6.bb =>
> > libxcrypt_4.4.7.bb} (86%)
> > ...
> 
> You also have to rename libxcrypt-compat_4.4.6.bb

Right, this just failed on the autobuilder and makes me wonder how it
was tested as it doesn't parse :/.

Cheers,

Richard


