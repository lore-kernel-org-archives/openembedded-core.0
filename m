Return-Path: <paul@betafive.co.uk>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 16B9E7F89C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 13:09:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 25C682177A;
	Thu, 14 Nov 2019 08:09:40 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Thu, 14 Nov 2019 08:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=5WwkzqR+zZjpGRFNoRwY4AO9Ghstp5m
	JqO3OJ/Nfifs=; b=HXgAsmIltRDMYaE14Ftje0pLTvwjhsHOxANJGhac9r+gAhS
	p+Oa07xC7VOkcKarrY3/wb7GGbG+cS1AwTfUrsaLW9u1t1xbZ07L+kdljKfc+BMq
	0Qmw43VX4m4gjMrUAi1asA3ufFIDQet/0QjSOcurFMOwr4+cxFNwl2A5dvqsgkX2
	nB8l8MuiP2r9fv+Cfaq4t3IqIcAtnRDXqgmAxWGMoF/KWgr3Tw+eniUKlcCWiuQh
	h8wQCWpFNKA2Zr79FadJg4gynO7IRsI/Cv7DcGjCZSoxDQd7ATLxJ0MfHUPGWzdC
	zFBTxgzN/J7jYn8e55qPpG7jsB1PDkiPdtOXkPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5Wwkzq
	R+zZjpGRFNoRwY4AO9Ghstp5mJqO3OJ/Nfifs=; b=pnDFquu0HoWulm6ArKkrZo
	jKjWMnXRMVvhGiEhU9CwXl+6B3fjZsc2O0obypvIgmF6FXGQ1gLyM5uAEX+4Ytdq
	Ls8REviJ5fNoFkgtbf1HV294st8QX8EKO5ee72fHvHBfPL3l3vdlUnA5vsqL8KfX
	0sQt3+szgKmaxiM8McIUbIxhnbxSFpeM/octWrDYza0NhWo1zC/lynCdasnINB1f
	KxYKb6dKOHZ+aD1TtiF6H4MmzJqIK10J1hUFIgVIeJT9NdhOblVpYCfuAxVEPVyi
	qX3bucACaZtu/YbWk4y2xXvEsBMyamSxiNyeLL2tx63LBU7WtWxEHU+K3z1UTmIA
	==
X-ME-Sender: <xms:E1LNXbsgJ0e2JtJ39Dz9HlMwaWnsh8QMgODdRcAE-PD0600A9DGjDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedggeelucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffoh
	hmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvgguuggvugdr
	ohhrghenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtg
	hordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:E1LNXQvnmWosZbRcDtuRNNcSs2ABYhrgNmm7VWyuUcrH9Cv75L99Wg>
	<xmx:E1LNXZwu6vKm1WJ5jb6rxMHpq9Tbhz5UdKt21VA8IxrYsyNjAHAbBQ>
	<xmx:E1LNXegJZSIWPbgplTT-OQ_ZNzhlMLLjRFE35mehML4_wMVe5Kn31A>
	<xmx:FFLNXe56CztFWBEf7lLKuNY_sfuh9rxi9qGOVBq6jH-1pZ6HjhjwCg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8B6A7E00A3; Thu, 14 Nov 2019 08:09:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-562-gfd0633a-fmstable-20191114v1
Mime-Version: 1.0
Message-Id: <aecb34e9-1332-405d-9f6c-3a39ca5efbaf@www.fastmail.com>
In-Reply-To: <72c148ae6199d0f352599791407870116b74833a.camel@intel.com>
References: <20191112223119.47941-1-paul@betafive.co.uk>
	<20191112230230.2330.23616@do>
	<ebb0fa72-ca88-42e6-a2e9-37acf03f6b30@www.fastmail.com>
	<72c148ae6199d0f352599791407870116b74833a.camel@intel.com>
Date: Thu, 14 Nov 2019 13:09:19 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"OE Core" <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGNkcnRvb2xzLW5hdGl2ZTogRG9uJ3Qgc2V0IHVpZC9naWQgZHVyaW5nIGluc3RhbGw=?=
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
X-List-Received-Date: Thu, 14 Nov 2019 13:09:39 -0000
Content-Type: text/plain

On Wed, 13 Nov 2019, at 00:47, Mittal, Anuj wrote:
> On Tue, 2019-11-12 at 23:31 +0000, Paul Barker wrote:
> > I'm not sure what's wrong here. I've given the reason in the format
> > shown in 
> > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
> > .
> > 
> > Maybe it's getting tripped up by the capitalisation of Upstream-
> > status and giving a poor error message.
> 
> Looks like it:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe/tree/tests/test_patch_upstream_status.py

Spotted the issue which leads to the confusing error message. Line 26 sets the regex as case insensitive but the later checks are case sensitive. I'll send a patch to fix this.

-- 
Paul Barker

