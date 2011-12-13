Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaRbw-0001k0-2x for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:37:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCUbJl008740
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:30:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07920-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:30:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCUSbv008734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:30:29 GMT
Message-ID: <1323779428.2731.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:30:28 +0000
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/10] Add missing SRC_URI checksums
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
X-List-Received-Date: Tue, 13 Dec 2011 12:37:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 00:13 -0800, Saul Wold wrote:
> Richard,
> 
> Add missing checksums for non-GPLv3 recipes since we enabled
> the error.  Also fix the ed recipe to remove an not-yet supported
> option.
> 
> Sau!
> 
> 
> The following changes since commit 9244a3b0565fd52d7973fda42a4f706b16240316:
> 
>   eglibc: Generate cross testing script during install (2011-12-12 21:50:10 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (10):
>   coreutils: Add SRC_URI Checksums for GPLv2
>   readline: Add SRC_URI Checksums for GPLv2
>   ed: Add SRC_URI Checksums for GPLv2
>   findutils: Add SRC_URI Checksums for GPLv2
>   gawk: Add SRC_URI Checksums for GPLv2
>   gzip: Add SRC_URI Checksums for GPLv2
>   sed: Add SRC_URI Checksums for GPLv2
>   gmp: Add SRC_URI Checksums for GPLv2
>   bash: Add SRC_URI Checksums for GPLv2
>   ed: remove unsupported option

Merged to master, thanks.

Richard



