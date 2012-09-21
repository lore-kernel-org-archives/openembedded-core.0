Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF41W-0002eK-Bf
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:16:06 +0200
Received: from localhost ([127.0.0.1]:53000 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TF3pC-0000OH-LL; Fri, 21 Sep 2012 14:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:content-type
	:content-transfer-encoding; s=default; bh=mN44EIBssTuTd1YZK499Gz
	uqZaw=; b=RLHy4LcyCmlXPlZkehQ087fMFzfNl7yYuMShbnlHOmyg2YVem2NKH9
	RzLmVubxIkJPrzoezpbirioRpCb6C/3Jsm4yo0cx7aGgtgGILa6XpB3qW/09PpSR
	+xpsQESeoWftZpUsqcMg8ElQNWQ+9sLKbdOSDUM26L+lhed2Qfwek=
Received: from [195.171.99.130] (port=63860 helo=[192.168.0.42])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TF3pC-0000OE-GF; Fri, 21 Sep 2012 14:03:22 +0000
Message-ID: <505C7402.4060604@communistcode.co.uk>
Date: Fri, 21 Sep 2012 15:04:50 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 14:16:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am currently having issues building my application with the latest 
toolchain.

I have used the new capabilities of it being relocatable to place it 
somewhere sensible and I think this may be what is breaking it. My old 
toolchain in /opt still works perfectly.

The error I receive is:

/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
cannot find crtbegin.o: No such file or directory
collect2: error: ld returned 1 exit status
make: *** [R0005] Error 1

However, crtbeign.o is at the path:

    [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
    [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
    crtbegin.o
    ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
    [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
    lib/     libexec/
    [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
    pt_chown
    [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$


Does anyone have an idea what is the issue here? Why can't it find the 
object file?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



