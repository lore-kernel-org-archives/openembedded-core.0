Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjXxu-0006wz-BH for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:41:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEbQRe023588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:37:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22766-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:37:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEbJcQ023582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:37:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311154909.30326.51.camel@phil-desktop>
References: <1311154909.30326.51.camel@phil-desktop>
Date: Wed, 20 Jul 2011 15:37:16 +0100
Message-ID: <1311172636.2344.44.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 14:41:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 10:41 +0100, Phil Blundell wrote:
> Since updating this morning I'm getting
> 
> | ERROR: Function 'File: '/home/pb/sources/libiconv-1.13.1.tar.gz' has
> md5 checksum 7ab33ebd26687c744a37264a330bbe9a when
> d42b97f6ef5dd0ba4469d520ed732fed was expected (from URL:
> 'ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz')' failed
> NOTE: package libiconv-1.13.1-r0: task do_fetch: Failed
> 
> The offending commit appears to be
> bd1e627bef29830f9346b4b984905fd8fcf2e716.  As far as I can tell from a
> quick inspection of the files, the checksum that was added for
> libiconv-1.13.1.tar.gz in that commit is actually the md5sum of the
> earlier version 1.11.1.

There is a big patch out there which includes a fix for this but I'm
asking it be reworked. In the meantime I've pushed a fix for the
checksums.

Cheers,

Richard





