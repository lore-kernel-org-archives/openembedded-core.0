Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 96E1261725
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 21:07:57 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:50554 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j5c0E-0017WT-6s; Sat, 22 Feb 2020 16:07:58 -0500
Date: Sat, 22 Feb 2020 16:07:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Alexander Kanavin <alex.kanavin@gmail.com>
In-Reply-To: <CANNYZj8EchSZ1vEPiOnx9n9X+osuikbL9hvYpnoykkPY+k66Og@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2002221605550.10479@localhost.localdomain>
References: <alpine.LFD.2.21.2002221554210.9952@localhost.localdomain>
	<CANNYZj8EchSZ1vEPiOnx9n9X+osuikbL9hvYpnoykkPY+k66Og@mail.gmail.com>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can i totally ignore recipes not related to the current build?
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
X-List-Received-Date: Sat, 22 Feb 2020 21:07:57 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Feb 2020, Alexander Kanavin wrote:

> BBMASK?

  BTW, that will work for me in this situation but is there a way to
not have to enumerate all the recipes to ignore, and just say, "don't
look at anything that is not related to building core-image-minimal?"
*that* would be seriously useful, because there's going to be a *ton*
of recipes i need to ignore.

rday

