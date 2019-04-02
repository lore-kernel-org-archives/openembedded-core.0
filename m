Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 276797D1F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 16:36:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B2B122710;
	Tue,  2 Apr 2019 12:36:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 02 Apr 2019 12:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=wfIQc1ww/ApgwTSq5OA7qlbWP5UXAxY
	zdxkJxeXFK+E=; b=hz6EU8OODmku3zM7lsde6A9eBDzRsCqIVmSIK0dWAsuDl4G
	VM8MgVGY0B+mb5ma+ppT8ODx+xAXsFc0EKOjU43c5W7EVzux9HqsoY4fPOisNu1D
	h4GAqA8rHLC3LLBexJMCRqWiYTp16QUzWKuTfkVSfvf9KsfnQyWcsa3AgiG7d7iH
	9mkQgGzXFrk5XDODfGVu3zxCfPg3YrtFCbxp5N/BfkHeHihZKXH2oiIMnBTg0jHc
	TVbrPjtrXZjWT9HgtvmmRr93/CAf2Rt2hSjJUlNlHrfT/cmWQIZqx0Dl///YnECG
	tsZBss/EQuGmmmEzF02gGsKnktabjiWECxhIrTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wfIQc1
	ww/ApgwTSq5OA7qlbWP5UXAxYzdxkJxeXFK+E=; b=MP4HfZu0Ts4uDOteOqSo7B
	hC7mMvYQbdH+y8v5TAibQIUVbw94TlVot5WIzIUiH+YlccKuox2H5rJLFLvHTCuH
	/x/pF5Vhujct9kB867/9bLiQp7D+5CAjn+WpT5acRUjvT3/wdEINwNvjul06olP5
	MkAi60UAxoSSvyRtAt+yAMOwFE6T2GIxgFzhE4ttY/BBrYpHf0ZEvJWp1bCmuGca
	Pbv3rvN/icCYgJPSpa/M7gToF2/r2JfqO8n44w4IjGQsjHte4vSNQ7pEBvhWu0Eq
	uMNS39yMNdLjaCSSA7ZZyzmhZHVTXbQZBjIoZ7czyVk5ijhlaKh1bMueRglmzDKw
	==
X-ME-Sender: <xms:gI-jXGTcD3Lvzctufy4kXkUmHdWTJo4Mi7TGsmsgJZNy1v6ixl0org>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrtddtgdekvdculddtuddrgedutddrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdp
	uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
	hnthhsucdlqddutddtmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredt
	necuhfhrohhmpedfrfgruhhluceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvg
	drtghordhukheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhi
	vhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:gI-jXG6f2SvmYKCBcEgeZaAtexKZSzLFfGFVBjBhJrD-Yax6PjONRQ>
	<xmx:gI-jXOLlwWVCdFFnkVyRsSw_6CM8ncSiKdZMs9REnqamGa5W5d4ebg>
	<xmx:gI-jXOnkOA8Eeo0mV2LBMgoXPXSR3ulCasun3-ePQRpFEDYKjClSCA>
	<xmx:gY-jXASGfYEQdRY9EH9tGhH220PPafkRQf9nwZ2mo-Hu0IakrM1VqQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7D1CD7C5CA; Tue,  2 Apr 2019 12:36:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-329-gf4aae99-fmstable-20190329v1
Mime-Version: 1.0
X-Me-Personality: 84186096
Message-Id: <b51fba48-8b94-4716-817f-b92849743823@www.fastmail.com>
In-Reply-To: <a0ef532b-b5b1-105a-78e0-54a4ea0194f4@windriver.com>
References: <20190402141538.25146-1-paul@betafive.co.uk>
	<20190402141538.25146-2-paul@betafive.co.uk>
	<a0ef532b-b5b1-105a-78e0-54a4ea0194f4@windriver.com>
Date: Tue, 02 Apr 2019 12:36:18 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "Mark Hatle" <mark.hatle@windriver.com>,
	"OE Core" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tzdata: Install everything by default
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
X-List-Received-Date: Tue, 02 Apr 2019 16:36:16 -0000
Content-Type: text/plain

On Tue, 2 Apr 2019, at 17:29, Mark Hatle wrote:
> On 4/2/19 9:15 AM, Paul Barker wrote:
> > tzdata is converted to an empty meta package which pulls in all
> > subpackages. The subpackages are defined in a TZ_PACKAGES variable so
> > that we don't have to repeat ourselves.
> > 
> > The timezones and conffiles which were in the tzdata package are moved
> > to a new 'tzdata-core' package.
> 
> Is there any type of 'RREPLACES' or anything that should be added so previous
> users of tzdata-all get tzdata in a package upgrade?

tzdata-all is just what I called it in my first attempt at this patch. So there was never a tzdata-all upstream to my knowledge.

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

