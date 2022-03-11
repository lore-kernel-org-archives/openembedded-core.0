Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B936C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:03:01 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.7795.1647018180350338756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pjUhMVTF;
 spf=pass (domain: gmail.com, ip: 209.85.217.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id a186so10179168vsc.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KoeRH4caXcLBRdQ1BD/lilaNEXA+av0PysYTeo0MIuY=;
        b=pjUhMVTFf0GaQPTXVpFbmoW+8X4WtNWaxFZNPK2rJLus1zng05pGEkQ534GPJvETrN
         07cjgKniDdHqjThngmos32JClM5GyQSaJMQc9wuqzp2QRTO57mbMwpL0RJV4e+5yYaZM
         G6RxJ00EVQ55hxqadhSNEnWDMXndlPXXd2Gp51KwtSoT65+1sDZ6oYjelaza5AK1QEBd
         QmteWhQ1tG19/Ob/ShO71Szqbdett4AD07HKJY1Wp+gy9PTD/t5yq7UQKq/wl5BcjIXU
         IP4cmPzyXRehiK4LyYSvijXzAx7rwVgOPK8LjLgph5PqLtBuJ5Ca3w2U8EZQDqVbtPZl
         rgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KoeRH4caXcLBRdQ1BD/lilaNEXA+av0PysYTeo0MIuY=;
        b=5/LlvJfkom67E6OmzW7v+iUMaamkjDWyp3BGXR+FEOt6nRCU7nt5MVK9oMAGH+NaSm
         nI+3uL3iBJyo3N/kNiMdaylvEj92GJ9mpeL+2wq0spt/DrX8+CJiVoAsJiFaFZ7vcH7/
         JMeqxklUaaiHsqI0Be+eEPKIv4ggM3c+tylUNwTi/gYv9hb6sfLvXh8W+hpCI6cC1ZTR
         QuLDajef9vBZcKM1+H4fylDNpNnxjRSDsvJH4pO4iAU78zfOjqok+e5taFL2U6/3gOuU
         YK4j2SY28ubYFgM0ErOwmoJ7pARUzJRXhn9vlz89I7VmsV+Vdd7Br4GoO2GqkLglwXD1
         3G7w==
X-Gm-Message-State: AOAM533g72hDDqQOPfJTIiOScZGA235RXq4WZJOgYIuCHaXOFcIzTr+d
	JBHFvmsoCaTcrXEinm+5SKywgj9LGavaKCGweek=
X-Google-Smtp-Source: 
 ABdhPJyI5JQfmQ0AZM7ijPs0sNK2OX0Wt+hVBPDmcmFnI32WmqfoeHBDwogE5nDPq8B3pbqE63r0NNVVZz8B1hYx4FI=
X-Received: by 2002:a05:6102:cce:b0:322:c483:76b2 with SMTP id
 g14-20020a0561020cce00b00322c48376b2mr1187170vst.45.1647018179314; Fri, 11
 Mar 2022 09:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
In-Reply-To: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Mar 2022 18:02:47 +0100
Message-ID: 
 <CANNYZj_xY2vzJvbiwwUWAjWvP5bh2bfyAi5MkdxAvrTO9feC9A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/2] libxml2 update
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Tony Tascioglu <tony.tascioglu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:03:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163065

Looks fine to me, thank you.

Alex

On Fri, 11 Mar 2022 at 17:59, Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> The first patch has no actual impact on generated code, so it hopefully
> can go into the upcoming release. It allows "devtool upgrade" to
> recognize that there is a newer version available.
>
> The second patch is the version bump, including a CVE fix. I do not have
> extensive test suite, so all I can say is that it compiles and seems to
> work in some light testing. Perhaps others could help test it.
>
> --
> 2.25.1
>
> Ralph Siemsen (2):
>   libxml2: move to gitlab.gnome.org
>   libxml2: update to 2.9.13
>
>  .../0002-Work-around-lxml-API-abuse.patch     | 213 ----------------
>  .../libxml2/libxml-m4-use-pkgconfig.patch     | 229 ------------------
>  .../{libxml2_2.9.12.bb => libxml2_2.9.13.bb}  |  11 +-
>  3 files changed, 5 insertions(+), 448 deletions(-)
>  delete mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
>  rename meta/recipes-core/libxml/{libxml2_2.9.12.bb => libxml2_2.9.13.bb} (91%)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163060): https://lists.openembedded.org/g/openembedded-core/message/163060
> Mute This Topic: https://lists.openembedded.org/mt/89714976/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

