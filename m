Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC10C7CFEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 22:20:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g5so3441055plt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 15:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ndTSqubDltXZOpAUs3EYNlgUiz9YyjONJE7wOdjoctM=;
	b=SNn49qReQhRaHM0ASdESz526XvJqJ0T5AzLFPbmfKqoLag3LasHhbLNflhO/LZpUNt
	mrckgfe9s+M8kkPrJpINK75JaYH2I+fuv9fwnu4I5gonhD6/lYAIqKf7t5DN4d0AiQzD
	W6sx+Wbg+wMhmgEj/Bq6nSXT8MyfmGIe+LkhdSFyA+nOEoFdzsU2PQw1JpODNkQLskc4
	MpTzP1ES8Nrj81gJGTnSlNRhWu3JW7BMxCqPETRjEdHmXYm1GGk3y8Hfzm0YMVb1eZgN
	CasO5P4rwYwHqGTY0MPY5OK/7WZ7OaHoqPjajDmuK3nRZT4DYWbzPqoxkUrtDSEU5/Qo
	DoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ndTSqubDltXZOpAUs3EYNlgUiz9YyjONJE7wOdjoctM=;
	b=I98LgjlOfYX5uHzVxqQXOBZDHK83JMPCiOjzLEh+3gTreLOAgfG7ZeG5BZIyMd6VPC
	yQ8T7K8yWWivQn00uTRXbxbLxz2JK5tmnP3nrphN/0OWIdAGZC7X/T63EQg0loRjnFAR
	DrS+xc0RcnB2uK7KQu5VVikHqWfV/FvBPSfODoK9VPt4SVEqjmoZsuMnh/vmRiNjfyxb
	IJo73ihmvUFm8eg1U8eHfOfSN4Nppn6kdmlJgUaVNPx4etu5sftwZ67+bXiG3fz8fD6d
	Q7dm84ERZFEHoJ7cyUAh0zag8WPi8ZEyOUTJSzMpL/V1pWBtwJfT/59zDN3M/U/j1RuV
	agOA==
X-Gm-Message-State: APjAAAUF2Egg7LbtHCDVoq7d699lvULY1mVAvcj5ZnUCINj/RYejNJjE
	LoGz5dOPcdEOn0CemVnXMYwREpNXCSE=
X-Google-Smtp-Source: APXvYqyGhnHC+CRUIf9FeyHMHJdziCCmN9dBRncfcUoODcEVn1ul8cMC8GjxJNyExYePbKbE/aUu/Q==
X-Received: by 2002:a17:902:84:: with SMTP id
	a4mr16121640pla.210.1557526824694; 
	Fri, 10 May 2019 15:20:24 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	f71sm13158388pfc.109.2019.05.10.15.20.23
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 15:20:24 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190510204954.33591-1-raj.khem@gmail.com>
	<20190510204954.33591-2-raj.khem@gmail.com>
	<20190510221726.GA20997@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e23fddb4-f2f2-6865-2a55-1824811b0c95@gmail.com>
Date: Fri, 10 May 2019 15:20:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190510221726.GA20997@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] epiphany: Fix build with clang
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
X-List-Received-Date: Fri, 10 May 2019 22:20:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/10/19 3:17 PM, Adrian Bunk wrote:
> On Fri, May 10, 2019 at 01:49:54PM -0700, Khem Raj wrote:
>> This patch is upstreamable, issue is not caught by gcc
>> ...
> 
> Upstream already has a different fix for this:
> https://gitlab.gnome.org/GNOME/epiphany/commit/a6a022c9c498ad5dcf7f2220644a7520df74ca31

ah thanks, I did not find it when I checked last time. but I guess I 
will try a backport and send v2

> 
> cu
> Adrian
> 

