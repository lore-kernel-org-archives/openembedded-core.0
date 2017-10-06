Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 496F76AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 13:38:42 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id v62so5590538itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=X4aouMjhb5t1s3/BkdDlCSQWSmRpEm4S4+/yAFkisLI=;
	b=o8iBjHcsmVxFSQ4BEms06EtXQfnslyB8CoSx1PuDNuzIIL6HqzCXptUt//h+Rpsc9E
	vr0PiPK7swinT8e2qnKZWPXrye9lN9RD8Tv6s+9su/+kub329iHj4U+n/WznOQShe/Ls
	koss/fRS/hCkDwfhZJn1q5leXBsSfwtrllIqVfKuaHoh/F98quhXmLCFS6XebWJqoEcP
	PYeLyb2FjRgeoTQniNoqLMNvDSJjZVdR1ATjiooUGTao1qXv23oYT0NOXnRc0ypDt5mp
	1cpGqkTu5tDgT4i+xSGe+RUEKvoQQm1qz7s5befQHFxEQcr9aj0hwOgox5LGswuHM5b4
	/xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X4aouMjhb5t1s3/BkdDlCSQWSmRpEm4S4+/yAFkisLI=;
	b=aI/gi3GmYAgc9xI/CdqvB9SHFUoUzzxZ3Orawp3ch+Bpi47O/kKDGpgxsMydMaG8Az
	vmqGX+96qdKqP+naJ6GAzRxRcUDelSMZmnBXLYiabPFH7CXzuSEfpKj0tD4jI6HZLbts
	IJE70Uuz/iIa8TXHrzm9lV/bjmhMyJxoz1JiKPgnxVdPlulNwogJuY6dh55zA8W7rrBS
	swlO12n5dmuLGVY6KW0yxoYHeVRx2BliS8Q2X9YvlqYjS1kgb0oQU5TaftgkhDOUGFet
	oTlvwPEemzUKo+Ywa9STfcjj6mR80nTv85qoYBGaQwK3w2k8p3USHlawEzEX5dloY6lK
	nodw==
X-Gm-Message-State: AMCzsaXh91fpnn72Ed3ieBtUzzYAdKQH3b9gbu6A4uM3LmFEpEHSSnLR
	HVZ0431gFkfC2C1QAL7s2JkLjBEE
X-Google-Smtp-Source: AOwi7QAvZNl0Wt0I4pL10gi5PSzf7ECtJioP0iXCFsnwysS1JaPAioDtiuYIlIfFgEYrUJsNPpYLgA==
X-Received: by 10.36.48.72 with SMTP id q69mr2464145itq.123.1507297123776;
	Fri, 06 Oct 2017 06:38:43 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	v18sm901821ita.28.2017.10.06.06.38.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Oct 2017 06:38:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1507297122.2615.49.camel@gmail.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Oct 2017 08:38:42 -0500
In-Reply-To: <20171006121259.5817-5-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
	<20171006121259.5817-5-git@andred.net>
X-Mailer: Evolution 3.24.5 (3.24.5-1.fc26) 
Mime-Version: 1.0
Subject: Re: [pyro][PATCH 04/17] openssh: allow to override OpenSSL HostKeys when read-only-rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 13:38:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-10-06 at 13:12 +0100, André Draszik wrote:
> From: André Draszik <adraszik@tycoint.com>
> 
> With these changes it is possible to have a .bbappend that
> - sets SYSCONFDIR to some persistent storage
> - modifies SYSCONFDIR/sshd_config to use ssh host keys from
>   the (writable) sysconfdir
> 
> Signed-off-by: André Draszik <adraszik@tycoint.com>
> Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> (cherry picked from commit 106b59d9f96f70d133fa1421091ad280d27a5b6a)
> Signed-off-by: André Draszik <adraszik@tycoint.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass       |  4 +--
>  meta/recipes-connectivity/openssh/openssh/init | 46
> +++++++++++++++++++++++---
>  2 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index 2503d89e28..4b91972ce7 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -91,10 +91,10 @@ read_only_rootfs_hook () {
>  	# and the keys under /var/run/ssh.
>  	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
>  		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ];
> then
> -			echo "SYSCONFDIR=/etc/ssh" >>
> ${IMAGE_ROOTFS}/etc/default/ssh
> +			echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}"
> >> ${IMAGE_ROOTFS}/etc/default/ssh
>  			echo "SSHD_OPTS=" >>
> ${IMAGE_ROOTFS}/etc/default/ssh
>  		else
> -			echo "SYSCONFDIR=/var/run/ssh" >>
> ${IMAGE_ROOTFS}/etc/default/ssh
> +			echo "SYSCONFDIR=\${SYSCONFDIR:-
> /var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
>  			echo "SSHD_OPTS='-f
> /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
>  		fi
>  	fi
> diff --git a/meta/recipes-connectivity/openssh/openssh/init
> b/meta/recipes-connectivity/openssh/openssh/init
> index 1f63725cc0..386628afc8 100644
> --- a/meta/recipes-connectivity/openssh/openssh/init
> +++ b/meta/recipes-connectivity/openssh/openssh/init
> @@ -19,10 +19,24 @@ fi
>  [ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
>  mkdir -p $SYSCONFDIR
>  
> -HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
> -HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
> -HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
> -HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
> +parse_sshd_opts() {
> +    set -- ${SSHD_OPTS} --
> +    sshd_config=/etc/ssh/sshd_config
> +    while true ; do
> +        case "$1" in
> +        -f*) if [ "$1" = "-f" ] ; then
> +                 sshd_config="$2"
> +                 shift
> +             else
> +                 sshd_config="${1#-f}"
> +             fi
> +             shift
> +             ;;
> +        --) shift; break;;
> +        *) shift;;
> +        esac
> +    done
> +}
>  
>  check_for_no_start() {
>      # forget it if we're trying to start, and
> /etc/ssh/sshd_not_to_be_run exists
> @@ -45,21 +59,45 @@ check_config() {
>  }
>  
>  check_keys() {
> +	# parse location of keys
> +	local HOST_KEY_RSA
> +	local HOST_KEY_DSA
> +	local HOST_KEY_ECDSA
> +	local HOST_KEY_ED25519
> +
> +	parse_sshd_opts
> +	HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ |
> tail -1 | awk ' { print $2 } ')
> +	[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey
> "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
> +	[ -z "${HOST_KEY_RSA}" ] &&
> HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
> +	HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ |
> tail -1 | awk ' { print $2 } ')
> +	[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey
> "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
> +	[ -z "${HOST_KEY_DSA}" ] &&
> HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
> +	HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep
> _ecdsa_ | tail -1 | awk ' { print $2 } ')
> +	[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey
> "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
> +	[ -z "${HOST_KEY_ECDSA}" ] &&
> HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
> +	HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep
> _ed25519_ | tail -1 | awk ' { print $2 } ')
> +	[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$(grep
> HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print
> $2 } ')
> +	[ -z "${HOST_KEY_ED25519}" ] &&
> HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
> +
>  	# create keys if necessary
>  	if [ ! -f $HOST_KEY_RSA ]; then
>  		echo "  generating ssh RSA key..."
> +		mkdir -p $(dirname $HOST_KEY_RSA)
>  		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
>  	fi
>  	if [ ! -f $HOST_KEY_ECDSA ]; then
>  		echo "  generating ssh ECDSA key..."
> +		mkdir -p $(dirname $HOST_KEY_ECDSA)
>  		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
>  	fi
>  	if [ ! -f $HOST_KEY_DSA ]; then
>  		echo "  generating ssh DSA key..."
> +		mkdir -p $(dirname $HOST_KEY_DSA)
>  		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
>  	fi
>  	if [ ! -f $HOST_KEY_ED25519 ]; then
>  		echo "  generating ssh ED25519 key..."
> +		mkdir -p $(dirname $HOST_KEY_ED25519)
>  		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
>  	fi
>  }
> -- 
> 2.14.2
> 

If you are backporting this, please also backport
ae32558a19ae3b3f175365dc0e10fa74a91e28ce (https://patchwork.openembedde
d.org/series/7509/)


