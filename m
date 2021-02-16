Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.10536.1613493804722458669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 08:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s6A2xUcT;
 spf=pass (domain: konsulko.com, ip: 209.85.160.179, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f179.google.com with SMTP id b24so7439094qtp.13
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=QFwCCpUNtrNGMHmZqsikwI1Xsb1xbFzFq/WPJ8EVu40=;
        b=s6A2xUcTeTFnSX6xDeari0FOewv36GmMoo9LZGWS9lpDzjfbNub/zaxAzOWLJMJ/Mc
         TeUZe9EXui4vo0z//f//p/9UmPfeg+QzUwDwCeITuL7FQ1MKN38lp22rU9iaKKdOxQis
         X0dBj8PEU6RC9yFPzyeql4uZUAWCtZLXXGSnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=QFwCCpUNtrNGMHmZqsikwI1Xsb1xbFzFq/WPJ8EVu40=;
        b=JcIrwrl+zISb+ATvWYBkKXm8px8X8LwocD73ET+lrjFZVPfbk8W5tY/GIeu59bYifO
         3MDlc9c1Xq1x1KRfwMiERGVFB6yHqRhTeEiTXVbkY66Bep+9DOwSUdE0ByEBCHo2LY97
         V0KCSGnFPzdIbElMX1vkL5pCGxR26FsbcqQJ7wW0qAfNWwwADXSAc7HZiR3c1hnjCDnJ
         yctdN5YOjG23c3gZR+08Nsrtpg7RYYGT1bAIEnjKCmSHjfxOAT6gR8+YgQFO1roACEFx
         U2SJ+3668lHgxU1GQ0H9iPvRVgXvanytp48fjyCYQvpA+B0bckxOHRTVtGN6p/VIYdEA
         2brg==
X-Gm-Message-State: AOAM530x6S7Wb/DGu8EvcT50MWVFDWndipQBXtYzIZkkMvnW4GiWMs/o
	rHWQnQikW4AU/Pi86iXJYvmXbg==
X-Google-Smtp-Source: ABdhPJxaSY7TV0wedkID6RtNT6jIx0XdVVIXzUWZDc+qYGME/74rDb3K60U9fE0CwOv2fVYzcTRdbQ==
X-Received: by 2002:ac8:4653:: with SMTP id f19mr19577882qto.100.1613493803900;
        Tue, 16 Feb 2021 08:43:23 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id b65sm12595769qkd.120.2021.02.16.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 08:43:23 -0800 (PST)
Date: Tue, 16 Feb 2021 11:43:22 -0500 (EST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: Lee Chee Yang <chee.yang.lee@intel.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH][dunfell v2] sudo: 1.8.31 -> 1.8.32
In-Reply-To: <20210216150139.421-1-chee.yang.lee@intel.com>
Message-ID: <adb785bf-9948-6dc-196c-b56b96264599@spiteful.org>
References: <20210216150139.421-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Feb 2021, Lee Chee Yang wrote:

> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> release notes:
> https://www.sudo.ws/legacy.html#1.8.32
>
> updates include fixes for
> CVE-2021-23239
> CVE-2021-23240
>
> Also backport patch to fix build error with musl
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>

Please also mention CVE-2021-3156 in the commit message, the release notes
for 1.8.32 indicate the fix for that is included as well as 23239 and 23240.

Scott

