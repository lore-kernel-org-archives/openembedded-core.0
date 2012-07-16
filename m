Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SqhBs-0006Nv-I4 for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 11:02:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6G8ojbk028933
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:50:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28381-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:50:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6G8oYV5028927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:50:35 +0100
Message-ID: <1342428637.5019.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 09:50:37 +0100
In-Reply-To: <1342187709-19368-10-git-send-email-morgan.little@windriver.com>
References: <1342187709-19368-1-git-send-email-morgan.little@windriver.com>
	<1342187709-19368-10-git-send-email-morgan.little@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 09/20] python-setuptools: Update for python-native changes
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
X-List-Received-Date: Mon, 16 Jul 2012 09:02:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-13 at 09:54 -0400, Morgan Little wrote:
> Add pythonnative to the inherits list
> 
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>  .../python/python-setuptools_0.6c11.bb             |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
> index a769714..dbbc4dc 100644
> --- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
> +++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
> @@ -5,7 +5,7 @@ LICENSE = "PSF"
>  LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
>  
>  SRCNAME = "setuptools"
> -PR = "ml4"
> +PR = "ml3"
>  DEPENDS += "python"
>  DEPENDS_virtclass-native += "python-native"
>  
> @@ -14,7 +14,7 @@ SRC_URI = "\
>  "
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>  
> -inherit distutils
> +inherit distutils pythonnative

Rather than do this with every user of distutils, would it make sense to
inherit pythonnative in the distutils class? Is there a case we wouldn't
want that inherit?

Cheers,

Richard




