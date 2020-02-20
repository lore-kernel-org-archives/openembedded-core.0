Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id B7B1361330
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:24:05 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c23so2105499plz.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=08es9nqOGBRvvcTVKRYw0Bdv59SJt/jbohIKbhgooKk=;
	b=YELIPtjn5Bpl1ax18FKcwqj9qiAyutboHFrrwOLNwxtVhIIZ0r8jqIKnYM56eUCG1j
	w6Uvi05zdIl24s/3GlRR6eJDKMlMCBCBCA1Li4Z97pkd4Kr9U0FHIJHCtLoYgGqY7RDH
	BmvMQnfHreqNAlPaLahZtjJLtUAKbu2lH7j/Mb6L79BeYsXtTJGmegAwURYn0PMQAzAo
	lnhWkBBAS6B6OoSXeZ591q506Yplnf6ARuWP7E1QBTYXJGhjh8G5JmEK6jhPI/Q/ChnR
	JA8x3dAtfyq2wNE+E/N1PURyh3RZxk8UgK/0jjeSofVA7ajwpNQXiZ8+o3tW8ilulmzq
	eyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=08es9nqOGBRvvcTVKRYw0Bdv59SJt/jbohIKbhgooKk=;
	b=cZPNHUfQOmaNDWE1korV7b1qz8seLykCWbElY+XqInqYqf/n9SssZgd8K4BsHK+Kl1
	noNc2gPm5w0NumnbJk7iGR+GETCTjsTuhaCfI8jLQanT44s16gUrJ7On1eP3A114KrNc
	HTBXO+RdQepXp0ElalehNwARJ0fox0n9N5QxRJgT+8+PlXpA4JeMB3cDInk8+jEOvEMa
	leLjIsPMBGmkMAXuW/MwblALv3m6HXJlOumfheriKpVXZN4WwxziVBEsN+/qjXaof+IE
	eW8GESwWImbPmzAaXoLt+MQ6JTVaESORaY9Dn+/7yxoAX7bvTyGq1O4B8lvkK93rnb6F
	enLw==
X-Gm-Message-State: APjAAAVDpAVg3rksp7ae9RzvNO30r/O9vGaJe4ypsk197GBUkaxXX7R8
	pGnE18ZP6KNKJT4DaNd+rkA=
X-Google-Smtp-Source: APXvYqxYUNEhutKih2ZGlHMkA7B54tDKna/uTN3CvGCnOHE/5+s5EbQUL1cZmGQpbzOjuawRwezWUg==
X-Received: by 2002:a17:902:14d:: with SMTP id
	71mr29753092plb.162.1582237446377; 
	Thu, 20 Feb 2020 14:24:06 -0800 (PST)
Received: from tyche ([2601:646:9200:4e0::ebc])
	by smtp.gmail.com with ESMTPSA id i64sm298174pgc.51.2020.02.20.14.24.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 14:24:05 -0800 (PST)
Message-ID: <1cecdefa2345a98c110a8ade1b5085b0e20bf8f2.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 20 Feb 2020 14:24:04 -0800
In-Reply-To: <CAJ86T=UnK1KcPrZ+CYhJapB-Akpiz29wjvLgs0pu5NSQgnkQsA@mail.gmail.com>
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
	<CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
	<CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
	<CALbNGRSFZcsh0ZKBgyRX+eg3ThZbRf1ryiVbHU5Y0vZgd0BkTg@mail.gmail.com>
	<CAMKF1srmsrx8Nq4gSj5ZDK0o1d4t8AtDWnjtDgzT1Py8i=Njtg@mail.gmail.com>
	<CAJ86T=URADiQr=_iOdw990WWCHhkDL0sAS-oD1JEtyV9UOHGXg@mail.gmail.com>
	<7dd9779b1be7e10a54b3b1bff4788cae931cb02a.camel@gmail.com>
	<CAJ86T=UnK1KcPrZ+CYhJapB-Akpiz29wjvLgs0pu5NSQgnkQsA@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 22:24:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-02-20 at 14:11 -0800, Andre McCurdy wrote:
> On Thu, Feb 20, 2020 at 2:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, 2020-02-20 at 14:00 -0800, Andre McCurdy wrote:
> > > On Thu, Feb 20, 2020 at 12:33 PM Khem Raj <raj.khem@gmail.com>
> > > wrote:
> > > > On Thu, Feb 20, 2020 at 12:24 PM Andreas Müller <
> > > > schnitzeltony@gmail.com> wrote:
> > > > > On Thu, Feb 20, 2020 at 1:45 PM Andreas Müller <
> > > > > schnitzeltony@gmail.com> wrote:
> > > > > > On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin
> > > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > > You need to at the same time drop the introspection
> > > > > > > enablement logic from EXTRA_OECMAKE I think?
> > > > > > > This line:
> > > > > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb?h=master-next#n70
> > > > > > > 
> > > > > > > And for consistency, it would be good to do the same for
> > > > > > > gtk-
> > > > > > > doc.
> > > > > > 
> > > > > > This is odd: I fell over this because there was no gir
> > > > > > created.
> > > > > > Did
> > > > > > not notice it was few lines below. Need to check that -
> > > > > > maybe I
> > > > > > am a
> > > > > > bit off-sync to master or something is wrong elsewhere.
> > > > > > 
> > > > > > Will sync to master and send V2 then.
> > > > > > 
> > > > > Finally had time to look into again. In the recipe there is
> > > > > 
> > > > > GI_DATA_ENABLED_armv7a = "False"
> > > > > GI_DATA_ENABLED_armv7ve = "False"
> > > > > 
> > > > > => My patch is wrong it overrides above accidentally - thanks
> > > > > Alex!
> > > > > 
> > > > > Since webkit builds gir fine (my machine is armv7ve) that
> > > > > does
> > > > > not
> > > > > seem necessary any more. I would like to send out a patch
> > > > > removing at
> > > > > least armv7ve - shall I take the risk to remove armv7a -
> > > > > maybe as
> > > > > two
> > > > > patches?
> > > 
> > > These two should be equivalent for all practical purposes and so
> > > should be updated together. ie remove them both, one patch.
> > 
> > it will run user mode qemu underneath, which is not same for both,
> > are
> > you sure libraries and apps it will run are identical ?
> 
> Binaries built for armv7ve will contain HW integer division
> instructions. Binaries build for armv7a will not.
> 
> That should have no impact on gobject-introspection.

if it executes correctly. The reason why this was done in first place
is that introspection app inside qemu either segfaulted or got hung.

> 
> There's a much bigger risk in letting these two build variants drift
> apart than there is from updating them together but only testing one.

qemu has failed in mysterious ways with slight differences in ISAs
Not oppposed to doing it, All I am asking for is to try it before
making the change.  


