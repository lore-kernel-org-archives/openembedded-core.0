Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUsEJ-0002xZ-Gb
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 05:17:51 +0200
Received: by pzk36 with SMTP id 36so1104550pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lfS36/1oMvt4dm+aTC2x/ffs5ZRcUzL3dQ1u0uQ4YHQ=;
	b=wNBd/BbvUzPuPhGT4X9UotDEP5+jV50zgMd4qtAm4tOZ+sqzQgf+6OrFS05YLrql+o
	WJbAmiM1w743fCpxOvP/I94haFWy2h3vP+nDz2Eum4qb7b/4wZBncxdbd+Ybw7bq4UB3
	RzRHmbjqQ3gtOg0fXo87xKCFiCMyBGt1BQrIM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=u+qf+L4uWZyzI5l4o845cVkRuQ1oBfryBpM4Z+IAnOmo9TntXRCYpiFpkXqeED/ulg
	/TowwYyXSQ4zir0P9kceeb6cOZyw9D6u8ZQ2Wa/YaqgBDRC9prRi1NFjHN+9biSyfkbi
	7kc3wh/yDCAv+x7Q5VB+bhif2voyZ/LHkS3Jc=
Received: by 10.142.59.20 with SMTP id h20mr247022wfa.293.1307675669486;
	Thu, 09 Jun 2011 20:14:29 -0700 (PDT)
Received: from [172.23.8.101] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id o1sm2377997wfd.8.2011.06.09.20.14.27
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 20:14:28 -0700 (PDT)
Message-ID: <4DF18C11.4010003@gmail.com>
Date: Thu, 09 Jun 2011 20:14:25 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1307510707.git.kai.kang@windriver.com>
	<f0caff18791ca02c18eeb8205f3efaffd1e88cc9.1307510707.git.kai.kang@windriver.com>
In-Reply-To: <f0caff18791ca02c18eeb8205f3efaffd1e88cc9.1307510707.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/2] bitbake: add another local configuration file
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
X-List-Received-Date: Fri, 10 Jun 2011 03:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2011 10:56 PM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Add a new local configuration file local.extended.conf.sample, and more advanced
> settings what user can configure could put in this file.
>
> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> ---
>   meta-yocto/conf/local.extended.conf.sample |    5 +++++
>   meta/conf/bitbake.conf                     |    1 +
>   scripts/oe-setup-builddir                  |   19 +++++++++++++++++++
>   3 files changed, 25 insertions(+), 0 deletions(-)
>   create mode 100644 meta-yocto/conf/local.extended.conf.sample
>


I thought of just having a sample file with advanced configuration 
options. I dont know adding another local.conf file is going to make it 
more usable.

> diff --git a/meta-yocto/conf/local.extended.conf.sample b/meta-yocto/conf/local.extended.conf.sample
> new file mode 100644
> index 0000000..048d641
> --- /dev/null
> +++ b/meta-yocto/conf/local.extended.conf.sample
> @@ -0,0 +1,5 @@
> +# eglibc configurability is used to reduce minimal images's size.
> +# the all supported eglibc options are default enabled by adding
> +# to DISTRO_FEATURES in default-distrovars.inc
> +# put the options what you want to enable below and uncomment it
> +#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index de94316..1b1cf6b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -641,6 +641,7 @@ CPU_FEATURES_arm ?= "vfp"
>   include conf/site.conf
>   include conf/auto.conf
>   include conf/local.conf
> +include conf/local.extended.conf
>   include conf/build/${BUILD_SYS}.conf
>   include conf/target/${TARGET_SYS}.conf
>   include conf/machine/${MACHINE}.conf
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 5fc8b19..31fb3d6 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -55,6 +55,7 @@ if [ "x" != "x$TEMPLATECONF" ]; then
>       fi
>       OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
>       OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
> +    OECORELOCALCONFEXTENDED="$TEMPLATECONF/local.extended.conf.sample"
>   fi
>
>   if [ "x" = "x$OECORELOCALCONF" ]; then
> @@ -79,6 +80,24 @@ EOM
>       cp -f $OECORELOCALCONF $BUILDDIR/conf/local.conf
>   fi
>
> +if ! (test -r "$BUILDDIR/conf/local.extended.conf"); then
> +cat<<EOM
> +You had no conf/local.conf file. This configuration file has therefore been
> +created for you with some default values. You may wish to edit it to use
> +different eglibc configuration options for example. See the file for more
> +information as common configuration options are commented.
> +
> +The Yocto Project has extensive documentation about OE including a reference manual
> +which can be found at:
> +    http://yoctoproject.org/community/documentation
> +
> +For more information about OpenEmbedded see their website:
> +    http://www.openembedded.org/
> +
> +EOM
> +	cp -f $OECORELOCALCONFEXTENDED $BUILDDIR/conf/local.extended.conf
> +fi
> +
>   if [ "x" = "x$OECORELAYERCONF" ]; then
>       OECORELAYERCONF="$OEROOT/meta/conf/bblayers.conf.sample"
>   fi



