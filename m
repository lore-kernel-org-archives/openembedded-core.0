Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1QDY-0001vm-Pe for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 00:03:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M4Vmb029333 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:04:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y5DkWi3myZRb
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 23:04:31 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M4Qbn029330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:04:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5aa88c90226af1c5822344de8ae4fce537533782.1315383334.git.dongxiao.xu@intel.com>
References: <cover.1315383334.git.dongxiao.xu@intel.com>
	<5aa88c90226af1c5822344de8ae4fce537533782.1315383334.git.dongxiao.xu@intel.com>
Date: Wed, 07 Sep 2011 22:58:23 +0100
Message-ID: <1315432703.13021.27.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/1] telepathy-python: avoid duplicated installation of errors.py
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
X-List-Received-Date: Wed, 07 Sep 2011 22:03:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-07 at 16:18 +0800, Dongxiao Xu wrote:
> telepathy-python install fails on latest Fedora 16 due to the tighter
> check of duplicated file installation.
> 
> Remove one errors.py entry in Makefile.am to fix this issue.
> 
> [YOCTO #1453]
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  .../remove_duplicate_install.patch                 |   26 ++++++++++++++++++++
>  .../telepathy/telepathy-python_0.15.19.bb          |    5 ++-
>  2 files changed, 29 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch

Merged to master, thanks.

Richard



