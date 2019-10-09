Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 542 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Oct 2019 10:20:57 UTC
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id B10346C149
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 10:20:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 92E674F0;
	Wed,  9 Oct 2019 06:11:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Wed, 09 Oct 2019 06:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm2; bh=p3k6qTgvUuneS3zrVmv1bXtLhCrkhoK
	noy/K/3V0Yvw=; b=U0hA6+ZVa+0VQUi9wMDqCYEloDlnUAjCk2CuXH0hSTnvO9a
	TIwQ+kv0WZbE2ydW51OcJoT+6q4EvPfb2ZmIM69PiGkeD7iXrccO47UdJt7QMR4d
	ZiA8Py4JZ/xdffvpYUu0ihpeP+btZOO7Zz+TrnwLL0BzEZEq064MsP0H9LR/pcWM
	8EU4dVUIicV/NtmGkQE+LsLsTvhIhbT73URgIi6olJjdBeJ5QSE3nc4FTEQCSDzF
	MO47l9VsWYUKkeTXzAGsUN5naEHNtA/ZtyB11iAKIups7v2Hety5xQg6szm2cMiF
	mvyKK0j4kvijfnssuav1XvXcRRPCNC+EEKLG6SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=p3k6qT
	gvUuneS3zrVmv1bXtLhCrkhoKnoy/K/3V0Yvw=; b=c3PznVNo1AVCrtnuo3WPvo
	0L1XnQ1me14rmhni6Cdr5jKHwHYvp41Oy9RSJ1pC9rSdVVXYvbGgTJREE8wY043H
	fmVRutLQPQ7MWW+j0eq9GbtPy1+Nv266+N9SopCIvPM1K4VwGvBXmZwkrS6jx0UH
	w8M5EuKo3YpGcVF7LT21L0c6SnmNfZRfMqemZClldkmsMRludeBZWqDkknvnN13N
	06B3tuxQKe/oFgSfvkulmWj1KWv70rXLVflztrUx5xyMRwNOF6i7MTiv0g54lrHF
	pHjLT609V1wsiOhfd4/rFti9bCGfAzqT0QrWgHqQHPCu0Xu7I6Abg0IpR3u3XriQ
	==
X-ME-Sender: <xms:abKdXc4DmJ3odyHL4xK0WIb6N3ct6RO9Dal7CyM0diN1Risj4E3bJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedugddtudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecurfgrrh
	grmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehl
	uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:abKdXQXflUSi5zWmTpRKQ7VGo-RtzuRRA8vMMoDlQGRD0Zymb6yVKg>
	<xmx:abKdXZJU_9UYsDDsNzkY7J_ysEAWt5q7fyXCWqt5aj1YBZe9P3v4ig>
	<xmx:abKdXQQfMY28StISRoMsgqBjn7ccUl8VGFITUllOCDT_1BPZszCkLg>
	<xmx:arKdXUr4dQJ3QX9fbJ6Tggfu7W_0lFrP6xKmv3FkRwDbuC3ErbViFg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 92DA4E00A5; Wed,  9 Oct 2019 06:11:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <c73664e3-0bbc-40e0-b134-96c9bdd629c2@www.fastmail.com>
In-Reply-To: <005f542adcf8904ec7fc2cd45e1c2cc8aa532cba.camel@linuxfoundation.org>
References: <20190924090609.264248-1-paul@betafive.co.uk>
	<005f542adcf8904ec7fc2cd45e1c2cc8aa532cba.camel@linuxfoundation.org>
Date: Wed, 09 Oct 2019 11:11:33 +0100
From: "Paul Barker" <paul@betafive.co.uk>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
	"OE Core" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Add new mirror archiver mode
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
X-List-Received-Date: Wed, 09 Oct 2019 10:20:57 -0000
Content-Type: text/plain

On Thu, 26 Sep 2019, at 21:31, Richard Purdie wrote:
> On Tue, 2019-09-24 at 10:06 +0100, Paul Barker wrote:
> > This patch allows the creation of a full source mirror using the
> > archiver
> > bbclass. Using the archiver allows us to make use of copyleft license
> > filtering, recipe type filtering and other features that are not
> > available if
> > we just copy the contents of the downloads directory itself to create
> > a
> > mirror. We also get the advantage of sstate caching and we don't have
> > to
> > throw away the entire downloads directory before building to keep
> > sources for
> > other builds out of our mirror.
> > 
> > The resulting mirror may be published and used as an entry in
> > PREMIRRORS or
> > MIRRORS for a subsequent build. The functionality is explained in
> > more detail
> > in the patch commit message and the additions to the documentation
> > comments.
> > 
> > We've been using this patch in our Oryx Linux distro for a few months
> > now to
> > confirm that it works as expected. All feedback is welcome,
> > especially from
> > people who have worked on the archiver bbclass before.
> > 
> > Mirror creation was tested with the following additions to
> > local.conf:
> > 
> >     INHERIT += "archiver"
> >     BB_GENERATE_MIRROR_TARBALLS = "1"
> >     ARCHIVER_MODE[src] = "mirror"
> >     ARCHIVER_MODE[mirror] = "combined"
> >     ARCHIVER_MIRROR_EXCLUDE = "file://"
> >     COPYLEFT_LICENSE_INCLUDE = "*"
> > 
> > The resulting mirror directory was moved out of the tmpdir and a
> > rebuild was
> > tested with the following additions to local.conf:
> > 
> >     BB_NO_NETWORK = "1"
> >     INHERIT += "own-mirrors"
> >     SOURCE_MIRROR_URL = "file://${TOPDIR}/mirror"
> > 
> > Paul Barker (1):
> >   archiver.bbclass: Add new mirror archiver mode
> > 
> >  meta/classes/archiver.bbclass | 136 +++++++++++++++++++++++++++++---
> > --
> >  1 file changed, 117 insertions(+), 19 deletions(-)
> 
> This is coming in a bit late to be in 3.0 as we're way past feature
> freeze. Have you given thought to regression testing? I'd also really
> like to see some tests. There are some already:
> 
> meta/lib/oeqa/selftest/cases/archiver.py 
> 
> and whilst I'd not going to claim they're wonderful, it would be good
> to extend as we add new functionality.

I've parked this for now, as you say it's a bit late for 3.0. I'll resubmit with some extra test cases early in the 3.1 cycle.

-- 
Paul Barker

