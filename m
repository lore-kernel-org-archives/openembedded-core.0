Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B10B97E4CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:32:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so9023454wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 05:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=wNlrEt29zCULEya10iDHa0tFMzyT0JyXseQ2VQk+F2o=;
	b=Ayvmw2m0DW5rQU7BweTu/47IJ2w8faOIOYrkZb8Wizetzn/Td8enG1+Pqkg6H78MrX
	na8oAm581Y/Eqzwy95VOgQdUW64B7cq2IPToIN7AvEQhDkGUUyh9xZVEszBvxo7OIieo
	mH8o+dnyY9IodfwXTs/fUuHWwx9eBIXRe0DYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wNlrEt29zCULEya10iDHa0tFMzyT0JyXseQ2VQk+F2o=;
	b=mnkeUX+JieZLegvLbdywTpvOv/hokp63ZXv0ZOpcvdLmTRTGK9tHjbLCAlnH6CLnGq
	M07JUEN5gf2BgH02jF1xIhkvH8rXKRESYV4RsmuqzbO2jQuDea/IMXaFnFY7dsYzrJyt
	fg+WFnOVTsFD8zJk732dRiTHtDad0mQnaXwy6puwMDo6E6m1NWjCki2+UbFnsqkQUuUj
	4I3dwATKY4HJK8UL0mWatgBuGFzY1vQxkDmE//5PBS1jv+PAoGzH8R6c6c/2f28apN4f
	HUvC1P4mzlYfrKVhNRfJADOJdMlQI+k1sJ7Wu3czVCxZyOPPeRkfpxA4OwptGB+Do/XF
	LUXQ==
X-Gm-Message-State: APjAAAUvTlG/fwjqTHk9PLDJSP8eOGbc+yh5HRT2xcMdCiSnDjgKaCpp
	a+EWbNwkvNovaDnX49zUKgs0bw==
X-Google-Smtp-Source: APXvYqySu+xS9OVpkmVhaRkrfGX1PYjGWO/pPSDj7mn8WBHfgaHoccnAgmOiPTO8FtSFs+nhe5yAFg==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr42999906wrt.111.1560169965330;
	Mon, 10 Jun 2019 05:32:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g5sm12910315wrp.29.2019.06.10.05.32.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 10 Jun 2019 05:32:44 -0700 (PDT)
Message-ID: <4cf0eb7936f1e27033202312d5e4f27e27266641.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2019 13:32:43 +0100
In-Reply-To: <2c3427c3986a8fe363e6a99f3d78a136c79efd61.camel@linuxfoundation.org>
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<20190607121954.116898-3-alex.kanavin@gmail.com>
	<2d919bbd6f607604f8315c95e1154c169fd2c5da.camel@linuxfoundation.org>
	<2c3427c3986a8fe363e6a99f3d78a136c79efd61.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gtk+3: update 3.24.5 -> 3.24.8
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
X-List-Received-Date: Mon, 10 Jun 2019 12:32:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-06-10 at 12:47 +0100, Richard Purdie wrote:
> On Sat, 2019-06-08 at 10:05 +0100, Richard Purdie wrote:
> > On Fri, 2019-06-07 at 14:19 +0200, Alexander Kanavin wrote:
> > > Rebase 0003-Add-disable-opengl-configure-option.patch
> > > 
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  ...-Add-disable-opengl-configure-option.patch | 41 ++++++++++---
> > > --
> > > --
> > > --
> > >  .../gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} |  4 +-
> > >  2 files changed, 23 insertions(+), 22 deletions(-)
> > >  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.5.bb =>
> > > gtk+3_3.24.8.bb}
> > > (84%)
> > 
> > I retested with the date/time on the workers fixed and this series
> > present. We saw:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/693
> > 
> > so I think there might be something not quite right with opengl
> > disabled (the main difference to nodistro I can think of?)
> 
> Its now in master:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/687
> 
> so I think there is some kind of parallel make race in the new gtk+?
> 
> The autobuilder is proving very tricky to read at the moment and
> intermittent bugs are making it into master :(

I've realised the error wasn't:

Failed to open file “./gdk.gresource.xml”: No such file or directory

but

| glib-compile-resources --target=bloatpad-gresources.c --
sourcedir=../../../gtk+-3.24.5/examples/bp --generate-source
../../../gtk+-3.24.5/examples/bp/bloatpad.gresources.xml
| 
| (glib-compile-resources:91029): GLib-ERROR **: 02:42:13.583: creating
thread 'gmain': Error creating thread: Resource temporarily unavailable
| make[3]: *** [bloatpad-gresources.c] Trace/breakpoint trap

which sounds like a parallelism issue :/. Question is which resource
we're running out of...

Cheers,

Richard



