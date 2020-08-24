Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.190445.1598254810380990871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 00:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nu5GZpk1;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id g26so6615309qka.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 00:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0ArTPpq1AThkG2LDaWc36sd4XTRsjXL9WC0q9JNfaY=;
        b=Nu5GZpk1ftSZD5PljVH16rt8iF+HWM7+AuAqbha007jRcEMKjvzm3gT0SDfwqTY+Hj
         96PXU/8j6AdLvnZFN+xqGZd8sFgQMcbFFpAlEBUj3UgMHOuoZaX2f+90gLOApEtY4AtP
         06V+XIHv3bm0sWmpzI17zEklf5+ccZFa3Rx3oZTsZZ9N4q55Yk9iC7T9sGDr5x4iMT/I
         o373+F0LiHxdpO66DuFeMH1FrDM53GGLFyH+Hrn/gx2ibKYPw/Qk980pOVSt9T7AANrw
         Gex9Jc6H7+mcI5JoXZp3rNR079Lyx7Qbja+DhYUMfWjtCwrrUHvjt8jksMvSMnR5Q7b4
         VZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0ArTPpq1AThkG2LDaWc36sd4XTRsjXL9WC0q9JNfaY=;
        b=t2JXN/iGFcS+5aOG824hDmAepuBFr67s3QxSlxnBwS1tMXzS9G3NNpWOxqjU2SweUx
         lzrkcq2rKZEj7UVA9SbTiWeCPIwXFM0vtlQCBIfKXtzt2TqiqysnUjZwqmOB37sFbo8X
         os460ZqYo/1myhV62AV2TDW1AW7O7Xe1rjSjmQgantpaKV2Sg3VFQ1eEYNTBZ7DWn5VH
         a/cXH48VYwNIIGi7wACoG1Y0g1mHoPapu4TO7bj5z2hPIOWU6ti2nS+qYgXSc5L4EBOW
         rmem0tJTFyScwNa2p69OToNjR2P6tU6Zf5WmpcxGZgw0HkeGVFC1d5gIL0D5SsfeIGM4
         uPbw==
X-Gm-Message-State: AOAM532U8dn5omrieOXRB971rtZLmgAJ91ve+EfY4ptlpWrZBn3rmu+N
	9MwcuuwNW3MTSOH9bXquhL3oKf89XGFlK9zz7Kw=
X-Google-Smtp-Source: ABdhPJyycPWz49BHha0h9wdxFdrae5L4kqRgL/MvuDPH/BJKbmZavPuBJFvTUQirpiua+hPrbyNS6NlxAl/QlRaQ6eI=
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr3605301qkt.474.1598254809355;
 Mon, 24 Aug 2020 00:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598036283.git.bruce.ashfield@gmail.com>
 <c9d0bb421a2f7c6783f2c2bbf47c95da5537985d.1598036283.git.bruce.ashfield@gmail.com>
 <CAMKF1sr-JshybsWtqUv9ACo873VoabioyzQipS8EFmeHB96XZA@mail.gmail.com>
 <4b7d45f691efa80b05f3405cbf716a2bce1c13d8.camel@intel.com>
 <CADkTA4NApf+0cxP21pQ=JykJbazGk1M-si6etrqPFvQ0oE6STw@mail.gmail.com> <227946a676d142f2a1d15ba3b8eaab85800212fc.camel@intel.com>
In-Reply-To: <227946a676d142f2a1d15ba3b8eaab85800212fc.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 24 Aug 2020 00:39:43 -0700
Message-ID: <CAMKF1sqggjNMp6=F_BTF4tjgVgQV6XJ0RfFXaYyTmQYUBqpz=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto/5.8: update to v5.8.2
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Bruce

Can you also backport
https://github.com/torvalds/linux/commit/6bcaf41f9613278cd5897fc80ab93033bda8efaa
to your 5.8 tree please ? this should help fixing selftests.

Thanks
-Khem

On Sun, Aug 23, 2020 at 8:21 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Sun, 2020-08-23 at 23:03 -0400, Bruce Ashfield wrote:
> >
> >
> > On Sun, Aug 23, 2020 at 7:59 PM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > > On Sat, 2020-08-22 at 01:20 -0700, Khem Raj wrote:
> > > > Hi Bruce
> > > >
> > > > On rv64 I am seeing an error while building lttng
> > > >
> > > >  #error "LTTng-modules requires CONFIG_KPROBES on kernels >=
> > > 5.7.0"
> > > > >    20 | # error "LTTng-modules requires CONFIG_KPROBES on
> > > kernels
> > > > > >= 5.7.0"
> > > > >       |   ^~~~~
> > > >
> > > > I wonder if we need to update defconfig
> > >
> > > I see the same failure with linux-yocto-rt kernel as well.
> > >
> >
> > -rt doesn't enable kprobes, so yes, with the latest lttng, it would
> > trigger that issue.
> >
> > Traditionally -rt had issues with kprobes, but that is resolved now.
> > Rather than adding the overhead, the enablement is still on demand
> > for -rt.
> >
> > That being said, it looks like lttng has forced my hand, I just
> > enabled the config by default in -rt and don't see any issues.
> >
> > I'll send a patch on Monday to fix it up.
>
>
> Thanks Bruce. Should PREFERRRED_VERSION of linux-yocto-rt should also
> be explicitly set like that of linux-yocto? I was wondering if there is
> a specific reason why we don't set version for that kernel for qemu and
> BSPs?
>
> Thanks,
>
> Anuj
