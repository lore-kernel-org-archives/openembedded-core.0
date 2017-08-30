Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C5FA871ABD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 09:39:57 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id p14so16952132wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=E7TvrngkFgbppyaW4saOseOUlA9ywU4wTkI1+90Ny4g=;
	b=oKm5YQzkS9QdKa8ME2hr5sC6RuYvUoHK2I7maFMAOq3kmZQioOd3LmDwDGUVeZaWV9
	ldUsdWsgA383V0BkOM8Xy99Rt6zZfzpH/Ca2Hu0yLG4EV4F6qblZ4JI7V78zdVBsuEEL
	5sGRUJkUN0EFObbiJuSOd1jn11IlUnbeezb7Cv+lfwE3zS1tgP9nro8rmPejbvA8tRQf
	rQ3KG98bIrsW8uJAkNJFLpTz5PBBR9ogB8qh97E7l0k6JtcXp3UWNAxpbICgYi3qZbbW
	L0yfiC50A40iFJANbXLTpuZzhWYu/DVy4botwaqxExwz3Am2tlYID2W03h/IfFthublN
	zyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=E7TvrngkFgbppyaW4saOseOUlA9ywU4wTkI1+90Ny4g=;
	b=RDOdgW/cpmMA31w+TsBTmCOGQayhwqdx1CPaD1cGtaX6U22g5vJfSA926bmyReOjAW
	xlYCQZU+phebs4w3L+fArjowfpP+nuCFyp535lCxZRGO4722w9/IGkp8oZGq9wSokSjM
	Y/4lhYC0z/3SIM1u6Fv47GH8SEkNkYQyhcDLUijAciqjMe9ztvPu3ML61H3lhZGbV4+Y
	m9bR9Hvtwm2aVPrFOB6FksqMVrCm3iCOHccXiR+/q7zU+4OxG3DcjeI+1eL5PiwD7ACl
	IVuQnyKJnruGp9AN30+p4FVY6/hb23FTkXIANbYGQR86+ZO9Kw45S2eNBYWSt6dRrelF
	AoCg==
X-Gm-Message-State: AHYfb5iZ5DatMwrYmfyXHV/aVsQuBdSVW5tPD8WsRqeTr+A4WSV1m6up
	CLwPxMUQEL53z2STwiQ=
X-Received: by 10.223.164.131 with SMTP id g3mr638909wrb.121.1504085998356;
	Wed, 30 Aug 2017 02:39:58 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EE7A.dip0.t-ipconnect.de. [93.232.238.122])
	by smtp.gmail.com with ESMTPSA id r2sm2139992wmg.30.2017.08.30.02.39.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Aug 2017 02:39:57 -0700 (PDT)
Message-ID: <1504085996.12799.39.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Aug 2017 11:39:56 +0200
In-Reply-To: <20170829204309.16139-1-otavio@ossystems.com.br>
References: <20170829204309.16139-1-otavio@ossystems.com.br>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Wed, 30 Aug 2017 09:39:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-29 at 17:43 -0300, Otavio Salvador wrote:
> There is no COMPATIBLE_HOST in the recipe neither it makes sense for
> this to be machine specific.
> 
> Possibly, initramfs-framework's based modules may be machine specific
> but if there is the case they can just RDEPENDS on
> initramfs-framework-base and provide the specific module as another
> recipe.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
> Changes in v4:
> - Drop INHIBIT_DEFAULT_DEPS as allarch defines it
> 
> Changes in v3:
> - Add the new dependencies to the hash whitelist

As I said before ("Re: [OE-core] [PATCH v6 1/1] initramfs-framework:
module to support boot live image" from July 31st), I consider it a
mistake that support for live boot with all its dependencies was added
directly to initramfs-framework.bb.

I was in a hurry at the time and therefore didn't file a bug, but I can
also do that.

> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 38bec33197..04aa730160 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -50,8 +50,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    docbook-xsl-stylesheets->perl \
>    ca-certificates->openssl \
>    initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
> -  initramfs-framework->systemd \
> +  initramfs-framework->dosfstools \
> +  initramfs-framework->e2fsprogs \
>    initramfs-framework->eudev \
> +  initramfs-framework->parted \
> +  initramfs-framework->systemd \
> +  initramfs-framework->util-linux \

Let's not dig us deeper into this hole and instead split out the live
boot module into its own, arch-specific recipe.

Then initramfs-framework can become allarch without having to make
layer.conf more complicated.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



