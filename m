Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQ5b4-0000Lw-RA for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 00:33:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RMUTHv007403
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:30:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07192-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:30:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RMUGK0007385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:30:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306517584.git.raj.khem@gmail.com>
References: <cover.1306517584.git.raj.khem@gmail.com>
Date: Fri, 27 May 2011 23:30:09 +0100
Message-ID: <1306535409.27470.308.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fix SRC_URI
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
X-List-Received-Date: Fri, 27 May 2011 22:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 10:38 -0700, Khem Raj wrote:
> Wrong patch got pushed into pull branch. But I have made amends
> here is the remainder. uclibc being in both meta-oe and oe-core
> confused my build on one machine it was picking it from oe-core
> and on other from meta-oe. Good new layers :)
> 
> The following changes since commit 4b9c98e10d0ebaef45c8386103ec9ed69a589fba:
> 
>   uclibc_git.bb: Fix patch path in SRC_URI (2011-05-27 10:29:24 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-thumb
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-thumb
> 
> Khem Raj (1):
>   uclibc_git.bb: Fix patch path in SRC_URI

Merged to master, thanks.

Richard



