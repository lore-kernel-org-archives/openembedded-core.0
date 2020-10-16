Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.11038.1602837773948471051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 01:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zhdc396v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id l15so1137962wmh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 01:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rhcx53J7tSV4zIQq9ga9C+D9NMvNdZvaMqX6Oocd4dE=;
        b=Zhdc396vj3zym1nNvNc5u5+Q0toflFq8H/89cnWiA7Yx0qlIi7d31hoZ0ECb7WkOhF
         a5oswx18WPi1EvLOg9O7s1C3pA65LxJ586FMlz17LjtSNHGsEOR1ZO2kCghBd3lKouTg
         lMDQoeoAMdvWI71EYs0qKBnblOHwdf4tKmVuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rhcx53J7tSV4zIQq9ga9C+D9NMvNdZvaMqX6Oocd4dE=;
        b=SATlUkcRwQqsK5uSBIT5rS6kzXFhkWV0RyKP4fUGsBIXuuHE8kUFp+zHku6y+whyMx
         RGauPER9etgnA8x2ceLaT6CvpYSFkItBmOZrY2xl+St1HyZYkfFMF3sYHIHhK+csKnXi
         wHj6U+kF4vKtEnoALZDIMG/XGJZJ/uQ5PQMUkv3Kne9UoqAc++B+HTtr4MQcHOX9NYuB
         5+tYaOjqO1aJ2VkE8lnuJ5SZS6DxtlFFWX02ZVfLR6F9Y4TLyPVR2x3yfCRI0uQl+qXx
         8YAhSCRoI1aYb5YPWUePa7LQJPrE8+VRgBpUN6pdRJ6J5B1VDJ5IVdFTiHClqf9a0ywH
         +J4A==
X-Gm-Message-State: AOAM5329vPeJ4RW/5HG5PpsyIrPFkpp++e8dz5rXUrbqzeMyRwas18Pk
	fyuBhv+9KdictopA0M62KWQ4LA==
X-Google-Smtp-Source: ABdhPJykDxfFpxtEzmrZbO/p7iww4YzC3/OA98S7X/xG8INC1N4Goo3aWy72kqkkiNhg8CqvT+lZpA==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr2675247wmc.4.1602837772402;
        Fri, 16 Oct 2020 01:42:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id z15sm2598338wrq.24.2020.10.16.01.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 01:42:51 -0700 (PDT)
Message-ID: <c17959f4b0ac63d56b7b8d2c76d69af8025ae677.camel@linuxfoundation.org>
Subject: Re: [poky][PATCH v4] Update license file to match current SPDX names
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2020 09:42:50 +0100
In-Reply-To: <20201015200842.18834-1-idadelm@gmail.com>
References: <20201015200842.18834-1-idadelm@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-15 at 21:08 +0100, Meh Mbeh Ida Delphine wrote:
> Updated mappings of license fields of meta/conf/licenses.conf to
> match latest SPDX naming.
> Added missing mappings.
> Renamed license files that were added in license mappings eg from
> GPL-2.0 to GPL-2.0-only.
> 
> Fixes: [YOCTO #13320]
> 
> Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
> ---
> 
> Changes in V4:
>  * Renamed license files that were added in license mappings eg from
> GPL-2.0 to GPL-2.0-only
> 
> Changes in V3:
>  * Added missing mappings to meta/conf/licenses.conf
> 
> Changes in V2:
>  * Corrected the email subject line.

You've sent several versions of this (v5 and v6) however this is the
version which is in my view the most correct at the moment. If we do
anything with the "or-later" files or variables, it should be in a
separate patch to this one.

I did put this patch (the v4) in for testing on the autobuilder. As I
suspected and hinted at in the previous email, it failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2606

(see step1b and the errors).

Basically the issue is references to the license files you (correctly)
renamed. We need to update those references. There look to be three
problematic references:

step1b: ERROR: sysvinit-inittab-2.88dsf-r10 do_populate_lic: QA Issue: sysvinit-inittab: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/beaglebone/build/meta/files/common-licenses/GPL-2.0 [license-checksum]
step1b: ERROR: sysvinit-inittab-2.88dsf-r10 do_populate_lic: Fatal QA errors found, failing task.
step1b: ERROR: connman-conf-1.0-r2 do_populate_lic: QA Issue: connman-conf: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/beaglebone/build/meta/files/common-licenses/GPL-2.0 [license-checksum]
step1b: ERROR: connman-conf-1.0-r2 do_populate_lic: Fatal QA errors found, failing task.
step1b: ERROR: make-mod-scripts-1.0-r0 do_populate_lic: QA Issue: make-mod-scripts: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/beaglebone/build/meta/files/common-licenses/GPL-2.0 [license-checksum]
step1b: ERROR: make-mod-scripts-1.0-r0 do_populate_lic: Fatal QA errors found, failing task.


Cheers,

Richard

