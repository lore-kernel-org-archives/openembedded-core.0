Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id AAB2E75669
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 10:30:27 +0000 (UTC)
Received: by wgv5 with SMTP id 5so32355933wgv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 03:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zGEFHDaQzaE4k6hTQqvI2hfsCXaviebL1JYxsYmBPDU=;
	b=mKgfPNmvdsW2sdKpnzO1TmSB/NzWtkKnTBAhr5Ii0Xl+7GEcsmzhENIM2XvhJeJyIC
	XE8ptFsmRAij1vxxyczjiR1PrRZeX6s9ZlgdIj2FswZmaw8bst9pU6eMek2b0sRtuAYy
	OPSrXZj1kcoMF3uRz8meu3pw/Gmr6BrcXuOwHwip/VYR2xvBcMCjHiOnKRFnlqAexTEu
	rRQa6Jwx3ZQi3Tu7DI6o9OxzeYoks2WjzPhfXn9UCGibx6WNQTm62qoSuJfUTUuOlbWg
	tbelW4KgOeweC8n0vuwW9SDlIUYCWd4nFWNTgTFB6zRg0BkSLIcQo1bDzBCKFHMTOsMX
	yUKw==
X-Gm-Message-State: ALoCoQmAI7iw96VxOcXaM9udPYEmPrKHErOI4pE4IBrCnxjXQ9zGt9EvbN9hsmgMok6+UFduYikk
X-Received: by 10.194.83.70 with SMTP id o6mr4074861wjy.44.1432809028088;
	Thu, 28 May 2015 03:30:28 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id w11sm2642237wjr.48.2015.05.28.03.30.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 03:30:27 -0700 (PDT)
Message-ID: <5566EE42.7070503@dresearch-fe.de>
Date: Thu, 28 May 2015 12:30:26 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5566E259.3000001@dresearch-fe.de>
	<1432806496.404.103.camel@linuxfoundation.org>
In-Reply-To: <1432806496.404.103.camel@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5][fido] commit 699e1570e6 breaks build
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
X-List-Received-Date: Thu, 28 May 2015 10:30:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 28.05.2015 11:48, Richard Purdie wrote:
> On Thu, 2015-05-28 at 11:39 +0200, Steffen Sledz wrote:
>> Commit 699e1570e66cb28e4bfd0eb15d41f3af2bed5b62 (autotools: Fix find
>> races on source directory) in fido branch of openembedded-core breaks
>> build (do_configure) of qtbase-native from meta-qt5 fido branch. :(
> 
> I'm struggling to see exactly how this commit could result in this kind
> of failure. How did you deduce that this was the problem?

By trying step by step one commit (in openembedded-core) after another.

> Is the problem not that qtbase-native doesn't rebuild cleanly if
> configure is re-executed? Have you tried cleaning qtbase-native and
> rebuilding it?

I're checked this. A clean build or a "bitbake -c cleansstate qtbase-native" avoids this problem.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

