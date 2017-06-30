Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF8978277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:52:15 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id k3so2862012ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pyc2RonC0H1lxd8wr0DnnGT06cYBgmrWMeRL4a4Zeww=;
	b=ifEIwiBQpTaHSnE9CiL2SoEA1KWCeHBXzGIkAVroFHZqrXmvk4PjjJ7dSynrD6HxpX
	MtMWDEOHqhqGtdfZrpxbAoogzVO6YseUleqo8m/KnmKm5SVJGWNcWoJaXIQdYW7EHkr9
	+mE1p7dGCSN2NqAPdHC1NKpYukhreAEZvczieIzzH/0++NgLODihEbola0cUjh14ILBW
	yWXBz8Ks+UmxR/+VA2pa+aN8gglOp0OXlfh8sBDK/oUr8aenW3ud7gSiqqV5KstwiGMH
	bwTOiz5GjEA0Bp8Ib050rf7fTttx64xpEuHu28mBs480RCjzEgZqW/2gmEf6zrxnDGxS
	nXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pyc2RonC0H1lxd8wr0DnnGT06cYBgmrWMeRL4a4Zeww=;
	b=mVhH7bFTZWd6M+oJ27O7WSDQyAtyHOimIIHBToLQbYbateU2/dzE1CNBe3A+3fdyou
	BTju8Vj396X0Xm5ERLHCzUgtCZHdtAt7s1gy0Y4VWA1t+6k8anAc0TE3k7WHD4/7n6WF
	XJG8M0Zz6e4HZM4dXSmPlDWahRsv0Pgo1cQW3SjXZD4+3BRPdT7CtDbcKIGETpw6bhRH
	Hu5MQqgBuN87xDruS9f+itnnK95KdMA9spKtOeq5TMNko5fcN/yZyjlseb7YHnGEwngh
	szoVVbOM4cYN+5whW9NVm5VR3Ecs6ewlj//WW/PVJ9pvtYvYxFndsBf+e4xkuQtRDDJu
	UvYg==
X-Gm-Message-State: AKS2vOx5dO5DBMr/OEquFeqydzgCXlKTGLCec090hKQVn2HjjAhDin14
	Jm0hPY2HlkeOv5YKgHQ=
X-Received: by 10.36.178.75 with SMTP id h11mr20042086iti.61.1498830737042;
	Fri, 30 Jun 2017 06:52:17 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	76sm3251539iou.59.2017.06.30.06.52.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Jun 2017 06:52:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1498830733.8274.5.camel@gmail.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 08:52:13 -0500
In-Reply-To: <20170613082751.1163-1-git@andred.net>
References: <20170613082751.1163-1-git@andred.net>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [pyro][PATCH] openssh: allow to override OpenSSL HostKeys when read-only-rootfs
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
X-List-Received-Date: Fri, 30 Jun 2017 13:52:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-13 at 09:27 +0100, André Draszik wrote:
> From: André Draszik <adraszik@tycoint.com>
> 
> With these changes it is possible to have a .bbappend that
> - sets SYSCONFDIR to some persistent storage
> - modifies SYSCONFDIR/sshd_config to use ssh host keys from
>   the (writable) sysconfdir
> 
> Signed-off-by: André Draszik <adraszik@tycoint.com>
> Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit 106b59d9f96f70d133fa1421091ad280d27a5b6a)
> ---
>  meta/classes/rootfs-postcommands.bbclass       |  4 +--
>  meta/recipes-connectivity/openssh/openssh/init | 46
> +++++++++++++++++++++++---
>  2 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index 498174a664..abf4e14f4c 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -91,10 +91,10 @@ read_only_rootfs_hook () {
>  	# and the keys under /var/run/ssh.
>  	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
>  		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ];
> then
> -			echo "SYSCONFDIR=/etc/ssh" >>
> ${IMAGE_ROOTFS}/etc/default/ssh
> +			echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}"
> >> ${IMAGE_ROOTFS}/etc/default/ssh
>  			echo "SSHD_OPTS=" >>
> ${IMAGE_ROOTFS}/etc/default/ssh
>  		else
> -			echo "SYSCONFDIR=/var/run/ssh" >>
> ${IMAGE_ROOTFS}/etc/default/ssh
> +			echo "SYSCONFDIR=\${SYSCONFDIR:-
> /var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
>  			echo "SSHD_OPTS='-f
> /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
>  		fi
>  	fi
> diff --git a/meta/recipes-connectivity/openssh/openssh/init
> b/meta/recipes-connectivity/openssh/openssh/init
> index 1f63725cc0..386628afc8 100644
> --- a/meta/recipes-connectivity/openssh/openssh/init
> +++ b/meta/recipes-connectivity/openssh/openssh/init
> @@ -19,10 +19,24 @@ fi
>  [ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
>  mkdir -p $SYSCONFDIR
>  
> -HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
> -HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
> -HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
> -HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
> +parse_sshd_opts() {
> +    set -- ${SSHD_OPTS} --
> +    sshd_config=/etc/ssh/sshd_config
> +    while true ; do
> +        case "$1" in
> +        -f*) if [ "$1" = "-f" ] ; then
> +                 sshd_config="$2"
> +                 shift
> +             else
> +                 sshd_config="${1#-f}"
> +             fi
> +             shift
> +             ;;
> +        --) shift; break;;
> +        *) shift;;
> +        esac
> +    done
> +}
>  
>  check_for_no_start() {
>      # forget it if we're trying to start, and
> /etc/ssh/sshd_not_to_be_run exists
> @@ -45,21 +59,45 @@ check_config() {
>  }
>  
>  check_keys() {
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
>  	# create keys if necessary
>  	if [ ! -f $HOST_KEY_RSA ]; then
>  		echo "  generating ssh RSA key..."
> +		mkdir -p $(dirname $HOST_KEY_RSA)
>  		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
>  	fi
>  	if [ ! -f $HOST_KEY_ECDSA ]; then
>  		echo "  generating ssh ECDSA key..."
> +		mkdir -p $(dirname $HOST_KEY_ECDSA)
>  		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
>  	fi
>  	if [ ! -f $HOST_KEY_DSA ]; then
>  		echo "  generating ssh DSA key..."
> +		mkdir -p $(dirname $HOST_KEY_DSA)
>  		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
>  	fi
>  	if [ ! -f $HOST_KEY_ED25519 ]; then
>  		echo "  generating ssh ED25519 key..."
> +		mkdir -p $(dirname $HOST_KEY_ED25519)
>  		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
>  	fi
>  }
> -- 
> 2.11.0
> 

This patch breaks read-only-rootfs + systemd + openssh (see http://list
s.openembedded.org/pipermail/openembedded-core/2017-June/138883.html).
This should probably be fixed before backporting.



