Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SouOC-0004Cp-BX for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 12:43:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAWD9l002856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:32:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02807-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:32:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAW3Wu002848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:32:04 +0100
Message-ID: <1342002724.7934.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:32:04 +0100
In-Reply-To: <1341973780-4638-1-git-send-email-msm@freescale.com>
References: <1341973780-4638-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] dtc.inc: fix for libdir == /usr/lib64
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
X-List-Received-Date: Wed, 11 Jul 2012 10:43:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 21:29 -0500, Matthew McClintock wrote:
> On 64bit systems dtc will still install libaries in /usr/lib
> unless we havet this override
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-kernel/dtc/dtc.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
> index fab91dc..18847c6 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc
> @@ -10,8 +10,8 @@ SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
>             file://make_install.patch \
>  	  "
>  

Merged to master, thanks.

Richard



