Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id EA54D6E89B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 11:01:20 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id u57so3987847wes.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 03:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=2HOt4n8yoGBNimbdHo92bwiKofW2o7tlzTiBrWRO0o0=;
	b=iMMMyFmIhKsbKfPdDl+/u1duLQh0jQP7w37atITkGghirV70ESdwGkpncX4YZwRum6
	aRQK+P38bC9VW3oo6moJPu4rvS6+gPgOhFkvdmoumbzW28TjbCPMDn7fIwgZ6/PD6H69
	USmOlLwdMF5tAAE3U+Hd91mYEjwnNv9as2rGj8VYmfXdqQxXEDI7bAELVkf7OCIgdSKO
	yS/fOj5RmSgnBlACJ3lGjlUhyws5HreqcWtwHFvlQZA3tyKNYjcf7IpnRY/9iv9jEWCx
	bDoX1BHy2RqW+wQRc/Rc52EX0wCVmlpJstTGipxQawtU2Mh2y7IQBb9aKKum7G0XDZBU
	OZQA==
X-Gm-Message-State: ALoCoQmAAKozZeTCt6hb7sLqN2kVsXm+DrNrkSkGR8fmzD/uoANG5Y8Wfpx3YvSmBc2qBPYgntGV
X-Received: by 10.180.98.199 with SMTP id ek7mr12056542wib.21.1391511681460;
	Tue, 04 Feb 2014 03:01:21 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	ha1sm48870969wjc.23.2014.02.04.03.01.20 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Feb 2014 03:01:20 -0800 (PST)
Message-ID: <52F0C87E.5040007@linaro.org>
Date: Tue, 04 Feb 2014 12:01:18 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390316993.874.85.camel@ted> <52F0ABC7.1010908@linaro.org>
	<1521180.2sXy9KK50E@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1521180.2sXy9KK50E@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 04 Feb 2014 11:01:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2014 11:10 AM, Paul Eggleton wrote:
> On Tuesday 04 February 2014 09:58:47 Koen Kooi wrote:
>> What's the status on this? I know a fix went into meta-intel (albeit it
>> in a legally questionable way, but that's their problem) and the other
>> affected layers have received patches for it.
>
> Legally questionable in what way? If you refer to your name being removed from
> the patch, that was rectified before the patch was merged.

Good, the last I heard was that Tom merged the patches where authorship 
was removed due to "git workflow issues". I just checked meta-intel git 
and it seems to be OK now.

I still don't get how someone can (accidentally or not) add 
--reset-author their git patch workflow, but that's a different discussion.

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

