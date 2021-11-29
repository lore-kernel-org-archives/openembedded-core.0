Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CF1C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 11:09:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.59678.1638184197977669893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 03:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=w0J/QYqb;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id s13so35962225wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 03:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5mnb/K3WRKSLKjFedVsRiuvTa88dNsvZTiE8USSZbk=;
        b=w0J/QYqbDxSY0uKqHRZpRXCouRRXwZUQOtq4741w2GxpbzDA0Wo7QVymvHYgteUlC6
         B9nBJZn9Wt5IUSc7YWreHs2Jkfa+/Xp2aFcr0GsrvdYBnW1rEcw0DSDZiQWEZWH74aln
         Mt5SBKqRTkUd/A2Z2pz5ZQ1R+ZB7y6+lDyR0k+l7MJyHa4LaMJG8c79Y/QmclkYi0P1g
         yHjfKsnWw3oKJX4hdHhm8JKWP+u8Dg54ELI53ICRs1Hr95dh7sh3PNWNvOEtDDOlzeFD
         JW1cGjENXHPwj2pI2o1uGnaOjuiTTCCHpvrckoIvqbe/pD+X6Drr2FC2oiQVVWmTuI2c
         UQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5mnb/K3WRKSLKjFedVsRiuvTa88dNsvZTiE8USSZbk=;
        b=nWuvWLYy92Q5f0oMZwtHSXR2n9TFuvQDogVCklkGR3bjqR5jwN3nsXx4NrN4E2hUbp
         HbVgps6+d1pXzS6PFt2R9WO3pPEHJGfT72NKisFgtKjIXyrQaRCrvMRSxVxroTBJPReT
         sQA88vd8ICrl9NEJEcXyVXpzK+IHJWSiUGc4ENtPmb80bzlJnCtdxIJJZiD15OziWZH0
         qyTgqc02i1CQS4FM6tltGtrhLPEND5c/sxVSctF63ggDBNzfi9R0LbDAgS0k6b4aaYeH
         GaUbDVdUKA7NjYlMiuWJiWn9GlHuD+c+XLtMzMzAz+D7QSrVnGaNlkY9FG/md1xB8xkB
         aVQA==
X-Gm-Message-State: AOAM530FjWddQxfn+5g6hb2Hen/CLbKzel1YA44g235Kxb/pKx6hnSR6
	swHK8Xdk3/cDuZPLdVu7ipoJyWaJi1oraRjZqjn18Q==
X-Google-Smtp-Source: 
 ABdhPJxzzrHCxSUCRvbxEreqTCERhB6UaJpBO0rXLud4EwXD9RTIuCzIFTh5y6kM/jZvh2e2FZdSkfqSjn6suGFRUoc=
X-Received: by 2002:adf:fe81:: with SMTP id l1mr33838262wrr.522.1638184196196;
 Mon, 29 Nov 2021 03:09:56 -0800 (PST)
MIME-Version: 1.0
References: 
 <CALQfBwyaboT35pkQHjhXVDrFy9+VbX6c19vcfZdQaz4TR_-NKg@mail.gmail.com>
In-Reply-To: 
 <CALQfBwyaboT35pkQHjhXVDrFy9+VbX6c19vcfZdQaz4TR_-NKg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 29 Nov 2021 11:09:45 +0000
Message-ID: 
 <CAAnfSTtHTHKRCmqspHUUCDNH2kRutC-0C_5Zk=HMAAWE7wEn7g@mail.gmail.com>
Subject: Re: [OE-core] bug#11131: Email Address Check
To: Dhruva Gole <goledhruva@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 11:09:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158937

On Mon, 29 Nov 2021 at 06:18, Dhruva Gole <goledhruva@gmail.com> wrote:
> I am currently writing a patch to address the bug, in which I have so far done the maintainer and patch strings check in READMe.
> However I had doubts on how the community would like me to implement the email address checker.
> One way is:
> I referred to this: https://stackoverflow.com/questions/8022530/how-to-check-for-valid-email-address/28982264#28982264 and found the following code could be useful:
>
> from validate_email import validate_email
> is_valid = validate_email(email_address='example@example.com', \
>     check_regex=True, check_mx=True, \
>     from_address='my@from.addr.ess', helo_host='my.host.name', \
>     smtp_timeout=10, dns_timeout=10, use_blacklist=True)
>
> Other way: (simple check)
> is to just use the python re library as given here: https://www.geeksforgeeks.org/check-if-email-address-valid-or-not-in-python/
>
> Please let me know which approach would be preferred.

A simple RE would be best.  Don't try to validate every address with
SMTP, and don't try to be too clever with the RE: false positives are
better than false negatives.

Pretty sure the RE linked there is too strict and assumes that
top-level domains can't have email, which isn't the case.  Fun
internet fact: the .tt top-level domain (for Trinidad and Tobago)
accepts mails (it has MX records), so t@tt could be a valid email
address.

Ross

