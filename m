Return-Path: <akuster808@gmail.com>
X-Greylist: delayed 149276 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 14:41:11 UTC
Received: from mail-pa0-f51.google.com (unknown [209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 438CC6FA47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:41:11 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kq14so11157909pab.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UJp0rKCGVLtIkwT8XXfE0gVHi4ZDEVggPmP963JZkYc=;
	b=bNOz870RhO6eR/Rq9VTotl5P3qomGr6iZqyi0PYfHiUiBv/+C6mLMQmzSjPLrrROuf
	gMPQ2MjO7HoFeTkxpQyQAIfj4LXmehxY7i/kHW2mk5sYnP0zBxZH8OzY7+tSR2U5Rd2L
	4F+rolIq/MuJpxW5e3zuI6MeJ0mvpP+pJvBuL/JUUH3VeJ11B+TKo8ZkPb+bjQeerQe3
	OmZWfWGVGFgHG8ZSe1fWXg/v1sWshk5OoeGtFLo+yit3hvgpG668KuOMb7SUDE6dFvLf
	HAjO7scQH78G0UjdnbKVDziF289il6M+8mvqFJElljFwstASwKjm3pRzgEGt3scnBHUW
	GHYQ==
X-Received: by 10.68.224.101 with SMTP id rb5mr46550092pbc.135.1401288073009; 
	Wed, 28 May 2014 07:41:13 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	cj1sm89720423pac.40.2014.05.28.07.41.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 May 2014 07:41:12 -0700 (PDT)
Message-ID: <5385F585.8030809@gmail.com>
Date: Wed, 28 May 2014 07:41:09 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1401138331-31087-1-git-send-email-akuster@mvista.com>	
	<CAJTo0LaB94-s02ng6CXdFNLGYEasN4chZFdJXEaWnpMZ2nsWEA@mail.gmail.com>
	<1401278830.2607.45.camel@ted>
In-Reply-To: <1401278830.2607.45.camel@ted>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Update timezone files to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 14:41:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 05/28/2014 05:07 AM, Richard Purdie wrote:
> On Wed, 2014-05-28 at 11:40 +0100, Burton, Ross wrote:
>> On 26 May 2014 22:05, Armin Kuster <akuster808@gmail.com> wrote:
>>> This updates both tzcode and tzdate to latest
>> Please send patches using -M so they're easier to review.  Also you
>> put "solaris" instead of "solar" in the commit message.
> How did the license change from PD & BSD to PD?
Hmm, it shouldn’t. will correct with v2.

regards,
Armin
>
> Cheers,
>
> Richard
>


