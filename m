Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoDSA-0004jg-R0 for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 13:48:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72BhhRL015083
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 12:43:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14687-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2011 12:43:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72BhZ5b015077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 12:43:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312249633-23675-1-git-send-email-raj.khem@gmail.com>
References: <1312249633-23675-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 02 Aug 2011 12:43:19 +0100
Message-ID: <1312285399.2344.581.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] scripts/runqemu: grep for line beginning with TMPDIR
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
X-List-Received-Date: Tue, 02 Aug 2011 11:48:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 18:47 -0700, Khem Raj wrote:
> Currently the grep regexp matches any occurance of
> 'TMPDIR=' but if you have another variable defined
> e.g. OE_BUILD_TMPDIR=xxx then that gets picked up
> too.
> 
> $ bitbake -e | grep TMPDIR=\"
> TMPDIR="/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc"
> OE_BUILD_TMPDIR="/home/kraj/work/angstrom/build/tmp-angstrom_2010_x"
> 
> So we become a bit more stringent and look for
> line starting with TMPDIR
> 
> $ bitbake -e | grep ^TMPDIR=\"
> TMPDIR="/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc"
> 
> make sure that it greps
> only TMPDIR=xxx occurance and not values of other variables
> whose names happens to end with TMPDIR

Merged to master, thanks.

Richard



