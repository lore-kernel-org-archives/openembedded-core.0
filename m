Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id E98626067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 13:30:38 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id u186so87028671ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=N413EpYiWu09LzJ5cra4FRMysvZG9Q2+P7UJs4fsgsY=;
	b=yIuvaw4LSWdpEPsJz/o7P5PDEQ9PxRo/U8McJp5s9FHGu0kqCSp4n6hOhPH3Ha8RCI
	3OtLtcTXD39zBF6BtZ3OEBfHeoDsAXgX/p17F4YVNn5VAlbyY9R+16QZay4z9GlU/fTL
	EnsGLDwRyquh/HvOhr/ZeryJ3OoEc0J2j++gccG23S6lUa2J4Y/KsCojI29lTtPbLCWx
	kSIEGD8QAo9eKlvoG4gN5AHzXKyzAzYgc/phOyAMdxOwp9tvz6MYN6n/ncRlpZ3e7heg
	WmsmKyh4fwIHrXiRSeNJIckO9i3l36N3J4vZ1VVwr6txND2QDV8+mP+Ac+mpSiiiZ4Oa
	fnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=N413EpYiWu09LzJ5cra4FRMysvZG9Q2+P7UJs4fsgsY=;
	b=j6atFVWYXxM/mnYsziNfhko2X7HLxCN4ybFPBKD8LRxxiAMG4MPmeuY25iAidXutTn
	bg8zVH4G4YjuxLA+lxk23k4fQ/GrvgBICyZuKxrnRc/QlVF91DN95lzWuA0HJ/geFWVu
	3y4f+lfD6dxCYXClqARoUOKXth3trerQlkjO8PvCteZOIW0RD+RPJYQmIdZ+r6kaLP1k
	XYmIUfNOwBLOxSSBnTdj7VGdAzQw2tlRztBwhzvRp887uyEbLIdWMcUe6aXc028yCEx/
	y4fejEsEyzt5C16z9PdmFMNS5b75dNOqQC+a00NlSSZ6Lyh0PyuHA70YRvv0489/LVkk
	o98Q==
X-Gm-Message-State: ALyK8tJKndO1Moy9ix5upwgBygvTscmiBUNF/0Z5lTnpCh37t/5fRw+hLKNiRjViySMcBNVY
X-Received: by 10.36.26.81 with SMTP id 78mr1083938iti.4.1468330238846;
	Tue, 12 Jul 2016 06:30:38 -0700 (PDT)
Received: from pohly-mobl1 (host-091-097-029-052.ewe-ip-backbone.de.
	[91.97.29.52])
	by smtp.gmail.com with ESMTPSA id 39sm1475890iop.25.2016.07.12.06.30.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 06:30:38 -0700 (PDT)
Message-ID: <1468330235.31553.5.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 12 Jul 2016 15:30:35 +0200
In-Reply-To: <CAP9ODKps8qLV8cvyR4DHq8yZ+iFk5A1f3ON7EFNrdr=hq__HJA@mail.gmail.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
	<25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
	<CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
	<CAP9ODKrNecB=hRAkFb-LL4TcTc9XXw=AmKu-efdjPs3PKDkY1A@mail.gmail.com>
	<1468249814.17048.1.camel@intel.com>
	<CAP9ODKps8qLV8cvyR4DHq8yZ+iFk5A1f3ON7EFNrdr=hq__HJA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meta-ostro-fixes: initramfs-framework: add retry loop for slow boot devices (like USB)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jul 2016 13:30:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-07-11 at 12:17 -0300, Otavio Salvador wrote:
> On Mon, Jul 11, 2016 at 12:10 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > On Mon, 2016-07-11 at 11:35 -0300, Otavio Salvador wrote:
> >> Hello Ross,
> >>
> >> On Fri, Jul 1, 2016 at 2:50 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >> > Agreed but please split the rootfs in another module; so we don't
> >> > force it to be included. The e2fs can rdepend on it.
> >>
> >> I noticed this has been merged but my comment here was totally ignored. Why?
> >
> > I can't speak for Ross, but perhaps he felt that it was already a
> > worthwhile improvement. I wanted to address your comment (and still do),
> > but didn't find the time last week. I'll do it via another patch now,
> > okay?
> 
> Ok but Ross action is wrong in my opinion, in worse case he should
> have asked before. If comments are ignored there is no point in people
> spend time doing so.
> 
> I wanted the change to be atomic and not two changes which may
> required more rework for same logic change. :-(

It turned out to be just a mistake that it was already merge.

On the other hand, one can also argue that these are two separate
logical changes - adding the retry loop, and then making that code just
the optional default implementation for mounting.

Anyway, see "initramfs-framework: make rootfs module optional" for that
second part. Note that I did not make e2fs depend on rootfs, because
there's no real connection between the two (for example, the rootfs
could also be btrfs). Instead it is the finish script which depends on
some kind of rootfs mounting.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




