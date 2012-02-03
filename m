Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RtMDX-00025L-5n for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:42:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GYWDA022396;
	Fri, 3 Feb 2012 16:34:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21673-09; Fri,  3 Feb 2012 16:34:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GYO7q022390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Feb 2012 16:34:25 GMT
Message-ID: <1328286870.16474.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2012 16:34:30 +0000
In-Reply-To: <4F2C04B6.3070808@linaro.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
	<4F2C04B6.3070808@linaro.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 00/10] external-csl-toolchain fixes and improvements
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
X-List-Received-Date: Fri, 03 Feb 2012 16:42:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-03 at 17:00 +0100, Ken Werner wrote:
> I just switched to this branch and configured OE-core to compile for 
> qemuarm using the external CSL 2011.03 toolchain. When attempting to 
> build the sato image bitbake aborts when compiling libproxy_0.4.7.bb. 
> I've changed the cmake.bbclass to have cmake find the binaries of the 
> external toolchain as posted here:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014432.html
> 
> With this patch applied the build of the core-image-sate and 
> qt4e-demo-image finished successfully. Both images are booting fine 
> using QEMU.

Thanks for reporting that. I've merged the patch you refer to above.

Cheers,

Richard



