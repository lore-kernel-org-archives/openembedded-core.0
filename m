Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id E344160DFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 11:04:31 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id x48so3261745wes.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 04:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=5PZ0uTK2+w3S3s/9YDrX2i5MtaifdQWR+B4Uu8iT0s8=;
	b=gobNAbmQsHn5yXW46KgaDbtYdMmlpeY0dNFcLaUYDrI+tkBQIovxW9kAntHbU0wYL3
	ejMnl+rKYNPdYWu9qzQhDCGEWnFeEvhAMKE4F8Ex5qz7CsKuiGHtIP4cZumkZ5speLTg
	SRCwcUWYw6tRBXtxkpUt0nGij/PpVjOae0btIt1IvnxLbA0oxOrjYaHd+JGrwH6tQcae
	Kk5gGswEwx8urNrUdv4sWJ10EfFGp7KGwhAEyBNBtG1FskFfAWD5dSaE+J4LEs705S/4
	1XjzCCX5XqzAcpSXAPyWpqy5pgyhpu/hhSWIpIT9zYgpZTHTY46E09faGURTPxzTV6+y
	/hJw==
X-Gm-Message-State: ALoCoQkscLHAR/z4O/ZoIKHyLNGt5RtFGEdEHHyez6nBN6TYwLbL68l3XHTAlznCpyqWfLutPFIJ
X-Received: by 10.194.48.80 with SMTP id j16mr18939114wjn.44.1396609472186;
	Fri, 04 Apr 2014 04:04:32 -0700 (PDT)
Received: from ?IPv6:2001:610:612:0:2ad2:44ff:fe4b:bc17?
	([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id n41sm18818169eeg.4.2014.04.04.04.04.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 04:04:31 -0700 (PDT)
Message-ID: <533E91BD.8000107@linaro.org>
Date: Fri, 04 Apr 2014 13:04:29 +0200
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1396602904-14596-1-git-send-email-koen.kooi@linaro.org>
	<465539862.Xb3zOTJjse@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <465539862.Xb3zOTJjse@peggleto-mobl5.ger.corp.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [Dora][PATCH] buildhistory-diff: add ability to report version changes
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
X-List-Received-Date: Fri, 04 Apr 2014 11:04:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2014 01:00 PM, Paul Eggleton wrote:
> On Friday 04 April 2014 11:15:04 Koen Kooi wrote:
>> From: Paul Eggleton <paul.eggleton@linux.intel.com>
>>
>> Add a -v/--report-ver option to report changes in PKGE/PKGV/PKGR even
>> if the value is the same as the default from PE/PV/PR.
>>
>> Also add a -a/--report-all option to report all changes instead of just
>> the default significant ones.
>
> Hmm, looking at this I'm not sure that this is the right fix for a stable
> branch - ideally we should just fix the error rather than backporting the
> feature IMO.

I'm fine with either, this was the easiest for me, a single cherrypick.

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

