Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46B2C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 11:03:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.9394.1645441398415060238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 03:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OYfZhwfI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id k1so26356508wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 03:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tqpz3bFpiZ5f9Kfa1usO5I7sFmgdxzErjrSeYCaUk1U=;
        b=OYfZhwfIGOSKkZk3uKPDdjvHjPMjyHy7FIiZyM1CaWgK7YeY41q89A4VJbAWj6t5SW
         ng7voxZ31EtEYsolX/S24S2BC5R8iwcZiQv3FasjVHJwwfblfDVz1TH6BxDYMrVqjTEB
         YBW82dk/uJ/IS1b2jfeMoo3YOeWqOuTkO4x0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tqpz3bFpiZ5f9Kfa1usO5I7sFmgdxzErjrSeYCaUk1U=;
        b=vAapRipp97kvrsu5k+tAByHhCqJrRINa6IsJn8zQpLHk45igo1zSPKoaFcTwjHfpLM
         upHJwTs5AEZP6aBdX7VLtjY25jBARvSHQ0X9ZeFqtB0mGbemhWXeLf0QJNHy1ZglGdK/
         WXF9B2Po13F01p3ysHcA+DkKpYYrPb2IhqUsJjorDnF2LDI3G9uLUYJsdNehBJGqLVlO
         zs9ijj3YocsFeX+aDmZTpXtSQg+s27HzUU4FnsgzjghoxFPgyjj3yTJIRrWidHtO7lm0
         /4VnwB5G5cSDfcQZuxzW7Bgpzo2HfFRWcU87VCYxuCFQr+qrZejR7iBpyrW5g/6Blv2w
         6BIQ==
X-Gm-Message-State: AOAM530oR+ZTgi9WDFutp8yoV5RjIGE/kbMZTQ2hFJ/uFzaa6KNWL6KD
	sm5FgyoaLA6iWN9/2KFGc0rQFg==
X-Google-Smtp-Source: 
 ABdhPJx0DP/AUJTRTaAgwhQJjuugV4889PqY4z0y7h26S42lpbdz2Pu+j8h0+mWzGtY8v06i4Xnifg==
X-Received: by 2002:a05:6000:154a:b0:1e9:3cb3:5022 with SMTP id
 10-20020a056000154a00b001e93cb35022mr11285566wry.312.1645441396444;
        Mon, 21 Feb 2022 03:03:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ae50:3f11:233d:4303?
 ([2001:8b0:aba:5f3c:ae50:3f11:233d:4303])
        by smtp.gmail.com with ESMTPSA id
 e3sm43283414wrr.94.2022.02.21.03.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 03:03:15 -0800 (PST)
Message-ID: 
 <5eedb5abfa7deba8b118a4135176a79d9b2c7dfe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/19] Python PEP-517: build wheels and
 installw with pip
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: oobitots@cisco.com, Tim Orling <ticotimo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Feb 2022 11:03:12 +0000
In-Reply-To: 
 <PH0PR11MB4902E3249E580C9D2002BBC1D73A9@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
	 <PH0PR11MB4902E3249E580C9D2002BBC1D73A9@PH0PR11MB4902.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 11:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162024

On Mon, 2022-02-21 at 10:52 +0000, Oleksiy Obitotskyy via lists.openembedded.org
wrote:
> Hi,
> 
> Seems that python changes cause build fail https://swatbot.yoctoproject.org/collection/6991/

FWIW that was with the other patches in your branch too. I was curious to see
how it looked but it isn't quite there yet :/

Cheers,

Richard


