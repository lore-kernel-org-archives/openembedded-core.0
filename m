Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE5C6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 14:47:29 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id bSWPeu71i8e42bSWQe9lfU; Tue, 16 Jan 2018 14:47:31 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=do719Wo4 c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=RgaUWeydRksA:10 a=O5fH4meCk4TxctXDl7cA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1ebSWP-0001w1-Pp; Tue, 16 Jan 2018 14:47:29 +0000
Date: Tue, 16 Jan 2018 14:47:29 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180116144729.pfwg3qs2yhbxirl4@mcrowe.com>
References: <20180115175321.r7sfuxibr743icio@mcrowe.com>
	<CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
	<20180116115516.bs5g4ngea3gz4sgr@mcrowe.com>
	<CAJTo0LYFZqkc_KMXKjNmX4M3z0UjAjGpRLNingKsmXf7yBUmHQ@mail.gmail.com>
	<CAJTo0LbHs0aVrvQi2RwSK=2FAe6q5nyYsu9CxDcnKrBae=f70Q@mail.gmail.com>
	<CAJTo0LZC6AJhTs0PtbRvfHK-dqjgfZvNSdN3gXGdWksaBZOP6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZC6AJhTs0PtbRvfHK-dqjgfZvNSdN3gXGdWksaBZOP6Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfAD5gMFYjUaXOWMg27J77+qA25C6CbAZNW6RS8Rv1gyOBuTASuliU9tf6pFQoHTw9KIN1fCEqJjnWWz9/xMoMS8lvwGK0m4Eo+eVALHarpw/+1UVp0Dr
	dFX1H27+EhznR9fldVnE5RlWPARHxEqlzYI=
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Tue, 16 Jan 2018 14:47:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 16 January 2018 at 14:04:14 +0000, Burton, Ross wrote:
> Another fix would be to respect USE_NLS and seed msgfmt=/bin/false
> appropriately.

 CACHED_CONFIGUREVARS = "MSGFMT=/bin/false"

appears to work, but I'm not sure whether that's what you meant.
Presumably it would need to be:

 CACHED_CONFIGUREVARS = "${@base_conditional('USE_NLS', 'no', 'MSGFMT=/bin/false', '')"

or similar.

> I'll test that later, or you can get the glory if you can
> send a tested patch.

Since I'm not really sure what the consequences of doing this are, I'm not
sure that I want the blame that comes after the glory if I get it wrong. :)

Thanks.

Mike.

