Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfEJJ-0003pj-B6 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:53:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GnwLk022022
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:49:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21561-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:49:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GnoY3022016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:49:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310139697.6337.134.camel@phil-desktop>
References: <1310139697.6337.134.camel@phil-desktop>
Date: Fri, 08 Jul 2011 17:49:10 +0100
Message-ID: <1310143750.20015.911.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 16:53:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 16:41 +0100, Phil Blundell wrote:
> I'm not sure whether there are pending patches which will address these
> or not, but with a fresh pull from today I'm still not getting very good
> packaging for eglibc 2.13.  Specifically:
> 
> WARNING: For recipe eglibc, the following files were installed but not
> shipped in any package:
> WARNING:   /etc/localtime
> WARNING:   /etc/rpc
> WARNING:   /etc/ld.so.conf
> WARNING:   /lib/gconv/ISO-2022-CN-EXT.so
> WARNING:   /lib/gconv/IBM921.so
> [... etc ...]
> WARNING:   /lib/gconv/.debug/ISO-2022-CN-EXT.so
> WARNING:   /lib/gconv/.debug/IBM921.so
> [... etc ...]
> WARNING:   /share/i18n/charmaps/ISO-8859-15.gz
> WARNING:   /share/i18n/charmaps/IBM285.gz
> [... etc ...]
> WARNING:   /share/i18n/locales/ss_ZA
> WARNING:   /share/i18n/locales/is_IS
> [... etc ...]
> WARNING: QA Issue: libc-extra-nss rdepends on eglibc-dev
> WARNING: QA Issue: libc-thread-db rdepends on eglibc-dev
> ERROR: QA run found fatal errors. Please consider fixing them.
> 
> I'm not sure if these are actually new or not, though.  It's possible
> that they've been there for ages and I only just noticed.

I'm guessing something is going wrong with prefixes somewhere. I'm
certainly not seeing the bulk of those locally...

Cheers,

Richard



