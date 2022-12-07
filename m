Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10394C63707
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 08:13:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10362.1670400827835311945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 00:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=6lnsv15A;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.43, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f43.google.com with SMTP id v7so12999391wmn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 00:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7eYaRY1FUbH0bK4kq3KCxIUpAfHVrOw17faHa43IEN4=;
        b=6lnsv15AfjXSZabkDmxGpK3YI8nKPDzUSxKfjQHR8sMtLQiehMzXXPI6RZYhYyAszX
         IUcgjrb3RkQeZz0UlcYqOnP08l+UEPqLlEmOnMyoCsD6weNdJY5gAHac+F37LQXHfk1/
         wV1FIIGHfBPdrqQVweQ3i5Oy8cMO3kNhlrjlUwmVE3qGsEmDEACD1hSEAY0IYo7RJcc0
         hStbs7GSEnQZXQgR3D9jCKi6bL+C723/9YkBT3HhLpqZ/VTzeHjGlkQHaj4Mya7gKfrZ
         k1WmEeAG79US/fls4963AxzGQdmhB4+6S+rolg2F07E7JEsChrKz3Rn3yQpyh7NS1Iqz
         BeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eYaRY1FUbH0bK4kq3KCxIUpAfHVrOw17faHa43IEN4=;
        b=em+rS9DJnAtPqsk50KF+vqIVjQv61Jeovi7UZfAQ3vv3mav/UYBBhta+9XrwZuYszi
         jgNh/Mzs//MzV1j8yXJUvKsSPolAfTXyLFP4UzIesgb/b8TZu9xkIBOWsM4zy3xCH9fn
         E4Iua4KFKVe+BEY40va0kPM60L3E7OTsyp6XEcICqiXBHieEJTgGg2JkxXR2Iar6YHZS
         LayDRs3VHmJfmDhmL3TEf9pDsjdX/drJW7OuFbZS2c8+l3fOPKRe29OjbpDSGmrddS6B
         XvNtumISNZ2jrGhCLLJR3U1RZwGSyPUfrpfs+dZI+hR+UD3Lt5nDav4F0DqWwprz+ffm
         AjXw==
X-Gm-Message-State: ANoB5pn8n+lFVA/GWccr57Qrx2mOx1QewGmFut6UmgSuH84p/1iZxns0
	6EIFEK2oMEKBt9oOGY/ZEN4cVBblGpoycqmY
X-Google-Smtp-Source: AA0mqf7S9tPydkhd3IF0mwp3GcWPmJfa3oDH1LVNzzyNx5dwo6bEgG8QQ6nhgC5aJBWyI9IFD2Gssg==
X-Received: by 2002:a05:600c:4f83:b0:3cf:8b32:a52 with SMTP id n3-20020a05600c4f8300b003cf8b320a52mr70640194wmq.72.1670400825880;
        Wed, 07 Dec 2022 00:13:45 -0800 (PST)
Received: from WIPC21110265 ([2a01:e0a:a66:3180:c091:5ea2:164e:f210])
        by smtp.gmail.com with ESMTPSA id fc18-20020a05600c525200b003d04e4ed873sm902887wmb.22.2022.12.07.00.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 00:13:45 -0800 (PST)
Date: Wed, 7 Dec 2022 09:13:43 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
To: openembedded-core@lists.openembedded.org,
	open.source@oleksandr-kravchuk.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: Re: [OE-core] [dunfell][PATCH] Python3: Update stable branch 3.8.14
 -> 3.8.16
Message-ID: <Y5BLNyBpCni6KsTe@WIPC21110265>
References: <172E745A20A9AF85.5063@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172E745A20A9AF85.5063@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 08:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174345

On Wed, Dec 07, 2022 at 09:07:00AM +0100, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>  delete mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch
>  rename meta/recipes-devtools/python/{python3_3.8.14.bb => python3_3.8.16.bb} (98%)

Hi,

Just a few additional notes:
- With the update to 3.8.16, the patch for CVE-2022-45061 is no longer
needed.
- This update will fix CVE-2022-37454 (9.8) but cve-check will still
report it, as the CPE was not updated for stable branch. I asked for a
CPE change.

Best regards,
Mathieu

