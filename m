Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrUbT-0004lZ-Um for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:47:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDaQKd025283
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:36:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24227-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:36:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDaGUB025277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:36:20 +0100
Message-ID: <1342618580.513.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 14:36:20 +0100
In-Reply-To: <CAF1ZMEdcbw78ViHnxiFH2BY4rweS8nzQoTG_=5EcUTjqPw8G+g@mail.gmail.com>
References: <CAF1ZMEdcbw78ViHnxiFH2BY4rweS8nzQoTG_=5EcUTjqPw8G+g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: core-image-sato fetchall fail due to circular dependency
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
X-List-Received-Date: Wed, 18 Jul 2012 13:47:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 11:27 +0800, Dennis.Yxun wrote:
> hi ALL:
>  hit following error, any ideas?
> 
> Dennis
> 
>  $ bitbake -c fetchall core-image-sato
> Parsing recipes: 100% |#########################################| Time: 00:00:38
> Parsing of 833 .bb files complete (0 cached, 833 parsed). 1132
> targets, 19 skipped, 0 masked, 0 errors.
> 
> Build Configuration:
> BB_VERSION        = "1.15.2"
> TARGET_ARCH       = "i586"
> TARGET_OS         = "linux"
> MACHINE           = "qemux86"
> DISTRO_VERSION    = "oe-core.0"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta              = "master:2bd0aaf98c5d586638d82f5f22c1c24122a889a3"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> ERROR: Task /mnt/work/oe/oe-core/meta/recipes-core/ncurses/ncurses_5.9.bb
> (do_fetchall) has circular dependency on
> /mnt/work/oe/oe-core/meta/recipes-core/eglibc/eglibc_2.15.bb
> (do_fetchall)
> 
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Try updating bitbake. I'm not seeing that error here...

Cheers,

Richard



