Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 16B20773D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 09:21:17 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id j27so15046245wre.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ppxbYCS2mhKVq8/prA/lVIjWWzcdBPAd2zbahFxuvBE=;
	b=kJzjEdOktiI1TS/3sTpnursT6zSW65DmM3pdhbRlwJLTBLUWzP2FJIiQGZcF7/HCkz
	lVRALAZnMHzaOWjJIR6EM3Y3hN7L+l9/FtP9Jw7PFzUuogmvHhe722bzKWm/WAeks1gz
	E+pLI9wT530PfcGK7DX3XQX8BRj7wWBAG+9ZKacTUfjPsBtj0SWHuJCuJ6KL8QNhz6lz
	D6xuD8i0xDQG5V4FZnrgvA76Fa4u7dWo7Qu/6Zxly/1G5xJ/wtTRRunmAajdK3Zc8foS
	OC4uRclYxvF5lom0fpZDauDnTGf/TEbwVd+qtq2Kjn9/2k/GX/hDcs9NvlPGVYkyBzI+
	BEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ppxbYCS2mhKVq8/prA/lVIjWWzcdBPAd2zbahFxuvBE=;
	b=KKlS7gCEiIm8IVdT5munc7D8eao5YF1ofqFw2z1mGZd6y65ABv7AGbDEzCHPTtPN2l
	LFEknWgklv4/QogrgcOOxu3uGH7tUWKtqog03eoRldnHPpHZ3HuiEH1r6VEoDlC3Q1ev
	m8RqZgljzTo0CTnJy+qMPQR4xwxMuzlG5teVR4mYeKl7C3l3NhTo+WuIbmLcWlJWAazd
	xWzzZqEI03mPxiHWQ5Cq/2Xy3FAd5xq9xaqufviZsTtaRCqxxosPxE0lQ6Q7PFBPLN9h
	lthRNgcOGps0jUgsyf/gjfzKA6VfpjlGJDlKg3Ohv+3X+h11XV5Y9BpBWwHQqzQ8T2d0
	hokQ==
X-Gm-Message-State: AODbwcDHy3vNeb/iVTMm8n8cicRIGqqzC2mYzy/d84uJN4cCFfnMeLkr
	sYrZcO8JUc3nb66n
X-Received: by 10.223.177.219 with SMTP id r27mr22672036wra.148.1495704078524; 
	Thu, 25 May 2017 02:21:18 -0700 (PDT)
Received: from [192.168.19.15] ([95.147.75.178])
	by smtp.googlemail.com with ESMTPSA id
	r29sm8098086wrc.25.2017.05.25.02.21.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 May 2017 02:21:18 -0700 (PDT)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
	<20170525021717.394-1-JPEWhacker@gmail.com>
From: Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <7a69047b-31ec-c7e8-5d03-b472f91500f8@gmail.com>
Date: Thu, 25 May 2017 10:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170525021717.394-1-JPEWhacker@gmail.com>
Subject: Re: [meta-oe][PATCH v3] openssh: Atomically generate host keys
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
X-List-Received-Date: Thu, 25 May 2017 09:21:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 25/05/17 03:17, Joshua Watt wrote:
> Generating the host keys atomically prevents power interruptions during
> the first boot from leaving the key files incomplete, which often
> prevents users from being able to ssh into the device.
> ---
>   meta/recipes-connectivity/openssh/openssh/init     | 21 +++----------
>   .../openssh/openssh/sshd-check-key                 | 36 ++++++++++++++++++++++
>   .../openssh/openssh/sshdgenkeys.service            | 24 +++++++--------
>   meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 +++++
>   4 files changed, 60 insertions(+), 29 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
> index 1f63725..22124a9 100644
> --- a/meta/recipes-connectivity/openssh/openssh/init
> +++ b/meta/recipes-connectivity/openssh/openssh/init
> @@ -45,23 +45,10 @@ check_config() {
>   }
>   
>   check_keys() {
> -	# create keys if necessary
> -	if [ ! -f $HOST_KEY_RSA ]; then
> -		echo "  generating ssh RSA key..."
> -		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
> -	fi
> -	if [ ! -f $HOST_KEY_ECDSA ]; then
> -		echo "  generating ssh ECDSA key..."
> -		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
> -	fi
> -	if [ ! -f $HOST_KEY_DSA ]; then
> -		echo "  generating ssh DSA key..."
> -		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
> -	fi
> -	if [ ! -f $HOST_KEY_ED25519 ]; then
> -		echo "  generating ssh ED25519 key..."
> -		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
> -	fi
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_RSA rsa
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ECDSA ecdsa
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_DSA dsa
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ED25519 ed25519
>   }
>   
>   export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> new file mode 100644
> index 0000000..d2613af
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> @@ -0,0 +1,36 @@
> +#! /bin/sh
> +set -e
> +
> +NAME="$1"
> +TYPE="$2"
> +
> +if [ -z "$NAME" ] || [ -z "$TYPE" ]; then
> +    echo "Usage: $0 NAME TYPE"
> +    exit 1;
> +fi
> +
> +DIR="$(dirname "$NAME")"
> +
> +if [ ! -f "$NAME" ]; then
> +    echo "  generating ssh $TYPE key..."
> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
> +
> +    # Move (Atomically rename) files
> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
> +
> +    # This sync does double duty: Ensuring that the data in the temporary
> +    # private key file is on disk before the rename, and ensuring that the
> +    # public key rename is completed before the private key rename, since we
> +    # switch on the existence of the private key to trigger key generation.
> +    # This does mean it is possible for the public key to exist, but be garbage
> +    # but this is OK because in that case the private key won't exist and the
> +    # keys will be regenerated.
> +    #
> +    # In the event that sync understands arguments that limit what it tries to
> +    # fsync(), we provided them. If it does not, it will simply call sync()
> +    # which is just as well
> +    sync "${NAME}.pub" "$DIR" "${NAME}.tmp"
> +
> +    mv -f "${NAME}.tmp" "${NAME}"

You previously mentioned moving the third, most optional sync to a 
single sync at the end, but I don't see it at all now. Should there be 
another sync "$DIR" somewhere in the init script or service file?

Regards,
Ian

> +fi
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> index 148e6ad..5d08b53 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> @@ -1,22 +1,22 @@
>   [Unit]
>   Description=OpenSSH Key Generation
>   RequiresMountsFor=/var /run
> -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
> -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_rsa_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_dsa_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_ecdsa_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_ed25519_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key
>   
>   [Service]
>   Environment="SYSCONFDIR=/etc/ssh"
>   EnvironmentFile=-/etc/default/ssh
>   ExecStart=@BASE_BINDIR@/mkdir -p $SYSCONFDIR
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key -N '' -t rsa
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key -N '' -t dsa
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ecdsa_key -N '' -t ecdsa
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ed25519_key -N '' -t ed25519
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_rsa_key rsa
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_dsa_key dsa
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_ecdsa_key ecdsa
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_ed25519_key ed25519
>   Type=oneshot
>   RemainAfterExit=yes
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> index 5b96745..ede8823 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> @@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>              file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
>              file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
>              file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
> +           file://sshd-check-key \
>              "
>   
>   PAM_SRC_URI = "file://sshd"
> @@ -124,7 +125,14 @@ do_install_append () {
>   	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>   		-e 's,@SBINDIR@,${sbindir},g' \
>   		-e 's,@BINDIR@,${bindir},g' \
> +		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>   		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
> +
> +	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +		${D}${sysconfdir}/init.d/sshd
> +
> +	install -d ${D}${libexecdir}/${BPN}
> +	install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
>   }
>   
>   do_install_ptest () {
> 


