Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPFb8-0002X5-Th for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 17:02:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PExAqS001501
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 15:59:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01415-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 15:59:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PEx4Au001495
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 15:59:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306327205-4325-1-git-send-email-Martin.Jansa@gmail.com>
References: <1306327205-4325-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 25 May 2011 15:59:02 +0100
Message-ID: <1306335542.27470.27.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] python-2.6.6: py_package_preprocess should change Makefile only in PKGD not D
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
X-List-Received-Date: Wed, 25 May 2011 15:02:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 14:40 +0200, Martin Jansa wrote:
> * PACKAGEFUNCS ?= "perform_packagecopy \
>                 ${PACKAGE_PREPROCESS_FUNCS} \
>   our py_package_preprocess is called after perform_packagecopy which does copy D to PKGD
>   so we change it to target version in D (image/) before populating sysroot (sysroot-destdir/)
>   while keeping Makefile.sysroot version in PKGD which was created before calling
>   py_package_preprocess, so both package for runtime and sysroot end wrong
> 
> * I haven't seen this problem on faster builder, I guess because do_package and do_populate_sysroot
>   can run in paralell and I was lucky that do_populate_sysroot finished before py_package_preprocess
>   was started, but if you build python step by step -c package first you should see it every time

Merged to master, thanks.

Richard



