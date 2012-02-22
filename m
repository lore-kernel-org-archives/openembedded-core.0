Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0LDX-0003Fp-DZ for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:03:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MMt30j002758
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 22:55:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01958-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 22:54:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MMssf6002748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 22:54:55 GMT
Message-ID: <1329951294.32110.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 22:54:54 +0000
In-Reply-To: <cover.1329875013.git.josh@linux.intel.com>
References: <cover.1329875013.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Fix overriding PACKAGE_ARCH for MACHINE specific SRC_URI [v2]
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
X-List-Received-Date: Wed, 22 Feb 2012 23:03:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 17:46 -0800, Joshua Lock wrote:
> This series includes a fix for base.bbclass so that PACKAGE_ARCH is correctly set to
> MACHINE_ARCH for all recipes which include a MACHINE OVERRIDE in SRC_URI.
> 
> Cheers,
> Joshua
> 
> The following changes since commit d4ffe12ca36bf10be4e0f9565d7c3d8e6f4a265a:
> 
>   iputils: Add base_libdir to VPATH in order to find the crypto library (2012-02-21 17:59:21 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/work
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work
> 
> Joshua Lock (3):
>   base.bbclass: check all entries of FILESPATH for MACHINE overrides
>   external-csl-toolchain: skip parsing if CSL_VER_MAIN isn't set
>   netbase: remove redundant assignments

Merged to master, thanks.

Richard



