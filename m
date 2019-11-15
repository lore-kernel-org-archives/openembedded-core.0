Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 38C4B6D6F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 21:46:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47FBk94HVPzQ3;
	Fri, 15 Nov 2019 22:46:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573854371;
	bh=xkXyF12SN4lW8ywAs1UK30layM/f0aublHVv8LZlhVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/bfVT+dhDTdTQpsU9tHUvogumQQUgk4aCGwCFy2JABibUfDH0fFSGHCT1kcQG0Uh
	nB7O8b/YxUGOMIoZplpsU5HJUWkwfh7aoiwVQu54R1fz8nGhtIecerTMqd+0pz6g2n
	UR6g9L+Sdu+ai2ZJe/HnUcaGOzNgd+Dd3JjUjhjoK6Ii2hePmQteKuDXISzngXnsZs
	BjL4nwrW8L6mAoKTN9FIBZLwUH7VP4n4D1LY6WpgR3A07n3XoICAw8WqOymQBFLXS5
	OFKtutp6shgI+0CEIalp9m3V4wBAVhhpEy2CQHc8linZeWNkcrxUuL6euCaFCgxNKa
	HqAgyhkqwsoP8vimobBf2Bj/ODQQ3dHBbavYUt9vp6g4AQMnhmwyO8MykJA8gUQt9k
	VO6QqpCU/cQB8LcElibgNcFerbJvyqx9nYw+qVQ5JmpjW7A3WZmFMk+5PNfKxcFCuR
	0uUUCiOVWONEHOGuN4DpQaj2Y03Co7tynPYfVIcZwauOomDtLlpH4qoRJ3KSIqwHhi
	Wl33pSTWsZgrHsoNd3CdFUEIehMNuEefCxSCSaSFuKzBKgljLIilN8UGlk3gbJQQR8
	ES7Km7iJOfnrpf2XTpa1g6Pih7neZQboEZQXTVxy3AsxvcmG+nxzsiSWiMf13xufbV
	a9oDb4f03OR6FBQXP4hEk+20=
Date: Fri, 15 Nov 2019 23:46:05 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191115214605.GA17923@localhost>
References: <20191113081914.28778-1-bunk@stusta.de>
	<02d2657c-0beb-eeb1-ca00-3add30515f9c@intel.com>
	<20191114125101.GB13971@localhost>
	<cc75af7e-6229-44d0-5d30-d74a8ba11576@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cc75af7e-6229-44d0-5d30-d74a8ba11576@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Fri, 15 Nov 2019 21:46:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 14, 2019 at 07:18:28AM -0800, akuster808 wrote:
> 
> 
> On 11/14/19 4:51 AM, Adrian Bunk wrote:
> > On Thu, Nov 14, 2019 at 12:04:40PM +0000, Ross Burton wrote:
> >> On 13/11/2019 08:19, Adrian Bunk wrote:
> >>> +# Affects: Builds of dhcpd versions prior to version 4.4.1 when using BIND versions 9.11.2 or later
> >>> +CVE_CHECK_WHITELIST += "CVE-2019-6470"
> >> Can you be a bit more explicit about why this is whitelisted?
> > Something like
> >   BIND >= 9.11.2 need dhcpd >= 4.4.1, don't report it here since
> >   dhcpd is already recent enough.
> Actual. checking isc dhcp sources, it appears the fix is sitting in
> master and has not been merged to any of the stable branches. I have not
> had the time to unpack and check in an OE env ti validate that.
> 
> Have you done that?

At what commit are you looking?

rt46719 was merged in 2017, actually before 4.4.0.

> - Armin

cu
Adrian


