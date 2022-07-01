Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2277BCCA479
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 12:52:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.37659.1656679942317741403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 05:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GtOSfp6V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id k22so3096896wrd.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=fPjgHdJWDEAMFkYerChNxpZRZPgCrRS7q4MWSdWyqVg=;
        b=GtOSfp6VZz6J4CI6K5tukg4qEvDhsbl3zlLfF3IVBgZTvAIDuNmtDg6zFHopAkxyis
         USAOSPT2KlzjOHg3Xe5lI15jf/qIMfPq579a23OTbn3/jTA++Xe14Ogry9IWEPzJsPIV
         GNBJFfFGPGwYYpNzJ+62fUorPrGnNbo+5JPqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=fPjgHdJWDEAMFkYerChNxpZRZPgCrRS7q4MWSdWyqVg=;
        b=yyqAkG31Htf0MTE3fdM8PByTwW1CUld4nn58dZVJWFbhMoUKtYyNkMN+hylV1Ufbdb
         73PzFxkkoz/5ja7vrUPMsweMWNxPH0vbWBg0OP0tMwDsp4DoifruubN9A2VdwSRIWHps
         EhLhXXB7Zk2dzgYUkDUznMwPw84qtlqWTMR6NWdDlKuk3qvJmoxdVrm2icUZWugqh6ZQ
         jgA38VkVK6M++OwJ3pha1d6mouQtFg9X59LIaSeo5iN/CW3UGvUnogFN9kxRTQ/mgrIV
         BadgVvldoydG3Kq0Shos/eG09VYp+EyC+KvU0AIM8NLK1xIUXcvdowdl2tubngUAmpDq
         i9kw==
X-Gm-Message-State: AJIora9NSd6oMTxIu4viynlQtCIY4JMfGdMkysidlYkvn3o7tcgvObMM
	cnVHxe0i7O975t20g2rTDM75TQ==
X-Google-Smtp-Source: 
 AGRyM1uTEWDbsb0tYqL6f6g6FFjI1TRmfSWw7cWxk4VBkl8U5sL3WryHD6KdL8t9Haeb7BmUC+KJLg==
X-Received: by 2002:a5d:588f:0:b0:21b:ba06:4d46 with SMTP id
 n15-20020a5d588f000000b0021bba064d46mr14518778wrf.58.1656679940707;
        Fri, 01 Jul 2022 05:52:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a1c7904000000b003a047f64496sm10345019wme.7.2022.07.01.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 05:52:19 -0700 (PDT)
Message-ID: 
 <dc6bb9e65b31c7ef84855e9cd9245d0d9e4976f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 01 Jul 2022 13:52:18 +0100
In-Reply-To: <16FDAC3178C621FE.2437@lists.openembedded.org>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
	 <16FDAC3178C621FE.2437@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 12:52:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167467

On Fri, 2022-07-01 at 10:59 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2022-06-30 at 15:16 -0400, bruce.ashfield@gmail.com wrote:
> > With conference travel and issues with meta-virtualization, I've been
> > behind in sending this out .. but I have been queueing changes, I just
> > wanted to be around in case something breaks.
> >=20
> > Here are the -stable updates and the start of my efforts to bring
> > 5.19 in as the new reference kernel for the fall release.
> >=20
> > lttng-modules needed it's normal tweaks to work against the 5.19 source=
,
> > but otherwise, nothing significant has popped up.  I have other parts
> > of that uprev under test (libc-headers, systemtap, etc).
>=20
> Thanks Bruce!
>=20
> Unfortunately there was one issue the autobuilder found, a
> reproducibility issue in perf:
>=20
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220630-53gdl=
qxv/packages/diff-html/
>=20
> I've not looked into it other than looking at the above link but it
> seems some python paths are creeping into the binaries.

This looked a little suspicious to me:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-5.15.y&id=3D18f2967418d031a390a5befe855dd0faa8af70b9

Cheers,

Richard

