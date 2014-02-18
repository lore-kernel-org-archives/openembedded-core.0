Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id D5F956EB0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 16:54:26 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so15568531yho.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=9IzFffnsKP5D+PRBcR0nd83tpR8WhpeAfRJ+1wlaV94=;
	b=QDekjKpsm+dkobOYIvELXcZBkIjJINtUzJTdQglS2hRuFrjc85qzJUnNJFvHmWyvVo
	KaolLGO9zO93qJA55+dNK7/1ntfgFvt7DBTklvrXevTwhY8YJFG2M8HDpa8cH0dQ3xBg
	sb6fq1Y/BzrEnZB9/VLTRg33H/p/8JT1liw85vGQG8Shgf23PVAosiayIsGXhIq06Zme
	B7EIU5u9h922eSYzFRzFCd0pIm6MVfffPT9XesZAFI180WpFadkArlfEF17UkNibHsiw
	rv3TDuLfJrrTvXpI0n4rnNNI+ndspZtBv239WJ3NhCbkcoZInfTc9eh/+dYPAa14lL1l
	ERKA==
MIME-Version: 1.0
X-Received: by 10.236.129.36 with SMTP id g24mr11540492yhi.103.1392742467192; 
	Tue, 18 Feb 2014 08:54:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 18 Feb 2014 08:54:25 -0800 (PST)
In-Reply-To: <1392742198-23333-1-git-send-email-diego.sueiro@gmail.com>
References: <1392742198-23333-1-git-send-email-diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 13:54:25 -0300
X-Google-Sender-Auth: FwSBILkCeFv-_DMyFYYSlQUsTKI
Message-ID: <CAP9ODKoi31F4Pqbu0j4DPk=3LC5+NZkeNhTV+u8+XkkbU4ZuHA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain-qt[e]: add qt4[-embedded]-staticdev
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
X-List-Received-Date: Tue, 18 Feb 2014 16:54:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 18, 2014 at 1:49 PM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> libQtUiTools[E].a needs to be installed on toolchain.
> qt4[-embedded]-staticdev is the package which provides this library.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>

Please change the short description to have the packagegroup inc file
on it. And please expand the long description to explain /why/ you are
doing it. Don't need to use contracted strings in the long description
as it may be long as needed.


> ---
>  meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> index fc1ccba..b040182 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> +++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> @@ -33,4 +33,5 @@ RDEPENDS_${PN} += " \
>          libqt${QTLIBPREFIX}xmlpatterns4-dev \
>          libsqlite3-dev \
>          expat-dev \
> +        qt4${QTLIBPREFIX}-staticdev \
>          "
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

