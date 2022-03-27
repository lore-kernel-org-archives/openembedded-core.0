Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA117C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 19:37:41 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.2688.1648409860276452260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 12:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PnDP1TIQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id h196so9919437qke.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJWz3JvRLKle/TkSS/had0tbAWhBrtrwN3HYAfxHWbE=;
        b=PnDP1TIQy7P0Y9+0C1s+DcRopVWpbVa/8uL8Mc4ZBQpRKBnbSlxSvaHI9YiU9eUC1+
         wwQOdr1J2yxSBbanCBNiHbCZ8KlGgUo9DEx/HFeo7qDVfXQP2kVcyZDZgdj9nx/m00tE
         lmtuZBs6yU4cF8c6UNmk6vF16NzW+FWEglBqJGjC3mYC6zDYp1yheRSbRJVeJbgTMTct
         YT0004vRhKDVmtonEt6oW0RGZgYxXyWfcVLKgi2WofBHdM84vK+vb3P3e5GNSgqP4Rb2
         oglnUdDdlzHnbYbGX9YDTgF9E7jKRaHAA9EASSr/oIu+UMUQ9YlAvnE8peqNbbQ3gMi/
         G4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJWz3JvRLKle/TkSS/had0tbAWhBrtrwN3HYAfxHWbE=;
        b=5Q1kvJ++PKopnzlGSa9R8Jiibi3u+OsFibmPMIzpM7nrB+ib+f/Vzj3P1wwDuK5UL5
         RD+x1P/DLFbDcg96xbTNmARaOgWZWGx2dTnM/bbnR6AEZS8YciZDiqpNYYHrwVO5U4Qz
         HpX6xJvIPVBqnlnk00FJLVY0bqXfjJKtS+XRqhH4pkMAeRZKYujO0y4pAjqDEIY39Ske
         JpdnUaqnmao00NCtEYStqKw1qy5M0lB0vALOQTPf+RuF2akjHZXpzzW/cPThvGVu5fk3
         3qBqCkmeIkRpDvgV0sDhV3wGbxGZsSk+zn0fTkEvKqKTff9cv6uMYtRD1+nDTA3WwQp4
         At4Q==
X-Gm-Message-State: AOAM530jQHVfiHPuu1vcC4h5Sx2KEw3EDEVyopNAEzW5x+Pz0aKuyd/A
	t+q/Ei27x15nsSSEyMdiuBymoAvwOKCCMRToqU4=
X-Google-Smtp-Source: 
 ABdhPJz0fkYbQklRBj61wccvJLxlQilnKyN86bB+27KljDZYgMiV+EI60MxqHsDNdg2C7B2t2TJcKjMkAhoop+cVx4o=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr13784528qko.72.1648409859363; Sun, 27
 Mar 2022 12:37:39 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAAnfSTtfH14DNySVhDGYp76OH84TZ8EdZMTT5X_Sn_-gogjCGA@mail.gmail.com>
 <15514.1648407457453010645@lists.openembedded.org>
In-Reply-To: <15514.1648407457453010645@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Mar 2022 12:37:13 -0700
Message-ID: 
 <CAMKF1srZDT6miAx7_k4MbaPhCUuk97dttJvrPWSMmZpFytxBxA@mail.gmail.com>
Subject: Re: [OE-core] Proposal to change the SRC_URI source reference of
 neard package.
To: Rahul Chauhan <rahulchauhankitps@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 19:37:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163681

On Sun, Mar 27, 2022 at 11:57 AM Rahul Chauhan
<rahulchauhankitps@gmail.com> wrote:
>
> Dear Ross,
>
> Thanks For your Quick response.
>
> As per your Recommendation, I have sent a mail to "linux-nfc@lists.01.org" and inform that below tarball is incomplete.
> https://cdn.kernel.org/pub/linux/network/nfc/neard-0.16.tar.gz
>
> and request, to upload the correct tarball or is there any specific reason of the missing files.
>
> If you are okay, I will release a patch to do a proper git clone instead of fetching tarball until tarball is fixed.
>

If beard is doesnot release tarballs then switching to git clone is ok.

> Please confirm!
>
> Thanks & Regards
> Rahul Kumar
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163679): https://lists.openembedded.org/g/openembedded-core/message/163679
> Mute This Topic: https://lists.openembedded.org/mt/90058043/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

