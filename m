Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBjz3-0007db-Qn for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:39:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I8agkR010179
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:36:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09965-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:36:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I8abJ9010173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:36:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <82e7534dc19afc4236082b989988c65e025efb80.1303113405.git.Martin.Jansa@gmail.com>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
	<82e7534dc19afc4236082b989988c65e025efb80.1303113405.git.Martin.Jansa@gmail.com>
Date: Mon, 18 Apr 2011 09:36:29 +0100
Message-ID: <1303115789.5518.72.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/4] python-dir.bbclass: define default PYTHON_BASEVERSION
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
X-List-Received-Date: Mon, 18 Apr 2011 08:39:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-18 at 10:00 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/python-dir.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
> index a072a93..1ceb929 100644
> --- a/meta/classes/python-dir.bbclass
> +++ b/meta/classes/python-dir.bbclass
> @@ -1,2 +1,3 @@
> +PYTHON_BASEVERSION ?= "2.6"
>  PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>  PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"

Merged to master, thanks.

Richard



