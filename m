Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDBrI-00034h-D7 for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 11:09:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9AB1F008072 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:10:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id utAf83hD7KfP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:10:11 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9A4Mb008057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:10:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 10:03:24 +0100
In-Reply-To: <1317850009-7714-2-git-send-email-msm@freescale.com>
References: <1317850009-7714-1-git-send-email-msm@freescale.com>
	<1317850009-7714-2-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318237412.8533.72.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH v2 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Mon, 10 Oct 2011 09:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 16:26 -0500, Matthew McClintock wrote:
> __ppc64__ is not defined on powerpc64, rather __powerpc64__ is, this
> uses a patch that is already upstream to fix builds for powerpc64
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  ...PowerPC-checks-for-__NR_perf_counter_open.patch |   35 ++++++++++++++++++++
>  meta/recipes-kernel/sysprof/sysprof_git.bb         |    1 +
>  2 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch

Merged to master, thanks.

Richard



