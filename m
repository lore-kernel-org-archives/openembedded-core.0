Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.39.1600267581587339292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 07:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dEt5HACS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id y15so3356325wmi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=X776f+8dmaod1DIlYhnW1MIA+a2tS9qwZmyrR5jQAOQ=;
        b=dEt5HACSBhaA3WA0c2vl+FSGNJRkbsrYYPjBwRHmv7q+/ssabOJDK6vYGWgsSNr087
         4/jPsSj3/gv3h4uWdlbS9X6vBe4xOYFyVhTGIIqPewp44l/FlZXjhY0fNwxh22/Flnow
         w+5iG71JJ00eNvOijKyAATnSLhaJ67lde6rs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=X776f+8dmaod1DIlYhnW1MIA+a2tS9qwZmyrR5jQAOQ=;
        b=UjpvGu+vjZMooWrVJxzMgoJ+rvCb7B+ok0SV3xR7jRpUEHWvPjOACWhic3Y0YtVhIG
         MkacoYmSSTkEzprUme+YKiF3uYvAd2TQfFkhJa+ZmhCCCxXHUkoz5X9hDxI4uK0hzs6Z
         EQQrv+nnyggrE7vf2oJYzlqyVP+4iC0gatsxhaDkMnopRtVVoRIt6tJOAgXgcQMhn2oz
         om0z2GyYRZqAFily60UOVeNPbKgwnuIMUx8dYZIZ737vmyr4Cx0fNHQ240mn8Hn3ckQs
         zYFGJq3GG2R7ILtpKOF6CCwHt9ECtNMTJJVpPn1OVM1eGAK9sb5LWowZoLU6CazMlqwy
         PO6A==
X-Gm-Message-State: AOAM532QtEIoFnaUya8Gq3cOjlRyaVTN46WztPmSWJOT/jBCTEOw9MSz
	gzFXmxIWUtuvJqg1q698rDewkg==
X-Google-Smtp-Source: ABdhPJzI0KI3pH1Dn01TlllIZqNeef0x88kWKrgksZEThO0koel9AmpywjA6IIlfIb0NEGsSDtzQ7Q==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr5434811wmb.13.1600267579782;
        Wed, 16 Sep 2020 07:46:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:532:7978:4951:c36c])
        by smtp.gmail.com with ESMTPSA id j14sm34983881wrr.66.2020.09.16.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 07:46:19 -0700 (PDT)
Message-ID: <c3bc04a6cf7d158b44402ff572ec65bb716fdae2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2020 15:46:16 +0100
In-Reply-To: <CAPoiz9w55vmv+TPB69CFc_Js_qfBRk63EQ9q3kZ8j-xGaFmjZQ@mail.gmail.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
	 <8c3f76c48201397cc3f90fa89cda85a4fa739b76.camel@linuxfoundation.org>
	 <CAPoiz9yVTQAH2WJbVdbfED6r1EWKfaAnfRjSLbrcCzJL7og92Q@mail.gmail.com>
	 <c8e4bad572b1305b1b1a15b96643aeafe2272f6b.camel@linuxfoundation.org>
	 <CAPoiz9w55vmv+TPB69CFc_Js_qfBRk63EQ9q3kZ8j-xGaFmjZQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-16 at 10:25 -0400, Jon Mason wrote:
> On Wed, Sep 16, 2020 at 9:49 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2020-09-16 at 09:45 -0400, Jon Mason wrote:
> > > On Wed, Sep 16, 2020 at 9:26 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Mon, 2020-09-14 at 11:13 -0400, Jon Mason wrote:
> > > > > There is a large number of Arm Tune files located in
> > > > > meta/conf/machine/include/, and to support the current and
> > > > > upcoming Arm
> > > > > cores, more are needed.  Adding more files is simply going to
> > > > > make it
> > > > > harder to find the relevant ones for an OE/YP
> > > > > developer/user.  Also,
> > > > > there are problems with stale and erroneous configs (see my
> > > > > previous
> > > > > series), which will only be exacerbated by having more files.
> > > > > 
> > > > > I am proposing a reorganization of the existing tune files by
> > > > > including
> > > > > them in the generic family include file.  For example, the
> > > > > tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> > > > > tune-cortexa57.inc would be moved into arch-armv8a.inc.  This
> > > > > reduces
> > > > > the number of files from 12 to 2 for ARMv8a, and that is
> > > > > excluding the
> > > > > 13 I am adding in this series that would otherwise be unique
> > > > > files.
> > > > > 
> > > > > To use, simply add
> > > > > ...
> > > > > DEFAULTTUNE ?= "neoversen1"
> > > > > require conf/machine/include/arm/arch-armv8-2a.inc
> > > > > ...
> > > > > 
> > > > > Which is arguably what should be done anyway (instead of
> > > > > taking
> > > > > the
> > > > > default of the tune include file).
> > > > > See the qemuarm64 patch in the series for a working example.
> > > > > 
> > > > > Of course, by removing the existing tune files, current users
> > > > > are
> > > > > going
> > > > > to break.  A simple script can be written to use sed (or
> > > > > similar)
> > > > > to
> > > > > replace the relevant parts for those users that would be
> > > > > affected
> > > > > (at
> > > > > least for those that are in the layer index and update
> > > > > regularly).
> > > > 
> > > > I've just looked at this in a bit more details and I'm worried.
> > > > 
> > > > The intent is the BSP includes the processor/core tune file
> > > > that
> > > > its
> > > > based upon. The BSP should usually know which one is present.
> > > > 
> > > > That tune then presents the possible options which the BSPs
> > > > selects
> > > > from but the end user or distro can override.
> > > > 
> > > > With this change, you get all tunes and you don't know which
> > > > are
> > > > compatible with a given core/processor. I'm not sure that is an
> > > > improvement.
> > > 
> > > Before you were selecting an A75 inc file (for example), now you
> > > are
> > > specifying an ARMv8.2 inc file and saying it is an A75 from the
> > > available list.  Either way, you needed to know which core you
> > > were
> > > running.
> > > 
> > > In addition to this, you have the ability to run the generic
> > > default
> > > for the family, which will work for all of them.  And for ARMv8,
> > > even
> > > the more generic armv8 will work for all of them.  So, there
> > > isn't an
> > > incompatibility problem.
> > 
> > You should have the ability to access the generic tune with either
> > approach?
> > 
> > > > I appreciate not wanting "lots of files" but we need to
> > > > consider
> > > > the
> > > > usability too.
> > > > 
> > > > As others have mentioned, the errors are fairly obvious with
> > > > diff
> > > > between the files (or a GUI like meld).
> > > > 
> > > > What are the advantages this brings other than fewer files? Am
> > > > I
> > > > missing something?
> > > 
> > > This is the main benefit of it, TBH.  If I add 25 more arm tunes,
> > > it's going to get ugly.  And if Arm keeps adding cores at this
> > > same
> > > pace every year, it's going to get even uglier.  However, I'm
> > > fine to
> > > send out those patches if it only bothers me to have so many
> > > files.
> > 
> > My worry is that the current system:
> > 
> > a) tells BSP developers to select their processor, not an arch
> > b) only shows them tunes that work on that processor
> > 
> > So we're changing the model, but only for armv8XXX. This is going
> > to be
> > confusing. I do like only showing people things they can use too.
> > 
> > How about we split the difference and add the new tune files into
> > subdirs by architecture?
> 
> So it would look something like
> meta/conf/machine/arm/armv8.0/tune-cortexa57.inc
> meta/conf/machine/arm/armv8.2/tune-cortexa75.inc

Yes. With an open question on whether we move any existing files. Maybe
just the armv8.0+ ones?

> And inside of those, it would reference
> meta/conf/machine/include/arm/arch-armv8.inc or
> meta/conf/machine/include/arm/arch-armv8-2a.inc (just as it does
> now). Correct?

Yes.

> Assuming so, does it make sense to try and match this with all the
> other CPU architectures (e.g., x86, ppc, mips, armv7, etc)?

I'd say not worth it, just do this either for new ones or the armv8*
onwards ones.

Cheers,

Richard

