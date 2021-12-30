Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB65DC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 18:55:02 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.1894.1640890501236860885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 10:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f/yDq/ET;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id p7so41255690ljj.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 10:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=DZ5o0JsHj91ky56slTj/Ii8oy2edAjy//KMvVHFZsJ8=;
        b=f/yDq/ETuJA7h7aqJiSwutTOzZnubwAh6/eqZS6TvKEmFnbzr6xAOp1R0ffkWPgvZV
         PLlIONZAJ5LF+DOzHzOePvdJe5ikdMNDcuN0gU+cCWVYlf2g97NYgePPkNiJYX2+4Hqy
         jtAGojPcogjvfSHMaqO9AeTIStqcwCiz0DJN3ZKjX0awfxihevhqC0ZTjNp4bpl1UxYz
         HtnKSBqEgfqgi3ilQ81QyV6tfh0hmkCZiFSnGvjgq0VBiIWW/tTZG38ihCNBtdwlT8Mm
         SD9BD6uYSzjqLYrPynBUa+gc5OEQHoKYYxFtf060/HWWGS7DxOKZi7fcN+LH0orkc2lG
         f82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DZ5o0JsHj91ky56slTj/Ii8oy2edAjy//KMvVHFZsJ8=;
        b=5S+t/tfdcBtxlrFZpj5TS5mEu0aaPyHpG+dpsMZCqaDiUgEeygzKXs3brvooGDBkWk
         yX66NMk+1/sUXfYy8wUKsFrbh8VSpSu+zc4HcsFHdW0dxgomCLTea2brKODqDtM6Ti/m
         qQYPzpnADdJ5R+w5+pezOebzGcOSWirKH8NTIDoXTeNh6lyJAPrj4s45f5kYTmD7cOfc
         3auKu3NlumtLW6sVoqFoF1pFC4AhPj8mpP/wNvqp99jt9gsjM1Kq352zARqsQKxTjSFl
         MpHetHdGA7j89k03N+el/i/7rYMgj0O+olRZQYMMxQu41al7eBDzXCDHP4D18CZpvGP9
         YAiA==
X-Gm-Message-State: AOAM532jLrOphTWFbnn39P35rZSbCg5bQZXbEDRVi2hxAvqB8hZ7O5kh
	IAxbiNG+fk97QsFRKZ2Jf9k=
X-Google-Smtp-Source: 
 ABdhPJyUOuA0b6uJS+pUxXA83bd9KsWWoZ5aaGH0jpZYw5UJVHYqRtQPsAzQq4m7jsbzT4qyI8N0Og==
X-Received: by 2002:a2e:83cd:: with SMTP id
 s13mr25008026ljh.178.1640890499283;
        Thu, 30 Dec 2021 10:54:59 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 bq10sm172453lfb.199.2021.12.30.10.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 10:54:58 -0800 (PST)
Message-ID: <4f71652d-7857-7513-9add-fca8621231cd@gmail.com>
Date: Thu, 30 Dec 2021 19:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core][dunfell 02/14] openssh: Fix CVE-2021-41617
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1640181998.git.steve@sakoman.com>
 <a4e272700e18ca7e86e24ce4e24031ce7745c87b.1640181998.git.steve@sakoman.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <a4e272700e18ca7e86e24ce4e24031ce7745c87b.1640181998.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 18:55:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160063

On 12/22/21 15:12, Steve Sakoman wrote:
> From: sana kazi <sanakazisk19@gmail.com>
> 
> Add patch to fix CVE-2021-41617
> Link: https://bugzilla.suse.com/attachment.cgi?id=854015
> 
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../openssh/openssh/CVE-2021-41617.patch      | 52 +++++++++++++++++++
>  .../openssh/openssh_8.2p1.bb                  |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> new file mode 100644
> index 0000000000..bda896f581
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> @@ -0,0 +1,52 @@
> +From a6414400ec94a17871081f7df24f910a6ee01b8b Mon Sep 17 00:00:00 2001
> +From: Ali Abdallah <aabdallah@suse.de>
> +Date: Wed, 24 Nov 2021 13:33:39 +0100
> +Subject: [PATCH] CVE-2021-41617 fix
> +
> +backport of the following two upstream commits
> +
> +f3cbe43e28fe71427d41cfe3a17125b972710455
> +bf944e3794eff5413f2df1ef37cddf96918c6bde
> +
> +CVE-2021-41617 failed to correctly initialise supplemental groups
> +when executing an AuthorizedKeysCommand or AuthorizedPrincipalsCommand,
> +where a AuthorizedKeysCommandUser or AuthorizedPrincipalsCommandUser
> +directive has been set to run the command as a different user. Instead
> +these commands would inherit the groups that sshd(8) was started with.
> +---
> + auth.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +CVE: CVE-2021-41617
> +Upstream-Status: Backport [https://bugzilla.suse.com/attachment.cgi?id=854015]
> +Comment: No change in any hunk
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +diff --git a/auth.c b/auth.c
> +index 163038f..a47b267 100644
> +--- a/auth.c
> ++++ b/auth.c
> +@@ -52,6 +52,7 @@
> + #include <limits.h>
> + #include <netdb.h>
> + #include <time.h>
> ++#include <grp.h>
> + 
> + #include "xmalloc.h"
> + #include "match.h"
> +@@ -851,6 +852,13 @@ subprocess(const char *tag, struct passwd *pw, const char *command,
> + 		}
> + 		closefrom(STDERR_FILENO + 1);
> + 
> ++		if (geteuid() == 0 &&
> ++		    initgroups(pw->pw_name, pw->pw_gid) == -1) {
> ++			error("%s: initgroups(%s, %u): %s", tag,
> ++			    pw->pw_name, (u_int)pw->pw_gid, strerror(errno));
> ++			_exit(1);
> ++		}
> ++
> + 		/* Don't use permanently_set_uid() here to avoid fatal() */
> + 		if (setresgid(pw->pw_gid, pw->pw_gid, pw->pw_gid) == -1) {
> + 			error("%s: setresgid %u: %s", tag, (u_int)pw->pw_gid,
> +-- 
> +2.26.2
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> index b60d1a6bd4..e903ec487d 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> @@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://add-test-support-for-busybox.patch \
>             file://CVE-2020-14145.patch \
>             file://CVE-2021-28041.patch \
> +           file://CVE-2021-41617.patch \
>             "
>  SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
>  SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159947): https://lists.openembedded.org/g/openembedded-core/message/159947
> Mute This Topic: https://lists.openembedded.org/mt/87898179/4454410
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jacob.kroon@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

I would have expected this patch to leave a mark in my buildhistory, but
nothing related to openssh(d) shows up.

Size of /usr/sbin/sshd stays the same, which at least to me is a little
odd.. but I can see that the sha256sum output of sshd changes.

(It would be nice to have sha256sum hashes of files in buildhistory)

Am I the only one who thinks this is a little strange ?

/Jacob

