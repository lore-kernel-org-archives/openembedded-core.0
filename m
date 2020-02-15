Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 73CF361147
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 10:00:17 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:51896 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>) id 1j2uFG-007y2p-4L
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Feb 2020 05:00:18 -0500
Date: Sat, 15 Feb 2020 05:00:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.21.2002150438220.2937015@localhost.localdomain>
Message-ID: <alpine.LFD.2.21.2002150457070.2937813@localhost.localdomain>
References: <alpine.LFD.2.21.2002150438220.2937015@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: curious about proper use of "REALPV" re: versioning pre-release recipes
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
X-List-Received-Date: Sat, 15 Feb 2020 10:00:17 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 Feb 2020, Robert P. J. Day wrote:

... snip ...

>   second, the only example of that feature in all of oe-core is
> cdrtools-native_3.01.bb, which contains:
>
>   PV = "3.01a31+really3.01"
>   REALPV = "3.01"
>
> but that doesn't seem to match what is in the YP manual, as the recipe
> filename version contains just "3.01", so this doesn't seem like a
> situation where that feature is necessary. indeed, it seems like
> cdrtools-3.01 has been out since 2015:
>
>   https://sourceforge.net/projects/cdrtools/files/
>
> so it's unclear why this recipe doesn't just use 3.01.

  ack, should have mentioned that if one really wanted to update
cdrtools, there *is* a cdrtools-3.0.2a09.tar.gz, which really *would*
be a decent (instructional) example of that feature.

https://sourceforge.net/projects/cdrtools/files/alpha/cdrtools-3.02a09.tar.gz

rday

