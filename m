Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 53C617D48D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 06:57:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q1so14934255wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qYCNX26UxZ9C7UO9yl0oo7JLXXErpFpwvd64rFDzn3I=;
	b=HcYIpMnGElVo3iYO4l8wj2RymYt+6mZrfRlY0uLDb8Wns758z2qMCU56+EuIg9cst8
	xl4SvFEV0/oAZ81m3/g10j7krxc6ORAG7BU1StmqvLExkl4G3Tg/t5BVp29/QT08U9wh
	0FkkImsgSxDMIdaSn3XU7FzN/R1b2nHdf0E4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qYCNX26UxZ9C7UO9yl0oo7JLXXErpFpwvd64rFDzn3I=;
	b=nUWrGTucH4ROSdGkwUC/StcmbEr5ap8DLsxcjbdjoQNx22pVjIbCpChRUGuh+ZXyvQ
	HVuHZAMzVocqqrX7D4itlU+OsmufxhDHk8wFjSgNGFQ4aLxo/CC/rtabYEKJvd8jYue0
	6rl86dKpxiWvzJhYkCEhPsYU5xQJcPj3TMmFrFQAuCxstr4MRGn+j8wXdyDajnUWTT4j
	ONo55MIbIPXx9h8h+NaFym10ClcEaCL8cmNqv8ZbF8jc1uQtI4f0912cL0V+PIPi54kI
	rXjuF51e6s7xt5S4UsuZ5GlDAcuKi83Ftnvsu2bJHGRIlQ1auMrDjJikjxDuBpvLQhWP
	4A0w==
X-Gm-Message-State: APjAAAVpS6zQP3flo/78HFcFU0BtYT1qSA2kyD//alVUM79Bk0t5Z7U1
	tPRtUVUb737bBaKUVJxy2VWJyQ==
X-Google-Smtp-Source: APXvYqwmtkzFKBDPss9Zkt6ELYSO8ly53hstInqzyn0SZ23F/yj/3TWf/6tjNPmQ6xqNwr6HBOIpVQ==
X-Received: by 2002:adf:e449:: with SMTP id t9mr16673858wrm.204.1554706635112; 
	Sun, 07 Apr 2019 23:57:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w16sm41331487wrt.84.2019.04.07.23.57.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 07 Apr 2019 23:57:14 -0700 (PDT)
Message-ID: <4ada62440bafff322033ec43b1a1af9342539f8c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mariano Lopez <just.another.mariano@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Apr 2019 07:57:13 +0100
In-Reply-To: <b5761ac5-380a-64bf-f3a8-d93cd9aae822@gmail.com>
References: <cover.1554656203.git.just.another.mariano@gmail.com>
	<694f59ce48ac5931431cd76f12d7bbe23d279fbd.1554656203.git.just.another.mariano@gmail.com>
	<475418a26ad41bf4dd50386badf97eab3b6004f6.camel@linuxfoundation.org>
	<b5761ac5-380a-64bf-f3a8-d93cd9aae822@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] update-alternatives.bbclass: Add function to get metadata
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
X-List-Received-Date: Mon, 08 Apr 2019 06:57:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-04-07 at 21:23 -0500, Mariano Lopez wrote:
> On 4/7/19 4:32 PM, Richard Purdie wrote:
> > On Sun, 2019-04-07 at 12:15 -0500, Mariano Lopez wrote:
> > > -
> > > -            # Default to generate shell script.. eventually we
> > > may want to change this...
> > > -            alt_target = os.path.normpath(alt_target)
> > > -
> > > -            alt_setup_links  += '\tupdate-alternatives --install 
> > > %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
> > > -            alt_remove_links += '\tupdate-alternatives --
> > > remove  %s %s\n' % (alt_name, alt_target)
> > > +        updates = update_alternatives_alt_targets(d, pkg)
> > > +        for alt_name, alt_link, alt_target, alt_priority in
> > > updates:
> > > +           alt_setup_links  += '\tupdate-alternatives --install
> > > %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
> > > +           alt_remove_links += '\tupdate-alternatives --
> > > remove  %s %s\n' % (alt_name, alt_target)
> > I think the above is three whitespaces, not four? I know its minor
> > but
> > it jumped out as I was comparing the code before/after!
> > 
> > Cheers,
> > 
> > Richard
> > 
> 
> Good catch! I have sent the the fixed version but I messed up with
> the 
> cover letter, you can find the correct version here:
> https://patchwork.openembedded.org/patch/160236/
> 
> 
> I think I don't even need to put that link there :)

Thanks, unfortunately nativesdk-util-linux fails to build :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/711

Cheers,

Richard


