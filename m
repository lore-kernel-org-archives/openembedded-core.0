Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC0B4719E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 14:13:34 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 2so5057961vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c+07JDMUZL7oLMxWT1Py3cl8Qie1kwWh7LBSYm7qXF0=;
	b=gfjMggAALlu1Q8sOvHrVZiJ4048C/j3bQiHv5aPje2KLTd47LDU/8oGuYQw11IyzO2
	DEclSNSz4M/ZFgbYU4eXSpVJBqkU7sEuRPYP49tOZk007uAMAS898hKnTm5b4liictgA
	dxqgkJcyO1f7L4XopZOu6JmnOaW09IGoXtEElDBJ7TxZKhy1HpIx1dLe3xz60GEZU8xz
	GYQk6vFB8yI/Y0ppo6GqHXZ/7M2GWJj9hMFFldLc4HEgoERHAS6cVI/8RdLH2rbo9yRJ
	YbYxjwXsdDmRjJ2YkW8QF45XnMfeKsd/2mtwA6P67l6mRpfyu1I6/hlEel21u5phL1u7
	GRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c+07JDMUZL7oLMxWT1Py3cl8Qie1kwWh7LBSYm7qXF0=;
	b=l0wLD6ZZp/TaX60zdo02tGYVXCMCM199h7KyijDttfDjzJEaMwKBf4OBWBU3E9IV6U
	IP5xngsDIBM6jlCbdsIhMzg8XYzrAsylqjtS4J1oaIsLWgfE4/67WeWHT8dvLP2uvEiX
	qCbdzgcnikEusghaeWk0hQ5mLBzhCY6gso9sXR/Al1lu9BTop1U0JtTUfQIKuvaOCdR6
	6wZjZuadQw49nhCXFppUj2wMXUWwacMJkai+MF85Rk6aVone7eOOa7gyD48Txw2TWerw
	BCZ+xxbpuKSXzcVM7wkAxmgI2KNGlYFbOpVNlNp1GP/YbumzDS2da+NImKJPgCjv7bjr
	mtOQ==
X-Gm-Message-State: AA6/9RnC7z7Bc4vgs6g0B1oqoM/k6Q0tF1mBVPYDYify5F8Is2kvBT8+LxVwZnpOpDgwSDfv+4oEPMoKvieF9w==
X-Received: by 10.31.0.67 with SMTP id 64mr8773209vka.173.1476454415373; Fri,
	14 Oct 2016 07:13:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Fri, 14 Oct 2016 07:13:04 -0700 (PDT)
In-Reply-To: <1476451269-11260-1-git-send-email-amarnath.valluri@intel.com>
References: <1476451269-11260-1-git-send-email-amarnath.valluri@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2016 16:13:04 +0200
Message-ID: <CAMKF1soK1czJxYNo2H=gQsk2SvvvYexL9DSa7p+Yz8Yw3FL+zQ@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glmark2: Enabling c++ 11 features
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
X-List-Received-Date: Fri, 14 Oct 2016 14:13:39 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 14, 2016 at 3:21 PM, Amarnath Valluri
<amarnath.valluri@intel.com> wrote:
> The failure was:
> | ../src/image-reader.cpp: In member function 'bool PNGReader::init(const
> string&)':
> | ../src/image-reader.cpp:123:16: error: 'unique_ptr' in namespace 'std' does
> not name a template type
>
> This change enables c++11 features, as code useing them.
>
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> index 396ae70..4cb233b 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -28,6 +28,9 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
>                    drm-gl drm-gles2"
>
> +# Enable C++11 features
> +CXXFLAGS += "--std=c++11"

gcc6 now defaults to  -std=gnu++14,so I have couple of  questions here

 Are you pinning it to c++11 because it doesnt compile with c++14 ? or
is it because package is explicitly overrding the std option. In latter case
perhaps its better to patch the package and also submit it upstream


> +
>  PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
>  PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
>  PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm"
> --
> 2.7.4
>
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

