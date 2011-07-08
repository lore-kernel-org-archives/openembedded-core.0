Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfJD0-0001Qd-4E for openembedded-core@lists.openembedded.org;
	Sat, 09 Jul 2011 00:07:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68M3YuK024076
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 23:03:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23250-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 23:03:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68M3TJq024070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 23:03:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
Date: Fri, 08 Jul 2011 23:02:50 +0100
Message-ID: <1310162570.20015.920.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 0/4] rootfs space issue along with eglibc and libx11
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
X-List-Received-Date: Fri, 08 Jul 2011 22:07:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 10:29 -0700, Saul Wold wrote:
> Richard,
> 
> This is v2 of my patch set with updated commit messages and 
> reworked changes.  I grabbed the oe-dev change for ldd bashims,
> but still included the RDEPENDS for others until the maintainers 
> update the scripts.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit 93ce74a299832ca7f24b4ce1b951abffa0232612:
> 
>   libc-common.bbclass: Fix typo (2011-07-08 18:08:26 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (4):
>   rootfs_rpm: Add 50M to IMAGE_ROOTFS_EXTRA_SPACE for zypper /var space
>   eglibc: unbash ldd (from oe.dev)
>   eglibc: add RDEPENDS for bash on eglibc-utils
>   libx11: enable xcb support

Merged, thanks but I did remove the blank line in the rootfs_rpm
patch :)

Cheers,

Richard



