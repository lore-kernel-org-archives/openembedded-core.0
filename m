Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web12.2380.1616786586074585577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 12:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i5HM2yUl;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id z1so6932344ybf.6
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZXCQgdx5EuqKChloEwPyuEgPWbeIoGXGmC7/WmcRqM=;
        b=i5HM2yUloQN570hpjsE58x48hQGkcdAgXyKR1IkcBHxQ6KU9eXQE+8/nYBwynWdf5Q
         F/DzCoJGloZnVAhW4jUWAz4IeCQDgRG90kkBVjG1kGX7ZGmQo27nIPNkep6aqQfYQ2c2
         VGWIUHshakhTSUmrADrBRy9rSF8ECWo1ftjeqNa/oH78RZYjR6oePbh4kzDo47UN74rl
         7CYYiBS+tO/1LfoThJSv7hwngmIXIh0k7OBnrCfcIsEc2aCOpYVcfrF7oPUHoElQ9qcr
         me3PBp0Hz5QVtHx4eGA2GMO3HV+2K0JieGd6lqRu5TDymeceKB0rt6uDVgT9CDg4FIgW
         ZBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZXCQgdx5EuqKChloEwPyuEgPWbeIoGXGmC7/WmcRqM=;
        b=nxzyHrYypOmb0OlkoMCtbiqpXZ2iaDJGA48NqJkdWtI2YfLobuLbBiyiEQ5iSLWlBR
         YU3Z3m21uSadG8ubjWKpwKs8m4rapelttg0IX9KMR1rA2OZ/Y6d5YKY41oPr1oFcJdhA
         gt0aV7XinZtCIPylHT1WqqvRTy3OVkLnx+q1S+enTWI88tcJg7dvhuQsVTCvn7P7shjD
         awT50Os3pacgBWvKnXBzAbw2xj/u3UU3weaAjpIx732k0sVMRfuEd9qfkxUl01stGYU/
         +vEmuOrprCEeTWcss8iWdHWr4fIf4Mzu9foQBE3VleWj05GfI5VN0g4oslinhEaOdV2D
         OWnw==
X-Gm-Message-State: AOAM532ji9VTlvkEFQylg/l/+IrZcbEA/wypVQn2PvxCe5T5eEwouyOB
	OB+4wvgXlg59gJPkiVyjJ1FJGG2fDJnCFW20M5c=
X-Google-Smtp-Source: ABdhPJw2wI3TnJG+b+jzpY1Haj3rTLVnJAnwZoxKsLdVxMkMRYeqMsaxe0Fg2c8gzmcLfX/ddpa+8AqcU2K9B0TH+Lg=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr22412888ybg.97.1616786585339;
 Fri, 26 Mar 2021 12:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210325192052.2976-1-mikko.rapeli@bmw.de> <CAMKF1sry10GxKxwSOoyPd87wXA4=r4Nb-YXHEV+3TxCcHaANzw@mail.gmail.com>
In-Reply-To: <CAMKF1sry10GxKxwSOoyPd87wXA4=r4Nb-YXHEV+3TxCcHaANzw@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 26 Mar 2021 09:22:51 -1000
Message-ID: <CAGDS+nkEswf5uxRA+3u-NV1L=87d2X140B3zVR9vSvcfjSCKJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][gatesgarth][dunfell] openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449
To: Khem Raj <raj.khem@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 8:54 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> do we need this on dunfell too?

I plan to take it when it hits master.

Steve

>
> On Thu, Mar 25, 2021 at 12:20 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
> >
> > Only security issues fixed in this release according to
> > https://www.openssl.org/news/cl111.txt
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  .../openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb}            | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-connectivity/openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb} (98%)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> > similarity index 98%
> > rename from meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
> > rename to meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> > index f054d2fdba..5f281197c9 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> > @@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
> >             file://environment.d-openssl.sh \
> >             "
> >
> > -SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
> > +SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
> >
> >  inherit lib_package multilib_header multilib_script ptest
> >  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> > --
> > 2.20.1
> >
> >
> >
> >
>
> 
>
