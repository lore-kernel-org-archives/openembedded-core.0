Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcQXz-0004Uf-Ii for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:21:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNHdh4003352
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 00:17:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00852-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 00:17:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNHYeY003315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 00:17:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309383006.git.jessica.zhang@intel.com>
References: <cover.1309383006.git.jessica.zhang@intel.com>
Date: Fri, 01 Jul 2011 00:17:14 +0100
Message-ID: <1309475834.20015.496.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Add env setting to support libtool2.4 m4 macro
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
X-List-Received-Date: Thu, 30 Jun 2011 23:21:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 16:09 -0700, Jessica Zhang wrote:
> Add OECORE_ACLOCAL_OPTS to env setup scripts for options
> running aclocal to generate correct libtool 2.4 m4 macro, 
> the autogen.sh should be changed as aclocal ${OECORE_ACLOCAL_OPTS}
> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
>   Khem Raj (1):
>         package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib jzhang/aclocal
>   http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/aclocal
> 
> Jessica Zhang (1):
>   Add OECORE_ACLOCAL_OPTS to env setup scripts for autotool project
>     using correct libtool 2.4

Merged to master, thanks.

Richard



