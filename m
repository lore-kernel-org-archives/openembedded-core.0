Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R5VpC-0003Et-F2 for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 06:51:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8J4qGop032628 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 05:52:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HXrWZmPwO2aB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 05:52:16 +0100 (BST)
Received: from [10.251.10.36] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8J4q8d9032624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 05:52:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
Date: Mon, 19 Sep 2011 05:38:31 +0100
Message-ID: <1316407111.2656.2.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 3.1.91- 
Subject: Re: [RC3 FIXES 0/4] Some fixes for RC3
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
X-List-Received-Date: Mon, 19 Sep 2011 04:51:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-09-18 at 16:03 -0700, Saul Wold wrote:
> This has a host contamination fix for texinfo and a non-gplv3 build
> fix, some konsole fixes from Paul.
> 
> These should go in before RC3.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 31cb3974eeaf2a808e8da3864e70986578c58cb9:
> 
>   sanity: disable mirrors for connectivity check (2011-09-16 18:07:19 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib sgw/oe-fix
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix
> 
> Joshua Lock (1):
>   texinfo: several changes to build without zlib and ncurses headers on
>     host
> 
> Paul Eggleton (2):
>   lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
>   sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD
> 
> Saul Wold (1):
>   base.bbclass: add crosssdk items to INCOMPATIBLE_LICENSE exclude list

Merged to master, thanks.

Richard



