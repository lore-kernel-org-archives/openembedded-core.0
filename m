Return-Path: <paul@betafive.co.uk>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6C37D7F65C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 23:32:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id C12F8836
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 18:32:10 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 12 Nov 2019 18:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=CTb8P6w3bP9ygsSmM55fA0lvBqYAq3M
	riZhTJw/YGn8=; b=apKo+Aupta+D2dqBJRXUXLiQlt4m5tC+CR+MomoC8zKhCT0
	p4ivOYJ2stNsKo3St4ra2cD6hEN6XhQ7Tj+UgypluAD0KzzI55IvLEsFEPiZ0hRx
	ZjbM+YrnOIfelkwFLks/SASMlSsk4mvemDiYZFnYYqBJOiIHDZhnNYPBoNlLuPV8
	bTImOgLg5jsTTD1ZqOD2HdDsFIrLtGd7As6fJTj9GC2zgvtRgZwWzDOE7RG25tCB
	s9ZsLAimOgQvRpAKs1f+D8/DuXN9k4/VtBk8k1T917TyT1buSAusarQCjTCMuKUo
	dLttj9kUrh/ifHo8vhYIkWmClUzl9Va1B33vV9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CTb8P6
	w3bP9ygsSmM55fA0lvBqYAq3MriZhTJw/YGn8=; b=YWQLYpawB4xhLR3UwdJRCd
	Or33ouD+9JpHP2nu+AVOctXzvM8TynnZfx5jFCIs8fuwqAbOTq328bUp1Coy0iMv
	OjIGFngZE9Q374TqQy5k/q+VIiVDkjLvd3I5BOwzwma7jewWaPDyBzyNST26962A
	cJrllvZ0wln68/3mTDSDpWD+DzvhEoDLi/hkJ42SZPdgoYvWnIa9pSUeMnR0jQmm
	f7MOueHHeeTixhS8Cn+94Jmb4snNWk9/Lc4C4yG1IzmQmzzbxK7WIhx/O3p6V/Np
	N2hDQk7c0NehkYCMCmm77n5SnDsG8Xq28h+xXoBTd3S+c1HFuNdJrq61B9wZ560w
	==
X-ME-Sender: <xms:-UDLXTcefESmPLiHGQ0hGJlgHOGgV4Hoc6eS2qoFu7TpHzQhnrNKfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeftddgudduucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffoh
	hmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecurfgrrhgrmhepmhgrihhlfhhr
	ohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivg
	eptd
X-ME-Proxy: <xmx:-UDLXV6ilAizWbgXuukLP9vAgAOvSds1Q4uT2lxq2gpM5fE9MPhZQg>
	<xmx:-UDLXVnrPMC56pynKGe1Y81NYnEJyvaPZHL6JTveu_RGF0cCW3B6Sw>
	<xmx:-UDLXZ9YphvHEPffnCqvkUFvw-PEc_H9Jv4vp47LfnuL5VenEg4F_Q>
	<xmx:-kDLXVgKpVbIIZye0mvE_Y9cGKCirnG413UnzqXlDWEVbA2I3d7-2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A2202E00A3; Tue, 12 Nov 2019 18:32:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-557-g34fce02-fmstable-20191113v1
Mime-Version: 1.0
Message-Id: <ebb0fa72-ca88-42e6-a2e9-37acf03f6b30@www.fastmail.com>
In-Reply-To: <20191112230230.2330.23616@do>
References: <20191112223119.47941-1-paul@betafive.co.uk>
	<20191112230230.2330.23616@do>
Date: Tue, 12 Nov 2019 23:31:49 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "OE Core" <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 12 Nov 2019 23:32:11 -0000
Content-Type: text/plain

On Tue, 12 Nov 2019, at 23:02, Patchwork wrote:
> == Series Details ==
> 
> Series: cdrtools-native: Don't set uid/gid during install
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/21103/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Upstream-Status is Inappropriate, but no reason was 
> provided [test_upstream_status_presence_format] 
>   Suggested fix    Include a brief reason why 
> 0001-Don-t-set-uid-gid-during-install.patch is inappropriate
>   Current          Upstream-status: Inappropriate [native]
>   Standard format  Upstream-Status: Inappropriate [reason]

I'm not sure what's wrong here. I've given the reason in the format shown in https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status.

Maybe it's getting tripped up by the capitalisation of Upstream-status and giving a poor error message.

-- 
Paul Barker

