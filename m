Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJhMY-0006EB-PN for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 10:32:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G8NIYV028769
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 09:23:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27997-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 09:23:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G8N8VX028762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 09:23:10 +0100
Message-ID: <1334564590.16992.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 09:23:10 +0100
In-Reply-To: <CAMKF1srUybfieu7yw8NGy5b9myojC=KZXRuue7xB0ELZObgHHQ@mail.gmail.com>
References: <1334509553.16992.34.camel@ted>
	<CAMKF1srUybfieu7yw8NGy5b9myojC=KZXRuue7xB0ELZObgHHQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc-configure-common.inc: Stop gcc looking at build system paths
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
X-List-Received-Date: Mon, 16 Apr 2012 08:32:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-04-15 at 16:42 -0700, Khem Raj wrote:
> On Sun, Apr 15, 2012 at 10:05 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > gcc_cv_collect2_libs
> 
> is it the /usr/lib/cmplrs/cc2.11 access issue ?

It is.

> in that case the fix it fine. However if its something in LTO
> then we need to dig deeper

Its not lto related.

Cheers,

Richard



