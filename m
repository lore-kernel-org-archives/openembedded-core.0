Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLWug-00048X-6m for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 10:15:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA298v2v013143
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 09:08:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12973-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 09:08:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA298mDN013137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 09:08:49 GMT
Message-ID: <1320224928.20107.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 02 Nov 2011 09:08:48 +0000
In-Reply-To: <1320185290-18117-1-git-send-email-morphis@gravedo.de>
References: <1320185290-18117-1-git-send-email-morphis@gravedo.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] meta: glib-2.0: don't apply qsort_r test removable patch for native version
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
X-List-Received-Date: Wed, 02 Nov 2011 09:15:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-01 at 23:08 +0100, Simon Busch wrote:
> On some buildhosts with an older version of native glib-2.0 installed (in this case
> 2.16.6) the qsort_r test removable patch leads to a compilation error:
> 
> | ./.libs/libglib-2.0.so: undefined reference to `qsort_r'
> | collect2: ld returned 1 exit status
> 
> This patch fixes this so the patch gets only applied for the native version of this
> recipe.
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



