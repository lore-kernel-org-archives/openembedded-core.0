Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70D9C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 13:21:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.13915.1634044871514026037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y4LXDqJ0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id u18so67107230wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5BHrNnXrAn1IjTYg5X0By4QTStKvEBsi7guZB/NqF2s=;
        b=Y4LXDqJ09Nw6HUAZrCFqOOmjsprfD3vHTnEHQ5udraWkBzRVhCF46q7NF4zN1PRhIN
         GuwMgdSJv1UXbvGx2Xp/+SzeSy0wPf/VyG3UrtjLv/kdVbU0CxbaSdsyu+UREDpy1IZ1
         F4quaDeLEEJL+q+WGo1lH2L9WCeak1vb2lAz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5BHrNnXrAn1IjTYg5X0By4QTStKvEBsi7guZB/NqF2s=;
        b=GNH08i69jGDCNm17oFjXmjhYgFi1auqY0xGTrsnGrahudjpDH0hztJ/YL/4gvx5qLk
         r98qjGd+ujBkZT9MBVUuqTAoGrVlGWJlUmNnTqJ4AmmIdqaAbsEQGpsMoY0D7TVgNfqP
         8iDc+g1Xxu9+U0YkMjQw82bds32poj5SYz4uEGVii85+lIgwPBLekKk61vvzBJSMNBK1
         bf/nV9cuQDRCdA355tEVg3yQl4AyhlJ78Q4ujJXAlSfF00/VzkrTLtKEBrukSt+QbS/j
         yMxMJJ6coDZoJvAxJVfHsE7Hlg91+RBh6MHyv/nvy+syWYKUAx3eejGAgHONbcac/9+/
         p4DQ==
X-Gm-Message-State: AOAM531T4UhWDo1TqnP84HpkVFLTAJLBtesrrb+OfXAfHp7mFCwclTbw
	XDBNwXHpOBNCj8TdWRwPYNrqfA==
X-Google-Smtp-Source: 
 ABdhPJxoVAW0/YOTfxNKqmwzGtW0vbJ1E8WxO5Cq4AT64lVgtFnSjAJijhQCXXkj5Rd500d7/Rd0Rw==
X-Received: by 2002:a05:6000:15c3:: with SMTP id
 y3mr32294762wry.7.1634044869885;
        Tue, 12 Oct 2021 06:21:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d206:d72:2579:f3?
 ([2001:8b0:aba:5f3c:d206:d72:2579:f3])
        by smtp.gmail.com with ESMTPSA id
 k17sm10624918wrq.7.2021.10.12.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:21:09 -0700 (PDT)
Message-ID: 
 <c0e3bd5fdde8c109fab6cbd6c6ce2162883128d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] license: Allow treating missing license as
 error
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mac@mcrowe.com, openembedded-core@lists.openembedded.org
Date: Tue, 12 Oct 2021 14:21:05 +0100
In-Reply-To: <20211010172038.206959-1-mac@mcrowe.com>
References: <20211010172038.206959-1-mac@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 13:21:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156877

On Sun, 2021-10-10 at 18:20 +0100, Mike Crowe via lists.openembedded.org wrote:
> Use mechanism inspired by insane.bbclass to allow individual recipes or
> other configuration to determine whether a missing licence should be
> treated as a warning (as it is now) or as an error. This is controlled
> by whether the error class is in WARN_LICENSE or ERROR_LICENSE.
> 
> Use bb.fatal in the error case to ensure that the task really fails. If
> only bb.error is used then do_populate_lic isn't re-run on subsequent
> builds which could lead to the error being missed.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/license.bbclass | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 45d912741d..f0a6c0c20e 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -12,6 +12,23 @@ LICENSE_CREATE_PACKAGE ??= "0"
>  LICENSE_PACKAGE_SUFFIX ??= "-lic"
>  LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
>  
> +# Elect whether a given type of error is a warning or error, they may
> +# have been set by other files.
> +WARN_LICENSE ?= "no-license"
> +ERROR_LICENSE ?= ""
> +WARN_LICENSE[doc] = "Space-separated list of license problems that should be reported only as warnings"
> +ERROR_LICENSE[doc] = "Space-separated list of license problems that should be reported as errors"
> +
> +def package_license_handle_error(error_class, error_msg, d):
> +    if error_class in (d.getVar("ERROR_LICENSE") or "").split():
> +        package_qa_write_error(error_class, error_msg, d)
> +        bb.fatal("License Issue: %s [%s]" % (error_msg, error_class))
> +    elif error_class in (d.getVar("WARN_LICENSE") or "").split():
> +        package_qa_write_error(error_class, error_msg, d)
> +        bb.warn("License Issue: %s [%s]" % (error_msg, error_class))
> +    else:
> +        bb.note("License Issue: %s [%s]" % (error_msg, error_class))
> +
>  addtask populate_lic after do_patch before do_build
>  do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
>  do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
> @@ -190,7 +207,7 @@ def find_license_files(d):
>              # Add explicity avoid of CLOSED license because this isn't generic
>              if license_type != 'CLOSED':
>                  # And here is where we warn people that their licenses are lousy
> -                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
> +                package_license_handle_error("no-license", "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
>              pass
>  
>      if not generic_directory:

I'm a little torn on this and whether we should make it use the same variables
as the other QA checks? Is there a reason the user would want to configure this
sanity check separately from the other sanity checks?

I'm not sure I can see a long list of different license checks we'd want to add
here?

The current sanity checks in insane.bbclass could do with some cleanup and
refactoring so perhaps this could be come a common function (and common variable
to control all the QA checks)?

Cheers,

Richard




