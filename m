Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJSrM-0002jf-7i
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 19:35:48 +0200
Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 10:22:47 -0700
Received: by padfa11 with SMTP id fa11so6636507pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 10:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=CUmsAzq86AiGBkx+4/H3qvJJIsszHYIp+uvSbpOQM5k=;
	b=WynqSEVJS3PfsZMZWyF+tfowHAx0cbKKp1B7vWZ0b3++NiHvFDTjfsSjOFrzlyBlSn
	KkPO7BXK/H38E89Z7y4dlx3a3QRJDevpNUWRQq3EFPI678Y3C8Gi+XYWvelGwW1vW+iM
	8PRxzadI8zV69laQx+XHNm/kSmxZTFq7jdqt4A8ibb5WV1yYg9bO6LODX1BVU1WKSGuO
	hLTrtn7qsnHuYzcgCSG7+4LolzAFJdxcO6PJRjZNpNzbYCQH7ybhjIz2r41GPzjIAvMe
	q+dDfWGsPhoJSLeg1SmwrJU8vTbOq7dHtzylZnJ7V85wbidNgxi2sS+WrKRwBXSfqRX/
	3kHA==
Received: by 10.66.85.70 with SMTP id f6mr6760139paz.7.1349284967164;
	Wed, 03 Oct 2012 10:22:47 -0700 (PDT)
Received: from [10.1.10.30] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id ru4sm2901392pbc.25.2012.10.03.10.22.45
	(version=SSLv3 cipher=OTHER); Wed, 03 Oct 2012 10:22:46 -0700 (PDT)
Message-ID: <506C745D.4000909@intel.com>
Date: Wed, 03 Oct 2012 10:22:37 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349234650-21648-1-git-send-email-denis@denix.org>
In-Reply-To: <1349234650-21648-1-git-send-email-denis@denix.org>
X-Gm-Message-State: ALoCoQmtkx7kOo8qMmEcPACyWMzBlgIO4pMyqIwDB8TDza00Pw97oe5gl0CpiKMM49/h4giokx4U
Subject: Re: [PATCH][denzil] openjade-native: fix undefined Getopts error, use std namespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 17:35:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2012 08:24 PM, Denys Dmytriyenko wrote:
> From: Dennis Lan <dennis.yxun@gmail.com>
>
> Using Gentoo Linux as the build host, it fails without this patch
> Use Getopt::Std in place of getopts.pl.
>
> https://bugs.gentoo.org/show_bug.cgi?id=420083
>
> which following error:
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [InterpreterMessages.h] Error 2
> make[2]: *** Waiting for unfinished jobs....
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [DssslAppMessages.h] Error 2
>
> (from OE-Core rev 169a89b10817b742c063fcd76721e4dbbcca6199)
>
> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks for this, I've merged these patches into my sgarman/denzil-next 
testing branches.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


