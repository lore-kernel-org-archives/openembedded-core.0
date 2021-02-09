Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.10842.1612880727569043758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NpfKhINU;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.47, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f47.google.com with SMTP id g6so9065058wrs.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 06:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/dpPN/3qG7egRvMz1UpyKLyF61V2uPcfc6FbpHCLFV0=;
        b=NpfKhINUv5WkMWyoEiOBFTU5EgXTmm9Ugup/7u/doq+g2iQ5WoMjIH+d6RDDNyoqBE
         PrlvkGoXh0TDIlzl77AUK+HxM0M1H7rgNy4PxiiLFBMY3Rz6bUCgqss9+k5V1O5xl5hZ
         6v6jdEvQJ9RwGh7IEyQVKpma28iS4xrF7mzgftAHJkM3rSNFJkeqFPOQMQke66rJc7jB
         I9l6caOr+ge4LD/hTmA5dsoUkyxYMsw1hRV2baeNpwYB+NZ1F8CZTrmqGN/qAXwwL7Zv
         q5VE290n60dspgUdQ3xmhh2RyIvOtl83xyr1PBSoSrl+q5Vl6bB1IQtB7Obg2epQ86+Q
         ZR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/dpPN/3qG7egRvMz1UpyKLyF61V2uPcfc6FbpHCLFV0=;
        b=aLDKq3V4fNz9XTKnigVf9sYgiWmBL7UTv9v06Dd80M46s7XsgemUvcSQFADZzrml4T
         GnASFPGNJQ+yDt9UqMiDNzISuJdYcyDexvIezp+JrRfiLFhXWGRnFkgU54zLcGgTwI4e
         j1loc4H85mKIoeR/PR2SP92p09FIbwMAJjdS2CxnNttIqFTh2R4OIyDTfi/gr9gANz3a
         OT7WIQSb8sEAhf7On3laP0JNdbz53SgeN/QvfPrFLE1aQPjthg2Kxx7bSkGgTpYTyJbj
         BkxGptkLRPKGGOapTtdofU0eMFT5Olfw0NOYX4UQTMWh0g7YYBHOFTqOwoq04m2OoVAs
         IgQw==
X-Gm-Message-State: AOAM531R0bsKga1VnkgyGiuQI9SbzkCaa3WJE2Jjw+lVS9pOgSAGoLYJ
	4KtRACrqfQ0rsCYox+HA2BvxKFD6nKCjJfwPOjHG0w==
X-Google-Smtp-Source: ABdhPJy6Mg9y++M8QY43LB3lCnJ8hsGJquLMBQHJr3upHZcedH3oWzOPh0DspMeWXSiz5MQ9cJdfHoQiBV66UqAPwxA=
X-Received: by 2002:adf:f18a:: with SMTP id h10mr25467274wro.299.1612880725937;
 Tue, 09 Feb 2021 06:25:25 -0800 (PST)
MIME-Version: 1.0
References: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
 <165C8656186C2541.12911@lists.openembedded.org> <1353ad48939fcde5e0a549020fec51553560dace.camel@linuxfoundation.org>
In-Reply-To: <1353ad48939fcde5e0a549020fec51553560dace.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 9 Feb 2021 04:25:14 -1000
Message-ID: <CAOSpxdbfxTaky4Y++2KvCEUJpR7=zszHL6rxDt7hWNPHGxNfEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: CVE-2018-18438 Security Advisory
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 4:05 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-01-22 at 10:14 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2021-01-22 at 15:15 +0800, Wang Mingyu wrote:
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
> > > new file mode 100644
> > > index 0000000000..b6ce8fa57d
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
> > > @@ -0,0 +1,697 @@
> > > +From:      Philippe Mathieu-Daud=C3=A9
> > > +Subject:   [Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler =
use unsigned type
> > > +Date:      Fri, 12 Oct 2018 02:22:13 +0200
> > > +
> > > +The number of bytes can not be negative nor zero.
> > > +
> > > +Fixed 2 format string:
> > > +- hw/char/spapr_vty.c
> > > +- hw/usb/ccid-card-passthru.c
> >
> > No Upstream-Status.
> >
> > Its also unclear what the status of these patches is upstream, they're
> > submitted, there was discussion but they weren't merged. I'm also
> > wondering whether there are more of the 11 patches in the series needed
> > to address the issue? Or perhaps the issue was ultimately addressed by
> > other patches?
>
> I went digging and was pointed to
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1609015
>
> i.e. qemu upstream and Redhat believe this is not an issue
>
> Steve: What do we do here? Whitelist? Do we report upstream somehow?

I'll email the database maintainers and see how they want to handle
this.  If they won't do anything then we should perhaps whitelist - I
don't think we should apply patches that weren't merged upstream.

Steve
