Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 768D56D728
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 22:03:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 7D8FD22F4C;
	Mon, 18 Mar 2019 18:03:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Mon, 18 Mar 2019 18:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:cc:subject:content-type; s=fm1; bh=QdlZ3xrStRtMxSNHS5gcx8aBYHxG
	1TSpFTiIbbdktIQ=; b=n/5yu/iabKy02h7H8VGLvGi4HPf8hKEnQM94mx3GWzTZ
	eCJwFtcqzsoRbAX/Qgs8/JnmBC3xlqrw8Y36w3x2d0K/TBM30+BOUQ6YrBPvT3eq
	r4vLtWS83AKM0j22gU0N9bVkwi4Pn4f+ISgYCO2ifytCM5IhwvDRqu9FyMkhaMHe
	I1uy0qotCmXjYjPkEiZbqUufa4H4X3n0atMz2M5IkKhFs24FOjL2Lvm79Bf0Hyu/
	qTXU9UeXA3z5x+DZm/PsRDcRcbwON80RVv40DOWGBBL/dG30ivigs6YRI5r4Q8G9
	KVVTVytZxt5KtHUsuPR7aZBqCj2I6Exn5ez75op1TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QdlZ3x
	rStRtMxSNHS5gcx8aBYHxG1TSpFTiIbbdktIQ=; b=LUJvkxcpFBq3aKNygE+/gm
	NAWj2wDWVMLOWuUCYPBGu1pPEGo6UkVlG1VrQdUshkhQ4K4uVZMlZ57ECIPbJuoB
	fm3DlPG8PwVLKKvVdL3lgkc3MzhnnNkMdrjK/Y9BXSxazqejFOpUyZGZ6phYSNsB
	9i5jvymYbGmNk4KNOfRFYtjsVNY41IQzcwcybtPTB+uXCG2NGiWUkMJNLwjYnhpY
	LsFF5BIfqXxvOhXlN7zXyggaNg+6eNC63JjW1dBu6HazGMZ/XWdGMjXMUnftSXzH
	YiYrBEkSaRlKMzJOFaBLTr9+tJtNfZykjBXVEUczNhYUrW6K6FntuLrBZ67aUqgg
	==
X-ME-Sender: <xms:lxWQXLdk1Yl38komIgmeR_sxo0ZwWQ8TvpTofOBngfiOGpgzfakXqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddriedugdduheekucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfrrg
	hrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucev
	lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lxWQXI-O3s2BUgfoCOjzhbw6aCzTclBEL5pK_EMnFCdesUQJ0KvfsA>
	<xmx:lxWQXJicvmCkyGYmom6qsquDyxm-BkSurXmvy_klVuCPwV2oKSKyZQ>
	<xmx:lxWQXE_3zZ8vMLrka1gS4ZPQccb9cQC4lnIA3zvggE_YLujzp-AexQ>
	<xmx:mBWQXAvvwDqE762oITkW0cHSEFt3L7g9cL6G7RgvEtWSwVC39KJ9pQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A8D097C651; Mon, 18 Mar 2019 18:03:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-976-g376b1f3-fmstable-20190314v3
Mime-Version: 1.0
X-Me-Personality: 84186096
Message-Id: <10f0828c-9b4b-489d-8716-e3088393b80d@www.fastmail.com>
In-Reply-To: <CAJTo0LbaDk0044OMOE1m=Zy4sp0KmmHZ=gkPC4ri8QxSPN-PzQ@mail.gmail.com>
References: <20190318165138.30402-1-paul@betafive.co.uk>
	<CAJTo0Lbbcaexxy-PXpbmZhicdrR0z1pfi7Qu0St6N7CNT0VgEA@mail.gmail.com>
	<6d2b4813-483b-477e-8c20-5ebc2195a73d@www.fastmail.com>
	<CAJTo0LbaDk0044OMOE1m=Zy4sp0KmmHZ=gkPC4ri8QxSPN-PzQ@mail.gmail.com>
Date: Mon, 18 Mar 2019 18:03:03 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "Ross Burton" <ross.burton@intel.com>,
	"Otavio Salvador" <otavio.salvador@ossystems.com.br>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add tzdata-all package
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
X-List-Received-Date: Mon, 18 Mar 2019 22:03:03 -0000
Content-Type: text/plain

On Mon, 18 Mar 2019, at 21:30, Burton, Ross wrote:
> On Mon, 18 Mar 2019 at 17:10, Paul Barker <paul@betafive.co.uk> wrote:
> > That is a good argument. I just checked the difference in image sizes though (from buildhistory):
> >
> > core-image-minimal + tzdata = 8,868 kB
> > core-image-minimal + tzdata-all = 15,788 kB
> >
> > So it's probably not an appropriate change for everyone.
> 
> Agreed, and I didn't suggest that we switch to installing all of the
> tzdata by default for that reason.
> 

My concern is for recipes defined outside oe-core that pull in "tzdata". Do we just mention this in the release notes and leave people to manually update their dependencies if they require a minimal image size?

If we go this route we should define a new "tzdata-minimal" package which contains what's currently in "tzdata".

I also think Otavio has the right idea on calculating the dependency list dynamically so we don't have to update it for any future change to PACKAGES in this recipe.

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

