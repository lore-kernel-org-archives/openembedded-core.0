Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAOmy-0001oL-Kp
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:58:14 +0100
Received: by mail-oa0-f42.google.com with SMTP id i18so5802398oag.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OWYHkiiBhtByzEskby9YK2mQ0LYUOTv4OdDzcYnF1mo=;
	b=brx4a34st4NV9BpMcNHlPUJ4bfVkRU5XVhPfM3L21/69T4JmpI3UInrK6R3YTR6vDP
	pb8ClUdMKrBlVSXa7cSDvVj9Wb08AUKfupdg6VOM4aSP9GjxjkTiY0q6qmGIUpT8kzJD
	3DLP+uBBas/amCaJeoaXeJOIj9/vpRAENH7CkB6ymmt8o6O6P3OfFJsy4t9rIPODlzxl
	s/n3rqHaZz0ruPoQZc6qrfO5Oc03w89A/7F1ikn9N+yjCfLbG3YRS2SCa/XoiwA34a9x
	dB1Zj5u3Atvh45XQWDm8Bg74aKzJRmbvZR3MOmHfXesTOiVzCqWw9Iv0JegyTDOhVXNw
	YAdA==
MIME-Version: 1.0
X-Received: by 10.60.19.129 with SMTP id f1mr2207160oee.82.1361900504731; Tue,
	26 Feb 2013 09:41:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 09:41:44 -0800 (PST)
In-Reply-To: <1361900109-21869-1-git-send-email-ross.burton@intel.com>
References: <1361900109-21869-1-git-send-email-ross.burton@intel.com>
Date: Tue, 26 Feb 2013 14:41:44 -0300
X-Google-Sender-Auth: IxUhOM41jHw1i-o9Zbl3W3XcCEY
Message-ID: <CAP9ODKpR_ik-8F3d2-RwXDY=2Odn_uRVEwegZADSd38TCWmJ+w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 17:58:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 2:35 PM, Ross Burton <ross.burton@intel.com> wrote:
> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
> work on the target.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_197.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
> index c765c18..44cd919 100644
> --- a/meta/recipes-core/systemd/systemd_197.bb
> +++ b/meta/recipes-core/systemd/systemd_197.bb
> @@ -48,6 +48,8 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>  # Compress the journal
>  PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>
> +export ac_cv_path_KILL="/bin/kill"

This can be given in EXTRA_OECONF IIRC. Did you try it?

>  # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
>  EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
>                   --with-rootlibdir=${base_libdir} \
> --
> 1.7.10.4
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


