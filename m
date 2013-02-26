Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UALwH-0001n2-Ga
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 15:55:32 +0100
Received: by mail-oa0-f54.google.com with SMTP id n12so5279492oag.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 06:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=q838ue73SYTxHz1VYgFpucZ00MwzNkQpgn1TeXR/e3U=;
	b=IUOa24ZsV5Fx6d+rhKU0hMXT0FdOizgTV9AdK2wjoYyiTJZUURASn1XVm2osFDDRa+
	u8DU+7kLOCDHa2T33Rja84iLYzwEV6OtE2rl859SP42PH764R/tYhC1/ojG02roD4vy+
	Ft/N4R/Pgnkmv6DVJV0LkCuKUpOl4JwvN+/k5HcImuSeYfDRlB9sHRUbRj0wPfZF4lub
	I6egIBCCQ119mG9TjL9Xmrhs17juq68D5fpvolMlGcqdawgu43IPgPj0waCNUOgDg+AE
	o6QGYt6BfyLH7vpF4M2kCez5FkgbtNYjPrKLOwNWiFycDd/mDdz4dlGPKvUW9P6lreP4
	s/Sg==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr1658831oea.4.1361889174529; Tue,
	26 Feb 2013 06:32:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 06:32:54 -0800 (PST)
In-Reply-To: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
Date: Tue, 26 Feb 2013 11:32:54 -0300
X-Google-Sender-Auth: hGuutJuS6Ko8QKnQaoSQHkhP4Wo
Message-ID: <CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 14:55:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 9:36 AM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> index 8ca2f6a..ee3e20c 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> @@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "4e1cf5468d488aaf320ddfd439e03cbda0b213550fd734026d23138e4b
>  SECTION = "x11/libs"
>  DEPENDS = "intltool-native xkbcomp-native glib-2.0 virtual/gettext"
>
> +PACKAGE_ARCH = "all"
> +
>  PR = "r0"
>
>  EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"

Please inherit allarch


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


