Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3694060664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 18:39:06 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i18so12008316oag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=qNtXWRSuD5JKlBNoJqzM0UHYZc2cHrY6DTEs8pLE5BQ=;
	b=YPfeWLAVYZllaovFPeryWZj/CFGgmN732BZpG2Fjh/inH61r7eDu2213gabNttQzoL
	UgJz5P75CTFGRF0r7moP565/EZkRY9wyVkXTbRhompdtp5/1GzhdoF1/opCHkMfk0EwP
	uJySvQerorUuABVPOeyJTfu4QLoxfvcJMvoFBPnDosEmWPrVRFQz30kBDhDgd3bK4jHO
	5q0kg7X6GTdJuYlEj70KP86IiVs4fPrWNeY7RQ24/GDxtkqXRDLKvBPstsaKPb4l8rEz
	T0zg7DtMum5z9oLWxqOca6G79jAqWButnRXS5Kra2wG+khaV9txsKnUBTygXGDvEU0c6
	K+VQ==
MIME-Version: 1.0
X-Received: by 10.60.60.41 with SMTP id e9mr5654565oer.47.1376419146728; Tue,
	13 Aug 2013 11:39:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 13 Aug 2013 11:39:06 -0700 (PDT)
In-Reply-To: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
Date: Tue, 13 Aug 2013 15:39:06 -0300
X-Google-Sender-Auth: L2kHKS5eCeu3Q8NjWMVpNhD0nuI
Message-ID: <CAP9ODKpz=2nUBmoaX+uVHdCeYCkBq_kfEeKRi7zoJESkN9_zrA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 18:39:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 13, 2013 at 2:11 PM, Saul Wold <sgw@linux.intel.com> wrote:
> This shows an example of the config fragment support that
> both the linux-yocto and busybox recipes use. This example
> is specific to busybox.
>
> By adding busybox CONFIG options into a .cfg file and then
> adding that .cfg file to SRC_URI the merge_config.sh script will
> correctly handle these CONFIG options during the do_configure task.
>
> v2: fixed FILESEXTRAPATHS

This should be bellow --- line or it ends in the commit log.

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
>  meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++
>  2 files changed, 6 insertions(+)
>  create mode 100644 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>  create mode 100644 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>
> diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> new file mode 100644
> index 0000000..42c6730
> --- /dev/null
> +++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> @@ -0,0 +1 @@
> +CONFIG_RFKILL=n
> diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> new file mode 100644
> index 0000000..641f04a4
> --- /dev/null
> +++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +           file://no_rfkill.cfg \
> +           "
> --
> 1.8.1.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

