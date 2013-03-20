Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UIJtH-0003SU-Rq
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 15:21:32 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so1782260oag.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=h88ctiCgd8xWuBo0lGBRc/3Bt52JZn8mvfzSwV8lVIY=;
	b=R8zUdQxDDrPNudkxkihfKA3X9bHtQuc0vIHUgqBGspaljYwCp1gJ228QlHU9qNjWOY
	VZ/R5hFM9QbcTkK3oh1Fih1Wj1M6+FS3BBxuku1eGQVrsl3CqZF1K/qLrJo9FHS7wzVw
	5RxOWkouyrCutX4+KK7KWpnqY5NqsieqwPgo69GU1LXj/K8cyAGZ2MrvMN0h8264Ikxf
	NAGV0V/U8ad0EJF2BanWU/opN0E7b9uAbKL4dlQkmFjqVXZ2Pgun9OLiSkUbnf/5qSVT
	YZcUcCYBDLCK3Z5nXqx2EPpjmU5gU2ZloDPIlvUu4zGV3SlTVydVi8a1+UXvB3jXuWZ8
	MHrQ==
MIME-Version: 1.0
X-Received: by 10.60.11.228 with SMTP id t4mr4061301oeb.42.1363788268469; Wed,
	20 Mar 2013 07:04:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 20 Mar 2013 07:04:28 -0700 (PDT)
In-Reply-To: <1363730053-7719-3-git-send-email-eu@felipetonello.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
	<1363730053-7719-3-git-send-email-eu@felipetonello.com>
Date: Wed, 20 Mar 2013 11:04:28 -0300
X-Google-Sender-Auth: u5aHdocaaZtszZDU-k9HPkhvnvQ
Message-ID: <CAP9ODKpRRTpX_Ksr4ySSatTCRV4e0f8PREJnP7E8gF02e6Rmiw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "eu@felipetonello.com" <eu@felipetonello.com>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has pulseaudio
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
X-List-Received-Date: Wed, 20 Mar 2013 14:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 19, 2013 at 6:54 PM,  <eu@felipetonello.com> wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> index e5e671e..fca4cb0 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -1,5 +1,5 @@
>  HOMEPAGE = "http://qt.nokia.com"
> -DEPENDS += "pulseaudio"
> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"

Is it possible to explicitly enable/disable pulseaudio support?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


