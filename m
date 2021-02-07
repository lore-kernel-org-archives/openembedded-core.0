Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.27775.1612737378013989572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 14:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VTWt6SeL;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.44, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f44.google.com with SMTP id v15so15064560wrx.4
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 14:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGWxYaBuXopjtBygXqL909NaYMFMgyNTjR4v29gTDm4=;
        b=VTWt6SeL8L2Es8CzWV8q59l2N91d+viXHERyi4sOhrGTCFEJ9MhE9qffKjLf9aKqvZ
         g94oH6rBYd3UNMNNF9sTN5L1MQ5kmQfm/X1MrfQu31SRInIV0/R4Rv4Gohirpljotrxz
         ixdVPEe0cU8iDhCtVEhn2MIjSPim6ENYKtho8IKxH311JiBVvcklgng7AzYgUgVBR9Yw
         MazU6t10eiOFJlrNPzcUS1xxx3W8RnrpLL6j9ooo7FtahUt+aNYUBli/ktVIwBX28clC
         hnz/Q4xDWcLspmXHZaR4XuTBdm/F56tDztfw5QezP56va+3BSWlfmPPTURnTx0uky7VW
         JkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGWxYaBuXopjtBygXqL909NaYMFMgyNTjR4v29gTDm4=;
        b=rzhwd76jW6sVGCbbCxoAQyeuQdvDVFFaD+QrsVLILAV2q0QjkFliD07L8YftzB+tAz
         MwrpndsbxJ0fg2C6tmVMUjmC3NV6RAGrjTzXrvCHM7MH0DwONQmY7HVg8AoGUPmY8vVd
         +Xi8AQ6bcjVKbk5v6uvdIzn4FIkhKXipK5qbXGrANmlzKpeUHzgwKlosoL6HbPP3ijbD
         aIIYGe15ZAh9HQBiTPBP4a6/ZJenWgCOP9IbSZtlXSe6cOnO3lwY9F+93OZffvCDrrJv
         r6le1djd6wPvem2HSjmih4qww6PCQmnXeSCDCh0n7kXnKZ/mpmPsOxo/l0AzPiFPYfVG
         Q4Tw==
X-Gm-Message-State: AOAM533CfYAP8mAQEv8IOstTTmq+4KwTXJS34YlGj+LX5EMj/tvcNl1l
	nmEkEAu4lS0OiFS+p01Jx7GZDfEafRDelX8PQNC5pQ==
X-Google-Smtp-Source: ABdhPJxYTGm9Fn5CuMk7AhL9ZUr3LVNphhgp6gna6vX0a5kUaayqTRj4o2gMA55rYV7Iszeag0OlMqtCseKTcXxp/AA=
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr16532806wrd.329.1612737376390;
 Sun, 07 Feb 2021 14:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20210207180401.2979D960302@nuc.router0800d9.com> <049ee90a7c772d3b4850d6c2d97160c0e8538273.camel@linuxfoundation.org>
In-Reply-To: <049ee90a7c772d3b4850d6c2d97160c0e8538273.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 7 Feb 2021 12:36:04 -1000
Message-ID: <CAOSpxdZNYUhBLNSZrOk5zavG8NwLJEPVdjRn3owNX+uxmXeSjg@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 07 Feb 2021 08:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 7, 2021 at 12:29 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2021-02-07 at 08:04 -1000, Steve Sakoman wrote:
> > Branch: master
> >
> > New this week:
> > CVE-2018-12433: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> > CVE-2018-12438: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
>
> > Removed this week:
> > CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> > CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
>
> I think I'm seeing a bug in the tool here. Note that 2018-12433 and
> 2018-12438 are marked as applying to both openssl and libgcrypt so the
> tool is bouncing between them...

If you look at the CVE database entry you'll see that it calls out
multiple packages, libgcrypt and openssl among them.  The patch this
week whitelisted libgcrypt, so now it is picking up the openssl entry.

Perhaps our tooling filters out CVE's that hit on more than one
package?  That would explain what we are seeing.

Steve
