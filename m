Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.10258.1596379550826477215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2020 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J3MCfOfy;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o13so18531096pgf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2020 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=xTTVCHIyhClv1ibAhxSDz8904CguwJo+hBmqj/QsqV4=;
        b=J3MCfOfymRaaSGXxiNHxeIM/CdpoaxhYzBK1G+nZh3+WYu5FGClBoPMP7IkO7qKh9K
         d3FveO7wIhu1qtTFUkSc86FJZizkOlyONDHNViA7glWWzdDxVBQR5NiRSZllNaVrJoWW
         fkmUxZAnl4E0eLEbcnquq4Q+opVDVQ1JNP8l0zye4mQAxIpcgPXJCBbTfApjFk2U1tqZ
         sD53jR5oFGhrcv5eJRdtBGUgZnQvwaz726g9/GQWzrtkn/uXlvR0NkA4HpFn4EEllX4v
         jplS98ai6p+egSdmIA97QDY21eQVx4H+LP2Q8COVKQxg5Lwz+GXDKEoSweDuq+CnJBo+
         DyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xTTVCHIyhClv1ibAhxSDz8904CguwJo+hBmqj/QsqV4=;
        b=mKo1fGIkkVzjyjDYF6WRdLn6zXwjgKTm6nplxU5gZfrayui1ifl3gHbN866CKPMDOA
         L59Io/Fwx3wZQDj/o6A3lplX8jvTJVRaWUhXLfqHARfxfYcxNqi6gfNF2fPdpG3ccKp1
         qcuRMAqFjrVYEBv1FDtMq9GX8ZArdgw4chHzH3A6vkGZySYC4AvLU3FIwWhG56mrcQnU
         k8VZWSVSsQSS3HE00ujL+oCAs3GgyobiPqqEtkR1Prf/QdkLk/0Rhsl1Q3wJyDQ53Q6N
         Tq2IN+bZSgiZcv7ZrcIBJ6IHdjIuVqw+2nER2iHGRGR6HUStMaKcr/JcHRJZXPmKAuVH
         /PHA==
X-Gm-Message-State: AOAM530eh/hYDtD4U4B0dJZFZGNwK5WBDCUbrXkUEQYkAqE6fWW1Uv7P
	8lDLz5cqAOXnEgpuz6pD7qdFSDPBO4M=
X-Google-Smtp-Source: ABdhPJy4b+YilvI/bwkBRejsSIQvCY+/3Y/2YJqtojBBAlqS+nfFQ4Jm65VYtyAkmGTuvMOzt5rMlA==
X-Received: by 2002:a65:6089:: with SMTP id t9mr11525349pgu.236.1596379549881;
        Sun, 02 Aug 2020 07:45:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:8956:272e:1bb1:7766? ([2601:646:9200:4e0:8956:272e:1bb1:7766])
        by smtp.gmail.com with ESMTPSA id nu7sm12262744pjb.33.2020.08.02.07.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 07:45:49 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 09/13] vala: update 0.48.6 -> 0.48.7
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
 <20200801212335.14922-9-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <47884cbb-9913-8bf7-a9ea-064ec3425bff@gmail.com>
Date: Sun, 2 Aug 2020 07:45:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200801212335.14922-9-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/1/20 2:23 PM, Alexander Kanavin wrote:
> Remove patch, as issue fixed upstream.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   ...don-t-append-dirty-if-we-re-not-in-g.patch | 55 -------------------
>   meta/recipes-devtools/vala/vala_0.48.6.bb     |  7 ---
>   meta/recipes-devtools/vala/vala_0.48.7.bb     |  5 ++
>   3 files changed, 5 insertions(+), 62 deletions(-)
>   delete mode 100644 meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
>   delete mode 100644 meta/recipes-devtools/vala/vala_0.48.6.bb
>   create mode 100644 meta/recipes-devtools/vala/vala_0.48.7.bb
> 
> diff --git a/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
> deleted file mode 100644
> index ac9dc8c83a..0000000000
> --- a/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 2460d7b79f7e90dcfeebde5e9c53d9b6798a1f3c Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Tue, 21 Feb 2012 17:12:50 +0100
> -Subject: [PATCH] git-version-gen: don't append -dirty if we're not in git
> - repo
> -
> -* for example if we have some dirty directory and we unpack clean vala tarball in it, then it will append -dirty
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> ----
> - build-aux/git-version-gen |   25 ++++++++++++++-----------
> - 1 files changed, 14 insertions(+), 11 deletions(-)
> -
> -diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
> -index 0fa6faa..1d1f9d2 100755
> ---- a/build-aux/git-version-gen
> -+++ b/build-aux/git-version-gen
> -@@ -126,18 +126,21 @@ fi
> -
> - v=`echo "$v" |sed 's/^v//'`
> -
> --# Don't declare a version "dirty" merely because a time stamp has changed.
> --git status > /dev/null 2>&1
> -+if test -d .git
> -+then
> -+	# Don't declare a version "dirty" merely because a time stamp has changed.
> -+	git status > /dev/null 2>&1
> -
> --dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
> --case "$dirty" in
> --    '') ;;
> --    *) # Append the suffix only if there isn't one already.
> --	case $v in
> --	  *-dirty) ;;
> --	  *) v="$v-dirty" ;;
> --	esac ;;
> --esac
> -+	dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
> -+	case "$dirty" in
> -+	    '') ;;
> -+	    *) # Append the suffix only if there isn't one already.
> -+		case $v in
> -+		  *-dirty) ;;
> -+		  *) v="$v-dirty" ;;
> -+		esac ;;
> -+	esac
> -+fi
> -
> - # Omit the trailing newline, so that m4_esyscmd can use the result directly.
> - echo "$v" | tr -d '\012'
> ---
> -1.7.8.4
> -
> diff --git a/meta/recipes-devtools/vala/vala_0.48.6.bb b/meta/recipes-devtools/vala/vala_0.48.6.bb
> deleted file mode 100644
> index 9dace1348c..0000000000
> --- a/meta/recipes-devtools/vala/vala_0.48.6.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
> -           file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
> -           "
> -
> -SRC_URI[sha256sum] = "d18d08ed030ce0e0f044f4c15c9df3c25b15beaf8700e45e43b736a6debf9707"
> diff --git a/meta/recipes-devtools/vala/vala_0.48.7.bb b/meta/recipes-devtools/vala/vala_0.48.7.bb
> new file mode 100644
> index 0000000000..2e61db1052
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala_0.48.7.bb
> @@ -0,0 +1,5 @@
> +require ${BPN}.inc

I wonder if this .inc file should be merged into .bb while you are here

> +
> +SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
> +
> +SRC_URI[sha256sum] = "28de33e28da24500cc1675c3a6ced1301c9a6a5e6dd06193569001f9ce9a5c53"
> 
> 
> 
> 
