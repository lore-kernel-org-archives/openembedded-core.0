Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA7D2788AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 15:35:43 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id v13so15621343iob.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ACUxs8m4peZixHrjWGNsZM84QUifHjVqVSgOEouSwP0=;
	b=JQ3wV5a8iIkRyVJ/aazpC7RrCUFDBBAWo750T0sCQVmzRA5QFlkF9vtUwhKEqKMNNS
	aqnZb+k+GNaEYbRQYlmO8A2AUZ4O0ayX2+v6m2AQWGV5On08yymgX67aEPMPeDo4S/w/
	4DnY9BYVn2t/WI9f+FQa/oAKAVCzNfmwaCHvh4FZIm3gwVVZrWSJjFT7k8YScbwCw1N6
	ogbHMJGah3wd2M4tNBTqUqQdqzN3og2G5Xt2227DQW7mDn1fkhU1R4zf7NjV4rIY55Im
	tMt5cmG9VlTue5VPjkoZl8EeBEWjoTYRji3rBMJ0v+mIPbTnbLBwIM9asVfHPhL6scyo
	8EZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ACUxs8m4peZixHrjWGNsZM84QUifHjVqVSgOEouSwP0=;
	b=jUe3N+5RE9OmVw/rtjbCWCm4Rmb76NXKJSm4pAiaxu34U2RLu5Qav+LU+yU1eTKxSm
	AJiCDFOR6F4SgWUy4+1cnpqJ7fi1+nFtbnUzDapn1YSCsjkjPe00gI+m12joS8HqPpHm
	OZclHU90a7t1HHHNvMMxV3DgDe9PiJecNe5F+K2igDMSKgoa7vBN6rCUyIm+GoHnY6VR
	85qgz2rRn4DaHc/pQPn/IRhU3aMsZf+/2Y0V5zhzcovI/pygLHJ/ef9W4lVmDOkRs4Gv
	b0fK7mLi1rLfyfFHIbWFKg7EnDpNAY5L2eP97Uib7rRbNrbMKl0m6Lh4ASzNlD6Nrjt4
	j9RQ==
X-Gm-Message-State: AElRT7FOTLHo4hkwDHiX0dSqXIViNKw1pChST6FbuLfhXp8+FnGgcNtf
	W17fEgV2vlfpnmB1DTHSMdwVd8ltzyI0qVCbNzxEgQ==
X-Google-Smtp-Source: AG47ELvo2Cgnwc+1WahJZNCZuFhGuwTAZCsHeQ7Zw0vih3YsWXfKuzheSjmnY0YoN/x1viTZRzL4+OcJTtN6NXebVt4=
X-Received: by 10.107.183.4 with SMTP id h4mr30674333iof.201.1521819345040;
	Fri, 23 Mar 2018 08:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 08:35:24 -0700 (PDT)
In-Reply-To: <a582a169-310b-c51e-fece-4900b5f5a664@linux.intel.com>
References: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sreT7Pm9k7C74S7JggUOA7i52YefxoGGKyq5HhOkspaew@mail.gmail.com>
	<bcd2bae7-cbfb-8fbf-8a24-458d2c10d6fc@gmail.com>
	<CAJTo0Laa5a=KcaurORaN=nYXO8T5LZWJUAQpt=o9Z-doP9o=ng@mail.gmail.com>
	<a582a169-310b-c51e-fece-4900b5f5a664@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 15:35:24 +0000
Message-ID: <CAJTo0LaQ+Q9rOyJJDbFNPZXuo6ZZrVkQuyRENhoooGQRN3exMw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][v2][PATCH] distcc: Change SRC_URI
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
X-List-Received-Date: Fri, 23 Mar 2018 15:35:43 -0000
Content-Type: text/plain; charset="UTF-8"

That would be the ideal.

Ross

On 23 March 2018 at 14:56, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/23/2018 04:31 PM, Burton, Ross wrote:
>>
>> So many questions.
>>
>> What did we ship?  Why doesn't it exist upstream anymore?
>>
>> Shipping a fork in a personal repo sounds like a good solution for the
>> stable branches following the principle of least surprise: they're
>> shipping what they always did.  For master/2.5 though, I'm not happy
>> about it (but will pull this in for now to get it building again).
>>
>
> We might yet get a functional 3.3 upgrade for master in time for 2.5?
>
> Alex

