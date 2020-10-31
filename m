Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web08.3993.1604105354161370750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 17:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bOBq6GSA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id l8so4395250wmg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 17:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gxF8eBCZ5xN5Mj9chCpms4esKIVPVuhyZOVghVqvcxw=;
        b=bOBq6GSAhdZmZUOx3eE3I7/6/gBQGY+WSC/K4SCNlKxbm5PCZWo7zH/FqO3PXMKExU
         GqVcOCejORVHF4WGexfK4FxcsIaHRpnwcCxhq4nvH3ooOZC/Q1OOl0ArWem0N1tbugLz
         HAah/tmt9DIFgXJopTYFZPDqMc0/BLm9pJr0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gxF8eBCZ5xN5Mj9chCpms4esKIVPVuhyZOVghVqvcxw=;
        b=rDu8Z9pkO5fEztWMkQJAJwyHi7GYwAzM1sDUFLm6LVE0jBjOlq2Xp5RdEk27g4LZJi
         pXfwqPoh3OdzPjOnLe2RksRBFKXkdQcbka/+xQF4ejev7N+101eQ3IdP/Jr97lXM4yh0
         nHn1P7FgkrnX4760gkowGgBYQqdrH5XBDQW6wCo0dabspM6Rcze4JT6HXo2BtbWE998E
         E5fob75xqqqKlohkXj+fWn15iArSFutx2gONnXexWexMFsu/TG8TuLN8+TSysOXC371M
         KDxtXZE5hJA3DTUntbs16cOer8+XS4W8Hp6ee72PMr1Sk/c6OKReE2ol7vQasDtUW5eJ
         8l2Q==
X-Gm-Message-State: AOAM533DExLUZlHZ90xUZGYmxWiABmkqxtFeL13kn/OsFEKWNs1SSGyE
	5G3ht9uBlumudZjybnMc4UfrUA==
X-Google-Smtp-Source: ABdhPJzk/Yk0ZaLyMqzZcduVegqJ6CQ188bjLoij3FxjuQz6JVse1J/LLWyLgOIy2zFdV2MhHEF4bg==
X-Received: by 2002:a1c:6355:: with SMTP id x82mr5834019wmb.177.1604105352534;
        Fri, 30 Oct 2020 17:49:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id a17sm12612118wra.29.2020.10.30.17.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:49:11 -0700 (PDT)
Message-ID: <b298f53a7fceab3d51ec69ab1b9356269074e712.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Sat, 31 Oct 2020 00:49:10 +0000
In-Reply-To: <3b12ced1f6625fe0a9bdeb9e5c0cd5a7ca004d50.camel@linuxfoundation.org>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
	 <20201029142806.1830504-6-quaresma.jose@gmail.com>
	 <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
	 <1642964F5C513D13.27950@lists.openembedded.org>
	 <1642987B07D196A5.27950@lists.openembedded.org>
	 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
	 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
	 <1642D6DB2EF0C3ED.10902@lists.openembedded.org>
	 <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
	 <3b12ced1f6625fe0a9bdeb9e5c0cd5a7ca004d50.camel@linuxfoundation.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-30 at 19:23 +0000, Richard Purdie wrote:
> On Fri, 2020-10-30 at 18:23 +0000, Jose Quaresma wrote:
> > Hi Richard,
> > 
> > I see your fix:
> > 
> > -PACKAGECONFIG[asm] = "-Dasm=enabled,-Dasm=disabled,nasm"
> > +PACKAGECONFIG[asm] = "-Dasm=enabled,-Dasm=disabled,nasm nasm-
> > native"
> > 
> > and only nasm-native is needed,
> > because nasm is not needed on target and it's only needed at build
> > time.
> 
> I was thinking about that after I sent the email. I've tweaked it
> again
> in master-next and squashed it into the series since it was easiest
> to
> do that.
> 
> > I can fix it and send v6 series and I have another fix for this
> > series that remove 0004-capfix.patc in gstreamer1.0: upgrade to
> > version 1.18.0 What do you think?
> 
> We can make this one a follow up to the series.
> 
> > I hope this is the last version and I will be more careful next
> > time
> > I submit a big patch series.
> 
> No problem, thanks for doing the work in creating it! The end result
> should be good and its nice to stay close to upstream releases. I'm
> think we're just about there now.

Just to follow up, you renamed gst->validate -> gst-devtool but didn't
update the maintainers entry. I've added that. We also found that a
dependency you added, json-glib had reproducibility failures[1] as it
wasn't being tested previously. I spotted a previous similar issue we
fixed like this and Alex was kind enough to send a patch.

[1] e.g. https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201030-ld3_vz4a/packages/diff-html/

I'm running another test build, hopefully this one will be better!

Cheers,

Richard



