Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXw3v-0001EW-H4 for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 15:32:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6EPBJ0003851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 14:25:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01056-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 14:25:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6EP4Lp003838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 14:25:05 GMT
Message-ID: <1323181515.19363.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 14:25:15 +0000
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Make missing checksums an error v2 + clutter-gst update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 14:32:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-05 at 18:17 -0800, Joshua Lock wrote:
> NOTE: this requires a patch I sent to the BitBake list[1] to error cleanly,
> otherwise you'll see a Python backtrace and the build fail...
> 
> This is v2 of a series to add set BB_STRICT_CHECKSUM in default-distrovars.inc
> so that missing checksums in recipes raises an error.
> 
> Since v1 I've run a test over OE-core to ensure to ensure I can do world
> fetches for each of the qemu machines and discovered that omap3-sgx-modules
> and puzzles recipes needed checksums adding.
> 
> I've snuck an extra patch lying on my disk into the queue too, an update for
> clutter-gst.
> 
> Regards,
> Joshua
> 
> 
> The following changes since commit 044324465bd54d53ae768f3c1e7468ae0e0c6200:
> 
>   dpkg-native: Fix perl path (2011-12-02 15:31:03 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/checksums
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/checksums
> 
> Joshua Lock (4):
>   omap3-sgx-modules: set SRC_URI checksums
>   puzzles: set SRC_URI checksums
>   default-distrovars: missing checksums should raise an error
>   clutter-gst: upgrade to 1.4.4

Merged to master apart from the omap3 patch which was superseded,
thanks.

Richard 



