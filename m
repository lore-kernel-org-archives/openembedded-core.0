Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4093DC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 19:04:23 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.2061.1640891062438245351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 11:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJCkKzi5;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id i11so29594450ljm.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 11:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Ea6oM/5w5jpeFhD5cThT/wF0lgQO4lijNurx6Bly5/g=;
        b=MJCkKzi5RxXd83L1EheAJIC5bLNLOE3VHmhgjuQvmFDIkrYkdukEYKFsE6FbbmeiMK
         cRl/GqtXUZKTedk9EKqu+rXsMm+0F026NuXJI1mayA3wGEU5cTo382qU6TusT1WdrLDe
         oSB3V6edLjSX0aQyRwGmkJ98x8YERG1Ke6hyXTfLonniDl5HtMSzyZ6gmbuv8b25YCLF
         BYvZf5uB1rbFiLS6OzBhVcNQ9DIbBGJriZjqzHtJhj3ESqBPbj8J+pTRTxUEzW9bVpZq
         MdV5VBaUmJqfYorBQbEifiI3UDgrbphMSIoSwzhdu+GJuu1ZMHXlvCcVXnmlS8Y/isxo
         fEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ea6oM/5w5jpeFhD5cThT/wF0lgQO4lijNurx6Bly5/g=;
        b=Xphuuumupdgk3cb/Q4AaITLyeOO8saezID8jHWZHWrGMT+vieg2WeB34gQGFUZc3fe
         MBDcfmnOFXOAhMD+R6rmjA4RY/KDklh6k9YDpb9croqj++FLNitGjVq3ftdCA0xvlH8W
         2X1OMFUdZKgVquaGOmb3H18OwV+ii/MiKJIQxwFuF0XJ/4lYjD6U96A9oYf83klMNgQI
         kkbKWrmrCyFoNR8NwYp79kQAF7e+IrLNsESKorGe+pvwpQwYTHdxsQBZzPh0yk9XxlOx
         RpeYwBc/7RnkYzit8SXfS9O7vLxE5dyKNnqCPtWCMF8AYHUb5arwbKduvo4AxDHK6FaP
         GjpA==
X-Gm-Message-State: AOAM532MSmSCpQX+8jWu5GuLb8k6a+PYLFuoUXKO4a1pDL8erSbLQZLS
	EKdSoodBP5L9cvFntOPNNcw=
X-Google-Smtp-Source: 
 ABdhPJwRbS/pZWS4f9IH8ALl7cQlDLEGmPOZniEYi9pV5dnFCrHTJ2aIybMLJjTw1tjpgAPUazVqUw==
X-Received: by 2002:a2e:9056:: with SMTP id
 n22mr24137743ljg.423.1640891060501;
        Thu, 30 Dec 2021 11:04:20 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 cf18sm2550300lfb.251.2021.12.30.11.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 11:04:20 -0800 (PST)
Message-ID: <6cf463b6-6612-cac1-80ef-93ce21d9e211@gmail.com>
Date: Thu, 30 Dec 2021 20:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core][dunfell 02/14] openssh: Fix CVE-2021-41617
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1640181998.git.steve@sakoman.com>
 <a4e272700e18ca7e86e24ce4e24031ce7745c87b.1640181998.git.steve@sakoman.com>
 <16C59D37B8124AF8.22808@lists.openembedded.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <16C59D37B8124AF8.22808@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 19:04:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160064

On 12/30/21 19:54, Jacob Kroon via lists.openembedded.org wrote:
> On 12/22/21 15:12, Steve Sakoman wrote:
>> From: sana kazi <sanakazisk19@gmail.com>
>>
>> Add patch to fix CVE-2021-41617
>> Link: https://bugzilla.suse.com/attachment.cgi?id=854015
>>
>> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
>> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  .../openssh/openssh/CVE-2021-41617.patch      | 52 +++++++++++++++++++
>>  .../openssh/openssh_8.2p1.bb                  |  1 +
>>  2 files changed, 53 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
>> new file mode 100644
>> index 0000000000..bda896f581
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
>> @@ -0,0 +1,52 @@
>> +From a6414400ec94a17871081f7df24f910a6ee01b8b Mon Sep 17 00:00:00 2001
>> +From: Ali Abdallah <aabdallah@suse.de>
>> +Date: Wed, 24 Nov 2021 13:33:39 +0100
>> +Subject: [PATCH] CVE-2021-41617 fix
>> +
>> +backport of the following two upstream commits
>> +
>> +f3cbe43e28fe71427d41cfe3a17125b972710455
>> +bf944e3794eff5413f2df1ef37cddf96918c6bde
>> +
>> +CVE-2021-41617 failed to correctly initialise supplemental groups
>> +when executing an AuthorizedKeysCommand or AuthorizedPrincipalsCommand,
>> +where a AuthorizedKeysCommandUser or AuthorizedPrincipalsCommandUser
>> +directive has been set to run the command as a different user. Instead
>> +these commands would inherit the groups that sshd(8) was started with.
>> +---
>> + auth.c | 8 ++++++++
>> + 1 file changed, 8 insertions(+)
>> +
>> +CVE: CVE-2021-41617
>> +Upstream-Status: Backport [https://bugzilla.suse.com/attachment.cgi?id=854015]
>> +Comment: No change in any hunk
>> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
>> +
>> +diff --git a/auth.c b/auth.c
>> +index 163038f..a47b267 100644
>> +--- a/auth.c
>> ++++ b/auth.c
>> +@@ -52,6 +52,7 @@
>> + #include <limits.h>
>> + #include <netdb.h>
>> + #include <time.h>
>> ++#include <grp.h>
>> + 
>> + #include "xmalloc.h"
>> + #include "match.h"
>> +@@ -851,6 +852,13 @@ subprocess(const char *tag, struct passwd *pw, const char *command,
>> + 		}
>> + 		closefrom(STDERR_FILENO + 1);
>> + 
>> ++		if (geteuid() == 0 &&
>> ++		    initgroups(pw->pw_name, pw->pw_gid) == -1) {
>> ++			error("%s: initgroups(%s, %u): %s", tag,
>> ++			    pw->pw_name, (u_int)pw->pw_gid, strerror(errno));
>> ++			_exit(1);
>> ++		}
>> ++
>> + 		/* Don't use permanently_set_uid() here to avoid fatal() */
>> + 		if (setresgid(pw->pw_gid, pw->pw_gid, pw->pw_gid) == -1) {
>> + 			error("%s: setresgid %u: %s", tag, (u_int)pw->pw_gid,
>> +-- 
>> +2.26.2
>> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
>> index b60d1a6bd4..e903ec487d 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
>> @@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>>             file://add-test-support-for-busybox.patch \
>>             file://CVE-2020-14145.patch \
>>             file://CVE-2021-28041.patch \
>> +           file://CVE-2021-41617.patch \
>>             "
>>  SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
>>  SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
>>
>>
>>
>>
>>
> 
> I would have expected this patch to leave a mark in my buildhistory, but
> nothing related to openssh(d) shows up.
> 
> Size of /usr/sbin/sshd stays the same, which at least to me is a little
> odd.. but I can see that the sha256sum output of sshd changes.
> 
> (It would be nice to have sha256sum hashes of files in buildhistory)
> 
> Am I the only one who thinks this is a little strange ?
> 
> /Jacob
> 

Let me rephrase, I do see changes related to debug information and the
debug package, but no change in the resulting '/usr/sbin/sshd' size that
goes in the final image.

/Jacob

