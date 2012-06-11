Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Se4Fs-00038r-66 for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 15:02:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCpQWs014897
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:51:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13603-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:51:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCpINP014891
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:51:19 +0100
Message-ID: <1339419080.30460.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 13:51:20 +0100
In-Reply-To: <1339173827-61084-1-git-send-email-jason.wessel@windriver.com>
References: <1339173827-61084-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libnewt: Fix cross link using autoconf detected AR
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
X-List-Received-Date: Mon, 11 Jun 2012 13:02:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-08 at 11:43 -0500, Jason Wessel wrote:
> If building on 32bit host and creating 64bit libraries, the target
> package builds should not invoke the 32bit hosts's ar.  Specifically
> you will get an error message like:
> 
> x86_64-linux-gcc    -m64 --sysroot=/opt/qemux86-64/tmp/sysroots/qemux86-64 -g -o test test.o libnewt.a -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lslang
> libnewt.a: could not read symbols: Archive has no index; run ranlib to add one
> collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-extended/newt/files/cross_ar.patch |   51 +++++++++++++++++++++++
>  meta/recipes-extended/newt/libnewt_0.52.14.bb   |    5 +-
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/newt/files/cross_ar.patch

Merged to master, thanks.

Richard



