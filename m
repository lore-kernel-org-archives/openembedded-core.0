Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 152A37E27F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 19:05:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w13so9077365wru.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=MmLBIpM9d6AqaUNgpvMEgNW+fhMA1GKhI7Q40Bzwy3M=;
	b=C1/zQHjTrB4wonBVQnm/xvFRwSGuo4GSmnKRN2hUAnNtAzth19fyYI9t808nXxvctq
	NLrIw8HQXh/DrVE3n6Di1bU2VjTVfPAxt2LZox4j6yEZPlJXbYcScf287y+z3KsG0c8K
	crM/ScWmjqrpkKRSkOGHfq/JL9vY6knThU0OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MmLBIpM9d6AqaUNgpvMEgNW+fhMA1GKhI7Q40Bzwy3M=;
	b=OtvVfetcTfPy48vY18hBXKdiDfhU6B1xdVLPcZeR/x/4jED9VPISQHwFJYg0Rxvy33
	Q32wm4msN6s9P1st10elQG5E0QK0fgdvngeUdIQ0Q4EQ5ejDs6n1AteXPMjcwF5Tu8s0
	c9g1hgW6GoBZ1NcYlQdcEPlDCz/+Pr8Z4Q3l6WO7f18l1R4bQqOpvYT8H8ShH7vtv3ty
	m5mkuyMvH5xXm7qId5dxeJGt2vy41SLMLCzvJx6USCHPNTDVqkSiFFFqTlZtkYIgQQvp
	AVoOEt6u65CDwBgPxHbuG3J5tX73nJI+UoSMQTqi2asERbzMDRXLTkzZ+kMKVTI1JH9/
	TqJQ==
X-Gm-Message-State: APjAAAVimfVqNUZ0MTq5mx4TaDgYsHQWBAURxgWwAnvIHYvNmwaZj9n8
	unkdzNvDHyGCWx94fJmi2MLr7A==
X-Google-Smtp-Source: APXvYqyv+ru6CeJz8QBPSDK4VjQqs5g9f6QmqC7QRxojBudanx/pkEnELIFcS5TbTX6gJBb4wg+4HQ==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr35346676wre.9.1558465533848; 
	Tue, 21 May 2019 12:05:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b12sm7019355wmg.27.2019.05.21.12.05.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 12:05:33 -0700 (PDT)
Message-ID: <5c6ea6fcd04fb7020e73f4fcd39f989c362ad072.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2019 20:05:31 +0100
In-Reply-To: <CANNYZj_8kDSCn8w+JXQ_Z4O1AWpsRypcjRVOqNG15+Q_Cs_Y5A@mail.gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-32-alex.kanavin@gmail.com>
	<06cf651bb9729dab7f0ddec0f6cfc5f878773b06.camel@linuxfoundation.org>
	<CANNYZj_8kDSCn8w+JXQ_Z4O1AWpsRypcjRVOqNG15+Q_Cs_Y5A@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 32/42] libdnf: upgrade 0.28.1 -> 0.33.0
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
X-List-Received-Date: Tue, 21 May 2019 19:05:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-21 at 21:00 +0200, Alexander Kanavin wrote:
> On Tue, 21 May 2019 at 20:44, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2019-05-20 at 16:11 +0200, Alexander Kanavin wrote:
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  .../libdnf/{libdnf_0.28.1.bb =>
> > > libdnf_0.33.0.bb}               | 2
> > > +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb =>
> > > libdnf_0.33.0.bb} (95%)
> > 
> > libdnf-native build failure:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/850
> > 
> > Could be caused by the other fix? :/
> 
> No, this looks different, and probably specific to the c++ compiler
> on
> Debian 9 host - what gcc version does it have?

purdie@debian9-ty-2:~$ gcc --version
gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516

Cheers,

Richard



