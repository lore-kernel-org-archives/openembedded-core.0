Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sv4Nl-0000O5-Mz
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 12:36:25 +0200
Received: from localhost ([127.0.0.1]:51310 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sv3ri-0007q8-PM
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 10:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=rQtdmiLBbzmKWS7/M97k4a+1BOI=; b=jejYrlpLtF1Kf1HbyLM/11dO5MoI
	btDyCkni223KAiaMWAeijDZrfdQAkq3k9ILtYM1voqeJcNpBACfFB0WwYviYcHkt
	/McwSOMS+JGpRTglepiYF9ysApCh+tl4Jswxl6bjQMvufK0W7DRw+sruFFReMhSV
	LRB+8BKelmOsqs4=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:49641 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1Sv3ms-0007j1-L7 for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 09:58:18 +0000
Message-ID: <5013B7B8.5020908@communistcode.co.uk>
Date: Sat, 28 Jul 2012 10:58:16 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343307951.29991.27.camel@ted>
	<5013AACF.2010807@communistcode.co.uk>
	<20120728091614.GD3742@jama.jama.net>
	<20120728093746.GE3742@jama.jama.net>
In-Reply-To: <20120728093746.GE3742@jama.jama.net>
Subject: Re: [PATCH] lib/oe/lsb: Add basic LSB functions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2012 10:36:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2012 10:37, Martin Jansa wrote:
> On Sat, Jul 28, 2012 at 11:16:14AM +0200, Martin Jansa wrote:
>>> by installing lsb_release. Archlinux 64.
>>>
>>> Should it check to see if it installed first and error otherwise? It
>>> looks like it tries to do it here:
>>>
>>> +    try:
>>> +        output, err = bb.process.run(['lsb_release', '-a'], stderr=PIPE)
>>> +    except bb.process.CmdError as exc:
>>> +        return
>>>
>>>
>>> but it must be missing something.
>>
>> Same here, interesting is that it failed only during 2nd build, 1st
>> with this commit applied finished fine.
>
> Ah no, it was there also first time I've overlooked it as it's not
> fatal.
>

It was fatal for me as it trashed my sstate folder naming and then 
refused to build some packages. The directory in my sstate was created as:

${NATIVELSBSTRING}

Then when Bitbake tried to use shared state it expanded NATIVELSBSTRING 
to nothing and failed.


