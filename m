Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrZzx-0005io-Am for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:28:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BIOMsG000573
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 19:24:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32410-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 19:24:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BIOG7k000567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 19:24:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
Date: Thu, 11 Aug 2011 19:23:37 +0100
Message-ID: <1313087018.14274.456.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/10] Various Fixes
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
X-List-Received-Date: Thu, 11 Aug 2011 18:28:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 09:29 -0700, Saul Wold wrote:
> The following changes since commit a1f87ec65fa1a6d5ce9a010548dbe7c01ab9b711:
> 
>   eglibc: force GLIBC_EXTRA_OECONF to not be uset for nativesdk (2011-08-10 13:26:22 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Khem Raj (1):
>   scripts/runqemu: Make it run on ubuntu 11.10
> 
> Kumar Gala (5):
>   gnome-doc-utils: respect python-dir setting EXTRA_OECONF
>
> Leandro Dorileo (1):
>   scripts/combo-layer: a simple way to script the combo-layer conf
> 
> Richard Purdie (1):
>   gcc: Various fixups to ensure consistent gcc builds
> 
> Xiaofeng Yan (1):
>   chkconfig: remove link for update-alternatives to disambiguate
> 
> jani.uusi-rantala@nokia.com (1):
>   Magic file path should be given for rpmbuild

I've merged these.

>   python-dir: specify am_cv_python_pythondir & am_cv_python_pyexecdir
>   xcb-proto: use python-dir class for proper path setting
>   telepathy-python: utilize python-dir to respect libdir/site-packages
>     path

I'm waiting on these since I think the m4 changes will improve this.

>   gcc: move --enable-target-optspace workaround to just gcc-4.5.1

and this one has issues and dropped at Kumar's request.

Cheers,

Richard



