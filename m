Return-Path: <paul@betafive.co.uk>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2A77D718
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:55:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 78AE4488;
	Mon, 11 Nov 2019 09:55:07 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Mon, 11 Nov 2019 09:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=aEPssklrDBSoppoH+L5VgwCGzjuLugK
	h6Q6jTV+j6ow=; b=Miq3M9vMiLHxVoAvrItpcYqDaMVmyyciZSqEzH3r8x8qrHT
	su7mJnXjAN6MkQW8BjMekUoiLEADtTA3tVwKYnrtnRXSSgQl61IA9GxxOKQfdOoX
	hMgJasFv5ypu3PVZQUtuZRXteht2pLqPbEaNwxZNLfsyZBNOa/ZKKDO2msyruMWi
	7BGhpmdUacLtA78kiVaGn7ClZ3jJ4kAzpBZsFRePeRHr7fIbDp3xcalMj1JjJKt/
	wdRO0pBUw1E2FHeoJiiRXB6+FH4Eb+P4mCxjuHfdrQHxJ70xHAXZ7hu1TDBXeWro
	ubCuQFU2KOnK9dC5n+M4rA1kiu+o6fSgAb7ctLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aEPssk
	lrDBSoppoH+L5VgwCGzjuLugKh6Q6jTV+j6ow=; b=ZICyhHug+OFvRHCmucHNfw
	oi5RcmKdFckwzTSYs0A4cbPAQLJNVdUo9vELXPP+VwJamX4zbiSxRV73Y3MeWdBb
	4MWSNT0BxLo5AKwuvIo/GbmLvWpXJuZKnmdPfrNcPaHCcRCzbCiJZkYZeCIZDr6v
	4Qd1ymwErZh6br3mXlHRNT/mA1qijBkm5QsUexIHm6aDtgBS20Xns8nlcIMNj8WQ
	Y1rNZmkXdA3H+3KiR3jGMR921o/T/w2dbgJkZ3DsP/rkb6Q6Oe0+1Ma8n/HM62CU
	hVcz1hMZvUP77IkFxBy9C8t7haePaRwUEitqtH348XiyEzeYt9Hs+8VI0DCVYUUg
	==
X-ME-Sender: <xms:SnbJXcud2YGTtp1IgRvhw4NhYK2Go33wPZ5iw77xikT2WLJzFgefAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvjedgjedvucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffoh
	hmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhr
	ohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivg
	eptd
X-ME-Proxy: <xmx:SnbJXZSuyPKYmQeiiRhhS1xnKWiX242s24U1MMLVEkBykZPclBRq2g>
	<xmx:SnbJXaXU7YEpzqbvtVdY8DmLE5p0sQgyXIknRiJd4wSckuk7wQPATw>
	<xmx:SnbJXbwgdISRJ3Pt_ZoOKObFwW0W56XQHrY-8pcYnX9QV3SGtPn6pg>
	<xmx:S3bJXat8pqPvteIdKWDUfWVQcBKjJ8DpxipQRrTbrRZCZ2RuxwTppg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7A015E00AB; Mon, 11 Nov 2019 09:55:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <21a5193e-5f32-4f29-91b4-c61115802568@www.fastmail.com>
In-Reply-To: <25f98f5a-1d22-918b-29d5-6a381844631a@topic.nl>
References: <25f98f5a-1d22-918b-29d5-6a381844631a@topic.nl>
Date: Mon, 11 Nov 2019 14:54:41 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "Mike Looijmans" <mike.looijmans@topic.nl>,
	"OE Core" <Openembedded-core@lists.openembedded.org>
Subject: Re: Getting "File name too long" errors in warrior for	sstate-cache names
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
X-List-Received-Date: Mon, 11 Nov 2019 14:55:06 -0000
Content-Type: text/plain

On Mon, 11 Nov 2019, at 14:49, Mike Looijmans wrote:
> Starting with warrior build, I'm getting build fails due to "File name too 
> long" in sstate-cache filenames. This is probably related to having long names 
> for machines, but this did not happen in previous releases. For example:
> 
> OSError: [Errno 36] File name too long: 
> '/mnt/.../sstate-cache/52/sigtask.9u_r4yv2' -> 
> '/mnt/.../sstate-cache/52/sstate:u-boot-xlnx:topic_miamilite_florida_test_xc7z010-oe-linux-gnueabi:v2019.01-xilinx-v2019.1+gitAUTOINC+d895ac5e94:r0:topic_miamilite_florida_test_xc7z010:3:52cb29cef3922da53a752f38e9bbfdef878af51813dc095d9c1451d572844f93_prepare_recipe_sysroot.tgz.siginfo'
> 
> 
> What can I do about this? There's no hint in the error message and searching 
> for the message text doesn't show much except issues with crypto filesystems, 
> which doesn't apply. The filesystem is just plain ext4.

This looks like https://bugzilla.yoctoproject.org/show_bug.cgi?id=13177 which I filed earlier this year. I haven't found a solution which is acceptable to everyone though and since then I've rarely if ever actually hit this problem.

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

