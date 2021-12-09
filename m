Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F39C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:33:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.14944.1639071209136394176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T0VMMqU4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id c4so10943263wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=A+xhDjbPVjjck8WTOY8Oq1o9Zy4LVqCiTtqitVubVW4=;
        b=T0VMMqU4dOWSsmu4ZfurNsZtJjZ4gQlm2HCD+NlMRnzgOKxTZniVV6Lrn5WXQghQUu
         w2tkGvCabijEAq2c+qPLqFWY0yof2EpnNgy0QYSra6pZ+h2JdvQI9Z0e+iSSKozw72ad
         va6NuU1d+xy15nuDJehut1fZVzg6XeKUni/0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=A+xhDjbPVjjck8WTOY8Oq1o9Zy4LVqCiTtqitVubVW4=;
        b=wXBB/ylDLHodw7SYshH+kFnsjak4RH8BwzyX5B7pTtupK6koMNiBaO/g2LQfx3UxhA
         N8TKa+X1Gz9irea0tjRhkHpR35+K7hGZkbjSHGPhiulL+qUUt4rIyWnfsSk05Yhan9Fv
         lTvU+ZTd0boBpzVfbmcGGYQS+qNwHTT6P101HZOxgck6qD5QHQliH5idH4S08iS9IBjv
         sfLyk2lJOvj2OXlbN+eCucemrQNQ0H0uk8WcZTf+yFmzgxc64sj2aL6RQOtKhf2mP3Fk
         SW2wti9kSiqcYh9cXtG5fushtOsuocFOOlIiGkobH0C8HXwB5uLkho0H3Bm1Wai/mfz7
         CWYg==
X-Gm-Message-State: AOAM530L7/5eII4fLSHnyftZoY/BLAVgIjZkCUNVLiyIelH/iAtDhLky
	RHWTBklgQQeQv+/5gz3XXJ7UAA==
X-Google-Smtp-Source: 
 ABdhPJyhR++FmeVcdcMvVBhK/2P9mwKNfuvXds5aUymAdOiYa05ze8MvIQyk/2AR51/rBoXiXoAlew==
X-Received: by 2002:a5d:54c6:: with SMTP id x6mr8193921wrv.513.1639071207212;
        Thu, 09 Dec 2021 09:33:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb2b:2e37:1385:897e?
 ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id
 j18sm12272112wmq.44.2021.12.09.09.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:33:26 -0800 (PST)
Message-ID: 
 <e0e27f0087ea5381d3e0fa4c9313841a2f3e18c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] binutils: Add more detail to the ppc patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Dec 2021 17:33:25 +0000
In-Reply-To: 
 <CAMKF1sqMKEK5M891-7g0WN0HFVYRC7ZpV0vfr5nZmMEyShxOqw@mail.gmail.com>
References: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
	 <20211209172537.641755-2-richard.purdie@linuxfoundation.org>
	 <CAMKF1sqMKEK5M891-7g0WN0HFVYRC7ZpV0vfr5nZmMEyShxOqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:33:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159472

On Thu, 2021-12-09 at 09:31 -0800, Khem Raj wrote:
> On Thu, Dec 9, 2021 at 9:25 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > This adds useful detail from the orginal commit.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  ...1-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> > index 389232c1e3e..a271f55ea1a 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> > @@ -3,6 +3,10 @@ From: Zhenhua Luo <zhenhua.luo@nxp.com>
> >  Date: Sat, 11 Jun 2016 22:08:29 -0500
> >  Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> > 
> > +The wait mnemonic for ppc targets is incorrectly assembled into 0x7c00003c due
> > +to duplicated address definition with waitasec instruction. The issue causes
> > +kernel boot calltrace for ppc targets when wait instruction is executed.
> 
> This patch bothers me a bit. This either is upstream bug or it is not.
> So it should be perhaps forwarded upstream and if it is still needed
> and accepted that will be good.
> otherwise we should drop it.

Yes, that is why I wanted to add the description as it helps with the context
and a specific test. I think we need to clean up a few of the binutils patches
and share with upstream, see what is said, this is one of them.

I obviously saw others I thought we should remove for various reasons :)

Cheers,

Richard


