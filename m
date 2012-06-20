Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShFLA-00055i-CJ for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 09:28:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5K7Hqt0002333
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:17:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01637-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:17:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5K7HiRe002325
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:17:45 +0100
Message-ID: <1340176664.1640.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jun 2012 08:17:44 +0100
In-Reply-To: <alpine.DEB.2.02.1206191652560.3440@oneiric>
References: <alpine.DEB.2.02.1206191652560.3440@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Simplify "SRC_URI_append +=" to "SRC_URI_append ="
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
X-List-Received-Date: Wed, 20 Jun 2012 07:28:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-19 at 16:54 -0400, Robert P. J. Day wrote:

> diff --git a/meta/recipes-support/gmp/gmp_5.0.4.bb b/meta/recipes-support/gmp/gmp_5.0.4.bb
> index cb2ca5b..0f72742 100644
> --- a/meta/recipes-support/gmp/gmp_5.0.4.bb
> +++ b/meta/recipes-support/gmp/gmp_5.0.4.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>  		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
>  PR = "r1"
> 
> -SRC_URI_append += "file://use-includedir.patch \
> +SRC_URI_append = "file://use-includedir.patch \
>                     file://gmp_fix_for_x32.patch \
>                     file://gmp_fix_for_automake-1.12.patch \
>                     "

This last one will need a space before the first file:// to be correct.

Cheers,

Richard




