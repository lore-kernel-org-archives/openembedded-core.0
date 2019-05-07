Return-Path: <jacob.kroon@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29C776D561
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 05:04:12 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a17so5011878iot.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+E9Km+aDOPYsr7lRNnI0Ooid3mx/l/68/dLoT4d8jxc=;
	b=jC4ukKgtWXPJJMQsqeFX5fxYGcudAAX8oPKebD+AudB91Z6NS9b5Ho8l8Fho7RFXvd
	LJC5qsuHRO1lO1c/xMQElhJF/ivjWD8yVCMo4NDvgCKbbL9ems0/bxv6wCqzAKZorivd
	M34PAi+QPvK1CxRipuS2PlRhymreEvCpPOmUhes592/EsbRjveBWhF8EyhKfPa0TLwnz
	G1BuyDXk+ybaKdfajQViF11awH8FEc19vw5yw+ozpCHHiHmkTlUbV8mMZ9LKMkz39CRQ
	ZcACaUNChEbufeRYAd9HHtr+5YgF/h11kAYvwLS6VNH6RyXkMdNaEpc6RrqMbwg0Wz8O
	CUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+E9Km+aDOPYsr7lRNnI0Ooid3mx/l/68/dLoT4d8jxc=;
	b=M3Vc9v+yDeXkmPq5QUrTIJ+p5Y3v5dlCA37LZiSzHBw83/Pvmyacg7vWw8EHJd83+t
	0GN3USN9GjzZ19bIu3QmU8o477VJv5gwgK9p3YoTeMlwxZUJpop2A60pCDnyiXr88/t/
	qXgVH9RR/yNUpFvrxeUczbYRT8X/mqAt3s2XiZNu0BzeRBW53I+KHi1sP95bysxdw1un
	AwY3Xu6/Q0kwBWsP7phd+cLSdkDXX7n1T+07hy7IvnnXPAk1QxPpZnud80m+wRINT+qw
	0/EMwLppWuvmK3HjJVahSa4+A857nTz6ApVKA1BmTfmU5t4hRnFs6Kw2Ab0bt18pddcO
	IJxw==
X-Gm-Message-State: APjAAAXmkvYq8fev1C7Gz0K6EcIImuadkxFek6eSdKtx8DU71MmN/Eyr
	rMK8xz9qjBXVAmlQ7JOgioOzI/RAzf0/vzYGe+FCeQ==
X-Google-Smtp-Source: APXvYqy6eEG34y9/6nkUT+dSD8UFxuFPMeQ1e1FWWkJeEC9ESeboex638ELWbNYt1RQ+ic2aODN/GnrBGOivEg7FD0U=
X-Received: by 2002:a5d:9153:: with SMTP id y19mr6925169ioq.38.1557205453152; 
	Mon, 06 May 2019 22:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <B32C5021EF3D894688F75677907CBC734599A785@pvmmail.tp-local.ru>
In-Reply-To: <B32C5021EF3D894688F75677907CBC734599A785@pvmmail.tp-local.ru>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Tue, 7 May 2019 07:04:02 +0200
Message-ID: <CAPbeDCmBbidMPu4NMb-vGEUKBLNBj2_reFarAguMXOENphzALg@mail.gmail.com>
To: Popov Anton <Anton.Popov@t-platforms.ru>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: fix owner and group for binaries in resulting image
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
X-List-Received-Date: Tue, 07 May 2019 05:04:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Are we sure this is not caused by the new glibc2.29/pseudo problems
that has been seen previously ?
Which distro are you building on, and which version of poky/oe are you usin=
g ?
/Jacob

On Mon, May 6, 2019 at 5:46 PM Popov Anton <Anton.Popov@t-platforms.ru> wro=
te:
>
> util-linux source produce some binaries with setuid bit set
>
> do_install function produce binaries in /sbin and /bin with uid:gid
> of user who build image this lead to messages like this:
> mount /dev/sdb1 /mnt/flash
> mount: only root can do that (effective UID is 1000)
> this patch changing owner of binaries in /bin and /sbin to 0:0
>
> Signed-off-by: Anton Popov <Anton.Popov@t-platforms.ru>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 34255a2dec..d75a2dd399 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -201,6 +201,27 @@ do_install () {
>      fi
>  }
>
> +# when building yocto image with non-root user some binaries appears in =
resulting
> +# image with rights of user who build image. This behaviour may lead to =
misfunction
> +# of some binaries like mount because of setuid bit on them:
> +# mount /dev/sdb1 /mnt/flash
> +# mount: only root can do that (effective UID is 1000)
> +# ls -ld which mount
> +# lrwxrwxrwx    1 root     root            21 Jan  2  1970 /bin/mount ->=
 /bin/mount.util-linux                                                     =
                                  # root@mitx-fp32:/mnt/system/initrd# ls -=
ld /bin/mount.util-linux                                                   =
                                                                 # -rwsr-xr=
-x    1 1000     1000         28020 Apr 23 12:49 /bin/mount.util-linux
> +do_install_append_class-target () {
> +    for p in $sbinprogs $sbinprogs_a; do
> +        if [ -f "${D}${base_sbindir}/$p" ]; then
> +            chown 0:0 "${D}${base_sbindir}/$p"
> +        fi
> +    done
> +    for p in $binprogs_a; do
> +        if [ -f "${D}${base_bindir}/$p" ]; then
> +            chown 0:0 "${D}${base_bindir}/$p"
> +        fi
> +    done
> +}
> +
> +
>  # nologin causes a conflict with shadow-native
>  # kill causes a conflict with coreutils-native (if ${bindir}=3D=3D${base=
_bindir})
>  do_install_append_class-native () {
> --
> 2.20.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

