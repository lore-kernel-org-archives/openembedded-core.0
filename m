Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DBFC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 00:16:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5390.1644970566365077507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 16:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OfqlPbL8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so2613006wml.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 16:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NWQeslSQ7+nAc4GH9c8Qp8LJM45yFchs1zuqXUtNgsg=;
        b=OfqlPbL8gUuBwTklXsI60g9WYphLjWPV1h9e8PeydZf/kRD7Xcg/dxY8vwjKQONse4
         sjdMy1jZT32Ch4PehZ/YpUetOOFoTfc3ObOJDiw12jjaGt6vd3fpAyrH0I6acJKnhY4G
         8a1Kk3hxrBfpLjN+OBaDDlMYfk2m1GxxoRmgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NWQeslSQ7+nAc4GH9c8Qp8LJM45yFchs1zuqXUtNgsg=;
        b=u90ntCMtfcOocPKXmTHUvLnVzZd/KWKGvjO6RTGe/7PuV688+/UzMlWNpJfxmlwHEc
         0wTTgM1KyEDw1fP1qUFQ/9xHO7how2yi4Qj7VTFa8/Ojm0bn7PSpwljt183cetNn0ZOM
         FB39f+vhaKzK8bSjPFrUcpTr9o3tDfmNa1xLBUpGo0F8UIFfju29Ig49tUI0xWPjMdwR
         wrt78UvDtvgBMKnt2/jfoBBhfw3hmgdYrob6ZJ206tLeC88uOya9rnKP4lsmqptazgwK
         ImtUcTrVb0BBk4iEc+i5pFm9HyRfB5JRL+NqAL9M/zc9bEHJwEvM9KlZjEb9IBqcrMDK
         2wBA==
X-Gm-Message-State: AOAM532asGFgcX87PN1GlGgNPLdeFP0qvmIhQdgWVwnOrQYnT5FOgj4/
	E3zMnT4TjgI3507j09Q7wVySDA==
X-Google-Smtp-Source: 
 ABdhPJw/Ty9VMCL09YqfcJRIHqYYBFmaMERgKqkb66FJ+0k4cZZCQFOzl1S3GRPyTPvzOoDdHxaFAg==
X-Received: by 2002:a05:600c:230d:b0:37d:5882:ec9b with SMTP id
 13-20020a05600c230d00b0037d5882ec9bmr5032769wmo.162.1644970564772;
        Tue, 15 Feb 2022 16:16:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a680:61af:4a53:1ad3?
 ([2001:8b0:aba:5f3c:a680:61af:4a53:1ad3])
        by smtp.gmail.com with ESMTPSA id
 o10sm24519431wrc.98.2022.02.15.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 16:16:04 -0800 (PST)
Message-ID: 
 <59200a2598bcc9b75e291dc2ec8ad5495aab062f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.14.rc1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>,
	"qa-build-notification@lists.yoctoproject.org"
	 <qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>"
	 <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>
Date: Wed, 16 Feb 2022 00:16:02 +0000
In-Reply-To: 
 <DM5PR1101MB2348F85826AE094369BE968BBB349@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
	<fc898479cfa03b2df0987d9d31abad1800df1e8c.camel@linuxfoundation.org>
	 <16D2510D596B0944.17987@lists.yoctoproject.org>
	 <DM5PR1101MB2348F85826AE094369BE968BBB349@DM5PR1101MB2348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 00:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161762

On Tue, 2022-02-15 at 12:46 +0000, Teoh, Jay Shen wrote:
> Hi All,
> 
> This is the full report for yocto-3.1.14.rc1:  
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> 
> ======= Summary ========
> No high milestone defects.
> 
> No new issue found.

Thanks for testing! The TSC did discuss this today and agreed it should be good
to release.

Cheers,

Richard


