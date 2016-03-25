Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4D965D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 02:49:47 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p130so27540583qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 19:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UTrRbPBKajU+6nzp5GWZ9bEKYlTHoRaz0VD2ZFQK+fI=;
	b=NAQhL37SIrhSTcSOh8wGqGENx1fCSPfkvP6O1exOuNoJ3fq4mhI4iiWZrVgNn6jy0l
	81mnJisq+55SZJZxiE2QMZDIxfpv8g/mYoqkoyetq+8hA60L7kfSPRL52l4Sn/lqszoH
	V+7uyPnNTf7AbWkTyx5hAXT7LUeT+Do1TL8LiYgLt5/vMp8xK8ReonifUNSFLSDeC/vQ
	xxv3OtUtoibmeP/+6lK2KfdCPP252bkvyt5Oda8I7v/k6k5ZFQs/VVqZvM3SoBmfMq93
	9y32THBK38cCDZvDHmWxKStCU3b7M2MwSxs38i3y00jaVy9+MFrpLmt7cMWEOUM24Yub
	WkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UTrRbPBKajU+6nzp5GWZ9bEKYlTHoRaz0VD2ZFQK+fI=;
	b=VwsqKNTrrg3NG7P7sdcru/UD4aINaLC+cuwxqjeqxob8F1413gy2+vq2GZxygXBIS5
	No1mnvF4S3hCiRx4MYBnLpDW+8U9bKzE2zA7Y2RvW4l4cP/bYBsYo6ZcX8jGrPYq15XS
	VEB/D37AdOjesblNS+JC3RZaRRlYEolwUEp1Y+b8l34csLL9lcpQMAOrRJuvXBnGznl1
	KJGpRIkpiv4BQ3S8xURf6MO05ywHVBHzPX7OB/s6xyc3vxITXu0bSBTqPFjT80y3issu
	wJAnFTBLyCMcyZUU4k5r6jIXtKY3KP0jnGPNKBEA6CxjSm9fQjzpU5e4ZeREh7t6FX7M
	jVIA==
X-Gm-Message-State: AD7BkJLIjYQYmEoozewi7M3pCmKd5/+8fZ8ElWqTAsZQmdHQvAzZeSwu2iclXMVinhLvXdZNdK8ezXQ58xd0gA==
X-Received: by 10.55.78.70 with SMTP id c67mr14582188qkb.37.1458874188546;
	Thu, 24 Mar 2016 19:49:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 24 Mar 2016 19:49:19 -0700 (PDT)
In-Reply-To: <1458688681-31394-4-git-send-email-brad.mouring@ni.com>
References: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
	<1458688681-31394-4-git-send-email-brad.mouring@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2016 19:49:19 -0700
Message-ID: <CAMKF1soesfy2EcTF0thf9DeVandbn7aFtmd+vXqNf02QQ5Neng@mail.gmail.com>
To: Brad Mouring <brad.mouring@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] busybox-git: Backport patch to fix zcip false-conflict
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
X-List-Received-Date: Fri, 25 Mar 2016 02:49:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 22, 2016 at 4:18 PM, Brad Mouring <brad.mouring@ni.com> wrote:
> Busybox upstream fixed the issue where an incorrect comparison of
> addresses led to bogus renegotiation of a new ll ip in 1.24. Backport
> this change to the -git recipe.
>
> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> ---
>  meta/recipes-core/busybox/busybox_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
> index 47c1364..11c390e 100644
> --- a/meta/recipes-core/busybox/busybox_git.bb
> +++ b/meta/recipes-core/busybox/busybox_git.bb
> @@ -34,6 +34,7 @@ SRC_URI = "git://busybox.net/busybox.git;branch=1_23_stable \
>             file://inetd.conf \
>             file://inetd \
>             file://login-utilities.cfg \
> +           file://0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch \
>  "

just bump up the SRCREV past that commit.

>
>  EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
> --
> 2.7.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

