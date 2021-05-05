Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.625.1620253963259197653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CY3z3ZvV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id l13so3480145wru.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=beBZR0SLq1ZXayscAbZR2kwcycuBc7TED3+UGNemlqo=;
        b=CY3z3ZvVzn/6+IzZQWlzdtkh8Uz2Xvz7/RTLyEBo2QOZekES7BR2JFsP/ihBdwKN2G
         GHVomXrX/SGQ+dVNYCepujLBxIiEmpE0P3tf2ObONdsha/F2qVLByuSOQLuBVW3Klwrp
         cYDgUpkIh85znxxTJxuNaIfCgLY4CmpspLtR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=beBZR0SLq1ZXayscAbZR2kwcycuBc7TED3+UGNemlqo=;
        b=VavuF2UwRFsLXlS1aVot4ZXyhp8466757Y+OP5cOMyrlHn1V93EpXNv/38Tk4W9I2x
         I7rDHhZe3BQeMuvz02qwc1yrl31GNl+1PPWc7n/eVP4Zjp5V2bnnrlebO7+KZG7XrNQi
         SgAJAaDzZhzL2CVt/NErIY5akPnUbPrnbgPOX4jvDrGgQverJ7VfwvzLEBne8pWbhtCR
         UQae/WNL/+UQuTFg+/KjbpaVVvGk/pIemW+LUBHCDdOk386OnJunOvfvKg2pcfMvypDp
         REEMhXNrX0vfpQe0CvX9+jpRQ+MMCv6iNOw73yuG5utPV3vkZ2JmRQ+gQO4gXUNV5B2A
         Z08w==
X-Gm-Message-State: AOAM533ZkF4A3UZuZtwkFR8ZgL4IVyIZXB4AMKoWxWht73uUFQmL7GC+
	plZ7QyL3NjsSdJZusPwSPGHj/Q==
X-Google-Smtp-Source: ABdhPJyaOFDFVXyEMAU6ANnGT29WPbHgYRjSUx0uvpFLyg28tB98DEScQtSJVN+RzfYJp9wqXqwEEg==
X-Received: by 2002:a5d:654b:: with SMTP id z11mr1305938wrv.167.1620253961746;
        Wed, 05 May 2021 15:32:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id a2sm1004586wrn.13.2021.05.05.15.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 15:32:41 -0700 (PDT)
Message-ID: <e08e70ad086f413733bf5ba3cabdd558926a9868.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/61] expat: upgrade 2.2.10 -> 2.3.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 May 2021 23:32:40 +0100
In-Reply-To: <20210505151850.660512-6-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
	 <20210505151850.660512-6-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-05 at 17:17 +0200, Alexander Kanavin wrote:
> Drop 0001-Add-output-of-tests-result.patch
> (difficult to rebase).
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../0001-Add-output-of-tests-result.patch     | 83 -------------------
>  .../expat/{expat_2.2.10.bb => expat_2.3.0.bb} |  7 +-
>  2 files changed, 3 insertions(+), 87 deletions(-)
>  delete mode 100644 meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
>  rename meta/recipes-core/expat/{expat_2.2.10.bb => expat_2.3.0.bb} (81%)
> 
> diff --git a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
> deleted file mode 100644
> index c5c18ead74..0000000000
> --- a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From aa84835a00bfd65e784d58411e76f60658e939dc Mon Sep 17 00:00:00 2001
> -From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> -Date: Tue, 18 Feb 2020 19:04:55 +0200
> -Subject: [PATCH] Add output of tests result
> -
> -Added console output of testing results in form 'RESULT: TEST_NAME'.
> -
> -Changed verbose mode of test application set by '-v' ('--verbose')
> -argument to CK_NORMAL.
> -Added new supported argument '-vv' ('--extra-verbose') that changes
> -verbose mode of test application to CK_VERBOSE. Results of each test
> -are shown in output only if this mode is set.
> -
> -Upstream-Status: Denied
> -
> -This patch changes potentially deprecated feature that shoud be changed
> -in upstream. [https://github.com/libexpat/libexpat/issues/382]
> -

Doesn't removing this degrade the accuracy of the ptest reporting?

Cheers,

Richard

