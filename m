Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AEF7260234
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 01:22:47 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id b79so11644569pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 18:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V7LYbZz6hYfkiTrc9432lPgJNDQz/OXk9MTLbFR0A2M=;
	b=TQxViZ2Sta1aS7TxxILXX0wWLQivCtsVvxlLFPBJ131nIpA0Tksu7PeVOmsqKLg5wv
	GNGrnzaAjI191HlqulGD0PvFmnyoXxkL600hQXDQhmOnWGJ+TwfAec5MoFWDKrzev1cp
	1nAKAkuoxB3XgCBwGbjPazNrRh/koGcUhhsje3ez9W2kuAWcMtufXjvllCAOavj3IdMJ
	gqihhFSQI0EvqL7hjVbtVgRrbIJEyZQbgtbg1yBH1+/lKRshZCCZAsedoxEcAP9H0M57
	iAvgEIbtI80xjgKs2BrpWJLtBQLplX1wLX/fMZIJTYyei0k1HJJqb/+CBC1q12vjkaRI
	PMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V7LYbZz6hYfkiTrc9432lPgJNDQz/OXk9MTLbFR0A2M=;
	b=bqgXounp6X9/JLYTepzabDN/lE3yYbHLgfBKI5boSpn3ycdXJMhi3a7pJMr8d57TLF
	fM7HbykX454aZkKuYXULQPH5/5mxVJwAdR3vAIyQjsmvdjyrOchuBC44HEjt7doPpKUm
	gL8+3cOAyRGQ3g3K07tVozTMPKWGTWZGwQeHeN7m6Rd/DV4gFFyu5WhWeNTbvx6hENDY
	PHbV/leEW/ip1g1LgmKGx4C66EhJJwqWLUfBaY5I2lpiKlAI5VAvebneQxWt7xJPEJbY
	n7XwAFdhV4Qn7R3PtsESpeP3eJLKkC5cNnncVTSQuEEKmr7xsLS+oG/fyzsU1OdpdGk2
	C5ng==
X-Gm-Message-State: AMCzsaUdIY5YpDl/V5YGV3ol7myw8Xi9BkQjWxnt1unuC2LnuJd5W7JQ
	YuHCnpzx2o6pwaAPyXMX19v7AXXSWxS06gbbugc=
X-Google-Smtp-Source: AOwi7QCykV75zGMuE9EpESRSjT/K8WM7uyiaIQu3+j4Qfmh0A9OfuFIWFRQJPfEHU84KWtUcY7/Naj6ehLXBa5ObNEM=
X-Received: by 10.84.240.12 with SMTP id y12mr2922601plk.215.1507944168588;
	Fri, 13 Oct 2017 18:22:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 13 Oct 2017 18:22:18 -0700 (PDT)
In-Reply-To: <1507922729-17240-2-git-send-email-pbarker@toganlabs.com>
References: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
	<1507922729-17240-2-git-send-email-pbarker@toganlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2017 18:22:18 -0700
Message-ID: <CAMKF1sqZrYbJ6MgLdQ5gJ=ZZhx1Gn=uYUD-_3S__E8OiDrLXiw@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] goarch.bbclass: Define HOST_GO386 and TARGET_GO386
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
X-List-Received-Date: Sat, 14 Oct 2017 01:22:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 12:25 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> These variables are used to control the floating-point instructions emitted by
> the go compiler for x86 architectures.
>
> The default is '387' which disables the use of sse/sse2 instructions and is safe
> to use on all x86 processors from the i486 onwards.
>
> If TUNE_FEATURES contains a feature set which is known to support sse/sse2
> instructions then they are set to 'sse2' to enable the use of these
> instructions. This is suitable for most processors from Pentium 4 onwards.
>
> Only the 'core2' and 'corei7' TUNE_FEATURES are defined in the oe-core layer and
> are known to support ss2 instructions. Other layers may introduce additional
> tunings which support sse2 instructions and for these layers, TARGET_GO386
> or go_map_386 should be overridden as needed.
>
> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> ---
>  meta/classes/goarch.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 659b26a..653f035 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -4,10 +4,12 @@ BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
>  HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
>  HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
>  HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
> +HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
>  HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
>  TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
>  TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
>  TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
> +TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
>  TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
>  GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
>
> @@ -66,6 +68,15 @@ def go_map_arm(a, f, d):
>              return '5'
>      return ''
>
> +def go_map_386(a, f, d):
> +    import re
> +    if re.match('i.86', a):
> +        if ('core2' in f) or ('corei7' in f):
> +            return 'sse2'
> +        else:
> +            return '387'
> +    return ''
> +


This is too conservative IMO, e.g. anything above i586 is able to handle sse2
with this patch i686 will use x87 for FPU,

>  def go_map_os(o, d):
>      if o.startswith('linux'):
>          return 'linux'
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

