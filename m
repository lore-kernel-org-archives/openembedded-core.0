Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5A76FF78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 21:48:08 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id q126so137795873iof.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 13:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4gkjnWSAG033ms+tZ8eeDpzUY9vWfAh3w1eG/t6t+As=;
	b=psX6312QSQViDgPgZHOC/VofoFJlBcZ8brGzNt2nAIjWudyfarF1xpuC9O+loJTVBD
	5lFp5rS34IWFKrslZljli9+7gFL58qy+ZVS1vGPCumTRliRW020m5aPyHMgjTVFkBnDt
	F0QCBZKlThsDp6YBFBTW071DWpYWSQl75XMLlBNtSYs/xr/L8ERDkTLuEZBSpCbo3dxq
	RH1T39zuSQffv0Tgx7HWOn98Dg2WmO22swLhmpwub9397Cr75JPKfDChQZdD8rx3wTOs
	5FW3A1QfzGrXFRi8jPJuAGq9uh/f1/Qseo318fIiDR0kQTW1TSY4Hf006liFi89onDDs
	8tjA==
X-Received: by 10.107.4.213 with SMTP id 204mr18295293ioe.195.1450648088775;
	Sun, 20 Dec 2015 13:48:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sun, 20 Dec 2015 13:47:39 -0800 (PST)
In-Reply-To: <1450629643-19659-1-git-send-email-liu.ming50@gmail.com>
References: <1450629643-19659-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Dec 2015 13:47:39 -0800
Message-ID: <CAMKF1soGKHFqC0+qxvZT4+B-ng9sfmMSyRJ-S4cBPvCs+SN1BQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] ncurses: fixes wrong paths in BINCONFIG
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
X-List-Received-Date: Sun, 20 Dec 2015 21:48:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 20, 2015 at 8:40 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> * Removes ncurses-config from BINCONFIG, that file does not exist at all.
> * Adds in ncurses5-config and ncursesw5-config to BINCONFIG.
>
> This fixed following warnings during SDK install:
>   warning: Removing ncurses-dev-5.9-r15.1@lib32_x86 due to file /usr/bin/ncurses5-config conflicting with ncurses-dev-5.9-r15.1@core2_64
>   warning: Removing ncurses-dev-5.9-r15.1@lib32_x86 due to file /usr/bin/ncursesw5-config conflicting with ncurses-dev-5.9-r15.1@core2_64

This patch moved it to PN instead of PN-dev, now I wonder what happens
if you were to install PN and lib32-PN packages, I guess you might
have same problem


>
> [YOCTO #8801]
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 8bfe133..27815b8 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -8,7 +8,7 @@ DEPENDS = "ncurses-native"
>  DEPENDS_class-native = ""
>  INC_PR = "r15"
>
> -BINCONFIG = "${bindir}/ncurses-config"
> +BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config"
>
>  inherit autotools binconfig-disabled multilib_header pkgconfig
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

