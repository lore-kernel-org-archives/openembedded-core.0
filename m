Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 21A8C70252
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 01:12:56 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hy4so3263284vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 18:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0B7UU8Y+oAWF5vPcPZaGBkfDSYQzfJhQ0DG2hTf1hYU=;
	b=qpayMCoFMnqHhkbWsj48vufFA5OGEGrhx/s8CMWI20H00DUH4nN4C4E2nmEa3HPxG+
	aurWCJNZsK8na2n/Bb4TaXUKHP/XR3mivDVR7a8XLjzc98pQR25Fi/0GywOt5XKe/KRs
	Of23Q++gp9dFzVj9GvRR3V3lFCea8sKamAkDc+BIKJsWs6UP1b1vUDutoT8lDxEPXQxv
	5AAbHUHK4k0xc3oaHcMozdkwVkaO9KuEUsZdm975m3h4/EThlvx7BKJkGZfoa3FJZFuX
	MqPxBSjgwrcO9iOdTfA/sieUohN+XCPQcjuq4sUlAR/eum+LqXDo/hc1qHfLtzGZB2VF
	49BQ==
X-Received: by 10.220.203.134 with SMTP id fi6mr34481815vcb.18.1405559577581; 
	Wed, 16 Jul 2014 18:12:57 -0700 (PDT)
Received: from [192.168.0.12] ([201.53.220.248])
	by mx.google.com with ESMTPSA id y8sm1829697vdj.25.2014.07.16.18.12.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jul 2014 18:12:56 -0700 (PDT)
Message-ID: <53C72316.2070009@gmail.com>
Date: Wed, 16 Jul 2014 22:12:54 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>	
	<53C5EAC3.3020901@gmail.com> <1405499628.20402.13.camel@ted>
In-Reply-To: <1405499628.20402.13.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: strip RPATH from libxml-parser-perl Expat.so
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
X-List-Received-Date: Thu, 17 Jul 2014 01:13:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Em 16-07-2014 05:33, Richard Purdie escreveu:
> On Wed, 2014-07-16 at 00:00 -0300, João Henrique Ferreira de Freitas
> wrote:
> I've seen this happen before with a half built perl recipe where you've
> switched machines half way through a build of perl. Stripping out the
> RPATH is not the right fix though.
>
> Cheers,
>
> Richard
>
>

I agree. And what is the right way to fix it?

Is an issue from perl recipes ? I want to get an start point.

Thanks.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


