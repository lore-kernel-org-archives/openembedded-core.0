Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id C045C7F95C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 04:56:22 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id x1so6056488iop.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 20:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=y1faLVX9OAwJMcI+dBpea73HGLwFvWROYD1dlXoAY24=;
	b=B17kZXOIljUFRtv9tp2BJHaS34VdiLvxeYmHBQ87PjM7TfAYoUzxEqZXyiVW4DsKxF
	DPnNmbhV5/PKD8ozRlWKBMaxYzt9cMaH507iIX6MpwRn6JUherWNq314DsrMX3x5tQ/S
	1XrCsh/d49sDbdJFiPcPY+cjAfDgftkNdAXiFx2JjCDKGhNbJBgjrgkw03XDwUVc8203
	KTAFToVC5U3eX3sSggpPEP1hZ5GBrSVJV3J/mrbIa0aaYo0o1Z5dB9FbClT0YN7aRx5D
	3CboHG5THN2Wt72vV1TEuBAeMATUUTq0epXgojJcTS7/nVaZIuAod0ni4nS5gUayMsrw
	pAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=y1faLVX9OAwJMcI+dBpea73HGLwFvWROYD1dlXoAY24=;
	b=ueowWz7+GMIRB8K6rLYHq/ycBd3XLHHV0SOosFCKJ7mjZbdphMFmpQT8DURWqduH3+
	clJL6NX1nQa+qy3C7RExijgqUAJuMTS/I85nnK8mWtQZ6jCozUrAwPspm6gQ73IjuRj9
	8bJZYjjmDs88GBIAl3ibGb3aQDha+Xc+HC+2wL4ZzfsRLJlfHtWClRKun2UgV/cI0Z62
	ioxAwONdzdGHC0I7SQ/JdoBRYiPAVEokt1MkznISuEqjwOCClqvPMgxTgQNeRvVPd3sP
	2glrndDhSzyuOj0hk4mODM9OTIkw4Y+D0rOfhr3tjHjdeqmURMEJtHKtPKimE3vWmLUr
	9oLQ==
X-Gm-Message-State: APjAAAXkXhXq6x100D0ccCW+EdTsPt8HbryeJRrvRWelUu1Z3gINbN5w
	9i2kkF0viGKW73Ei2efFJdZrue5FNtM=
X-Google-Smtp-Source: APXvYqxTndVXj3hkIDP1lnBmwFq/+7hZrLLUQ9QJCoEcKgTKEIVQc6NC52WejWoXloOfECrhGy0azA==
X-Received: by 2002:a5d:9f51:: with SMTP id u17mr9200037iot.258.1575608183078; 
	Thu, 05 Dec 2019 20:56:23 -0800 (PST)
Received: from ?IPv6:2601:646:8500:1c20:f522:3e2a:85ae:c5d2?
	([2601:646:8500:1c20:f522:3e2a:85ae:c5d2])
	by smtp.gmail.com with ESMTPSA id n5sm3571906ila.7.2019.12.05.20.56.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Dec 2019 20:56:22 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20191205220716.29178-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <bf7d7c11-f4ee-864f-7e94-b307700a9c78@gmail.com>
Date: Thu, 5 Dec 2019 20:56:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191205220716.29178-1-pkj@axis.com>
Subject: Re: [master][zeus][PATCH 1/2] libtirpc: Simplify the installation of symlinks for legacy headers
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
X-List-Received-Date: Fri, 06 Dec 2019 04:56:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/5/19 2:07 PM, Peter Kjellerstedt wrote:
> This also corrects the symbolic links installed in
> /usr/include/rpcsvc.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   .../libtirpc/libtirpc_1.1.4.bb                | 27 +++++++++----------
>   1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> index 633cececd4..91e0ce6fd2 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> @@ -1,5 +1,5 @@
>   SUMMARY = "Transport-Independent RPC library"
> -DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC library to Linux"
> +DESCRIPTION = "Libtirpc is a port of Sun's Transport-Independent RPC library to Linux"
>   SECTION = "libs/network"
>   HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
>   BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
> @@ -22,21 +22,18 @@ inherit autotools pkgconfig
>   EXTRA_OECONF = "--disable-gssapi"
>   
>   do_install_append() {
> -        chown root:root ${D}${sysconfdir}/netconfig
> -        install -d ${D}${includedir}/rpc
> -        install -d ${D}${includedir}/rpcsvc
> -        for link_header in ${D}${includedir}/tirpc/rpc/*; do
> -            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
> -                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
> -            fi
> -        done
> -        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
> -            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
> -                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
> -            fi
> -        done
> -        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
> +	chown root:root ${D}${sysconfdir}/netconfig
>   
> +	for dir in rpc rpcsvc; do
> +		install -d ${D}${includedir}/$dir
> +		for link_header in ${D}${includedir}/tirpc/$dir/*; do
> +			if [ -f $link_header ] &&
> +			   [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
> +				ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$dir/$(basename $link_header)
> +			fi
> +		done
> +	done
> +	ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
>   }
>   

I know this patch is making the existing logic better. But I dont think 
we should be substituting, sunrpc headers like this, what problems does 
this fix is not clear. tirpc is not a drop in replacement for sun rpc. 
Applications have to use it consciously. Sneaking the headers like this 
can cause subtle errors.

Perhaps original patch should just be reverted.

>   BBCLASSEXTEND = "native nativesdk"
> 


