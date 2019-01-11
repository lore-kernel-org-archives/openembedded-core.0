Return-Path: <paul@betafive.co.uk>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id AB7687C16E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 17:16:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 97C602221C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 12:16:30 -0500 (EST)
Received: from web5 ([10.202.2.215])
	by compute1.internal (MEProxy); Fri, 11 Jan 2019 12:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=message-id:from:to:mime-version:content-transfer-encoding
	:content-type:subject:in-reply-to:references:date; s=fm3; bh=CEh
	LyJilbJ0hFsqa1tgpzp+a3p6DevAAC3kd474Gr6s=; b=PB7mCQK+sQN7UnePdl/
	7JenrDRAK4iITlI3yW6fnerAWKp5xImc7rxL8/pImPBFHJGEhBl4G64JVvu9EDSo
	l1pftUkpiYM2TBKPqXNa6pRlC3G2EP2m3sEUzS1RA+BR/E/dbI0qlXvTQXnQlbXe
	xI6w7CCDUkXayXe4HoqIcSpyYHvzvLjQ2nuZy/BzTzttSkHYxucQGsokuq+my4da
	5wVmfWvplzXhehaMR8sltDpU+WBuIhKo3eMVsUrnk61qhRZGI8a7Lwtc3pbMJmeR
	2Y1OyPp+JmNHizViLMIam4tJIadMujNEj6nADHiIE8n9z1/DweLBkcfHetWjcm8H
	tjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=CEhLyJilbJ0hFsqa1tgpzp+a3p6DevAAC3kd474Gr
	6s=; b=Mzu+KBij8zyuqzSckcH3avbNSys//UKsAvX6ZzFb2SItLjPE2F4o1bkNr
	Z20aGYahwezrvMXJH/IFdblMMZgFaPn/Y9nxAfxdZQUrR4nij16tVB18MneQ3+3e
	sZd4AZJPNBxhbM7eR8YvuRTY+GMkqVHf2iV6okE30vGFrAHvWApk7xDtgP5AX7oG
	1lGbQqGQx81D4KlOO5QjFQjsaTgnSksocLsjEQEEKz0T13psPCkrjM7zKTaHzcpj
	zCgv81Yga2lLCOzrfHsnHmSWziVybMhlrKSwdzpz09RpAN9Rtt24U7jkskLY2nOq
	vj4Pp2rJfN1Z0Al7FQ96uqs6m9yWQ==
X-ME-Sender: <xms:bs84XJIGr_kq22-eUJYsZVTQQ5FQXgynYKbaeF993wQZijRE2vMzgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgdellecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucenucfjughrpefkhffvggfgtgfoufgjfhffsehtjeertdertdejnecuhfhrohhmpe
	frrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecu
	ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvg
	gurdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgv
	rdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bs84XBAdJ6LslO0iRxUJD50qd4vsdBO1i6Gp4HDz9d2hqqvSO8TLcA>
	<xmx:bs84XCY9qqgUF0F4DHej3tYwjCzfkXhL99RmmhRXqXapmpr6-bzqCg>
	<xmx:bs84XFlgnZpyxKiXvelG2Zgc67TwCY9wdLwHX5xpF-Lhc9kDXryNdg>
	<xmx:bs84XI-tD0OBUAk_PGoggvzOozHyREhm08B7OZ-6Ne3VPhy_1A6Ouw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id DC3A39E19E; Fri, 11 Jan 2019 12:16:29 -0500 (EST)
Message-Id: <1547226989.885609.1632072120.4FE7D8CF@webmail.messagingengine.com>
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
In-Reply-To: <20190111170558.2331.12366@do>
References: <20190111164438.19749-1-paul@betafive.co.uk>
	<20190111170558.2331.12366@do>
Date: Fri, 11 Jan 2019 17:16:29 +0000
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFNob3J0ZW4gZmlsZSBuYW1lcyBpbiBzc3RhdGUtY2FjaGU=?=
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
X-List-Received-Date: Fri, 11 Jan 2019 17:16:32 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On Fri, 11 Jan 2019, at 17:05, Patchwork wrote:
> == Series Details ==
> 
> Series: Shorten file names in sstate-cache
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/15617/
> State : failure

That's weird... the patch applies fine onto master here, I've just tested applying it to a clean clone of openembedded-core.

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
> * Issue             Series does not apply on top of target branch 
> [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 65c419b8c4)

Git can't find a commit hash starting with 65c419b8c4 in poky or oe-core.

> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 


-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

