Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3647198A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 12:36:07 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u185so6731769wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tsf/wJPFPqjZ/I8qoz8p0uw2RoWcKAgfNV693QYz+0s=;
	b=K85wDohVVa1dPYiJhXwmBmcXIFUmnWVvIkuApUvM5K6iZeTMQ7TEDMZT3w1kcQdWtW
	/wh0MEGnssb26iOTUB42OTNWrGD6Vkuj1eBuLXuQIpm9/Zj0G+uVThMg8Ws7D9/vtutv
	8U3Xd3Ryt8dttVDVdzGZqwiZbreDixwPI8hQYkE7w4X1NQdIYiNAA+dH9h4dNDxZgqGr
	7IaXAKiK077Jjq4dtgVl5sGdstRJq5nlgizl1XsZPDSGue+yMgsf2vggC5xHzv+5iPIz
	Mtt8tXG13Z4Fyfe0fTs7lHBgJCOWGfYsTpjTYQ68dzoGo70MQOMO8yRN4J08ireY1DQ/
	k/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tsf/wJPFPqjZ/I8qoz8p0uw2RoWcKAgfNV693QYz+0s=;
	b=r/5HpQ2wNE9lQ6lsCzUhpTAupjtWHuk8zc9N2VJ7y4LadM6o1aedtKDTQSTMZBaiMH
	F7zpA8XATJMeiLmZ96NUi8gNY9kWhIuU1BkxTM3adJN1ANFjkw5p6y9L/myk/hTM4pRi
	cvTN0BMEYkXYO+AUnrSW2jGVS6JUZTR6F4AlElD2S1aHsZGIyxsaa3wLnxxuUiYQBj4A
	r3NLtA5U3fyldUGahAuUOTEvKslUF5jB/n6l0zJvHEIB8nZhq2Vt1OCf/y1I9g+7746W
	lnt8ds+7W4NSF8NUViNAq2dD5Q5v9/XxbYqT6yyCpCL5U25jk2yNMm+UtopFqqMyNSlD
	RvDA==
X-Gm-Message-State: AKS2vOwXRShk5pzwyJqwlAdxlVHvl+V7tq2I+x5m/XTMXUcLYaGVDdRK
	ocunTbuCaRDoH0bm8kkmS8hh6KM8Fg==
X-Received: by 10.80.160.231 with SMTP id 94mr20701610edo.173.1497962169071;
	Tue, 20 Jun 2017 05:36:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.172.100 with HTTP; Tue, 20 Jun 2017 05:36:08 -0700 (PDT)
In-Reply-To: <1497901004-140599-2-git-send-email-yin.thong.choong@intel.com>
References: <1497901004-140599-1-git-send-email-yin.thong.choong@intel.com>
	<1497901004-140599-2-git-send-email-yin.thong.choong@intel.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 20 Jun 2017 14:36:08 +0200
Message-ID: <CAAQYJAtfYB4m9QJj1KsJHE52=Q5WUx-hT3mfXeLY4yv0ZCgDZg@mail.gmail.com>
To: "Choong, Yin Thong" <yin.thong.choong@intel.com>
Cc: otc-pg-team@eclists.intel.com, "Eggleton, Paul" <paul.eggleton@intel.com>,
	"Wold, Saul" <saul.wold@intel.com>, core-dev@eclists.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] image_types.bbclass: Prompt error message on missing setting in UBI and UBIFS
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
X-List-Received-Date: Tue, 20 Jun 2017 12:36:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 19, 2017 at 9:36 PM,  <yin.thong.choong@intel.com> wrote:
> From: Choong YinThong <yin.thong.choong@intel.com>
>
> Prompt error message to guide user add argument
> MKUBIFS_ARGS and UBINIZE_ARGS in local.conf on
> every UBI and UBIFS image creation.
>
> [YOCTO #11589]
>
> Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
> ---
>  meta/classes/image_types.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 7749b00..48338ac 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -145,6 +145,14 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
>  multiubi_mkfs() {
>         local mkubifs_args="$1"
>         local ubinize_args="$2"
> +
> +        # Added prompt error message for ubi and ubifs image creation.
> +        if [ -z "$mkubifs_args"] || [ -z "$ubinize_args" ]; then
> +            bberror "MKUBIFS_ARGS and UBINIZE_ARGS argument have to set in local.conf for UBI and UBIFS image creation."

Why in local.conf ? It is not globally valid if you do multi-machine builds.
I'd say the right place is the machine.conf in the BSP layer.

Andrea

> +            bberror "Detail please visit this link http://www.linux-mtd.infradead.org/faq/ubifs.html"
> +            return
> +        fi
> +
>         if [ -z "$3" ]; then
>                 local vname=""
>         else
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

