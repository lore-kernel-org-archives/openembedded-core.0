Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8AEB7FA11
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 00:59:07 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id o82so1093706vka.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 16:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZEjnzfOsllAztgLtzy7rod8OFZ3rhX4CTfEbuviO12o=;
	b=ub8ktjUL1l/y3fqqwdStINMVZ8PrUi7h2gE40+gsRmaE7aunNNN+LFRRkFbRLusoKm
	zWT9afBbXNjdiAJ8Cd64sgeM8VM05i5g1L/Xxh/5ziMyo9rDoJ8pz7tpQvW3cblRmb+V
	2BdZmb5J3VKkWUpo5ObNwOtoy3zMKl4B7H8r08/Cs9MKNXmZrXEul8xFi8ziAqqOzkIz
	uH6c0mZG+QvFtH/DcUteF9OHpkqC0ITV7fpzqTN0orZcF5x/u3kzJubP0JwK3AiJstTB
	8Pw/TXaRF0+HS3f+Y/A0Sl6HQzaC7GBnXs4H16IX27NKj/2Juhe9MNOOS/jd218x9F6V
	NZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZEjnzfOsllAztgLtzy7rod8OFZ3rhX4CTfEbuviO12o=;
	b=dtbycdjhnIGAUTPremvjf/mhIbnUk8j39f6e0du2yh69nPyaQW5pSGGs1xQ6kxmmak
	cxIHi32dpsrSzR17PN/UQQHMxzlyfacl8iibNp1uvcS+JQKYyKyFYEyxW2ZUMMbRvgR+
	z4hzabwZmFk2Xf/TTrHyqHrLO/J2YI1A+e7Anp5PdFRdGgMUdlXsGEU+1mKkpqxFSzbc
	icWp0sGuUUrliXTumFjTefyD5p/Km1pFJ53QUFAKzeIT3wSODrMIECD69ukBL7Kiu0aF
	UyJXG7TIczEMQyLikrUh9DR+OwMdrUR6rhI/7jp0hK5nbLMKanUHoMhmtpxTzgLDp7/o
	309w==
X-Gm-Message-State: APjAAAWH01s46dmeSWNuZ4zlYoMv6wL7y4yHaw+xtoa88VNdr8bTPvwj
	ZIcDybF+1AKwhAyiCvVupzD8L3HZRlk9RgjUnOo=
X-Google-Smtp-Source: APXvYqw+bkMrNU+XXFHJlGESWKZGj+d8mhlpffoSVDzOrggFwIuTk84upRlwlQFdYi/Y1LHLqKLIgbYqDYBzSCa0iOY=
X-Received: by 2002:ac5:c7b2:: with SMTP id d18mr3855449vkn.75.1573174748422; 
	Thu, 07 Nov 2019 16:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20191107204943.17467-1-obi@opendreambox.org>
	<20191107204943.17467-3-obi@opendreambox.org>
In-Reply-To: <20191107204943.17467-3-obi@opendreambox.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 7 Nov 2019 16:58:57 -0800
Message-ID: <CAJ86T=UNsGMLiLfkLcT_2nh=z9e4NzaJGfXbfj5+wSN1wuQ8tQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Add runtime dependency on new ldconfig package
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
X-List-Received-Date: Fri, 08 Nov 2019 00:59:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 7, 2019 at 12:55 PM Andreas Oberritter <obi@opendreambox.org> wrote:
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-core/systemd/systemd_243.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
> index 6e7f95693b..54fcc6a5d1 100644
> --- a/meta/recipes-core/systemd/systemd_243.bb
> +++ b/meta/recipes-core/systemd/systemd_243.bb
> @@ -139,7 +139,7 @@ PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
>  PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
>  PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
>  PACKAGECONFIG[kmod] = "-Dkmod=true,-Dkmod=false,kmod"
> -PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false"
> +PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"

Is this necessary? The implication of adding it is that you want to
support situations where ldconfig is disabled in DISTRO_FEATURES (ie
the new ldconfig package is not pulled in via a runtime dependency
from glibc) but then manually added to systemd PACKAGECONFIG (ie
ignoring DISTRO_FEATURES). That just seems like a misconfiguration and
not something we should try to support.

>  PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn"
>  PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
>  PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

