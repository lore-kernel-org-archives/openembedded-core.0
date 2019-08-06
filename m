Return-Path: <andrew@aj.id.au>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73B947F2B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 01:40:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 9AA23594;
	Mon,  5 Aug 2019 21:40:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute4.internal (MEProxy); Mon, 05 Aug 2019 21:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=yykas3pi3sS0NitapIk/HfoPLaxiAbj
	hqmKVwMaHkhY=; b=Uat3zVgqVVTNmTasmlT4cvUehZW2/uPixLgoGnDX+dbZnBQ
	s0xtv+Lqz2l1+9woVXexGtH6xqIRrzPqe3bWAm6dJ4qMA6qMPrSbTJYSr/50LjZk
	Zl9PbkSZ0eMQ6VK2Xh/zH6VdCnBipTt8O8B5MA0fBlnBUBZpBCGNZct7wOWAcefV
	qkhuDOqXfBXzF1xk/etUXyCsNITQmvULKc78sNEw0+hByZBE8sw+9Tws3dCIDaRT
	8sgXva32c/H4G41sw+iGAYzhzUWVycQ513eT6ffx24tJ7LQaXO2Eo3bjRv119ekY
	AExKlexir9wXgoqFmHZt5mqAqX1x+Xip3grAxhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yykas3
	pi3sS0NitapIk/HfoPLaxiAbjhqmKVwMaHkhY=; b=oG8bx9W5fWaWNUG3/j3OWj
	m9hJQou6XxyceREMfUrkkCYOkBDzy2a15ZjoaRxYA0jET9O3bY4KCtZQPdhI12rF
	RzH63t6gwDDEvhqffYUU3OOBJno8ssTdaIV/5Nt+VC9khGeLx0l7LyP5p6nkkYMW
	Qh2KA4ORPFivesyNBqzMj/MBDD20EgyfQ9ykTsZdCo9M7lNAuY3sWsrbq+GrG0cv
	Ii/5gNTgLO0TCa2fE9+KbhA2xo0WqG6kkXSxKzXmSc+1qRRmtPUvUNO1rO3pEQz1
	nckWiu3lPHouSlIXnTj+uqg6MzYSbZks7kd0vFCYGFnJQ+qtsPCPHnBjt2N9zDmQ
	==
X-ME-Sender: <xms:iNpIXf4IWu7af1AQjiWErilQCQOevzfndbkSqtL6cDHY4KQ4fQOywA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtledghedtucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
	rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
	grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
	rhfuihiivgeptd
X-ME-Proxy: <xmx:iNpIXeWLfvWErR920Kjol5JAq-XuRLlYYRXVGaZCvhHxsO7K-Vv-Ww>
	<xmx:iNpIXXSpj5WxgQmKMc5t6ZuEgu6B78aMXHxpK_JuNOHaLyZx0wL6sw>
	<xmx:iNpIXbezxOvuaBrO5GR8GexEWa8bJuy0S_u0yYBmooBwi9QQ0LGolQ>
	<xmx:idpIXb5ItPfDRScfksEwYXOojs1qwnOyCNTca301oO6A4fMD8vRjtQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A85A1E00A2; Mon,  5 Aug 2019 21:40:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <30ae8ca4-1df7-40c0-a1df-3966760d8aba@www.fastmail.com>
In-Reply-To: <234b1140-a0b4-1085-756c-2e4ae963870b@intel.com>
References: <20190805031211.11190-1-andrew@aj.id.au>
	<234b1140-a0b4-1085-756c-2e4ae963870b@intel.com>
Date: Tue, 06 Aug 2019 11:10:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ross Burton" <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dtc: Provide libfdt
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
X-List-Received-Date: Tue, 06 Aug 2019 01:40:26 -0000
Content-Type: text/plain



On Tue, 6 Aug 2019, at 02:08, Ross Burton wrote:
> On 05/08/2019 04:12, Andrew Jeffery wrote:
> > Applications are appearing that depend on parsing flattened devicetree
> > in userspace on target devices, e.g. pdbg[1]. Mark dtc as providing
> > libfdt so application recipes can depend on it.
> 
> Other recipes can just depend on dtc to get libftd build.

Alright, lets leave it that way.

Andrew

