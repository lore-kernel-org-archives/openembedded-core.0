Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 43F117FB11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 17:49:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so25558675wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 09:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4pg5Zgle/+cdlgcrQYMUIVg94mXLcWzVs/d9WCpZhVE=;
	b=WeXFcubO7ANdLyYEWRaVhvJoCnI7OLw1L+pEue3u1SFWsiJLQMho4eM+IEEvzUCTIT
	fSx98v3J211g5fvS9HjQJnVr5TUMBRD7R4p7/G3HdvXhXk17Ds+nad3kKGsnCrK+JDu3
	xEcIWfKYoApSiHVtAaJ3vCH/+6B+kQnaXr4sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4pg5Zgle/+cdlgcrQYMUIVg94mXLcWzVs/d9WCpZhVE=;
	b=Uoa0uog+e5w5dAgzBmvbjwKV65+LspR7de9wjG3FZk0LbAmgfy5h/edFlLx1WKTKQw
	6+XDWIXRY/+7vqjWdl0CnPCQli1iZAMceesbPWNl4sTtkJLnpTpRsOe9lvm15iIa5PZ7
	WHMq4fEmcw8jgLq/ZeX4v4nFpxN/Oekh4JhWplnD9kQth96d12YmUpdXIQkxwaMrQI2r
	L1LTTaoO1sYL2OVxwePQD6aGkcf9JoPL8SZpPhITZUcRV+cXu1BQullRBb5RLe2W2etP
	gt/+3K2YXfqF3XMdKWZ0dMY2Lus7IPJfsC0upbAHfBkGojW0YahZ9RoNFtqD3WoT77Nw
	Zfuw==
X-Gm-Message-State: APjAAAVyemzt/8fXk2IGVdBtU2oNFODUxB6clBcs3pSt+vlixTnoLjS8
	HPOsta30tqSzw/UEVvh301PrKQ==
X-Google-Smtp-Source: APXvYqx5UzMcasO5K1xqq44weqQn3KiBira+Zg0HthksKxkmdxEbDkjYEosTOgtYcNvmKnkUZv1lJA==
X-Received: by 2002:adf:9427:: with SMTP id 36mr9948135wrq.166.1579369755949; 
	Sat, 18 Jan 2020 09:49:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u18sm39182931wrt.26.2020.01.18.09.49.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 09:49:15 -0800 (PST)
Message-ID: <1d6df236caab354f681ddcfd160494cb5abc7695.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Sat, 18 Jan 2020 17:49:14 +0000
In-Reply-To: <d7933788a8f6741d3d829a5703a6860c5e8466ae.camel@linuxfoundation.org>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
	<045bded79ff6636698fe2f9d2b64171fdebd61d0.camel@linuxfoundation.org>
	<CALbNGRSa9oFogL4xAfbbAuCPzzLQTOD0js6Znu=p1z_PUHubFw@mail.gmail.com>
	<d7933788a8f6741d3d829a5703a6860c5e8466ae.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2 00/10] Make MIME work on desktops
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
X-List-Received-Date: Sat, 18 Jan 2020 17:49:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2020-01-18 at 11:13 +0000, Richard Purdie wrote:
> On Sat, 2020-01-18 at 12:08 +0100, Andreas Müller wrote:
> > On Sat, Jan 18, 2020 at 9:40 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > > V1 -> V2:
> > > > * Shelve global path export thingy
> > > > * Add me as maintainer of itstool (let's consider 'ü' in my
> > > > name
> > > > as
> > > > test case :)
> > > > * Change "to to" to "to" in commit message
> > > > * Build shared-mime-info from git to allow automated upgrades
> > > > * mime-xdg.bbclass: Be prepared for packages as libreoffice:
> > > > Desktop
> > > > files
> > > >   installed are absolut symlinks broken for us. In case other
> > > > projects do same:
> > > >   Offer asolution and guide recipe writers how to handle by
> > > > generating warnings
> > > >   with instructions how to handle.
> > > 
> > > Thanks, this looks good to me. It did generate a warning on
> > > master-
> > > next
> > > builds in many places:
> > > 
> > > WARNING: libfm-1.3.1-r0 do_package_qa: QA Issue: package contains
> > > desktop file with key 'MimeType' but does not inhert mime-xdg:
> > > libfm-gtk path '/work/armv7vet2hf-neon-oe-linux-
> > > gnueabi/libfm/1.3.1-r0/packages-split/libfm-
> > > gtk/usr/share/applications/lxshortcut.desktop' [mime-xdg]
> > > WARNING: libfm-1.3.1-r0 do_package_qa: QA Issue: package contains
> > > mime types but does not inhert mime: libfm-mime path
> > > '/work/armv7vet2hf-neon-oe-linux-gnueabi/libfm/1.3.1-r0/packages-
> > > split/libfm-mime/usr/share/mime/packages/libfm.xml' [mime]
> > Slipped through - will send a follow up
> 
> Thanks, should be simple at least! :)

I've sent a fix out which I think is right...

> 
> > > It also generated:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1458
> > > 
> > > which partly is the python2 removal that was in with the test and
> > > partly this series since itstool is GPLv3 :(.
> > Is there any activity required from my side?
> 
> Well, as things stand this series breaks meta-gplv2. This is
> currently
> tested on the autobuilder and turns it red. I'm therefore blocked on
> merging.
> 
> > > I have to admit I'm not sure how reasonable it is to keep hacking
> > > the
> > > gplv2 layer to work...
> 
> The question now is really whether we want to continue supporting
> meta-
> gplv2 with master?
> 
> I don't like the layer, I think there are other approaches we're
> going
> to need to take going forward and the project may need to send that
> message.
> 
> If someone steps up and fixes it, great, we can move forward and I'll
> defer that discussion.
> 
> If nobody does, quickly, then I will need to start a discussion about
> dropping it from the core YP testing. This patch is blocked until
> something changes though :(

I figured out how to fix the issues so I've sent patches as well and am
rerunning the autobuilder tests.

Cheers,

Richard


