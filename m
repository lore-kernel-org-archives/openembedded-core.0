Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2815373232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:50:28 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so13939951igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=d2F6St7WhSW2X79FTdjWEBF7I2qLMFIlJCbjrTHKVyY=;
	b=phYcFlVWs6HCtuH8GcUx29cdstHXSGX2eXyWhi26IJ0VWBh2wQPCrQNKzLiV1Ofqxz
	TgkyCFl0dq0CHR9X8YL2hsqD/+IInOI8A/nDyhJRD/WDGzBZwUiFjWzZVkP9kpu8/WvA
	HmHvk0rqlH11KRqb+DWN+M536zlXQVrmzU13flUU6gPGUyatfmMKkcr7ieuYsihzg7kG
	Mfny+FJgLYXLW+WJCSlMqhDflJZa3uDRfgeX5Eh4Oiy4Hv1ir9bGSsLpnn680d+by5lj
	Ssx1+hW9/q/bWim/3PMAN7NuobS5CxEWPRpwLgqNGs+bcvCh/EkTAiCr0gjzjHKP2C54
	dZXA==
X-Received: by 10.50.45.33 with SMTP id j1mr5146372igm.61.1441885828564;
	Thu, 10 Sep 2015 04:50:28 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	m25sm6891287iod.32.2015.09.10.04.50.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 04:50:28 -0700 (PDT)
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <55F16E82.1070708@gmail.com>
Date: Thu, 10 Sep 2015 07:50:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55F1679C.5090508@linux.intel.com>
Subject: Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close
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
X-List-Received-Date: Thu, 10 Sep 2015 11:50:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 09/10/15 07:21, Alexander Kanavin wrote:
> On 09/09/2015 07:02 PM, Khem Raj wrote:
>
>> So I encourage you to formulate a policy and make a proposal to
>> community and get everyone on board in changing
>> the policy OE wide.
>
>
> Actually, first we need some kind of tool that keeps track of custom
> patches and their upstream-statuses and minimizes the amount of manual
> work.
>
> Then we can formulate a policy on top of that: for example, if a patch
> has been 'Pending' for 3 months, the person who added it gets a
> reminder to update the status; if the patch has been 'Pending' for 6
> months and the patch person has been unresponsive, no more patches are
> accepted from that person until he does the upstreaming of the ones he
> already got into oe-core. Something like that.

With so many maintainers on so many different layers/etc we would need
some sort of billboard somewhere listing the names of people currently
on the "naughty" list ;-)

