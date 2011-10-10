Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDBwc-0003GM-E1 for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 11:14:46 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9Fcin008234 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:15:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zo8eQpz35NMo
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:15:38 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9FYv6008219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:15:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 10:08:54 +0100
In-Reply-To: <1317852788-16690-1-git-send-email-msm@freescale.com>
References: <1317852788-16690-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318237742.23801.2.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH v3 1/6] Fix mdadm for powerpc64
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
X-List-Received-Date: Mon, 10 Oct 2011 09:14:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 17:13 -0500, Matthew McClintock wrote:
> This takes an upstream fix for compiling on powerpc64
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../0001-mdadm-fix-build-failures-ppc64.patch      |   50 ++++++++++++++++++++
>  meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    6 ++-
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch

Merged to master, thanks.

Richard



