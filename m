Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5F6C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 14:41:15 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.33562.1640270474365265038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 06:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=se/5iO4g;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id x15so22358192edv.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mG3Et9ENbf7s0+SBz/++YDG2LTwkOiSDC7xVQyvmyiI=;
        b=se/5iO4gJ0LRQAthnS4ISMtEmxDlRJevo2ppMwjmIHTthkOlbF/g9BE0NrVY4Vn2EX
         jOKYugvZqgjfSIEg5urbdr/yDb9AUpj+BUYqkdEdgPquy0sHhEtEVfsNvpVf0lMRUAr3
         E7/qo6J8S9pjgPTED/Ed/h0+b7G97iQNxfYEtoPq0AGRGbvRFU3GFioi5ignz10iLiKO
         6Z0Z34qiQS2ymqoxIm1+S4ECGGgzcqseyXl81S0U7fcakamyyCsjzojGj6sdoXN/Df8R
         1NhZgUwbe9dqCTX/n0q1OIBLzVHLmmDAEdBVQGrB5d3hp8Q6SGvifbKVlMaKyZpr/krf
         BvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mG3Et9ENbf7s0+SBz/++YDG2LTwkOiSDC7xVQyvmyiI=;
        b=3Jk0oUvR+lyQLq2ePX7IfoQLxj68ZAFq+D/DfzrdSMKqPqbqFaeHqdo+XgeAuBX1vH
         9U5nxHDD0CIB/B4QLq+BUrYdt38eoyidB0SaAr9a4MAqGyMjI1W5sNaAEmb1b9tXNOmK
         8Eh9u24pjHVJf7i9qUErvjuK/i6Qnjq6rWpgN3TExW6wUX5XeCOgRpcB3RM6D24xEkhc
         rrD5KyU8QDYO/GZ6O5p5XQsQYBL1sHc+nKQhx73eZdOnP9brDot1FbYMgrixX6vSq/iQ
         eN9/jhtiLzm/yDymOlfEYomTweFwiwiwIk1P4LNE56W/ptID0svXIQdf9AI+gdeTPDbL
         c1ew==
X-Gm-Message-State: AOAM530JcNLXi0uSqjPwn1NXpnfe73uZrYgNECKXgvjPm/4dS8ufD0sR
	zczR2u2aPYswt6YTrkDpawuhY3hgIr/xcJVuOmFwtA==
X-Google-Smtp-Source: 
 ABdhPJyAOe5nHeqJi6/JhCpmmFTC4e/BDk3DuNCDrQ7QPlKEskGqPq7r+NMubTphK7IaOFqh+qrCIcVWoTqW7aiWSP4=
X-Received: by 2002:a17:907:7ba8:: with SMTP id
 ne40mr2121259ejc.329.1640270472236;
 Thu, 23 Dec 2021 06:41:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1640181998.git.steve@sakoman.com>
 <5930e54a9e0c6b023e46b83c4294d6293cdf3f82.1640181998.git.steve@sakoman.com>
 <d77c8b750ff8aa4a2ae62483230636d25f8f6ec8.camel@intel.com>
In-Reply-To: <d77c8b750ff8aa4a2ae62483230636d25f8f6ec8.camel@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 23 Dec 2021 04:41:01 -1000
Message-ID: 
 <CAOSpxdaW1NykmwseT=TrDFhgmLPpxLVmci+yEgKA43e9XcbD0Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/14] selftest: skip virgl test on fedora 34
 entirely
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 14:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159984

On Wed, Dec 22, 2021 at 11:19 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Wed, 2021-12-22 at 04:12 -1000, Steve Sakoman wrote:
> > With the sdl frontend, qemu isn't able to even boot fully,
> > so let's skip the test early.
>
> This will fail any time the host has libdrm > 2.4.107 so perhaps that
> should be mentioned in the commit message.
>
> Fedora 34 recently update to 2.4.109.

Thanks for reviewing the patches Anuj!

Yes, I can certainly update the commit message.  I had just copied the
commit message from one of the master commits that disabled this test.

Steve

> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > index 9e5c3f2878..f5b3ba27a9 100644
> > --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > @@ -181,6 +181,8 @@ class TestImage(OESelftestTestCase):
> >              self.skipTest('virgl isn\'t working with Centos 7')
> >          if distro and distro == 'centos-8':
> >              self.skipTest('virgl isn\'t working with Centos 8')
> > +        if distro and distro == 'fedora-34':
> > +            self.skipTest('virgl isn\'t working with Fedora 34')
> >          if distro and distro == 'opensuseleap-15.0':
> >              self.skipTest('virgl isn\'t working with Opensuse 15.0')
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159959):
> > https://lists.openembedded.org/g/openembedded-core/message/159959
> > Mute This Topic: https://lists.openembedded.org/mt/87898199/3616702
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub [
> > anuj.mittal@intel.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

