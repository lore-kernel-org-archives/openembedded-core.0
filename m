Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B20C65BA5
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.4563.1650006130737391621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 00:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZIiUZfkU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id k22so9660809wrd.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 00:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=I7nqc46XLRJlBE+nOdgWCoC9MDf8dB918AQNncGr0yE=;
        b=ZIiUZfkU/UFS5aey7c6zY6HTHbDELUBOjAs59suA2omxgh8t4NiHchAaZoUtY+S/U+
         oxeUvSIU319RYeiUGtF1bvOvrxati9wvkIfJRS6FyZlhbUykQlsb3Pyn8pK5Y7ZyMTPJ
         ofKpjUeyNsB8caLCej+nbkOeCFZFBaUl98U7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I7nqc46XLRJlBE+nOdgWCoC9MDf8dB918AQNncGr0yE=;
        b=Dv4DvpHD62Wy7nXNn0KYaAb9C49JWMft4Qk+eBcGUQNhfB5WNnOBc9K5Z9GlENGeX3
         jYXAxl+VVJrIh3XPp+7Muj5vpj8L80IVZ/dfKPzHu9L+iuMBBHCBunwjR+1XedMeXL88
         eTBnqCVV9sIScWm1wWj43nqmLxVw/gmvBkdxbc7NAID8ZKQCkttr/MABCL2XUBYT/LqP
         nRjcoXYAsC1jPhkPS2hZlFoPUWcHrMh2qysTJGz0L7DX/1dRScHq3XWyQ8aWox2EIvDC
         30An9Eyw0IWoMPqr3KHCRmZiKboBymweP6+rq0x4FUW1N4ODeMP3UY0TbWGMi/DmkVjP
         BH9w==
X-Gm-Message-State: AOAM530xoe7tvs/qBFVjw9xiQtR7g0Mt5XKfecSfu+GKLO564LtOpAQO
	tk4VML3RvB97ZRNfFDZfIDSd0g==
X-Google-Smtp-Source: 
 ABdhPJwMv1i/6E4AT/rGUtvZHKWDfdmylmUbApY+IvLfD+MFQhCrWpLCenE5lgcXFZD/DS59R8xlVg==
X-Received: by 2002:adf:914f:0:b0:207:d1cc:77e0 with SMTP id
 j73-20020adf914f000000b00207d1cc77e0mr4378799wrj.475.1650006129096;
        Fri, 15 Apr 2022 00:02:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:11b3:ac79:b941:ad48?
 ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm3480033wry.64.2022.04.15.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 00:02:08 -0700 (PDT)
Message-ID: 
 <c79d74d02d7f6b58628fdb4521f60808c2d55020.camel@linuxfoundation.org>
Subject: Re: [OE-core] License mismatched for libxshmfence_1.3.bb and
 recipeutils-test_1.2.bb
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Apr 2022 08:01:55 +0100
In-Reply-To: <73be0c1d-e8e8-5361-5132-62f2c837205c@windriver.com>
References: <73be0c1d-e8e8-5361-5132-62f2c837205c@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164420

On Fri, 2022-04-15 at 11:55 +0800, Robert Yang wrote:
> Hello,
> 
> The following two recipes use the similar sources, but their LICENSE are different
> in the recipe:
> 
> meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
> SRC_URI = 
> "http://xorg.freedesktop.org/releases/individual/lib/libxshmfence-1.2.tar.bz2"
> LICENSE = "Proprietary"
> 
> meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> SRC_URI = "https://www.x.org/releases//individual/lib/libxshmfence-1.3.tar.bz2"
> LICENSE = "MIT"
> 
> There is a COPYING file inside ibxshmfence-1.2.tar.bz2 and 
> libxshmfence-1.3.tar.bz2, they exactly the same:
> 
> $ diff libxshmfence-1.2/COPYING libxshmfence-1.3/COPYING
> 
> Please check the end for the full contents of COPYING, it's not either MIT or
> Proprietary, but should be a free software.
> 
> How to fix the LICENSE name, please? Add a license file called libxshmfence? Any 
> comments is appreciated.

Having looked at a few SPDX licenses, I think this looks like HPND:

https://spdx.org/licenses/HPND.html

I suspect the license set in the recipeutils-test is there for testing purposes
and not as a "real" license but we probably need to make that clear, or only
modify it at runtime in the test.

Cheers,

Richard




