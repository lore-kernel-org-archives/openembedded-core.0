Return-Path: <twoerner@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id AEF967FB83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 21:38:29 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id m15so5502271qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bYqCBzwNN2z3Rg8Ubn1ehBp310BccFWJqV+/fcLFXgc=;
	b=SOPWs5kDWnhz4DMhMJuIqeRhtHIVgt5dy8PyLIywiQJoTL/pNooejpUZQhD4+YRw9Y
	V7mVrEVeQAIGwuoVvhdhA6WCuyxXwtd4Ew/LUCQTEWyVihoT8bOoFVxUagEVpHVkqyPH
	PhhmvMAHeHnN7pteXvCeS8S7FVrnBfycLl7Jp58QovLLH3uZp56QhPtvFV3UB6tcAgc+
	2XcFpUiC5wBUmDjkiT1V24sOHWKURQpfOYK9vy8mlTdU4NfVtLXmzQ/f4PQ7xR4HWclT
	eFoGVZub3Q54cM6layy041l8KS//Lt/0UtCfhQz+hN6GVul/eJarkxPjFdIotJD+71Hx
	6SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bYqCBzwNN2z3Rg8Ubn1ehBp310BccFWJqV+/fcLFXgc=;
	b=OXXaW9nTggL5NAAps2xpl8sBBfs0Zz+2psoARNbtg4Mz9RHF5mQFGSZa5CcSTJB8Lb
	uGJfaTaEjWW1waUbpYjaJJZ7RYDLdp62gJ67cujuIdTkZ0jfGIW3r4yAKqDJf3K3sA/e
	SQpSIISqBRPaS+EDpEWwI27AZE7OwDcexrSHRBbIKahhBM7wFeOl5tJNL43dR5FDf6Pp
	uNVdZ9XHwPwdO3ci7tvONLGnOrinkw2cQH5mN4w7Vl2e7TDAc/RdCZPbPVFA8KadgkFR
	jD5YBCFrPoC51TCvlJEexPCDwSzAI9JmJIvKe2AgApRUwJ61apXOB0jXWIz7daHD4gxC
	cQ3A==
X-Gm-Message-State: APjAAAWb9lALx45CWGydU3spIuFkVBk7xNpf8wcd6FITIaDsXivPzCmj
	yBDL+g2H9nRbUobe07jQSH3nRSOP
X-Google-Smtp-Source: APXvYqzZQcpRbiPEnqZggTcL13+b7xgTNsdoYLtEQ4sMLLDCJg8sstuTcelNUkdqHn/6iFbCyZbjfw==
X-Received: by 2002:ac8:5408:: with SMTP id b8mr5569600qtq.164.1572039510452; 
	Fri, 25 Oct 2019 14:38:30 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	x38sm2738164qtc.64.2019.10.25.14.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 14:38:29 -0700 (PDT)
Date: Fri, 25 Oct 2019 17:38:27 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191025213827.GA31737@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3>
	<20191025134458.GA22739@linux-uys3>
	<1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
	<20191025172451.GC25729@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20191025172451.GC25729@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 21:38:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2019-10-25 @ 01:24:51 PM, Trevor Woerner wrote:
> On Fri 2019-10-25 @ 07:37:34 AM, akuster808 wrote:
> > is someone going to send a patch?
> 
> Yes, I'm working on that now. This looks like something that should be fixed
> upstream, so that's the approach I'm taking. Please bear with me :-)

I sent a "quickie" fix to the list so master builds can proceed:
https://patchwork.openembedded.org/patch/166245/

But I also opened an issue with the upstream project:
https://github.com/stevegrubb/libcap-ng/issues/9

And proposed a solution:
https://github.com/stevegrubb/libcap-ng/pull/10

