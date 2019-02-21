Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB7D79E63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 19:38:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 8B8F332B8;
	Thu, 21 Feb 2019 14:38:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 14:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=Kd9hILuj8E6AZmfioDqHlsdhYAzdftkI0RqgaUDQd
	DA=; b=pnwgGEjjKULRP3mYDmS0r0lNR9PxU5f8ibPea1dtM7RgziISrRdDR/QE6
	sYhdejWEaVVd3NrQhEQNgu8HHt8V5iyd/Dulf2kQXJuCXrvkmRGSqXTHlS7ozPBI
	cdk+j02JLW+ISaMTDHHiL5nKIgM99oFataHdr8Qo0pYiRtOB5G4LDirpRQ1DR0T/
	frq6+AjPCZJe0nO1GaG6+92CGItwvBeSyZdsLui2YCuoquHovUpOjGytSKulDFWx
	MnNy2VslTASNusyf2R1cn2ksO367z6c7JXHB61cwFaTuO5CoOsrjyw4tcrM1MlZx
	YH4DOnnsH7Ma81i0jqmr4VQ9OSkHA==
X-ME-Sender: <xms:Hv5uXK81HH3jGEyrMiJx-1a8W8E979SiMEhGwsdCPPknYlx2LRZsYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgddufedtucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
	uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplh
	hisggvrhgrphgrhidrtghomhdpghhithhhuhgsrdgtohhmpdgrlhhsrgdqphhrohhjvggt
	thdrohhrghdpphgrthhrvghonhdrtghomhenucfkphepkeekrdduudefrddvuddurdejvd
	enucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhinecuvehluhhs
	thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Hv5uXLceBR6KD0duPp9JdCpkd0_xTnhcE5MOMpBRmQqIhwO8R5pc1A>
	<xmx:Hv5uXI6tP5LxEygklYye0KfItN_73bVPF013lBxor6YmC7f8MRjLAg>
	<xmx:Hv5uXKUPkePJYfB9Q4fPpPhLrnUxgKompgzUm0SOvx8TWa5Zdf7U5g>
	<xmx:H_5uXO4n9_ww8j_DungsWFSv6lGdtun3WwpQh1tZsMqyKa7zyvMKhQ>
Received: from laptop (88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 67CEC10341;
	Thu, 21 Feb 2019 14:38:06 -0500 (EST)
Message-ID: <d69c68b7bd8d492a5551194eb82192de28a4a662.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 21:38:02 +0200
In-Reply-To: <CAMKF1srNi9+LnpUdg5qoXse6EZ6kKN5i2AJjLBYU4B1eBJ0oGQ@mail.gmail.com>
References: <cover.1550755109.git.tanuk@iki.fi>
	<4adb54612485c88c98ae65860adc8d820f5b51c3.1550755110.git.tanuk@iki.fi>
	<CAMKF1srNi9+LnpUdg5qoXse6EZ6kKN5i2AJjLBYU4B1eBJ0oGQ@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Thu, 21 Feb 2019 19:38:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 10:43 -0800, Khem Raj wrote:
> WARNING: alsa-lib-native-1.1.8-r0 do_fetch: Failed to fetch URL
> ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.8.tar.bz2, attempting
> MIRRORS if available
> 
> we might need a better source

I don't know what's going on with the alsa infrastructure, it has had
various problems since last weekend. Sometimes the ftp server works,
sometimes it doesn't. The ftp server is certainly the official source,
since that's what was advertised in the release announcement.

In my testing I used Debian's archives, but I suppose it's not cool to
cause server load on Debian.

Is github a good source? If I recall correctly, github has had some
kind of problems in the past regarding checksum stability, has that
improved? I see there are many recipes using github, so I suppose it's
ok.

This link seems to work:
https://github.com/alsa-project/alsa-lib/archive/v1.1.8.tar.gz
...but most github SRC_URIs have structure where the the tarball is
under archive/download/<version>/ and I wasn't able to figure out a
working url for alsa-lib that would have that structure.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


