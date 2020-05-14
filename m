Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.12967.1589465399155264832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 07:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RmaaMoMh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id y3so4335391wrt.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OE3roNNni8TJaQSCJ+7kNSvmBYrE0sYKXUkuAcfleds=;
        b=RmaaMoMhBzE1EJyZt8lRxQF4PNrpAD1nPZfElcxQ/nkiEhydniUobfJAJW0JTerDi5
         rxqbLMlUM8N6LX8owXcvr9DtwCjPglAmwxvYzd4G0su+XN8XxSG6MNr9Jc2Qlt05Qfpq
         gS2odT6AhFrDk1EmdCWNI9UHqfUcvjC+yuelM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OE3roNNni8TJaQSCJ+7kNSvmBYrE0sYKXUkuAcfleds=;
        b=aqeKXYUqxGVs0WCBmQOgoJdq9JG5or6c+Is9S2j5lLlsYo3lu36Ita+yF3YzJvddTN
         krwP/jaYbc6eeFWa1iKJiFJLWU+v5GVu4JJQh+yJ4cmnMyoxNx1p3WkVEmFdORa4uY9t
         RTY6bRA8KcXIFe+Pg/paYAVrejRdj44De9qZ3xeq9wdAvESWo3sJBS5fd21uVxyRwRdn
         h3wr8cVKa3Mb69TW23ijhvEM+6CylGvpOuQpl/y8OYsMBp/CVysdDkgxVCRs4CPWKZKO
         UqKWgzRb06J8GFnqGwp6emd5q/R6DGLv49zLtybyt7pifpFpdIwnetD2GLaPGqiF/cli
         0HKg==
X-Gm-Message-State: AOAM532rq1AwGD7F9q/dlffJW7Va/37rFvYSow6sPR+/n7IVRhZRnluA
	zjrHg/LkWRAO+yMMiospdsw5UA==
X-Google-Smtp-Source: ABdhPJz989660+UUCP3asqdz+AfEyUktamifD8zfAMjN5x6lfYqCNkLmEZx25FnhB7fFsq6TrTiFaw==
X-Received: by 2002:a5d:40c2:: with SMTP id b2mr5495746wrq.13.1589465397658;
        Thu, 14 May 2020 07:09:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z18sm20657517wmk.46.2020.05.14.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:09:57 -0700 (PDT)
Message-ID: <4586b07ae3f2c70500b6627645de2f71760b45e4.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel/kernel-yocto: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Date: Thu, 14 May 2020 15:09:54 +0100
In-Reply-To: <cover.1589378829.git.bruce.ashfield@gmail.com>
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-13 at 10:24 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Hi all,
> 
> This is a resend of the v5.4 stable bump to v5.4.38, plus a new
> -stable
> bump to v5.4.40.
> 
> The extra changes to make these pass the AB tests are the kernel
> reproducibility commits.
> 
> The issue we had on the last submission was that IKHEADERS was
> switched
> to a module, and hence was failing reproducibility tests as we didn't
> have the timestamp variables exported for the module build. It has
> always been a problem, just one we hadn't hit.
> 
> I've left the fix as two commits on purpose, since the copy of the
> reproducibility export fixes the problem, and is definitely safe for
> dunfell,
> and the second commit is my effort to remove the duplication of logic
> and
> create a common python routine they can call. I've used the
> techniques for
> subprocess running that I've done in other kernel build elements, but
> if they
> aren't the right ones to use, point me in the right direction.
> 
> All said, these are green on the AB and should be ok for master and
> dunfell.

I think this triggers something here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1914

which is nodistro rather than poky.

Cheers,

Richard

