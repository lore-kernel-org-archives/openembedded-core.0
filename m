Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R3ct2-0001Ql-D7 for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 01:59:32 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8E00OvT011581 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 01:00:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XMfGPfQK3cFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 01:00:24 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8E00Kt7011562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 01:00:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2011 00:54:09 +0100
In-Reply-To: <3be290aac4da885fe5bc31797c4a689196c63b7a.1315956050.git.sgw@linux.intel.com>
References: <cover.1315956050.git.sgw@linux.intel.com>
	<3be290aac4da885fe5bc31797c4a689196c63b7a.1315956050.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1315958057.25993.6.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libzypp: move package-manger to it own package
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
X-List-Received-Date: Tue, 13 Sep 2011 23:59:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 16:41 -0700, Saul Wold wrote:
> [YOCTO #1234]
> 
> This moves a couple of files to a pkgmgt package so that
> they will not be installed by default. This removes the
> Add/Remove Software Icon from rpm based rootfs.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/libzypp/libzypp_git.bb |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



