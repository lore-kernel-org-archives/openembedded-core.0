Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2t3W-00085P-Kp
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:40:06 +0100
Received: by mail-ob0-f178.google.com with SMTP id wd20so873338obb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 16:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=vZqmmCFUHcczFJ4nXvLoAwflPBF2YF4flgdzXvc+83o=;
	b=xXcPEOSfVvrvkMud8XHqXtYgPymUyXyQlXSoYBejhCc9DJ1S9BFg1ctKoDg08SGdE8
	v0isFdlon+UDakUGk1X6amtdBdj7qhGka0T+S2XjaiCPd8U6QbShlWxz+VyN/UjAvD4P
	qeSfCuBs861SHHM/6mJZk6xzY31dVUZki7zX3mxCmYWlqpPMyyjCqgaUNqNGA2DIbqZL
	xxx7Z+z9/0mm+1V8En1B9+EFMLrh4CDQax9CzZ0Ib3vIEnsvpW9ZbwASSUz3gEpd/eOS
	n9+7Sbj8lGOL6Bv/IrvN4A3lMOhN00XJtxnI4KagZyGBLiPS1FA41rUqBbWs/8T3d8Sw
	7gBw==
MIME-Version: 1.0
X-Received: by 10.182.39.69 with SMTP id n5mr20169999obk.72.1360110255908;
	Tue, 05 Feb 2013 16:24:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 16:24:15 -0800 (PST)
In-Reply-To: <9e352d99316c5f8130db240d670c604b48b261ac.1360104547.git.dvhart@linux.intel.com>
References: <cover.1360104547.git.dvhart@linux.intel.com>
	<9e352d99316c5f8130db240d670c604b48b261ac.1360104547.git.dvhart@linux.intel.com>
Date: Tue, 5 Feb 2013 22:24:15 -0200
X-Google-Sender-Auth: jZJAhgCfJM-xfd_cxq4Pw90XeQs
Message-ID: <CAP9ODKqt0ZwcyOzCZYVqPt_tuSqk-=PJAX22sP2V2=P-0a94Uw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] meta-yocto: Document new oe-git-proxy in site.conf.sample
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 00:40:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 8:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> The new oe-git-proxy.sh should address all git proxying needs. Document
> its usage in meta-yocto/conf/site.conf.sample and remove references to
> the old mechanisms.
>
> V2: Separate out the meta-yocto changes from the oe-core changes
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  meta-yocto/conf/site.conf.sample |   35 +++++++++--------------------------
>  1 files changed, 9 insertions(+), 26 deletions(-)
>
> diff --git a/meta-yocto/conf/site.conf.sample b/meta-yocto/conf/site.conf.sample
> index 68d1da9..2834702 100644
> --- a/meta-yocto/conf/site.conf.sample
> +++ b/meta-yocto/conf/site.conf.sample
> @@ -16,32 +16,15 @@ SCONF_VERSION = "1"
>  #http-proxy-port = 81
>  #
>
> -# Uncomment to cause git to use the proxy host specificed
> -# although this only works for http
> -#GIT_PROXY_HOST = "proxy.example.com"
> -#GIT_PROXY_PORT = "81"
> -#export GIT_PROXY_COMMAND = "${COREBASE}/scripts/oe-git-proxy-command"
> -
> -# Set to yes to have a gitconfig generated for handling proxies; you
> -# might not want this if you have all that set in your global git
> -# configuration. If you don't enable it, the rest of the entries
> -# (_PROXY_IGNORE, etc) don't really work that well
> -#GIT_CORE_CONFIG = "Yes"
> -
> -# Space separate list of hosts to ignore for GIT proxy
> -#GIT_PROXY_IGNORE = "host.server.com another.server.com"
> -
> -# If SOCKS is available run the following command to comple a simple transport
> -# gcc scripts/oe-git-proxy-socks.c -o oe-git-proxy-socks
> -# and then share that binary somewhere in PATH, then use the following settings
> -#GIT_PROXY_HOST = "proxy.example.com"
> -#GIT_PROXY_PORT = "81"
> -
> -# GIT_PROXY_COMMAND is used by git to override all proxy settings from
> -# configuration files, so we prefix OE_ to avoid breaking havoc on the
> -# generated (or local) gitconfig's.
> -#OE_GIT_PROXY_COMMAND = "${COREBASE}/scripts/oe-git-proxy-socks-command"
> -
> +# To use git with a proxy, you must use an external git proxy command, such as
> +# the one provided by scripts/oe-git-proxy.sh. To use this script, copy it to
> +# your PATH and uncomment the following:
> +#GIT_PROXY_COMMAND="oe-git-proxy.sh"

.sh

A similar change ought to be done for oe-core .sample, no?

> +#ALL_PROXY="socks://socks.example.com:1080"
> +#or
> +#ALL_PROXY="https://proxy.example.com:8080"
> +# If you wish to use certain hosts without the proxy, specify them in NO_PROXY.
> +# See the script for details on syntax.
>
>  # Uncomment this to use a shared download directory
>  #DL_DIR = "/some/shared/download/directory/"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


