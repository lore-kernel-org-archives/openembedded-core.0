Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tq6UL-0006BM-Aa
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2013 19:22:57 +0100
Received: by mail-ob0-f171.google.com with SMTP id dn14so12241099obc.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2013 10:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=et/LK6GKeB7spNZB2i0g7ThnUglNWw12d50fZvU6B0g=;
	b=KBeqfgEZine528UsmwrrkTlt9AJpHGMzAnQfd3kghZ424dL5S1n2Wchi8Y39gdxmwY
	fEwZ3/i2gBLJesYrbqN3qd8k3Vq4z1KqNrUb7KkollNga6sNvfDNgaLBntJAlDPIiP/7
	g4SZZKT3wf/q7xGRAv6yEZ1NeVIWfTwfzUyIPVVKYMiVUdSMZJKdKTg5F2OVl+DwPYkA
	bsbSOLD1JwEGf/8Y4BH8ovz7KUYKWOWPVi5d0t08aaxQL1kLWhaYRUI95uqk2IBsYOkH
	zBFDVZ+veL9OYtvLHlj45d2mQw8Yg4hUHz3ounmdxS8MKm/V0AQ/T71/E+spM+g1/KSO
	LlYQ==
MIME-Version: 1.0
Received: by 10.60.171.146 with SMTP id au18mr24084241oec.108.1357063675582;
	Tue, 01 Jan 2013 10:07:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 1 Jan 2013 10:07:55 -0800 (PST)
In-Reply-To: <29b8701ad0c5e0cabe53f59ef839f8f20bec6c4c.1356919994.git.Qi.Chen@windriver.com>
References: <cover.1356919994.git.Qi.Chen@windriver.com>
	<29b8701ad0c5e0cabe53f59ef839f8f20bec6c4c.1356919994.git.Qi.Chen@windriver.com>
Date: Tue, 1 Jan 2013 16:07:55 -0200
X-Google-Sender-Auth: DB98DVRy79VHIX0SvEB1L9w-zoQ
Message-ID: <CAP9ODKoh_yv0Spe3kDObbyVDRE=rvuFuMTXaY7r9ShJORwzdrA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5 1/4] sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
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
X-List-Received-Date: Tue, 01 Jan 2013 18:22:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 31, 2012 at 12:16 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This variable indicates whether the rootfs is intended to be read-only
> or not. Changing this value from 'no' to 'yes' on a currently running
> system with read-write rootfs and rebooting will give the user a working
> system with read-only rootfs.
>
> However, it is not suggested to change its value. Normally, if a read-only
> rootfs is required, we should build an image with 'read-only-rootfs' image
> feature.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit/rcS-default |    4 ++++
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb  |    2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
> index 3c9dea9..88907a5 100644
> --- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
> +++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
> @@ -23,3 +23,7 @@ FSCKFIX=yes
>  #TICKADJ=10000
>  # Enable caching in populate-volatile.sh
>  VOLATILE_ENABLE_CACHE=yes
> +# Indicate whether the rootfs is intended to be read-only or not.
> +# Setting ROOTFS_READ_ONLY to yes and rebooting will give you a read-only rootfs.
> +# Normally you should not change this value.
> +ROOTFS_READ_ONLY=no
> \ No newline at end of file

Please add a newline at the end of the fine.

> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index de073b8..bf6a29b 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -5,7 +5,7 @@ SECTION = "base"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                      file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
> -PR = "r9"
> +PR = "r10"
>
>  RDEPENDS_${PN} = "${PN}-inittab"
>
> --
> 1.7.9.5
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


