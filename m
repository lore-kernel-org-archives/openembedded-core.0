Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.10058.1615820779606413098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 08:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastree3d-com.20150623.gappssmtp.com header.s=20150623 header.b=v8SFlLVc;
 spf=none, err=SPF record not found (domain: fastree3d.com, ip: 209.85.218.43, mailfrom: adrian.fiergolski@fastree3d.com)
Received: by mail-ej1-f43.google.com with SMTP id bm21so66795134ejb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=7p/R02JDIlaOgeR7Vl2TrqGlrQKJaZUMoHYCOykWS68=;
        b=v8SFlLVcPU2LfEc2IrRW49QlX4eBYdKny/3uPn+3F2nzFBSuhCWkCod3//fmYdLKmi
         EQ9Voi5i+a+0jkVUmhOopnWL9Vi7Gm7rEbOAgeIjceswS0HJsbO9MuckGg6QX5Vm2Qxh
         jxsUiCBKzYLQ9TkG1wrlV45A4+SHSoxNhfX3trwwVAFaL1O4XSZ91+B8Td1I8/Rc+GQD
         0OXRiJCwosNYlzYAuVp/It693MU8IY23N3p+vR9WfMeI6kwIWKxun+FsUpPLLw5oJ8ZP
         otjtsF2oOJbDwxxabpojtQBf/noUrD1tLZK3zdtbYOBP6diCh9Uwaa6rYBIwyZ4lWmIU
         i10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7p/R02JDIlaOgeR7Vl2TrqGlrQKJaZUMoHYCOykWS68=;
        b=raG2qLnaSH0EVJpWlVERoMtgQA/f/DGevoYdd8JlyaprrFTpty4XYOtj0j0V5YqPdZ
         Fsmhmd/E+oBYRIFP4bUsn5oEYtzs0qWTN1Uo+fSxskEhZsyQ6hKM8RD6S+8RlmyyLwpI
         wZSveYp4Vm7+4cBuPK/H5XkU49j94KG+7beMlCOD4VMo4hneX4Uef+MRvVqK13cthpYy
         48UMHwSsXZydeV21BUGvZSrFofUUcumQgPhe89o6oIN8vOYX7TI+uYcZ++3hxJDvZksz
         70X+cKl6JAmH8GoiIM417XnVWz7H7IywpOksenEa0HJIEtnylOen8r3vG1FhOLWq/jS3
         CSLQ==
X-Gm-Message-State: AOAM533X+jDnePsg/0ZST6l+Jh3uvbIkTMnHvhFwCMDxe9rO7vqvZpJ6
	6a1F31UKrVFDVfRR6FEoiq6UAuUIyBhk
X-Google-Smtp-Source: ABdhPJyVRrqKQlqVgxTcl8gU8cIepgd04FOoNlpLBy7V9Ssb17sxcFZ0ndtQsFLFtOIDLQPvn9ZkQg==
X-Received: by 2002:a17:907:7683:: with SMTP id jv3mr24015377ejc.450.1615820777728;
        Mon, 15 Mar 2021 08:06:17 -0700 (PDT)
Return-Path: <adrian.fiergolski@fastree3d.com>
Received: from [192.168.2.144] (8.237.197.178.dynamic.wless.lssmb00p-cgnat.res.cust.swisscom.ch. [178.197.237.8])
        by smtp.gmail.com with ESMTPSA id h13sm8376029edz.71.2021.03.15.08.06.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 08:06:17 -0700 (PDT)
From: "Adrian" <adrian.fiergolski@fastree3d.com>
X-Google-Original-From: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
Subject: Re: [OE-core][PATCH] weston-init: Set $HOME variable for SysVinit manager. SysVinit sets by default the $HOME directory to "/" for the init scripts. It's picked then by the weston-launcher and make weston-terminal to have wrongly set $HOME environment variable for the root user.
To: openembedded-core@lists.openembedded.org
References: <20210315140136.174672-1-adrian.fiergolski@fastree3d.com>
Message-ID: <ef878ec4-77c2-ef85-4370-81c98d43d204@fastree3d.com>
Date: Mon, 15 Mar 2021 16:06:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315140136.174672-1-adrian.fiergolski@fastree3d.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

This patch is wrongly formatted and should be ignored. I have already
sent a proper one.

Adrian

On 15.03.2021 15:01, Adrian Fiergolski wrote:
> Signed-off-by: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb   | 1 +
>  meta/recipes-graphics/wayland/weston-init/init | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index 65d7b81dc5..6b78e6722f 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -30,6 +30,7 @@ DEFAULTBACKEND_x86-x32 = "fbdev"
>  do_install() {
>          if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
>  		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> +		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
>          fi
>  	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
>  	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
> diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
> index d3e87c6cef..a849f29bcb 100644
> --- a/meta/recipes-graphics/wayland/weston-init/init
> +++ b/meta/recipes-graphics/wayland/weston-init/init
> @@ -30,6 +30,7 @@ done
>  case "$1" in
>    start)
>          . /etc/profile
> +	export HOME=ROOTHOME
>  
>          weston-start -- $OPTARGS
>    ;;
