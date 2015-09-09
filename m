Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5E2763CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 07:44:58 +0000 (UTC)
Received: by qgx61 with SMTP id 61so1114456qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 00:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JqaVPsWwCa9ANaHRJecPyxKM18eudjC1jtna2cmyUbo=;
	b=cSLz/Lamgyf3jVzK7Bi5JXrPcMLel6zNSOVrnZOAoDCMKG8ZpTCPesHKO6ecKp3luw
	jgukRcuIT9WxfaGBwgyjU1cc46K299F5JKM3YGR1RgLL128O7Y/f0uC27YECDFxGNokb
	hyjLsWzW9yVnvoXrODFY7/ORDB6f7iUSuVKo3DDbCU5IocxijJrrCQg1bAZhw0k8mZTo
	b7Kt37I1f5imLfOgKU/TLO1XjHmATRWHX7lmlLBLfNY+TVb0kZ35bCsOeqdtAK6y7JNF
	3vaOJtfmOAFH2xl8AGpQ249Oxgz3a1setfwH9EOy83K+P6Dh5wxTgSns1wFEUjVf78o2
	sB8g==
X-Gm-Message-State: ALoCoQkqLMbe5YhZT6oERAVLPFJI4tmf1plHK7sYpH4vcjquShL9uS0uB4jfgzuBSh4z+VcGksOy
X-Received: by 10.140.151.76 with SMTP id 73mr44088556qhx.61.1441784698735;
	Wed, 09 Sep 2015 00:44:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Wed, 9 Sep 2015 00:44:39 -0700 (PDT)
In-Reply-To: <c89abf81c424d620a687f0c7bda8f74fcc0f5faa.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
	<c89abf81c424d620a687f0c7bda8f74fcc0f5faa.1441753511.git.raj.khem@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 9 Sep 2015 09:44:39 +0200
Message-ID: <CAP71Wjw8W61iC_anLZCb2BFQxo0uxTRgKNnHpWYAJn-1xpizow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/16] xorg-driver: Fix logical && with bitwise and operation
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
X-List-Received-Date: Wed, 09 Sep 2015 07:45:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 1:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>  ...put_dpms-Replace-logical-with-bitwise-ope.patch | 31 ++++++++++++++++++++++
>  .../xorg-driver/xf86-video-omap_0.4.3.bb           |  2 ++
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
> new file mode 100644
> index 0000000..41e77d3
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
> @@ -0,0 +1,31 @@
> +From fc653ca3b36435aea281ae409fb90f85e1bc0d81 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 7 Sep 2015 08:44:13 +0000
> +Subject: [freedreno][PATCH] drmmode_output_dpms: Replace logical && with bitwise &
> + operation

why are you adding a patch sent to freedreno mailing list (so I would
assume against xf86-video-freedreno), in the xf86-video-omap recipe,
is that a typo?

