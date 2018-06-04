Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 135C0753AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 19:18:21 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id a2-v6so22937621uak.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 12:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=jNZssnPkV2m9LD0S7dFvHxqByJIQod1AVsPxPB7rB00=;
	b=kwlCSMoJn8Gz6YQmBvFAKsDNpG4Tkat1UpHqT2LxOI1O7EQ4kWiBiQnHvpMQV+lwXi
	fvFI3rqZ3eJFm7CHLVi2LvRNbI1HL8tTWzZxDYnp6YdO7l2p0RcSJCkE7MJHBtpCt+x6
	jUEWCgQMhCdFCsnyxpZnAeZ0VqAN6GU5yFPUcEq/SE1gnVLNevVauQCp5n0mb6EPQBKI
	EtqPvtvX5FWS5G9zew2Fcs+enCCf3NpCeYSX+uRoQlpaIOA0c3CWyQhdyXmeRpeoeUlH
	9YP0nznphY8Rk1BRiCm/6PXy1OrI6y098nLSW7YEuH7qHu1aJiF1ftjzaN0St6+BEdaW
	GHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=jNZssnPkV2m9LD0S7dFvHxqByJIQod1AVsPxPB7rB00=;
	b=pAMLEBnhzTgo4cbdWoiOdEgltUXAFzZ8DudSWmIz+CXlgSyVqa4QHvXpeswmrAozuM
	X2FPM5hJlq3YkxkjVn3G21Kf1mbdAFF8hXk2z5nPxe6P22P9NvMZyh7hG5MBKRx01YbW
	H80muBHP0QJkop53l9QG3jL8hCTQo6Y8sO/7sk+5V/bakTlSrXWsqXjgbImJbgb+lsH7
	QmLioyuviquk5kLPuCcm50u8dyT8rlyOYk4pUXlQn04n2Pap5/RpiSn4eTm7pErfhy7H
	VqeHhYWFm3IE9Qr8vGt1I+7d1jNdu4jIywEP+4iPfkKcs0L05h6fRSLTpWzRaL84uFUJ
	AMRw==
X-Gm-Message-State: ALKqPwecg7bXrdl6I9p3NWdMrPxZmHeSEsKdxBtlM1uKafWmV604mREI
	tDAajJKG5SZk7bKkfsx3iEONRDg8vTxaifXuUIk=
X-Google-Smtp-Source: ADUXVKLdhJteZbbJhgnClZkgarDJtK7WhLWdPfEjkt6HyjglBqMGpc5ivDWnFVtILtKFJb7FDS4PneytSWbIKgb4Fgo=
X-Received: by 2002:ab0:1048:: with SMTP id
	g8-v6mr13880973uab.52.1528139902769; 
	Mon, 04 Jun 2018 12:18:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 12:18:22 -0700 (PDT)
In-Reply-To: <1527286040-11947-1-git-send-email-armccurdy@gmail.com>
References: <1527286040-11947-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 4 Jun 2018 12:18:22 -0700
Message-ID: <CAJ86T=VFe=vuPfudEY_hUV3MMz34vOak7stiTHR33nTmya68Cg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: drop sshd support for DSA host keys
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
X-List-Received-Date: Mon, 04 Jun 2018 19:18:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 25, 2018 at 3:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> DSA keys have been deprecated for some time:
>
>   https://www.gentoo.org/support/news-items/2015-08-13-openssh-weak-keys.html

Ping.

Any issues with this?

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 8 --------
>  meta/recipes-connectivity/openssh/openssh/sshd_config     | 1 -
>  meta/recipes-connectivity/openssh/openssh_7.6p1.bb        | 1 -
>  3 files changed, 10 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
> index 5463b1a..be2e2ec 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
> @@ -60,9 +60,6 @@ done
>  HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
>  [ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
>  [ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
> -HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
> -[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
> -[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
>  HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
>  [ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
>  [ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
> @@ -79,12 +76,7 @@ if [ ! -f $HOST_KEY_ECDSA ]; then
>      echo "  generating ssh ECDSA key..."
>      generate_key $HOST_KEY_ECDSA ecdsa
>  fi
> -if [ ! -f $HOST_KEY_DSA ]; then
> -    echo "  generating ssh DSA key..."
> -    generate_key $HOST_KEY_DSA dsa
> -fi
>  if [ ! -f $HOST_KEY_ED25519 ]; then
>      echo "  generating ssh ED25519 key..."
>      generate_key $HOST_KEY_ED25519 ed25519
>  fi
> -
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
> index 31fe5d9..b7c3ccd 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd_config
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
> @@ -22,7 +22,6 @@ Protocol 2
>  #HostKey /etc/ssh/ssh_host_key
>  # HostKeys for protocol version 2
>  #HostKey /etc/ssh/ssh_host_rsa_key
> -#HostKey /etc/ssh/ssh_host_dsa_key
>  #HostKey /etc/ssh/ssh_host_ecdsa_key
>  #HostKey /etc/ssh/ssh_host_ed25519_key
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
> index e11e8d7..a527a7c 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
> @@ -110,7 +110,6 @@ do_install_append () {
>         install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
>         sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
>         echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> -       echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>         echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>         echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>
> --
> 1.9.1
>

