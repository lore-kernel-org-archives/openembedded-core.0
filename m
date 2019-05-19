Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9FE7D68C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 04:48:32 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h17so5187313pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 21:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=U0ZTqEavTkEmo2MlRcjl7ZThjmncSFzgdrW0VNZ48hw=;
	b=F5Qaj0QvGFPWAOKGKUdTTkoLJGrLFRFvXEGT6ai6F0BOD5UMriNoN1qoJR2MFuBFaA
	AKbhaO5NWdZp+U/mqAQsJd7wP2VrXeR+W43hAeFx7L8NToae/XjB65j511DcOA1fCKvU
	dTLDl8Tmq6hJNEvwbJNVSAJQost2ZQBOlYO+YumcjvJadJuDfNZOwtvu8fIA2jpuz+WG
	rf51QOrJkmQy/tMZmbZko3/rDoB8c2Pds6Vwj/XsicdYGHidsciurXEvEjGj17w6bW8I
	N85BF0WorNCmJZIPJ3wm7zNlZ3Lx4dxpP7j+zSC9Yc5cXzNVmec098J0ak0675/t+d4q
	P/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=U0ZTqEavTkEmo2MlRcjl7ZThjmncSFzgdrW0VNZ48hw=;
	b=fJNqlBc5fZMTmF2clqbhVnw1MrPywgpe6sg1rrMVcXsO2hI0hH/Di344TiY67ZOvw2
	Glx8UH9PrTCSAVfJsu58KyT4RPEXIOLS3ezohYDOadAfTcIR2rxRI9oPjoJFx3wbkYyN
	wpxzF2vjLe2/879IBfUxR973DitsXqcBxC2do1nc0nd4jvlQK16zgpAAC5BCXlEPXSKj
	YCfcNh4LugeDEr3D6Ot29ytxB/DZkqJEbAO+k4XtBxlliKcyrw7zyS0kguKqfXqxNO9m
	Xcevo9YQ2LT/1OtgcNd8FlD+aDkTiPL9B/A2K07n31C4hPwnjLPXqNuK9vRHQgRZxECm
	4r0w==
X-Gm-Message-State: APjAAAXBRas/YmTiUvqjhBlp+iaBm7hjXbaBN65GP6EB2ZeTGwpxrTuC
	mmkHrk//chV4MKxu8OvPsAmbzZ7ZsrA=
X-Google-Smtp-Source: APXvYqxbNvBxj6ftiIACdHJEAsRhPgKPJa5HyDNeaO1agGaqHKAg8vNHpmialb6+vRv8QLBCVi81sw==
X-Received: by 2002:a62:5653:: with SMTP id k80mr71397355pfb.144.1558241313488;
	Sat, 18 May 2019 21:48:33 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:2991:b26a:5bdc:753c])
	by smtp.gmail.com with ESMTPSA id
	e78sm28702930pfh.134.2019.05.18.21.48.32
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 21:48:32 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-31-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <07b946fc-bd26-fd7a-e4c4-1cbb782db4f1@gmail.com>
Date: Sat, 18 May 2019 21:48:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190517181151.44001-31-alex.kanavin@gmail.com>
Subject: Re: [PATCH 31/37] bash-completion: upgrade 2.8 -> 2.9
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
X-List-Received-Date: Sun, 19 May 2019 04:48:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/19 11:11 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../{bash-completion_2.8.bb => bash-completion_2.9.bb}     | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>   rename meta/recipes-support/bash-completion/{bash-completion_2.8.bb => bash-completion_2.9.bb} (82%)
> 
> diff --git a/meta/recipes-support/bash-completion/bash-completion_2.8.bb b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
> similarity index 82%
> rename from meta/recipes-support/bash-completion/bash-completion_2.8.bb
> rename to meta/recipes-support/bash-completion/bash-completion_2.9.bb
> index 85064343e30..ce66ba5a2a8 100644
> --- a/meta/recipes-support/bash-completion/bash-completion_2.8.bb
> +++ b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
> @@ -9,8 +9,8 @@ SECTION = "console/utils"
>   
>   SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
>   
> -SRC_URI[md5sum] = "201b6ae62f7d5fb5b1b25e34427db919"
> -SRC_URI[sha256sum] = "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d"
> +SRC_URI[md5sum] = "60139333b25c4d54ad40323b701be130"
> +SRC_URI[sha256sum] = "d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6f6cc4b90fa12b2f5"
>   UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
>   UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
>   
> @@ -25,9 +25,6 @@ do_install_append() {
>   
>   	# Delete files already provided by util-linux
>   	local i
> -	for i in mount umount; do
> -		rm ${D}${datadir}/${BPN}/completions/$i
> -	done

why is this deleted ?

>   }
>   
>   RDEPENDS_${PN} = "bash"
> 

