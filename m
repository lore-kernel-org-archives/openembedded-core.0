Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYmzU-0007O9-Ju for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 00:03:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8MuA64009734;
	Thu, 8 Dec 2011 22:56:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08226-04; Thu,  8 Dec 2011 22:56:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8Mtxie009722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Dec 2011 22:56:01 GMT
Message-ID: <1323384970.5309.92.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 22:56:10 +0000
In-Reply-To: <4EE13D86.6020203@emagii.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
	<68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
	<CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>
	<20111208151026.GC3761@jama.jama.net>
	<CAAQYJAuHVLo6A_cGXBVoq+3Tj863LRH+hu-6GtZeqo3_aJWYQA@mail.gmail.com>
	<4EE13D86.6020203@emagii.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 08 Dec 2011 23:03:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 23:43 +0100, Ulf Samuelsson wrote:
> Not sure exactly what sumtools does,
> but as I understood it, it does things which
> the targets need to be doing at first startup otherwise.
> 
> Does that not mean that the target rootfs will grow
> from 44 MB to 57 MB during that process?
> 
> If it does, you never want to have the non-sumtool version.
> (I guess if you downloaded the file over a 20 bps channel to
> a nuclear submarine, you would disagree)

It doesn't. It will compute all this data into memory at each boot
increasing boot time but it won't write it back to the flash.

The sum images just mean the data can be directly loaded without
computation and reading a lot more of the flash.

Cheers,

Richard





