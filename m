Received: from mail-ia0-f173.google.com ([209.85.210.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TzuMd-0001XL-1P
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 20:27:34 +0100
Received: by mail-ia0-f173.google.com with SMTP id l29so4736300iag.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qZzpPHPb3V5P6DfDHw5iOCsEgmF/ree5KdR+TaPYl6I=;
	b=BKpY8E/VKNYPs6x00+/RmA5uqcSYRruXCzklBuqkxtmb6O3XpmnaHidj5nsmG01J9D
	4yAa0mZwr4XUnedtBRPp+GEl4gu3mSJEWiBdnbgILq+vpu35HMtUx8zfVKw41NzerWTS
	S8zFwwbBNPvfowetGTEXv/Qcw4eR+JniksjUNXk+Pxtykzp3SgNLRWsk96puAL3FesIT
	f7vfD/JGpyYDhQfzs/UwrkUqzbcd6KowKq3XXuH7Mexdh7zFISmHZ2Afv2qPN7fW4AMc
	TrMIn+EgumoVWOBFAgO4Oj/SBZGeMjy6aUI5G1/q7VdgFDre+UeGV/daDnwf5htsAMOC
	3fSQ==
X-Received: by 10.50.140.34 with SMTP id rd2mr4890663igb.93.1359400311763;
	Mon, 28 Jan 2013 11:11:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Mon, 28 Jan 2013 11:11:21 -0800 (PST)
In-Reply-To: <5106C6ED.2090204@linux.intel.com>
References: <1359269665-1843-1-git-send-email-raj.khem@gmail.com>
	<5106C6ED.2090204@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jan 2013 11:11:21 -0800
Message-ID: <CAMKF1srOXjd2Pn6dou6zwZhpcJxiOQL2VwA7E6nLLf+GOAGRkQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] module-base.bbclass: Call make instead of oe_runmake in do_make_scripts
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
X-List-Received-Date: Mon, 28 Jan 2013 19:27:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 28, 2013 at 10:43 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 01/26/2013 10:54 PM, Khem Raj wrote:
>> This makes the external module compilation a bit more robust for
>> cases where external module recipes may be passing extra params
>> to make via EXTRA_OEMAKE, and more that often one needs to pass
>
> s/that/than/ (this honestly through me a bit :-)

oh!,

Richard
should  I send a V2 or would you amend it


