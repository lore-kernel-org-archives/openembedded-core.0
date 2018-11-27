Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 734646C5C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 19:53:08 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 40so21293127oth.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=Cdi5OueTG4AgrFk/76nHPHnLT8Ihg6Zj9iXz0FSY+iI=;
	b=kWg7zLd+9XG5l6Or2apoSAsXNVGSA9XtxnGP+asAWlz1El084co8ChV13vbmFN8Fsm
	PZ1uS4Ybadjc78iiTF0hHuoCrpHmqm9R5JP6olcqBz53wP4g+NFDqzPccgQ3nLae/B0m
	V/K5T6knf1NQuPYgEPu8JJxiDqA/YdZ1lG5mc0LpEGi+xGuix7fWu6d+E8oUoe8oKH+2
	ZQ1fwlUMcQPpkT2b+ZG4+BTDEYkXlaBuYCLxJqFBGfvpiOF7XlqhjyR9/ghB+EvBtjqH
	3ITa46nV2JNBOFOuHephE/LWjsO9qG5hYYTQp3cxGq9SXRdbFuh3k2d84NwlBTQ9eud1
	RMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=Cdi5OueTG4AgrFk/76nHPHnLT8Ihg6Zj9iXz0FSY+iI=;
	b=NvP2Ig7AKVaRt3G6SCN0vimJAhQaG3f9F4PXj5HJQXlyiOy+tKC5dojbR+r/44Jrvp
	ZipfemjTbE4duMr2WbxSWvmlbHa0lBZhf4XmvTKcuEmvAPILToSAJkyyrPMdf8Zj1WsL
	B1BhZkIBKG6qVfR+WYt1rbroWx780VLmvut7JCqubLx0tGg499gq2X7FC7prOOZ4xuSe
	b3fnWcU9gpLfaTgonT0v/tBAsMOXor5n03TSh4eDyT1f+JbQS1uLc24xgmtHYiml3Coy
	PjFjSaPizaNbHNTGiaCeRdNgyuDSezkT5we8ZFdS9kqWcJvdxzbCp+94k1d7CNTFMnNs
	UC7A==
X-Gm-Message-State: AA+aEWY6XByznvqLXBZX1igyBASPXEW828DniS96NYx362P1tokTrXAK
	A5YUpuAOrqIwZbHo87UCoCsRdSjvwBmO/A==
X-Google-Smtp-Source: AFSGD/WIHMoNlZDFRDyHMTg5E9TtEO1iXbCJXY8bmoupMj055x63ZWy57UottS3ya+sjVPAjrALqJQ==
X-Received: by 2002:a9d:3d0:: with SMTP id f74mr18039399otf.52.1543348388390; 
	Tue, 27 Nov 2018 11:53:08 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
	[209.85.210.50])
	by smtp.gmail.com with ESMTPSA id m1sm1377656otq.9.2018.11.27.11.53.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 11:53:07 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f50.google.com with SMTP id t5so21351541otk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:53:07 -0800 (PST)
X-Received: by 2002:a9d:5e0b:: with SMTP id d11mr17639689oti.145.1543348386523;
	Tue, 27 Nov 2018 11:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20181127191255.39052-1-abrodkin@synopsys.com>
	<CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
In-Reply-To: <CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
Date: Tue, 27 Nov 2018 17:52:54 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
Message-ID: <CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-tools: Improve build preparation
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
X-List-Received-Date: Tue, 27 Nov 2018 19:53:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 27, 2018 at 5:30 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
>
> On Tue, Nov 27, 2018 at 5:13 PM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
> > Even though we're not going to build here real U-Boot binary
> > it is still required to "configure" U-Boot to get get to the
> > tools building.
> >
> > We used to use "sandbox_defconfig" for that purpose but
> > since U-Boot v2018.11 it started to cause problems [1] due to [2].
> >
> > So to have less dependencies let's create super minimalistic
> > configuration which is good enough to allow us to run "make tools".
> >
> > [1] http://errors.yoctoproject.org/Errors/Details/202185/
> > [2] http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea
> >
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>
> To allow extended use, we need to enable CONFIG_FIT_SIGNATURE
> otherwise we won't have the support.
>
> See:
>
> # MXSImage needs LibSSL
> ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_ARMADA_38X)$(CONFIG_ARMADA_39X)$(CONFIG_FIT_SIGNATURE),)
> HOSTLOADLIBES_mkimage += \
>         $(shell pkg-config --libs libssl libcrypto 2> /dev/null ||
> echo "-lssl -lcrypto")
>
> If you do that, we can likely rely on this and avoid some extra tools
> packages (for example on meta-freescale).

Looking at this, I am wondering if folowing wouldn't be a generic
solution capable of upstreaming:

diff --git a/configs/nativetools_defconfig b/configs/nativetools_defconfig
new file mode 100644
index 0000000000..be69bdf43a
--- /dev/null
+++ b/configs/nativetools_defconfig
@@ -0,0 +1,3 @@
+CONFIG_SYS_TEXT_BASE=0
+CONFIG_FIT=y
+CONFIG_FIT_SIGNATURE=y
diff --git a/tools/Makefile b/tools/Makefile
index 3c0521f655..e916d0cebb 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -124,7 +124,7 @@ fit_info-objs   := $(dumpimage-mkimage-objs) fit_info.o
 fit_check_sign-objs   := $(dumpimage-mkimage-objs) fit_check_sign.o
 file2include-objs := file2include.o

-ifneq ($(CONFIG_MX23)$(CONFIG_MX28),)
+ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
 # Add CONFIG_MXS into host CFLAGS, so we can check whether or not register
 # the mxsimage support within tools/mxsimage.c .
 HOSTCFLAGS_mxsimage.o += -DCONFIG_MXS


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

