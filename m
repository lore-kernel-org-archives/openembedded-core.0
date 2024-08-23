Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA10C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 17:21:35 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.135.1724433690178870737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 10:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mhQPt/oO;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f040733086so20835991fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724433688; x=1725038488; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CODirUgI7jBlZm+HhjabaWfjo4baRQY23q9PzIKj74s=;
        b=mhQPt/oOlhLsJB4WqGCpcPzckmI2rZ6yGtFyOhEPGboyM3kZpkdKrKlyI6m/7epeZm
         wtSMFDo094UcC2rJmcRuCjtDymyZwU6vhI/S9oh+h4ApSqZVVnA8zPmgKa27x9dPbPMV
         6gNpPXi2RPvoyKeDhEo/R6MOt5wo7yeKinB4Iw//sNbhgY72C31x8XlAZf8YPQlkoHyL
         z+G6saudYvWBg8xon2rLVVZCWRFXgrW9d1rpXmUTvu2DVn1FBXHgh+O6RP2e9qeZ5brI
         lwd5QmMPGghFM2z8FKqJV1h0wFEtWaG4qSh7ie6Myr7RtUnLJ/iwcegsVb00c4QTCr2s
         MWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433688; x=1725038488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CODirUgI7jBlZm+HhjabaWfjo4baRQY23q9PzIKj74s=;
        b=q+h75yFwTI4Y0yFeZd9JU3R7hPTHDNUigQvfVqkx7rO5e6x+Z9fopOQElyEXgc+T4r
         3gysCxDBbKmuBBPJri2NRc6h+UIcQC/54l7w+79zXsXhTVfB/hLH3ZsD1OKP7G3UZL5A
         1IiOKo8JJj1oUQjv2cELmUSU8/AW6TFO777snPtbiR3CVQryxXFZMnWLC14F7YfMIwoa
         O+8rf/OCOXPgsiOosE/8ftUhKHZ8CwFQkRdhlHSwnkAvGNO4LNujaAq9yXgX1gscLwk+
         JAcwT8uNBAqHou4cgbj9ZkrhIdyOg+gvEKAsDw+rPtU/83tWTdzu0QKuddelse1OgCBd
         k1ZA==
X-Gm-Message-State: AOJu0YzASx8in0NN7Y+rFwFyOjYBqK7Z81Tro9etkChLMqqyhkp2vS6e
	XWYuLZcYfbkGgUhqxnkOOZy4j/PymuCb3h2YcelqM0+sZaq00/GgfZuIzaSA2YjXed0aeIiijtM
	lCvJShxeIWrRbmJIePYF52LC/vQU=
X-Google-Smtp-Source: AGHT+IEBKdDakcGj6Xrx4D+WJfqVTvnPGcikmwlq1vfyZrNAQmhrbJPiBgdDosXEnjXDQl1DZetF8XYaT7khnQ5KfNw=
X-Received: by 2002:a2e:b889:0:b0:2f3:f5fa:726 with SMTP id
 38308e7fff4ca-2f4f57aadbbmr17230491fa.46.1724433687215; Fri, 23 Aug 2024
 10:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_k-QHOXH-qEu69HTBcza1d3zge6LQkH5JmbxWYmyJVtw@mail.gmail.com>
 <5008.1724433479274681997@lists.openembedded.org>
In-Reply-To: <5008.1724433479274681997@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Aug 2024 19:21:15 +0200
Message-ID: <CANNYZj_ti=Rqf=S9Ry9XmPJ9ninYuh42-j8MRzpfgL8botSsKA@mail.gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH] wpa-supplicant: Upgrade 2.10
 -> 2.11
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 17:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203704

The stable branch policy isn't about API/ABI compatibility, it's
rather about whether a new release has new features or only bugfixes.
If there are new features it is not eligible.

Alex

On Fri, 23 Aug 2024 at 19:18, Siddharth Doshi via
lists.openembedded.org <sdoshi=mvista.com@lists.openembedded.org>
wrote:
>
> Hi Randy and Alex,
>
> I appreciate the feedback and your concern regarding upgrades in stable-branches.
>
>
> This update make sense for the master brnanch but likely not for scarthgap unless you can show that
> this is a bug fix only release.
>
> - This release for sure is not a bug fix only release. It does include support to new feature and can never classify as  bug fix only release.
>
> you'll have to backport any CVE fixes that you're interested in unless
> someone explains why this is a sensible update for scarthgap.
>
>
> - I do the understand that upgrades are avoided in stable/LTS branches as it might break the compatibility and result in various compilation issues.
> - However, that would only take place if the backward compatibility of the new upgrade is questionable.
> - Generally every new releases will have API or ABI-symbols added but if API or ABI symbols are removed from shared libraries or binaries it a matter of concern as it would be the cause of breakdown.
> - For this release, there are no ABI-symbols or API removed from the binaries and shared libraries. you can cross-check it in different ways (there are open-source tools to check or can be checked by manually comparing the header files)
> - I have my own script to do so and i always check the backward compatibility before submitting any upgrades and since it was all clear for wpa-supplicant, i went ahead with the upgrade.
>
> However, if still the opinion is that upgrade should be avoided, let me know, i would submit the CVE-patch for the same.
>
> Regards,
> Siddharth
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203703): https://lists.openembedded.org/g/openembedded-core/message/203703
> Mute This Topic: https://lists.openembedded.org/mt/108040776/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

