Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 79B73731CF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 07:44:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l16so12583406wrv.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 00:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=o6wEf3ghrBGLoVNFXyBOI5RfEYjxBMxEugD8De+L0Pg=;
	b=hzJlGiVS3KSrvH6JPedIqkcRVBR/Itl6DJ+uJDwPlpwW4Zya9hRaU67aoUyJdHCxr6
	xkHbul47ScYz0whErHBMyuvTSxbUEofVH6yEOVOXRS6oT82wG9ne12xmh38C+fdV57vr
	yvTlfry+9yssaQ9dBC7I/SKci13dBXaqp0TaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=o6wEf3ghrBGLoVNFXyBOI5RfEYjxBMxEugD8De+L0Pg=;
	b=dVDIjm9roqYeR8j8SW6bUoE9Ts2I+5j8udHbOcDnIFbjwKnEM3E2up+qq998XB+DsP
	pXZc8qhEWcKjo/hEGl8zoMceAo5Y6Yl151Z/STWPf6JwhPwXt9pKWEWXScukJrapg/Zm
	Yy9qUS9Prpto7jszMd0ahcrEtzxMFMjlx1L5OLbHScUAXdMApT/bq/8IB8bZecV1Wj4V
	f4KeInJJwwbsxoKv3Rdt7zc2cN3aosaL/vZRuAxER9NU6PQCunOK1JVNhoJDFSkkEOwN
	P8bpzwU7MiZL2LJG3+EdlHfsdeACFzx/+FICja91vZ/3zbkBY1a2+OZvpIPcke2X3ey5
	+fmQ==
X-Gm-Message-State: APjAAAW7WiqmynxkM7Bt5lVU3K7OYoMAivW0M8EAvHQwVm3cPUgx2mF4
	h7x1lNyCQDf/j5Fo2i+h60kAnw==
X-Google-Smtp-Source: APXvYqyo5KVqEPO0Ovej4utUozcqIbEUwMoxwS0QJzRFrvkRnY/GaYcs5gfsxp4uQRlzNsB4qjdKkw==
X-Received: by 2002:a05:6000:12d1:: with SMTP id
	l17mr17258250wrx.91.1568015075019; 
	Mon, 09 Sep 2019 00:44:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g73sm23742147wme.10.2019.09.09.00.44.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 00:44:34 -0700 (PDT)
Message-ID: <4719cb39acdead5dd44e1100f0dd9265b0185da2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 09 Sep 2019 08:44:33 +0100
In-Reply-To: <20190909031607.1806186-1-raj.khem@gmail.com>
References: <20190909031607.1806186-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] python3native, pythonnative: Separate definition and export of PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Mon, 09 Sep 2019 07:44:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-09-08 at 20:16 -0700, Khem Raj wrote:
> This helps recipes where they need to explicitly pass the variable
> and
> does not entertain the ones from environment
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/python3native.bbclass | 6 ++++--
>  meta/classes/pythonnative.bbclass  | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/python3native.bbclass
> b/meta/classes/python3native.bbclass
> index d98fb4c758..bed04bd941 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -14,8 +14,8 @@ export STAGING_LIBDIR
>  # find_package(PythonLibs REQUIRED)
>  # which ends up using libs/includes from build host
>  # Therefore pre-empt that effort
> -export
> PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
> -export
> PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
> +PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
> +PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
>  
>  export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
>  
> @@ -24,3 +24,5 @@ export PYTHONNOUSERSITE = "1"
>  
>  # autoconf macros will use their internal default preference
> otherwise
>  export PYTHON
> +export PYTHON_LIBRARY
> +export PYTHON_INCLUDE_DIR

I'm confused as this makes no difference to bitbake and is equivalent.
exported variables are always set in the datastore...

Cheers,

Richard


