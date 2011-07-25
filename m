Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QlJZq-0004hM-1y for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 13:44:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6PBdpOY017346
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:39:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15214-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:39:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6PBdh6n017340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:39:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
Date: Mon, 25 Jul 2011 12:39:38 +0100
Message-ID: <1311593978.2344.172.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED 25 July PULL 0/7]
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
X-List-Received-Date: Mon, 25 Jul 2011 11:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 00:30 -0700, Saul Wold wrote:
> Richard,
> 
> Here is a small collection of pull requests that upgrade and fix
> some bugs.
> 
> Note: I did not include TomR or your pull request, although I did 
> do some testing with both pull sets included and they passed build 
> testing.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit b4c23fce3eadaff8fc621d38759d493cd03cc131:
> 
>   consolekit 0.4.5: fix PAM installation dir (2011-07-22 11:56:42 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Dexuan Cui (2):
>   tcf-agent: upgrade to the latest stable revision 0.0+svnr1855
>   distro_tracking_fields.inc: update the info for tcf-agent
> 
> Kumar Gala (1):
>   gcc-4.6: Fix packaging of native toolchains
> 
> Saul Wold (3):
>   openjade-native: Add SYSROOT_PREPROCESS_FUNC
>   docbook-sgml-dtd-native: Add SYSROOT_PREPROCESS_FUNC
>   docbook-dsssl-stylesheets-native: Add SYSROOT_PREPROCESS_FUNC
> 
> Scott Garman (1):
>   runqemu: report error if TMPDIR cannot be determined

Merged to master, thanks!

Richard



