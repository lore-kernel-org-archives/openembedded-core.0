Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TF46j-0002oH-FZ for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:21:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LE8hW7026157;
	Fri, 21 Sep 2012 15:08:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25778-04; Fri, 21 Sep 2012 15:08:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LE8alV026151
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 15:08:37 +0100
Message-ID: <1348236516.10108.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Fri, 21 Sep 2012 15:08:36 +0100
In-Reply-To: <505C7402.4060604@communistcode.co.uk>
References: <505C7402.4060604@communistcode.co.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ld problems with relocated toolchain
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
X-List-Received-Date: Fri, 21 Sep 2012 14:21:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-21 at 15:04 +0100, Jack Mitchell wrote:
> I am currently having issues building my application with the latest 
> toolchain.
> 
> I have used the new capabilities of it being relocatable to place it 
> somewhere sensible and I think this may be what is breaking it. My old 
> toolchain in /opt still works perfectly.
> 
> The error I receive is:
> 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
> cannot find crtbegin.o: No such file or directory
> collect2: error: ld returned 1 exit status
> make: *** [R0005] Error 1
> 
> However, crtbeign.o is at the path:
> 
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
>     crtbegin.o
>     ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
>     lib/     libexec/
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
>     pt_chown
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$
> 
> 
> Does anyone have an idea what is the issue here? Why can't it find the 
> object file?

Did you have the patches that just merged to master applied? There are a
number of relocation issues those just addressed.

Cheers,

Richard



