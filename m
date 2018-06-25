Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id F22B774F09
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:43:41 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 14-v6so11871840oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KPhbEyTHERei+Q/p9aX6zBkoeq+Fpz+gXdpNpHCWte0=;
	b=JfaZOx0ZVL17CgpoC9MOnWd0HccDQE+cLelHVmc7J2EVHe2ZvYDM2ppuaAgftSumWb
	IJ0sRY29P47j2DU+ldlOB0LKZe40mWBB4AgnQNGJG9W9YhHLaX0qRNdlAILJRF5TkkEc
	+YfY1jdhwbL3qjjh7GHnMSFYszjfkoIIZRVQu3PHMludnHwA/Gdvb4wE5w1jc9TTpWw7
	oLeToRanTtBjw91OC8WNA35fQ+K4/zsK+MijToUx91IyUr0T2v8FF7UzPp9pDpbd4va0
	ACoPzW3U817v1nnwnuNovXVLEFsFN1EtgL44TQ75l1yN17ws7rbkNZKZxhxdjSWYaVZ+
	7ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KPhbEyTHERei+Q/p9aX6zBkoeq+Fpz+gXdpNpHCWte0=;
	b=rS1mywD7pjrGos0AK/jmQC46j/RdFPOdI+ThLTDCCOsq6A+JQ37bvGPt2gTjfM441p
	Q7maymfyeTWWg0nZ3jUepkG1s3PIDP6tpnJunrNdP8REPM2O3OvgcUndWp8jXJF8GAmI
	grUMAQIPi6KBDi8nKgPoHxuuhcBSytv2dduiRWP1nPZfrEGL/hv+5NvZ5RVEwsedOv5o
	c16E0yw+YAZlTjM5/Qn0wjc+VrL4yvRkAtDtj3rpDthz2JLp6lqtFBkkE6IZR3E2KvhU
	IITvp+30J9e5fc1nSHCWvJYU1jClwRN6wefHLX3e+wZtZ9f25X5P2FM+frOAvQC2xQFN
	8EVA==
X-Gm-Message-State: APt69E3sVZUPbFMRWytawErtPHwtRRq0a2e2UmaC29N9VS4nQICBPxEI
	jhB7BsJHfYvvVcbcY5rqAdfOUw149LFtQgR6ov5nug==
X-Google-Smtp-Source: ADUXVKI5sOZVj8Y6tB4EYBCFMXS7MbEqrjtUk/g3t1ynK5q8auT2dGDtcyh7Lwlbh+pL44u+zpY+durGMPPAFNdXQb0=
X-Received: by 2002:aca:ef8b:: with SMTP id
	n133-v6mr6953358oih.70.1529919822946; 
	Mon, 25 Jun 2018 02:43:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 02:43:22
	-0700 (PDT)
In-Reply-To: <1529783581-46179-7-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-7-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jun 2018 10:43:22 +0100
Message-ID: <CAJTo0LaTFH59fz_Mr+FPrMNnZY5+AG1aw7xOMH9bzRQPqw3vfQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8][PATCH v2] update-rc.d: Add nativesdk
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
X-List-Received-Date: Mon, 25 Jun 2018 09:43:42 -0000
Content-Type: text/plain; charset="UTF-8"

As update-rcd is for managing init scripts, and init scripts make no
sense in a nativesdk environment, it would probably be best if the
update-rc.d class only added these dependencies for target packages.

Ross

On 23 June 2018 at 20:52, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> Add nativesdk for update-rc.d.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-core/update-rc.d/update-rc.d_0.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> index 76d4312..d3d3e2f 100644
> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> @@ -30,4 +30,4 @@ do_install() {
>         install -m 0755 ${S}/update-rc.d ${D}${sbindir}/update-rc.d
>  }
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

