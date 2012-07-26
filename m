Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SuJbY-0003Fo-Py
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 10:39:32 +0200
Received: from localhost ([127.0.0.1]:57087 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SuJQQ-0000TG-5X
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 08:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=nZii5QlcnzW4tN5ldGWoSbKho+s=; b=lHWWd3caiGfOPF0U54JloZK7gVtN
	pdgd4QGPvi4fLn08VciGlzm+PmvOtspjafZ/XY+feRlFeFB1nphWZQdr23e7d2Ej
	HJNDr1kXrVSZUgbSIAqDwacT9NZkkAl4AIKHk/v3ANQ8ENOUrArbmkA4IpZsiyrS
	l9cjDhbJ3M+0gwY=
Received: from [195.171.99.130] (port=18551 helo=[192.168.0.53])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SuJLa-0000It-0p
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 08:23:02 +0000
Message-ID: <5010FEA9.1080806@communistcode.co.uk>
Date: Thu, 26 Jul 2012 09:24:09 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5010AE26.5010908@windriver.com>
In-Reply-To: <5010AE26.5010908@windriver.com>
Subject: Re: removing /etc/init.d/busybox-udhcpc
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
X-List-Received-Date: Thu, 26 Jul 2012 08:39:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/12 03:40, Jesse Zhang wrote:
> Hi,
>
> I recently found that if "ip=dhcp" is specified in the kernel cmdline,
> there would be some strange behaviour of udhcpc.
>
> 1. udhcpc is started two times during bootup.
>
> snip...

I've also seen this happen on the beaglebone with meta-ti and poky under 
core-image-minimal configuration.

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



