Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 719CC70EE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:53:49 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so20517561pdi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 12:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=k2a8qg5OYfa1yIrXXzDBVriyB0H7T1/b3Xh7/FQvjuo=;
	b=aQ45r1bg0MvrXpy+QECIQxgVIYFp8UDXRLjE3sHK2RpvaGgaZUef5ZrF04Cto9KxoX
	gi1Lnhg9K8iixpzI3Yr3F2DeBV/Zln/smT8krIhhjuuHv4l0uG/IiYuWViSY+LYTKEoW
	/0zfYhI++wHV8e7pSzhI6i984q47t8ymzic7WZX29Bv2NFoI+tC2SJFIPoZolmKK9dd0
	vf7vtUcncCBHwPm9lDmMIFpchP5yQQ9OcLF9A9yI12IrDjAuwrQSDBfgIeNiejJRHtLr
	8rO7CM83kif3cKDltoeZrNvEfSPAZvaj7X67oQzScDnhmx2I8W3UY/GidyfSqHQpvrQS
	wbKw==
X-Received: by 10.70.62.37 with SMTP id v5mr30623575pdr.123.1408996430330;
	Mon, 25 Aug 2014 12:53:50 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:5c06:ce57:88ad:3611?
	([2601:c:9380:601:5c06:ce57:88ad:3611])
	by mx.google.com with ESMTPSA id fh10sm966410pdb.71.2014.08.25.12.53.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 12:53:49 -0700 (PDT)
Message-ID: <53FB944A.5080000@gmail.com>
Date: Mon, 25 Aug 2014 12:53:46 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
	<53FB8AFB.7090406@windriver.com>
In-Reply-To: <53FB8AFB.7090406@windriver.com>
Subject: Re: [PATCH 0/3] Add new tune files for IBM POWER5,6,7
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
X-List-Received-Date: Mon, 25 Aug 2014 19:53:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/25/2014 12:14 PM, Mark Hatle wrote:
> On 8/24/14, 4:41 PM, Armin Kuster wrote:
>> I believe these are new tune files. They add support for
>> IBM's POWER[5,6,7] cpus. Minimally tested on qemuppc64.
>> This is the first set of patches to add qemuppc64 support.
>>
>> Let me know if there are any issues with the format of these tune files.
>
> Only a minor comment.. I'd prefer if the tunes were named
> 'tune-power5.inc', etc.. instead of 'ppcpower...'

easy enough for me to change. 'ppcpower*' seemed odd to me too but I was 
following the convention of the other ppc tune files.

>
> But I can't say I care enough to say reject this.  :)  So if the
> existing names are already in use, I think thats enough of reason to let
> it in..

thanks for taking the time to respond.

- Armin

>
> --Mark
>
>>
>>
>> Armin Kuster (3):
>>    IBM Power5: Add new tune file for PPC power5 cpu
>>    IBM power6: Add new tune file for PPC power6
>>    IBM power7: Add new tune file for PPC power7
>>
>>   meta/conf/machine/include/tune-ppcpower5.inc | 21 +++++++++++++++++++++
>>   meta/conf/machine/include/tune-ppcpower6.inc | 21 +++++++++++++++++++++
>>   meta/conf/machine/include/tune-ppcpower7.inc | 21 +++++++++++++++++++++
>>   3 files changed, 63 insertions(+)
>>   create mode 100644 meta/conf/machine/include/tune-ppcpower5.inc
>>   create mode 100644 meta/conf/machine/include/tune-ppcpower6.inc
>>   create mode 100644 meta/conf/machine/include/tune-ppcpower7.inc
>>
>

