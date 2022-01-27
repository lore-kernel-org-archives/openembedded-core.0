Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242F4C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 20:54:03 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.3917.1643316842357611838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 12:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DuDi+Ozm;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id s13so8773674ejy.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 12:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=mbCKuOy9/B2xOCjFaIUIo1CfGhomH/H5O+rJStodbzg=;
        b=DuDi+OzmXz68PeMK4u4an0V/cCYJ6Y+KakRhZSr+0XHtF+3QfIjkVy/rMBiUrJBT2y
         FWWQiRlNI/1JwN3Dlxr+6xLaZytlEoWDlvuGlvgSjHkEykdSP/xUY0AHkCeCIE5zi1rM
         AChGywWGBBloqA28lzmhuktAajSFvMXqpidjAGjv1fUCD1J4H124Z/h7zHoITzG2Jzk0
         yx1PzPOCM0+aZb2DJUc2A8jzQhWklc+k4mbRYPt5LV5WxbYO4dnyw78u1NWWm4MdNwUH
         skkFApXyl1Ze9MQ9MEwOcwtGeSxHj8if7xjQ2VjFEob0qQ11UoJak4yvJVNJ5ctbk2Nj
         kzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=mbCKuOy9/B2xOCjFaIUIo1CfGhomH/H5O+rJStodbzg=;
        b=T5mdF98pluH5oqlS5PGC3ADTdpdogyBKKl2uEHmFu16rbNPV8k0JCfo5Pcef1+Jr+J
         GoUAugUWj1Nliz3C4eyEm84xLO0zkFPDDq9LxI9IR8YQDHLms/dhkhW6XxQ7rAXAU9BR
         mqu9pjPtqk0dftR4TDq4naUqNZrg5WJRhijWKmBphaY13Tqdmb3VzogpSS3s2UreXp1r
         7Rvu++XOw3tGCMwIuHCPhu3vpbu4pUhlXegNR8jcmu18uCyNrHIAT5nWOy2/kj1Murqa
         qcEFVaFH5trWS+WtEYwClMlW2isTxFM9i69Xnkw+hY7LGjI7PblV3YiAor+WcoItKT8N
         AY1Q==
X-Gm-Message-State: AOAM532a2aLG5tQl6eKBstlqsFW50GrdaI3o9GXlPYxd0ASo1FonOrsQ
	d9zlBSVzpbsjyA8C815yF5M=
X-Google-Smtp-Source: 
 ABdhPJwb0j4kVAIhvfsWFPnpq+1Byc5kfCDCRsHKVMESDv5N6mjXJe4+iVKIjDOxI+Osrn3u7HgKcA==
X-Received: by 2002:a17:907:720f:: with SMTP id
 dr15mr4380819ejc.182.1643316840790;
        Thu, 27 Jan 2022 12:54:00 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id
 c25sm11969738edt.0.2022.01.27.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:54:00 -0800 (PST)
Date: Thu, 27 Jan 2022 21:53:57 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Li Wang <liwang@redhat.com>
Subject: Re: [PATCH 14/17] ltp: update 20210927 -> 20220121
Message-ID: <YfMGZYuARRuap8eW@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220127102005.3050843-1-alex@linutronix.de>
 <20220127102005.3050843-14-alex@linutronix.de>
 <YfLUpiy5XbI24E6G@pevik>
 <CANNYZj9kn2hvwdZReHyE4SH9xm4gOAQ-7dtUEjoGJ-L8ixpJaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj9kn2hvwdZReHyE4SH9xm4gOAQ-7dtUEjoGJ-L8ixpJaQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 20:54:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161055

> On Thu, 27 Jan 2022 at 18:21, Petr Vorel <petr.vorel@gmail.com> wrote:

> > Hi Alexander,

> > > The ltp compliancy parser is rewritten to actually
> > > match the logs: they seem to be unstructured, test case names
> > > are not printed and the only indication of failure is appearance of
> > > FAIL[ED] somewhere.

> > I'd split meta/lib/oeqa/utils/logparser.py change into separate commit.
> > It's not related at all to the update.


> Without this, the update would break the ltp_compliancy ptest, as it would
> cause the parser to fail.
OK. If it can work with the previous version I'd commit it separately.
But maybe it's correct this way, I understand LTP, not openembedded.

Anyway, thanks for the update.

Kind regards,
Petr

> Alex

