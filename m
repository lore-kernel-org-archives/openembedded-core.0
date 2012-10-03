Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJKxJ-0002h4-Ak for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 11:09:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q938uPju025850;
	Wed, 3 Oct 2012 09:56:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25115-06; Wed,  3 Oct 2012 09:56:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q938uHV1025844
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 09:56:18 +0100
Message-ID: <1349254580.18301.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 03 Oct 2012 09:56:20 +0100
In-Reply-To: <20121003070128.GI15881@jama.jama.net>
References: <20121003070128.GI15881@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PN-dbg now RRECOMMENDS all PACKAGES?
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
X-List-Received-Date: Wed, 03 Oct 2012 09:09:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 09:01 +0200, Martin Jansa wrote:
> Yesterday I did build from scratch to test something and buildhistory
> shows a lot of RRECOMMENDS changes like this:
> 
> packages/armv7a-vfp-neon-oe-linux-gnueabi/automake/automake-dbg/latest
> -RRECOMMENDS = automake (= 1.12.3-r1)
> +RRECOMMENDS = automake (= 1.12.3-r1) automake-doc-dbg automake-locale-dbg automake-staticdev-dbg
> 
> I don't think any of those added -dbg exist (which is not fatal for
> RRECOMMENDS), but why are they added now?
> 
> Whole commit:
> https://github.com/shr-distribution/buildhistory/commit/df0fb2d40018ac6b39f981aea02412f9a5d8b073

I have a fix for this which I'll post shortly.

Cheers,

Richard



