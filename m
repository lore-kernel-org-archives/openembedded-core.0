Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC2971C9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 11:15:57 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id b4-v6so6207556ybi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/VN8W9bDMFpfEssU68n3Imcd25hOXoHWqXZqPt/nV50=;
	b=eWP2rojBewbfOrpieXQ9/ncEpLogWQjo/ue0WSqgKRrUPU4MmKjFdLkgIpiXqQQEFn
	5X/bBMp6DiQg4eihZrZy+JXQsIXSqYf8M2akWfnCBZhS2fLPTMbyyT98veEusco1C//b
	T7QDWY40PNvke439K1nM4UUcnmkuBt+X52xDL4YAhbXv8wrxcBwmogT13gVuM2LyKpU9
	8dW4w1N4O/kqeMgWsL1jqp01aanNyxiiERdFjI/joH1Z99ofN8TN0zLvsZcDBm0MSIhg
	gZe3LPg60p7E6pLocThCSxDOXksLdXxa1o+psbJBsqgQxZmX0d6XX3DHMj4Ku1vy2CGI
	1SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/VN8W9bDMFpfEssU68n3Imcd25hOXoHWqXZqPt/nV50=;
	b=Pld3xfuuNvQaKovugc3jr4+QQulFkjaZ3550yUBSMZ/KU3BczQHRJ9GyTjz3nEww77
	AktI72cO+9NPpttQMDIPaC/XjpWQHRUidgmgcW3b5MKUnB7Twi6+2OdPpTaMq9sEEYBi
	l7GR448sBHFIU++K17X5katna81IuLGGlSusyvEMu7qFBHlub+eOu4VxJg1tfw5QEcsE
	x7fe+rwjZKoyEm33bbwDtyorhidCEDlkjZKGoMY5FiJ8WmlbwfCl5ZqoD2vPs/1w0Ed3
	2EAMXT0XtuDoselpChmYDOYm2QvRjy0JovpXyAwTLHXMa6DtikNPEdbVofHtj/yemxfK
	JBxg==
X-Gm-Message-State: AElRT7GZdDuZ7FwnaEZGsxxghj8+DlV1NvHzOKz87GtjEEs9YPkKWdxz
	xDiww2BOHNKINpO8nto4OTRaBzmlL4/5hvtRHSE=
X-Google-Smtp-Source: AIpwx49AQGo3Y+8y95eO/9xpP9jUD5T+ZFl1R1HmxCSpOufgj2P8EH2bLi0Q26nhZ3pvs+SYPK2OGNM12VzZUgxvDHQ=
X-Received: by 2002:a5b:885:: with SMTP id e5-v6mr268561ybq.180.1522062958403; 
	Mon, 26 Mar 2018 04:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 04:15:57
	-0700 (PDT)
In-Reply-To: <1522060814-13140-1-git-send-email-awais_belal@mentor.com>
References: <1522060814-13140-1-git-send-email-awais_belal@mentor.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 26 Mar 2018 13:15:57 +0200
Message-ID: <CALbNGRTFb-QQz-oj9CjBiskYdoSPoDXUnOPZ3pn7-km6L1Gm4w@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-wm: fix QA issues with composite enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 11:15:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 12:40 PM, Awais Belal <awais_belal@mentor.com> wrote:
> If we try and enable composite support using --enable-composite
> through EXTRA_OECONF the following warnings are seen
> WARNING: matchbox-wm-1.2.1-r0 do_package_qa: QA Issue: matchbox-wm rdepends on libxcomposite, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGECONFIG? [build-deps]
> WARNING: matchbox-wm-1.2.1-r0 do_package_qa: QA Issue: matchbox-wm rdepends on libxdamage, but it isn't a build dependency, missing libxdamage in DEPENDS or PACKAGECONFIG? [build-deps]
> This fixes the above mentioned warnings.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
> index 815a75f..58e21a4 100644
> --- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
> +++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
>                      file://src/wm.c;endline=21;md5=8dc9d24477d87ef5dfbc2e4927146aab"
>
>  SECTION = "x11/wm"
> -DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
> +DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes libxcomposite libxdamage"
>
>  # SRCREV tagged 1.2.2
>  SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
> --
> 2.7.4
>
Maybe I missed something but from what I read it seems you are adding
options to your EXTRA_OECONF and fix QA by adding dependencies for all
cases.

Isn't this exactly what PACKAGECONFIGs are for?

Andreas

