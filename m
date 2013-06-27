Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B2C866ABBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 16:47:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5RGrx1J027314; Thu, 27 Jun 2013 17:53:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9JQjyvTr9r6x; Thu, 27 Jun 2013 17:53:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5RGrtxs027310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 27 Jun 2013 17:53:56 +0100
Message-ID: <1372351613.9930.225.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 27 Jun 2013 17:46:53 +0100
In-Reply-To: <51CC69DA.3010406@windriver.com>
References: <51C963C0.5020009@windriver.com> <1810438.1YW5iENKFC@helios>
	<51CC47DA.8090905@windriver.com> <51CC69DA.3010406@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Could qt4.8 build on mips 64 bits platform?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2013 16:47:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-27 at 12:35 -0400, Randy MacLeod wrote:
> We ended up with horrid bbapends such as:
> ---
> #Valid for all arches except mips64 with 64bit userspace
> # mips64 with n32 has host: mips64-wrs-linux-gnun32
> # mips64 with n64 has host: mips64-wrsmllib64-linux
> # qemumips has host: mips-wrs-linux
> # qemumips-64 has host: mips64-wrs-linux
> COMPATIBLE_HOST = 
> '((x86_64.*|i.86.*|powerpc.*|arm.*|mips-.*|mips32.*)-linux|mips64.*-linux-gnun32)'
> ---
> 
> so we'll likely need a clue on how to declare a host as incompatible
> or introduce an INCOMPATIBLE_HOST variable.

I suspect something like this should work:

COMPATIBLE_HOST_mips64 = ""

Cheers,

Richard


