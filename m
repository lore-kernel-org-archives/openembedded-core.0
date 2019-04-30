Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Apr 2019 12:08:10 UTC
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1D37DC5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:08:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 918656CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 08:03:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 30 Apr 2019 08:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=GZFquNYN50UORnps0/fWqIsB4DMPAA/
	TRrNBiB0aLeE=; b=dfp+dzRurI24FMdCTeWRgQ79o1T4FF33UM5IQQ2/7WgCmcP
	0Avmt5zWGtaY3NvDQ1yu2geFgCH+BPz7Y4LE9upOFzWhTevhtDxxxOMwyLExrRiZ
	i+1r+hMY3VE2ozRQoJFPL+DfswwwNyv4I9MJ/LNepTH9v+KFmV5HX18Jys8tHmHf
	7acCgjU/RWzylz5Ird7j0u+BUoc5I80zmKmKwrkt/+SJWit833RoHWe67KzsX04L
	d4hVk/EuB7EyOYyskz0hzJ6n7TrEU5edbk4XCALN3yXeukVDHo5ZGDVYTOkZuZIi
	OcbXdqdzJzy1ygtaOceUfR7vPXQlYsvW/MyZp4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GZFquN
	YN50UORnps0/fWqIsB4DMPAA/TRrNBiB0aLeE=; b=Bvco2tj+N0S+zxzHsQS99Z
	B9q++5IixSEwaBENlKvyVlnXrPskvVmn9tXgzIBkTxpRyeyeX+BxPcbn4FozCUwT
	7VKMStLAReXobfYiKZzrnQ6n0prC8JagiEPTAH70peiFNK6VdE7/uYlbqQCNzTeA
	rP3X4DI9Nvqa0Hyq1mHIvOmmjyiBaQTPhSOEnP6gTLxdp+4fCHxas1cM6HbP6auf
	88hCHl/pYIgcpchOU+KLSOGiKlWclCgmCtLcMPZK2Vai5QavoiCXi7wvcbL+VfH6
	+IjDUQDUYrC3Fi2MnitFydiNRmyTn9NoZz4ou+r9TujmNbkMN7btktwflujEzBow
	==
X-ME-Sender: <xms:eznIXEWUeS54TGL_SfcHkleAnrhG_DCOnF0skHYrh3vpGfeIcyXaMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeggdegjecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecurfgrrh
	grmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehl
	uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:eznIXH5Nv6tzzIs0K4JS_sjfZ7X1eWf2ttpeZ5Z33IgiCh7iF1M6HQ>
	<xmx:eznIXPXsg-hSUp0sAlCZ_8cGgWc2LzRtU53y6CizM79-1HRunIS7lA>
	<xmx:eznIXOrHkI5WCtKCaZEfed4qsnAq1hYRXcM0jt-bv4fgIHYc-xwlMA>
	<xmx:eznIXGT1em5A3zKbuep8o3SjV796D-vBwhGRitdKtm_6bdEztc-W2w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3C1747C199; Tue, 30 Apr 2019 08:03:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-448-g5cc1c91-fmstable-20190429v1
Mime-Version: 1.0
Message-Id: <057307c5-9cd5-49d4-b73e-6bf9be16f710@www.fastmail.com>
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
Date: Tue, 30 Apr 2019 08:02:59 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "OE Core" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] Fix systemd service enables/move	towards "stateless" configuration
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
X-List-Received-Date: Tue, 30 Apr 2019 12:08:11 -0000
Content-Type: text/plain

On Mon, 29 Apr 2019, at 15:44, Alex Kiernan wrote:
> As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> ("meson: stop creating enablement symlinks in /etc during
> installation"), services such as systemd-networkd are no longer enabled
> in images.
> 

As an aside - is this systemd upgrade why on raspberrypi3 with master branches I recently have no console on tty1 and `/etc/systemd/system/getty.target.wants/getty@tty1.service` is missing?

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

