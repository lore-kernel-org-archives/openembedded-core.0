Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iGF-0006qq-SU for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 13:48:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BjrTQ015519
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:45:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14945-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 12:45:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BjkUg015513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:45:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f1158ee9070ba8cbf1b6388e1af2906046548684.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<f1158ee9070ba8cbf1b6388e1af2906046548684.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 12:45:43 +0100
Message-ID: <1301917543.24596.337.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 01/46] sanity.bbclass: Use SSTATE_MANIFESTS instead of hard coding sstate-control
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
X-List-Received-Date: Mon, 04 Apr 2011 11:48:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:28 -0700, Khem Raj wrote:
> This helps when SSTATE_MANIFESTS is overridden by external layers
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/sanity.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 639e1ea..500a1b2 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -321,7 +321,7 @@ def check_sanity(e):
>              messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
>          elif abi == "5" and current_abi == "6":
>              bb.note("Converting staging layout from version 5 to layout version 6")
> -            os.system(bb.data.expand("mv ${TMPDIR}/pstagelogs ${TMPDIR}/sstate-control", e.data))
> +            os.system(bb.data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}", e.data))
>              f = file(abifile, "w")
>              f.write(current_abi)
>          elif (abi != current_abi):

Merged to master, thanks.

Richard



