Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4D728609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 08:57:47 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id i138so14510323oig.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 00:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rBisK3YsKJl9TuFhhpV7CsaZ3eZhvQy2DOMBCwMWOls=;
	b=WQjN5bQ1A/f5ZTInSfgeSdW1FYoL7dgmT5NF9CivkrbiryGMyrkJcOVfO5vie10PZ8
	nv1dq1ZN3jsSNzkjm6lVcHE2hH7SU/sqW315hzyy+F9dyvF8zHHvHEGW+9drS0c45KXY
	sZYAzC6WP9C4SP0Ys/ogCaUaDT9NdkEHgyvh8AYTASbbee3fIS/Slvuvx1keZksrjA/r
	i70qqKU5Nj6kJ6AFyTYpXtcbsY5GHkVDkutWn/BvSo+aAvTcRBOJ3N+fNhkjhDheYWlD
	sE77nSTEdGmvsgcxE/egu3yuOIo27lfjzw0n/uLN1mG01l1ntaXZOkbYFhg2rXf0UVu9
	Auzg==
X-Gm-Message-State: ALoCoQkJK9hFuO7C8j6hrfWkVw+pufKy1FJYnJWo2CVVq5ZfRN7ijn9LqxLSGK3ifR2SvECCnW9b
X-Received: by 10.60.33.197 with SMTP id t5mr18568276oei.74.1423645067988;
	Wed, 11 Feb 2015 00:57:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.161 with HTTP; Wed, 11 Feb 2015 00:57:27 -0800 (PST)
In-Reply-To: <1423538626-17248-1-git-send-email-armccurdy@gmail.com>
References: <1423538626-17248-1-git-send-email-armccurdy@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 11 Feb 2015 16:57:27 +0800
Message-ID: <CAP71WjxHc_z0b3tnY1TLkhsKnE8512GGgovvQZMP6w57UtfpgQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: update 10.4.3 -> 10.4.4
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
X-List-Received-Date: Wed, 11 Feb 2015 08:57:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 10, 2015 at 11:23 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-graphics/mesa/{mesa-gl_10.4.3.bb => mesa-gl_10.4.4.bb} | 0
>  meta/recipes-graphics/mesa/{mesa_10.4.3.bb => mesa_10.4.4.bb}       | 4 ++--
>  meta/recipes-graphics/mesa/mesa_git.bb                              | 6 ++----
>  3 files changed, 4 insertions(+), 6 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_10.4.3.bb => mesa-gl_10.4.4.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_10.4.3.bb => mesa_10.4.4.bb} (78%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.4.3.bb b/meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_10.4.3.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_10.4.3.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> similarity index 78%
> rename from meta/recipes-graphics/mesa/mesa_10.4.3.bb
> rename to meta/recipes-graphics/mesa/mesa_10.4.4.bb
> index 9669bcb..8140411 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.4.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb


looks good to me. tested on Snapdragon 600, with freedreno mesa/gallium.

