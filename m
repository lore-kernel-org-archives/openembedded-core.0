Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 822AD7CB3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 14:56:32 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id v20so13147013otk.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uluWSI6yipCel+22wbZbT2IcZQOBI7+YEXVO2YzLaGc=;
	b=nvr0BJErgAYE+O285COwn5pPt17PMkGDAyryVebmofGJnqUaW/WFTeoPnvoPmAAVPc
	VvmBLtAJCHCqCfP8SpqtVIzbpCl8HMaAWWjRJOCfdrdsnmFtc7TjJ8yRcE4u+p/17a/D
	FVYcLntf56j2Vs7swGWPriCUhyMvNrp7Wf4N1MiZHO2gTGBTOp+Cr+8JWlmaIicsOpsq
	r2oMAEIIAVcfnyD0gcOn2eRN4vSx7nyE5VcUZeoTNa1wygx552zaT6FRJOXpzWSTNLX2
	uCJDjULgzFDrM1okY5qK9O2ElvdLtSayXAkmlUjGEXOrp5x7TMy/cBc+xItCcey0SChy
	9V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uluWSI6yipCel+22wbZbT2IcZQOBI7+YEXVO2YzLaGc=;
	b=MPCLz2V8ojn1ItNUumFOuECGE4ZSCJoUprymV7gTn500PO/5yaLDuByoolUU09w5Tv
	8WkcdQQ7vLLi/3/fFrikJ3bYqq3wmcm5ojBlvHElx4gtE1yQRU4nlROFz4KZJ91CLU/l
	k5pkGNy8epz+WIPuCGsJ9TI+E8sltrbHGRf7CEs3uxeP8zwYEXl6+GclQZFLP1auR+bF
	7Stws9MhC0GzHgAtMefpfYKc1JyIiRKsPA1yKMomwMbT03cX4C0zHff2ORqbTgKWIldl
	JPXU4DCZf6iR6RnFVFElNVp6WJpnZbqIgMb30WLxz8Ozt/WzJvX13LZTpHjA7flbC6vO
	YenQ==
X-Gm-Message-State: AHQUAuZYArlE9R8bCBnuSChOg89rPVx0JRBuA2fh3uCoAq4bxzTxZr3z
	3xfaE1siMdoRy/ngj7VfnvLZSl06BTfW31aSmXU=
X-Google-Smtp-Source: AHgI3Ib1viFFzLqG511LoNUGOILMR0xH8DWgsPr1K/BHnm2HeYUgFQFo7HXO2fncDIsFH0BvpJfrX82cSS8t/yaekJo=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr24664527otl.12.1550760993379; 
	Thu, 21 Feb 2019 06:56:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550755109.git.tanuk@iki.fi>
In-Reply-To: <cover.1550755109.git.tanuk@iki.fi>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Feb 2019 15:56:21 +0100
Message-ID: <CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 14:56:32 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks! Will you be also sending an update to alsa-tools?

Alex

On Thu, 21 Feb 2019 at 14:34, Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> The following changes since commit f15ceac287c094abdeda64b03628455d92e0ce74:
>
>   libdrm: Upgrade 2.4.96 -> 2.4.97 (2019-02-20 21:22:28 +0000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib tanuk/updates
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates
>
>
> The alsa-tools update is missing, because the recipe upgrade deadline is
> near and the changes in alsa-tools look like a potential rabbit hole.
> I'll send the alsa-tools update separately when it's ready. The main
> change in alsa-tools is that the hwmixvolume program got ported from
> PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
> actually is using that program, it's not even built by default.
>
>
> Tanu Kaskinen (3):
>   alsa-lib: 1.1.6 -> 1.1.8
>   alsa-plugins: 1.1.6 -> 1.1.8
>   alsa-utils: 1.1.6 -> 1.1.8
>
>  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  4 +-
>  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 84 +++++++++++++++++--
>  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
>  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 10 +--
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
>  5 files changed, 85 insertions(+), 15 deletions(-)
>  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
>  rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (51%)
>  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
>  rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

