Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q5Irp-0006on-DH for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 16:28:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEQnSH026600
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 15:26:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26001-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 15:26:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEQhMn026594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 15:26:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ca0ffb747b87caed609b2edf08f963751dbc8873.1301567822.git.Martin.Jansa@gmail.com>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
	<ca0ffb747b87caed609b2edf08f963751dbc8873.1301567822.git.Martin.Jansa@gmail.com>
Date: Thu, 31 Mar 2011 15:26:39 +0100
Message-ID: <1301581599.24596.106.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Thu, 31 Mar 2011 14:28:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 12:40 +0200, Martin Jansa wrote:
> * This was done generically in bitbake.conf this should be done on
>   demand and distutils based recipes seem to need it. So we define it
>   here.
> * imported from OE 629ae87eadeec1068c3778e14488b549029adffb
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/distutils-common-base.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
> index f66a5cd..b6caf24 100644
> --- a/meta/classes/distutils-common-base.bbclass
> +++ b/meta/classes/distutils-common-base.bbclass
> @@ -4,6 +4,8 @@ EXTRA_OEMAKE = ""
>  
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
> +# libtool 2.4 does not export with LDFLAGS but distutils need it
> +LDFLAGS_prepend = "-L${STAGING_LIBDIR} "

This should not be needed, the linker itself should automatically look
in that path at link time. What problem are you seeing?

Cheers,

Richard



