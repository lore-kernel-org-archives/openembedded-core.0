Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FF0C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 12:20:52 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.29272.1647865251367095636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 05:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l4LeiXCP;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id c15so19538346ljr.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZI9UyrIoj/g5nYAS3gi7Gq2cMl89htAkaS8SIcBYHP0=;
        b=l4LeiXCP74J10+Lm5uGOOfvz6krmKSaY8nvsXRjTGC3/vmXULNvozDv2MqvM60woDU
         BITCVrzxL3Q4zZRsr445xUDjw2V8zM3i2a7x3PBFICTpcnWxYFM6a7viuI+0D9TPIY5i
         DFdHRBZE8lRvyXco+Pnka8nszlNX8c4fVTXKQrr3DVaruj/al8KPL+ocWh48SwSegGnx
         +EW+TyZEwhXcChnpAVXjM5SPnBnu3cBkEaNQTnen75ehw/DT4C9N9l+uFA9MVvN60A/L
         m2V0+8f8nsdmTExZvhU+tUo4zvElgNtk5RRIZzPavpMFenpGDYqIhoOkycv/2Ui6krpv
         4CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZI9UyrIoj/g5nYAS3gi7Gq2cMl89htAkaS8SIcBYHP0=;
        b=COf0CcbSM/mWU53H6m0se5F8mZabTmFE2mIEG0P+IRQi1M5zVK4VbkxAgKrcAxScLL
         80mSFeuDnK0KVRwN3OmPjbmBvEWpm13m6SavBTnLWUJoZReHBw0O1uNpeYf4VMtSybCe
         upkSgpHbOaumPus5WEiU81LcskTqIFTPsULJz9uVwQBJ8Oe6fAY38iBukxLSsK7Rjxy3
         b6rg2ljxYndAps+z9/AYel8QYa/AaakH1enyYM9Uogj8Ybk/pOO1hLBbq8dE2srCJv0Z
         /xKxUR6xqUq8UQQN4E5S8yNQ3UAO9zapakuw/ksYdklY0+dtD9iIGA3I5RRQdqYCewJ7
         SSIA==
X-Gm-Message-State: AOAM533cI/977+c/E+iqZ6CO24PHq/zE/Awi3ZCk1QBsw3jLobm3RZMq
	ygiP2MP9kgg78eTzVutnppGj9CCAZMeQb1xUHDU=
X-Google-Smtp-Source: 
 ABdhPJw6VR6hu/HEpSnHMrkeZiCYhbjScooNUrXZuGcGdKQqn50PDv7d1RowQL5taG6UK6EsfbEdfZNUBqt+Dfh/tmQ=
X-Received: by 2002:a2e:9d88:0:b0:247:fd40:a321 with SMTP id
 c8-20020a2e9d88000000b00247fd40a321mr14862082ljj.62.1647865249518; Mon, 21
 Mar 2022 05:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 21 Mar 2022 13:20:37 +0100
Message-ID: 
 <CAApg2=Qf4dLOJtW4TEjScSNuEOYrB5Gvc+ooxBZ3vcLH27Ku=Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to help
 monitor kernel CVEs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 12:20:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163500

On Sat, Mar 19, 2022 at 8:26 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This adds support for a random kernel CVE monitoring tool which can be
> run as a specific task against a kernel:
>
> $ bitbake linux-yocto -c checkcves
> [...]
> Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 135 (100% match, 100% complete)
> NOTE: Executing Tasks
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for be80a1d3f9dbe5aee79a325964f7037fe2d92f30:CVE-2021-4204 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 20b2aff4bc15bda809f994761d5719827d66c0b4:CVE-2022-0500 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 55749769fe608fa3f4a075e42e89d237c8e37637:CVE-2021-4095 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 4fbcc1a4cb20fe26ad0225679c536c80f1648221:CVE-2022-26490 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for dbbf2d1e4077bab0c65ece2765d3fc69cf7d610f:CVE-2019-15239 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 89f3594d0de58e8a57d92d497dea9fee3d4b9cda:CVE-2022-24958 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 1bfba2f4270c64c912756fc76621bbce959ddf2e:CVE-2020-25220 (NOT FOR THIS VERSION)
> NOTE: Tasks Summary: Attempted 627 tasks of which 626 didn't need to be rerun and all succeeded.
>
> Posted as an RFC to see what people think of this. I make no claims
> on how useful it is/isn't but wanted to show integration isn't difficult
> and provide some inspiration for ideas.
>
> Details on the tool in question: https://github.com/madisongh/kernel-cve-tool
>
> I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

Thanks for posting the patch. Apart from the discussion about cherry-pick
vs updating, here are my two comments:
1. For all such tools I would really prefer machine-readable output format,
so we can parse it, generate reports etc.
2. The tool itself works only if the kernel history is included in the vendor's
tree, they say in the README:
    Note that the script assumes that your branch is derived from one of the
    existing stable kernel labels (e.g., 'v4.9') - in other words, it
must contain
    commits from one of the linux-X.Y branches in the stable repository, and
    have other commits added it to it.

It means that there are cases when it doesn't work - especially when the
vendor cherry-picked commits or imported all the kernel as one commit.

I find it useful as another source of information in addition to the NVD
database. It would allow correlation of the two and possibly limit mismatches.
However, I can already see that the last commit is 2 weeks ago,
so data might be outdated.

Regards,
Marta

