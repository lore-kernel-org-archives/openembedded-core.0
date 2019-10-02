Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 555457DFE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 13:21:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v8so19675461wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 06:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=r+u0/gYRXKiswlhq0iWMYt1QK/3YWmUOWv4m2ezpaTI=;
	b=P+/A28Jn6dpmK18GLbmG1l8kC1PawbWVfQbwdl3ENMolrnElYQVakltan0evwq691M
	Lf9ma0MRsHrOxrMNmh7oV+R2vSRAhSypzYt+NyEk8bwr5s80X9LFnu/mRi/Ex7/KpG39
	NcNht7Zudqju4BFipSjuaWPtGX21vo5HcidJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=r+u0/gYRXKiswlhq0iWMYt1QK/3YWmUOWv4m2ezpaTI=;
	b=QbbYdWxowdyV/z5VdeiNGkyGwU5qBrgFd1MuP/3aqx7Wwa58UDLMWfmdkdCsLnUDgJ
	+JjlPd3Vp4+YWYyKNQMIi54vYByQ5SFGlYfP1fG0os3/CARyO1oCn2kSqshmfkcGVBdT
	UI8DAgx8x9JpXDKP29Z7TkzHZKuh7yY/KNe+RJQK5kAl7Vuh1CwOewj5JD0yweQIhRdJ
	t/ubfkByQKGeDWVWfvdI8UKXC3AJkeBfxnpVK4/n6u02tDSHKMYtKDC0xl7Fhdnv4IMs
	uI6s/1+PCuIcV1HCi2ws0XV2O85pHVSiw8OZfBDPp84/RetpKIHFwjG3syH13aK0FJHi
	xp8w==
X-Gm-Message-State: APjAAAUuvvLVh9Wocd/AFWSRYM9oiLzdASKYd8GE3a+M1y8wXKxzO4Y4
	8FjrfPW8Hdk6nzVfkj4a5MAKIg==
X-Google-Smtp-Source: APXvYqwn/pz4ccj5CEwBeJeEx6NvPV5GdEtcbHzpsA8Rrx99hs8yz1vWOaSUcMHjc5iZ+B0U3iwuDQ==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr2849941wrs.109.1570022512950; 
	Wed, 02 Oct 2019 06:21:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j1sm41843991wrg.24.2019.10.02.06.21.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 06:21:52 -0700 (PDT)
Message-ID: <279cb31b6c743596e9c7b19e613575f51a3b534c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 02 Oct 2019 14:21:51 +0100
In-Reply-To: <20190930213721.3320280-1-raj.khem@gmail.com>
References: <20190930213721.3320280-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] layer.conf: Add xserver-nodm-init to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Wed, 02 Oct 2019 13:21:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-09-30 at 14:37 -0700, Khem Raj wrote:
> Found signature differences when same machine is used as a copy
> see
> 
> ERROR: xscreensaver different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> Hash for dependent task x11-common/xserver-nodm-
> init_3.0.bb:do_packagedata changed from
> de0944d4fcaeed0efdb143a18cc406bd043469ae291de1704a999bc878a7691c to
> ba7bdaf35860ba5bf5a5f4ce06379a77c88eb9806e09a1fc5373933888a46507
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 27893b633e..a13c8dc9b2 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -44,6 +44,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    opkg-utils \
>    gstreamer1.0-meta-base \
>    ca-certificates \
> +  xserver-nodm-init \
>  "
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \

This seems odd, why is xscreensaver depending on xserver-nodm-init?

Cheers,

Richard


