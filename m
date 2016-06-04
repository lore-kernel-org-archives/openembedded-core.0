Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 06381771B3;
	Sat,  4 Jun 2016 21:11:55 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id t40so110849434ioi.0;
	Sat, 04 Jun 2016 14:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=WEl6BPvZ9qQ0nWVXB9x5f3dbUqdWMWl+z2KV88Sj4WE=;
	b=jSzmhXy7lt/9YgfSkR9yieFsHGeOnIzCxi/aUDgQBs1RtvAsUniZy7gNfgC9XMyEg8
	0pByWa/AvakP9jQ1QMFE+GO6F/OYGQoNAAWScKHY/v7RVcJoI96V5ribBD02nnd7mFkF
	xKiXBYPaoY2mmvfZ3hksMWZIqqIcEiN7ZmOVGTIlWE7ZzxoynGBtkfspINBFYE6K58TN
	oR+tEPw/LBva9A8IrCY6UY4tGO17rukeuyAIUsnXszQpm6l0rsofF8w4ci7uU7cg4fVZ
	OgDUMruE7p9whAX3kwF+FBYDmp+Sb9Py8tC5ndOtN//AUh9x/DNxUyCQM5KtHmn8uQX9
	fIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=WEl6BPvZ9qQ0nWVXB9x5f3dbUqdWMWl+z2KV88Sj4WE=;
	b=TZxMQWeI77FslZR8/Fr19bIQOHITaPi5KAGoq1fgcYf9ZetcaJxCyLT2RcortvdlNH
	7ewtglCWQan3Q6yAxDIzQjP015WLioarN+0+yRARV4WaVv3pmo+m32r3ClrR9NCU2HV1
	SzkPuo+6uioSslYVRlIdhp1PBKunvb0hEvBkw/ebTXvl8SMfLMFnG3tHud/9t+Yfp5Ha
	/kcjsPw0YNp75F2YmjK5ypVDpV/rxdhbWQ8PERqMkvVCyL8EjbL2Eb0WDWLS+LBkrKxP
	6UOHgN9LoM7ZVBnZwWpQ2cHR6xeN1sUn8IXAeU8icWe/dayfKwW0q6+4RYhtd2yJLKXl
	DAXw==
X-Gm-Message-State: ALyK8tJN7dARrD8qph383NMGFzj/xVgHHsqWdp94NNMIjjBqOFHgjpRA+y/xZivKMLpfZw==
X-Received: by 10.107.20.210 with SMTP id 201mr14768203iou.152.1465074716241; 
	Sat, 04 Jun 2016 14:11:56 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	v62sm2658583itc.19.2016.06.04.14.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jun 2016 14:11:55 -0700 (PDT)
Date: Sat, 4 Jun 2016 17:11:49 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160604211149.GA28175@openSUSE-i7.site>
References: <1464054649898.9b34c448@Nodemailer>
	<3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTBcwNx0SMYjQ2GbRJviekG8h734t0yH24zeyiQEG367Q@mail.gmail.com>
	<17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: layerindex upvoting Was: [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Sat, 04 Jun 2016 21:11:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri 2016-05-27 @ 08:25:23 AM, Paul Eggleton wrote:
> On Thu, 26 May 2016 22:18:34 Andreas Müller wrote:
> > On Thu, May 26, 2016 at 10:14 PM, Paul Eggleton
> > 
> > <paul.eggleton@linux.intel.com> wrote:
> > > On Thu, 26 May 2016 13:46:21 Cliff Brake wrote:
> > >> On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.com> 
> wrote:
> > >> > meta-java repo was moved to:
> > >> > git://git.yoctoproject.org/meta-java
> > >> > 
> > >> > Is it possible to update the list with that info?
> > >> 
> > >> Done, thanks!
> > >> 
> > >> https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a02341562
> > >> a9b f254b3dd9dc71704
> > > 
> > > At some point it would be great if this script could be driven from the OE
> > > layer index rather than being a separate entity - then updates would
> > > largely be self-service for the maintainers, or at least they would only
> > > need to be done in one place.
> > 
> > Maybe a bit off-topic but layer index should have some mechanism of
> > removing rotten layers.
> 
> We've discussed this on-and-off at OE developer meetings for a while now. FWIW 
> I can remove them manually - actually I just got around to deleting meta-
> picosam9 which has been unmaintained for years.
> 
> Part of the problem though is determining what "rotten" actually means. 
> Additionally, there's an element of leaving things around in case someone 
> comes to fork/revive them again. We do show a "last updated" date but it would 
> be good to figure out some other way of determining and indicating "layer 
> health" - to date I don't think we've managed to figure out anything practical 
> for that.

It's nice to see this topic come up. For the last couple OEDEMs and OEDAMs I'm
usually the person to brings this up and it usually gets bandied about for a
while. There's certainly lots of interest in general and from the toaster
people in particular since old layers are likely to cause a build to fail
which leaves a bad impression on newbies.

Currently the best idea we've come up with is to have an opt-in class that
people can enable in their builds which will "phone home" to the layer index
indicating what was build (target, distro) which which layers. Hopefully we'll
think of a way of giving some sort of relevant status in the layer index;
maybe with different coloured balls (a la Jenkins) or something to click on
for the data. I.e. someone built a poky image for a raspi2 using master 2 days
ago and it succeeded, but the 3 people who tried since have all seen failures.
Maybe toaster could use this info somehow too.

Ideally, as a start, we would only record nodistro, core-image-minimal builds.
If people fed in their results with various branches and various (BSP) layers
doing this build in a month we'd have something meaningful.

We're open to any suggestions :-)

