Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web10.2558.1588277121111034988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 13:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=baNXUZF8;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id g35so3004604uad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 13:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vDYApf4wf7DnkqYrR016uRDIum6w/oL1Zk9ZitjEpLk=;
        b=baNXUZF8WXPkY+BrM4J7gXYJSouABHz1qHc/3G1WBBtp3xXUwM5SGd0G1aX11nJ39f
         NVL/fLLKqLDV3qEPOWVx7CIVxDhMohd7W65smu1Ea0HkwIhFswNResT0xYYhmx/reQ5w
         G+7vlOnFQb31VVeQthInrw2qEhQp8pHy6hCM/F13wLE2NbeA20PVTMJwYyoHfs3t6xGa
         2VqTKtCN1/BHLjkC8dl6RYU06vWmsFZPHHkfSQ3+U4huhEqKpTyXsbxBufM7OQsNOPxL
         sXBF1EXVm1oStWoOkxBGaK6jooUmQDnm4SDpEZK4D8O6TzTrX0uVSBoHrULYQrK9n+Ap
         Zb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vDYApf4wf7DnkqYrR016uRDIum6w/oL1Zk9ZitjEpLk=;
        b=euQxHh1E5rjG+B4+CjEEb1ZKVvdudvf3iHRok0QmW+hhT0freuiB3DB2t5Vcc+Frdt
         R713RxZ3oMo16EXFEwMj2YWFIFnlsJzGKRP2xsOQ7AsmcYu35JdWXBsBCSGTg4vsA3/W
         /mJN2etbUQ4CxixDWLn9b+tqPSKtKxLTgTkVxcPimQ2jV9/ommuB+HQ4e4i+AnNM2PHh
         kHxqjQJ7DEP5h47qSM0/cC7UI4TNH/vW4wqabumduuzxUzuopJMHvD8u0NCDn/yFPajp
         glaIE0lyG9yN8ew5FdhzvUHxpOmpVoRc2RVa4PSwgF/WGQLdSWWJYcPpyGm8CEjZtTw9
         MnOQ==
X-Gm-Message-State: AGi0PubjHier/s6mm+8iKGQ5SfmYe53Ey4ZB0cRNyXkCEcTCkN/hmdf0
	QnKSCR2t1T5KIORmsihVYCFk+kqyUmF7B7uwW+AuYzhW
X-Google-Smtp-Source: APiQypKSQLRfTmUWyNiL0R0b350JhGkPFsMGUvQPF/VoAokSh84a48dk0KIvw70XN9kWzO0yyQVY8WUwoi/F57Lguaw=
X-Received: by 2002:ab0:2095:: with SMTP id r21mr386258uak.92.1588277119862;
 Thu, 30 Apr 2020 13:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-5-alex.kanavin@gmail.com>
 <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com> <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
 <6a314323-ec76-5375-c37e-dfb5f32cfb71@gmail.com>
In-Reply-To: <6a314323-ec76-5375-c37e-dfb5f32cfb71@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 30 Apr 2020 13:05:11 -0700
Message-ID: <CAJ86T=XR+CWD8T=HLXUrfwUoiOjcwf2sifb1B4OWT=76OzKjQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 30, 2020 at 10:33 AM Khem Raj <raj.khem@gmail.com> wrote:
> On 4/30/20 9:33 AM, Alexander Kanavin wrote:
> > On Thu, 30 Apr 2020 at 17:46, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >     Does this mean it wont work with systems with mali gpu drivers any more?
> >
> >     if so, then its a regression, we should not drop patches just like that
> >     perhaps.
> >
> >
> > The patch is unmaintained, hasn't worked since kmscube was switched to
> > meson, and there is no way for me to test it or even understand it.

"No way to understand it" seems a little over dramatic :-) It's
testing for the availability of a function (gbm_bo_map) within a
library (libgbm) and then making some code and one of the source files
conditional on the result of the test.

  https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Libraries.html

> > Anyone with an interest in mali should do the work of getting it
> > upstream, just tossing custom things into oe-core does not mean they
> > will be kept there forever.
>
> I see if it has not worked for long, it should perhaps ok. and meta-arm
> might be better location for this if needed.
>
> When we accept patches, we sign up for some maintenance.
>
> I think it was appropriate when it was added, we did not keep it up. We
> switched to meson without porting it, perhaps it should have done then
>
>
> >
> > Alex
> 
