Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8h2V-0001RR-4V for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 00:58:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GNnhKP010067
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 23:49:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09710-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 23:49:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GNnX51010061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 23:49:34 GMT
Message-ID: <1331941774.18586.214.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 23:49:34 +0000
In-Reply-To: <b10ee19a1ab989049aafcb0f8eefadf8296dc900.1331924359.git.nitin.a.kamble@intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
	<b10ee19a1ab989049aafcb0f8eefadf8296dc900.1331924359.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/7] python-pycurl: fix packaging warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 23:58:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-16 at 12:00 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This commit fixes these packaging warnings:
>  WARNING: For recipe python-pycurl, the following files/directories were
> installed but not shipped in any package:
>  WARNING:   /usr/share/share
> 
> PR not bumber because no change in the output packages.
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../python/python-pycurl_7.19.0.bb                 |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> index d9fe465..8b849d7 100644
> --- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> +++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> @@ -29,3 +29,7 @@ export STAGING_INCDIR
>  export STAGING_LIBDIR
>  
>  BBCLASSEXTEND = "native"
> +
> +do_install_append() {
> +	rm -rf ${D}${datadir}/share
> +}

What is actually in there? Is that a file or a directory?

This is one of the cases it might be worth looking at why it exists at
all as something looks wrong there at a deeper level...

Cheers,

Richard



