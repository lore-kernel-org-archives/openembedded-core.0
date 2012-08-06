Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyOUn-0001TC-MG for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 16:41:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76ETdFO028640
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:29:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27818-07 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2012 15:29:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76ETUDb028634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:29:31 +0100
Message-ID: <1344263373.9756.167.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 15:29:33 +0100
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/9] buildhistory improvements
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
X-List-Received-Date: Mon, 06 Aug 2012 14:41:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-02 at 10:23 +0100, Paul Eggleton wrote:
> A bunch of improvements for buildhistory, implementing some feature
> requests and todo items of my own, as well as tidying up some of the
> code.
> 
> 
> The following changes since commit 404d2d490fc347203e89d274530c17fb5f0aa20f:
> 
>   gcc-configure-target: Set native-system-header-dir for target gcc (2012-08-01 23:11:09 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes7
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes7
> 
> Paul Eggleton (9):
>   classes/buildhistory: remove obsolete flat package history feature
>   classes/buildhistory: ensure old package info is removed
>   classes/buildhistory: remove unused functions
>   classes/buildhistory: save preinst/postinst/prerm/postrm
>   classes/buildhistory: record PKG/PKGE/PKGV/PKGR
>   buildhistory_analysis: tidy up duplicate split_version function
>   buildhistory_analysis: ignore removal of self-dependencies
>   classes/buildhistory: save metadata revisions

Merged to master apart from:

  scripts: add buildhistory-tag script

which seems to need more discussion/work.

Cheers,

Richard



