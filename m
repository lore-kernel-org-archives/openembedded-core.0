Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.3004.1603132450775920874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 11:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AbzwKzc6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id x7so857712wrl.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vmsh5m6EAWyPD6QzayobLHmaz7PA8rYn97KGXMWNLUk=;
        b=AbzwKzc61XigBPAaSJC8Dcalkj8QW2nJRPIdlkj++N11zpyhnVJH1IVn+IkihFsKNU
         ZdJPobluuBxFJvl9jU46jOCuxdzDA7xcJSgz+SvhXYh641dlIqPdx5YwobTo1Sd3+MLu
         gzLqM0M3SPA6T1ekDXTYuGUQMU86yHivPYvLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vmsh5m6EAWyPD6QzayobLHmaz7PA8rYn97KGXMWNLUk=;
        b=dLWie07iPrfR+hV16PJUdCcwfHSKE3IO+Q8j3JVA91oXVItRIR9W7xNPD5P2tGfzr+
         qZqhPxI7MFuQPF9iOr/cZ636W4BepNwXKo+/2Zx0r+GCzVhNvV2x8r51/FOINbVUjVfr
         h5X5oFpmI2oWSopQ9asvkOJpVn22ADUsvbZv5ovxTvHlpIPksSFfP1Oibou40I3VE157
         ZLd3GU97qlrFOYiAJCI135gdeOVw8Z/qMaJaOiqCRTnRJ7Yz7tW0KvLBj/fXpG7opCa+
         Nx4gW1/E1TZldR546hPIvbOVBqJgFFf0Jl+LpNCQPtIdv0hA7CnV6+oL+O6oxdSfY/dO
         9wQg==
X-Gm-Message-State: AOAM533ZukndK23BEMZSK5+1vPaK6Spkgf4sqEI70LhPyMw2e7StQE0G
	DtNr1E31TKv7ETQP/jALHDXCQQ==
X-Google-Smtp-Source: ABdhPJwfoU+ORICL0oSJrU5YN9J7azE3GvbEuIvTNvtWRH9UzgIvodd/vrfsocR2M9pbjrBGDN1kDg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr676236wrw.302.1603132449303;
        Mon, 19 Oct 2020 11:34:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1c1a:7e1d:dddb:c4ce])
        by smtp.gmail.com with ESMTPSA id l1sm830731wrb.1.2020.10.19.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 11:34:08 -0700 (PDT)
Message-ID: <490104d86daace5b116470c8192d63fb605578e3.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 18 Oct 2020 12:00:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 19 Oct 2020 19:34:07 +0100
In-Reply-To: <CAOSpxdaCefKtbfRkhXf96KukVaT-hVv6JT_RNqaXVQr4eDQm1A@mail.gmail.com>
References: <20201018100004.8512E9601C6@nuc.router0800d9.com>
	 <27f0873f9e4c50789588953a20d530c9965e1a35.camel@linuxfoundation.org>
	 <CAOSpxdYO3dB_9PtC7pvmqNTa8ZUbGQU6YOfEFezM0mtCBjC7AQ@mail.gmail.com>
	 <CAOSpxdaCefKtbfRkhXf96KukVaT-hVv6JT_RNqaXVQr4eDQm1A@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 08:27 -1000, Steve Sakoman wrote:
> ON Sun, Oct 18, 2020 at 8:12 AM Steve Sakoman <steve@sakoman.com>
> wrote:
> > On Sun, Oct 18, 2020 at 7:56 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > I'm a little puzzled about how dunfell improved significantly but
> > > master didn't?
> > 
> > I am too!  The master CVE check runs first, so I guess it is
> > possible
> > that the database updated between runs.  But that seems unlikely.
> > 
> > I'll review the scripts, it seems more likely I have a bug.
> 
> I didn't see any obvious bugs, so I re-ran the report for master and
> this time all of the qemu database changes I submitted were
> recognized
> and we had a big decrease in master CVE count too.
> 
> So perhaps the database did actually update between the master and
> dunfell runs.
> 
> Another possibility -- I was using a common sstate for master and
> dunfell.  Doesn't seem likely to cause this issue, but since we use
> separate sstate on the autobuilder I'll do the same for the CVE
> report.

I have noticed this kind of oddity on more than one occasion, you can
CVEs fixed in dunfell that are still in master in previous weeks.

It does seem that either they update the database at an inopportune
moment on a schedule or there is something odd going on in the code
somewhere :/

Cheers,

Richard

