Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 097917E176
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 14:41:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w8so18941816wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=eWOvxQscLfWyRhpUV1IVycIJjSXG8OGBPEZjpmO8nDY=;
	b=K8vACpfpUwxHVmYysywklG0KNGjs+TXucswxwb2IFZG/Hpemdg9maI8kxpKerRUDyt
	6Tahs4I4WImdGyJk3eC6Kd6ZWfW2C82jChXQa8Zjn+120vlLktDkgt8Jyz7b0bIPzmfU
	v3rIlvy+SXmTzandhLpEhapnVMyq6ibdalUFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eWOvxQscLfWyRhpUV1IVycIJjSXG8OGBPEZjpmO8nDY=;
	b=Skhchx0wz56GiaqLCElGyh6wipyRGinyfvHFuK8Lo47S0SjDfcnmD/9Ww40ZaKK8gc
	EcbbHbBiodIKYeUKgEcq3H7RdV7KkAz9EGkTVmj0P2ORrsxDx66vgqPFZigPmZLGsNqt
	WkqiBhZEgqwEOlo4yzYJYhjdg7NbxU7xp1tdLq8gAQtk5KoVMboEfotrUj38Lnc09Xxw
	l+SnFKiw6SQQgqLFF9HDnRePL77KE0yJhzsCVsWKoUqtnepmJYD2Zf92e4MoTyvwDZo+
	7BAOx553sHCfclZbWtspKkNh/XjKIzCo53OlJTeCdRpkYlaVWmJCT/LaB6Q6exeHBwnB
	qchg==
X-Gm-Message-State: APjAAAVoiwwKqN0v1JsgKo+zTieYVlQs/q9sdXuRk456fVUkC4bEuAhg
	/fxF+ejFYuMDjVH1a/FAakUU5w==
X-Google-Smtp-Source: APXvYqxgrrSPicX2GdXHukCFrBpdPFIekJJqxObdd85sU/O2SrNmO0v++oHkmlFyajNUGQ2eVstjyw==
X-Received: by 2002:adf:b446:: with SMTP id v6mr50485948wrd.30.1558449684781; 
	Tue, 21 May 2019 07:41:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k17sm19050661wrm.73.2019.05.21.07.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 07:41:24 -0700 (PDT)
Message-ID: <6e8560511f994e0df99f20048fa7540c509cd960.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 15:41:23 +0100
In-Reply-To: <20190520141125.10805-3-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 03/42] libmodulemd: upgrade 2.2.3 -> 2.4.0
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
X-List-Received-Date: Tue, 21 May 2019 14:41:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-20 at 16:10 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> index 40715c06ee2..d7f486868b8 100644
> --- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> +++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> @@ -7,14 +7,14 @@ SRC_URI = "git://github.com/fedora-
> modularity/libmodulemd;protocol=https \
>             file://0002-modulemd-v1-meson.build-do-not-generate-gir-
> or-gtkdo.patch \
>             "
>  
> -PV = "2.2.3"
> -SRCREV = "4c75c6f8b39ee57aebe8fd36ef84808e893048c0"
> +PV = "2.4.0"
> +SRCREV = "d0a3eda45e083e8fe8b329a2310a53abdbf1e4d6"
>  
>  S = "${WORKDIR}/git"
>  
>  inherit meson gobject-introspection
>  
> -EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true
> -Dbuild_api_v2=false"
> +EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true
> -Dbuild_api_v2=true"
>  
>  DEPENDS += "glib-2.0 libyaml glib-2.0-native"

I'm wondering if this caused:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/852

?

I think its something in this series...

Cheers,

Richard



