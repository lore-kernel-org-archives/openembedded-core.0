Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ucetn-00057v-BD
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 18:49:58 +0200
Received: by mail-oa0-f45.google.com with SMTP id j6so2467688oag.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JX/475XYB2Mtzkxyi5hbk35F6kp9307khHjKCqwvckY=;
	b=Mo17ZAsmMHF2ttRkSVhhcMkUYKGLpTpN0+NP6tQscEu2+j81ELmWrbwcP6WyEyiXG9
	LFahYmdBP5vaBxwKzpZmIfbG2A5UjfNSB8XqZ9juiKIY3G88CxmXH35cftyKHQatIvIn
	Ot2/WJjh5CNLgwMdjpLwel0U1XjdXEx4mao0SvOp01PrA/wneDgx6FfZZKI4o03chWqE
	B8QgwP1jTKY5bmLnuPbg1xlG9D9qwl1GDwHJO4ayCdGajGspW5nh2GUFvB6kjyLhMGPZ
	OaoDlRqyuuxso5UmtrlCliUzRrqGL/k6rsPBdRIXxI2p8vlR0+wtue9ZILNq53JQz6DT
	tvHw==
MIME-Version: 1.0
X-Received: by 10.60.135.102 with SMTP id pr6mr13406377oeb.138.1368635501611; 
	Wed, 15 May 2013 09:31:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Wed, 15 May 2013 09:31:41 -0700 (PDT)
In-Reply-To: <1368123358-10995-1-git-send-email-eu@felipetonello.com>
References: <1368123358-10995-1-git-send-email-eu@felipetonello.com>
Date: Wed, 15 May 2013 13:31:41 -0300
X-Google-Sender-Auth: lrkkL1ElWDjOn9UwbLpyeCjMvJM
Message-ID: <CAP9ODKrkH4dKFLFNUA_RusUk=27N7n-Dzu3DNaFLbPNK6FtDVQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Felipe Tonello <eu@felipetonello.com>, "Eggleton,
	Paul" <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt: updated qmake2 class to export qconfig.pri mkspec
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
X-List-Received-Date: Wed, 15 May 2013 16:50:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 9, 2013 at 3:15 PM,  <eu@felipetonello.com> wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> This is necessary when Qt applicatins want to know variables such as
> QT_MAJOR_VERSION, QT_VERSION, QT_MINOR_VERSION, gcc version etc.
>
> OBS: This change made the build system crazy. When I changed it and run
> bitbake my-qt-app-recipe, qmake was consuming 100% cpu usage for long time. I
> had to stop it. So I recommend rebuild the entire Qt stack when changing this.
>
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>  meta/classes/qmake2.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
> index 5eebd8e..8b9861c 100644
> --- a/meta/classes/qmake2.bbclass
> +++ b/meta/classes/qmake2.bbclass
> @@ -6,6 +6,7 @@ inherit qmake_base
>  DEPENDS_prepend = "qt4-tools-native "
>
>  export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
> +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
>  export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
>  export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
>  export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"

The patch makes a lot of sense for me, Paul?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


