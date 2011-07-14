Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhNB9-0006RO-F0 for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:46:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEgGYk008326
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:42:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08140-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:42:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEgCrS008320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:42:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310583666.git.tom_rini@mentor.com>
References: <cover.1310583666.git.tom_rini@mentor.com>
Date: Thu, 14 Jul 2011 15:42:07 +0100
Message-ID: <1310654527.20015.1174.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] siteinfo.bbclass re-merge
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
X-List-Received-Date: Thu, 14 Jul 2011 14:46:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 12:05 -0700, Tom Rini wrote:
> Hey all,
> 
> This is the second of two pull requests.  This doesn't depend on the first
> request, it's just splitting changes up.  There's three changes here.  First,
> site/ix86-common was setting the wrong value for unsigned int.  Second,
> change perl to use SITEINFO variables rather than functions.  Third, bring
> in the various changes in siteinfo.bbclass that have been in oe.dev.  This
> last part will, I hope, also make dealing with multilib-specific siteinfo
> stuff easier (also alternative ABIs like x32).
> 
> My next step is to work on merging and verifying as much as possible
> the site files in oe-core and oe.dev.
> 
> The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
>   Saul Wold (1):
>         libx11: ensure nativesdk uses correct DEPENDS and XCB flags
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo
> 
> Tom Rini (3):
>   site/ix86-common: Fix ac_cv_sizeof_unsigned_char definition
>   perl: Use SITEINFO variables not functions

I've merged these two.

>   siteinfo.bbclass: Port over oe.dev logic for site files

I'm still in the process of reviewing this as its not easy to see
everything thats changing in there...

Cheers,

Richard



