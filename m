Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QelK3-0007yh-AU for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 11:57:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p679qmZC026592
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 10:52:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26468-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 10:52:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p679qcma026586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 10:52:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309899985.git.raj.khem@gmail.com>
References: <cover.1309899985.git.raj.khem@gmail.com>
Date: Thu, 07 Jul 2011 10:52:01 +0100
Message-ID: <1310032322.20015.807.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Add recipes for 0.9.32 release
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
X-List-Received-Date: Thu, 07 Jul 2011 09:57:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 14:09 -0700, Khem Raj wrote:
> With this changeset we add new recipes for 0.9.32 and make that default
> preference. Then the git recipe are moved to track the latest master.
> systemd related fixes are separately applied to both git recipe and 0.9.32
> recipes
> 
> Both sets work for arm,mips,ppc,x86,x86-64
> 
> Thanks
> -Khem
> 
> 
> The following changes since commit 4eb3abaa5f4b5df0314dc0d503298d65cd203259:
> 
>   uclibc-0.9.32: Implement execvpe and refresh scheduler functions (2011-07-05 13:53:05 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-0.9.32
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-0.9.32
> 
> Khem Raj (5):
>   uclibc: Add recipes for 0.9.32 release
>   tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
>   uclibc_git: Move SRCREV past 0.9.32 release
>   uclibc_git: Implement execvpe and refresh scheduler functions
>   uclibc-0.9.32: Implement execvpe and refresh scheduler functions

Merged to master, thanks.

Richard



