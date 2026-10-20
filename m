Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3742.1792488839113733863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=snlw0PDj;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a01933b584so21395555e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792488837; x=1793093637; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIZak+HyIsuBLMyNQRMn8jfpdvNZbal7Rs5RkF+adAk=;
        b=snlw0PDjk/H5J2xGubqQacYIW1OXmexAeCBwaSJ477+qaGdwdvg7m2QW+KYso+Oiws
         30BKh8r26icqj6wKJvaGjs89T3I1/0c+pu5j7MRXoUrv5BvIEFxOYZJzQf8GWydwFPGv
         RHpbQImsL51auCjA6QAFpxdlutSuZ9va4fqBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488837; x=1793093637;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIZak+HyIsuBLMyNQRMn8jfpdvNZbal7Rs5RkF+adAk=;
        b=cIpId2j++k5j+XRij2NdQXLuI/5yThc1YE2J3eIgnV2HidtyRlzou8Qvue9vGrfkOO
         Z4ay4DvoOpGKYkM+PVz0hqulSa92/qy5zI14CJEKrzP6LGRn6G785KNOpqRjisX8bTfu
         uqIy164gdS+ga9pvpjHtxKSWIlLF14Hnf5zfVhozYfbpExcO9jgIGgtOkCUxHaRQ13MN
         5FXcewwNJXv5wXACnxk74YBmWr+kRVYWIQx37fjK1bjEGpLcye9audQewXlzDobAxoL+
         /i1QuhEZ5E7Luid6Kzb3YJcbnYLTdCSkZvJ2PrnPY2WtGm7t/9Wn2XTR6/yWgFWI1PnC
         zr/w==
X-Forwarded-Encrypted: i=1; AKwUvBzAYOeO+638S//ET+yKCJQpR1KgwiyEuy4MatmZUAo2Me8KaDobVGDga7GfYieGTbHpVvnH8+z01OUPyf3jzag3sg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIymm6aYJUcemxSG1bII9bzjfFpj5OTwAVE6RFxNyDeCkOtpnNN
	JOSaTCktOJeLWBgxWM0xGtjGyvCjvnBOP8iqJv6kFQL8fOxRd/pLjeoWj//uSWiYEMrqfHl4T6z
	AbtzSKNY=
X-Gm-Gg: AYBFou0beG1l0VBQ7qf/Lo4lY+eUaN/VAQAXua1stG2sKf36/UL7apEJH9XeZj6bqw0
	Y841uQt0DWsD4NYacpdv7q6buREI1WSn/zzntEK+1lg3neeuHtLSLLPWoGUiBjtAQ34P6V9ApT4
	ZSyONoVKlz6l3TN2UAwATMoHAhu/W9AoQxRCha1Ng+TIGei7hl8R4b0Pqt+IamsET2izM+0VS7K
	BtSsxtgdcAYXSRz9alY+Zgvbf+e9gAlae97xlXapZfYBLy2bcI9Oq7IJrMt3h6LdBrR4vb2Tosq
	XCFbYiyNJeSdsjVPxRjBtsDch7kDrvwc5XQC1G9AM5V+6o58mwjY6ezrP/wfqde4RFdnAvtIY9d
	WlLDGbXDK8eA9tgCPet06T+m1xINGqSj6ySb+bC5fK+aaXsvrfR+R4zfdFMP5I1Ne2aU77Z6tF9
	BeAO5wK+YO3ZMWinRnRxZZsS6RnydxTwl6K4XU5cXqT6u9E/oBtMlfhOdp+HdksDtBK0HTlRd6g
	cTNpBFAiz+l+iQK9RzDezUcXvCWUJXCLmXk+Uvz33ZJ/muw+ZGh5uDsiFBPlAxkiQ0iGQ==
X-Received: by 2002:a05:600c:c082:b0:4a1:f377:5c6b with SMTP id 5b1f17b1804b1-4a1f3775fa9mr31436145e9.7.1792488837100;
        Tue, 20 Oct 2026 02:33:57 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd482bsm57736445e9.12.2026.10.20.02.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:33:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 11:33:56 +0200
Message-Id: <DM9K9FJ3GUXI.2GAS3HOWNI97V@smile.fr>
Subject: Re: [wrynose][PATCH] oeqa/selftest/devtool: handle existing patch
 directories in recipe tests
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Ayoub Zaki" <ayoub.zaki@embetrix.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019125810.492968-1-ayoub.zaki@embetrix.com>
In-Reply-To: <20261019125810.492968-1-ayoub.zaki@embetrix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248266

On Mon Oct 19, 2026 at 2:58 PM CEST, Ayoub Zaki wrote:
> Recipe update and finish tests assume generated patches live in a
> directory named after the recipe. Existing files/ or versioned directorie=
s
> can instead cause staging failures and leave generated files for later
> tests. Cleanup can also delete tracked patches that should be preserved.
>
> Share recipe-directory cleanup that resets the index, removes untracked
> files and restores tracked files. Stage recipe changes and check generate=
d
> patch filenames without assuming a subdirectory, including the
> --initial-rev cases. Keep paths that describe known fixture contents.
>
> Validated with devtool.DevtoolUpdateTests.test_devtool_update_recipe and
> isolated staging and cleanup checks on both target branches.
>
> AI-Generated: Uses OpenAI Codex
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 65 +++++++++++++------------
>  1 file changed, 35 insertions(+), 30 deletions(-)

Hello,

This needs to be sent to master first. Then, blacksail.

Regards,
--=20
Yoann Congal
Smile ECS

