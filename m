Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.1351.1594317858344198561
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 11:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=KS9HRqA1;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: paul.eggleton@linux.microsoft.com)
Received: from [192.168.178.69] (unknown [151.210.224.22])
	by linux.microsoft.com (Postfix) with ESMTPSA id 629BF20B4908;
	Thu,  9 Jul 2020 11:04:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 629BF20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1594317857;
	bh=bKidXFm3DNuuHS+QnukdKjB8MKXhwmCglPLxMFh+IRk=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=KS9HRqA1uIsrLg7nHXqxhXPgaUNsdDJXS83Sfm9uYl9sFZggYXwAvT0Gt80dxI0Qu
	 TnmcErMx4sRWiHkTP0Hhe07lhg4awhRnvoWW2p/MAncywEu0Vgh5XY5N0jg+WK0Ji6
	 Bv7N8C4F3/Fzl77/HueyLwOwVGw2AIPwUaac5XLA=
Subject: Re: [OE-core] [RFC PATCH 1/1] classes: add workdir_save class
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1594231229.git.paul.eggleton@linux.microsoft.com>
 <8a17db382b6b7fde9d5dddebb0fc410dc35b5088.1594231229.git.paul.eggleton@linux.microsoft.com>
 <e1985bdd0b4be2ef216279a2af09e1d301aa97d6.camel@linuxfoundation.org>
 <596ec4fe9b754d35bfc71820fa3c67b3@XBOX03.axis.com>
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
Message-ID: <19b26b09-f2db-d12b-107e-48cf870fa933@linux.microsoft.com>
Date: Fri, 10 Jul 2020 06:04:14 +1200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <596ec4fe9b754d35bfc71820fa3c67b3@XBOX03.axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/07/2020 5:02 am, Peter Kjellerstedt wrote:
 >Richard Purdie wrote:
>> Seems like a useful idea. I think the name may need "failed" in the
>> name to make it clearer what it does. We also need a section for the
>> classes chapter in the manual.
>>
>> As another data point, OEQA is using OEQA_DEBUGGING_SAVED_OUTPUT to
>> trigger saving information for reproducible builds...
>>
> How about "save_workdir_on_failure.bbclass"?

I'd like to keep the name short if possible, it'll end up in the 
variable names as well. Thinking ahead we might want to save other 
information in future beyond the workdir, so we could possibly drop that 
from the name. What about "failure_save" or "failure_saver"? Also, with 
underscores or without?

Paul

