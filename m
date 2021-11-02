Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06F4C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 12:36:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.118.1635856573081673842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 05:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xbz0J5+o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id u18so33087648wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=p3CfScBJwXojCy6/zkmLmufEbtpi6KiTIYfk1ZKJ3AU=;
        b=Xbz0J5+olsrWx2ApZBSBQMY/8JfuHh43mPe7g2aVap7UMeNqkd38o/91MqWUbpjapu
         +ND9C+8WP43Ss7WttQPSyxKqDLyWnCnFlNCrH9YLuxtHXhDV8PTqwh/NZL/5Ib5G3u4R
         NoqP7yCd+Cq5GI5MpTHMcTYGwQQS4hGSQICrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=p3CfScBJwXojCy6/zkmLmufEbtpi6KiTIYfk1ZKJ3AU=;
        b=20/xtm7s0jXm5n23cTOpCt7DEcGIdol1Sg9qv9LGL7V4I6Fpcw6TRI4o5RYRoUmhCP
         k3mTulNrfbVzH5HBH/IoRoU4GxDfveQto2n+nzXGeq4augLsZSUG+4Sg6U/p5KZO5i7a
         WtMV86NJYY/h0hkZlwN0deBReJNSdyJeNzVGZhClWTrnGlTr9OFgGKyqcxCbOObvYs5F
         mMH9Db45BYHV+963bxPAr+blWs7IMWmuwhEv1GkTnS3ZMkxT8zWOqmQre0vtV82Xh7Zs
         6oLeB2j8zY8C4nW5nhxzaGwLtwr4vcxPexfdKY4QFdzK+IZib5PqyK1n+qbaHxtwpBiu
         Fx7Q==
X-Gm-Message-State: AOAM532srBfZzFfJrE5mtGktDAgoFNB494oEhXSEr+DSjni4u4TkpBrv
	h8liJFxUKpfsXJL2sJBZZl5//xIntPIxZQ==
X-Google-Smtp-Source: 
 ABdhPJzdkA5C3mKn5gJCozz47kFbYTbDJdW8KdcDX+b6eR8wOr1p5FUlKk9IoLyvwHzd5CXQmnaWng==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr12022777wrq.311.1635856571746;
        Tue, 02 Nov 2021 05:36:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e05:60cd:475e:19f5?
 ([2001:8b0:aba:5f3c:e05:60cd:475e:19f5])
        by smtp.gmail.com with ESMTPSA id
 w10sm16574786wrq.88.2021.11.02.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 05:36:11 -0700 (PDT)
Message-ID: 
 <bee9058cd7cf3c2d92f7eb7b85eb4ac382e9379b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] patch.bbclass: don't repr() the exception,
 use str()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Nov 2021 12:36:10 +0000
In-Reply-To: <20211102122639.2422915-1-ross.burton@arm.com>
References: <20211102122639.2422915-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 12:36:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157776

On Tue, 2021-11-02 at 12:26 +0000, Ross Burton wrote:
> repr() results in formatting characters such as extra quotation marks
> which are pointless.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/patch.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 8de7025491..079ee33e3c 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -155,7 +155,7 @@ python patch_do_patch() {
>              resolver.Resolve()
>          except bb.BBHandledException as e:
>              bb.utils.remove(process_tmpdir, True)
> -            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, repr(e).replace("\\n", "\n")))
> +            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, str(e).replace("\\n", "\n")))
>  
>      bb.utils.remove(process_tmpdir, True)
>      del os.environ['TMPDIR']

Full circle:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ec6edfc27f2cfa990dd0f8b2bbc6f9472a50a839

:(

(the original issue being that str(e) on exceptions can hide a lot of useful
info)

Cheers,

Richard


