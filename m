Return-Path: <pbarker@toganlabs.com>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Apr 2017 09:30:53 UTC
Received: from catfish.ash.relay.mailchannels.net
	(catfish.ash.relay.mailchannels.net [23.83.222.32])
	by mail.openembedded.org (Postfix) with ESMTP id F182C77D77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 09:30:52 +0000 (UTC)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D914B7C39D9;
	Mon, 10 Apr 2017 09:12:28 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.135.247])
	by relay.mailchannels.net (Postfix) with ESMTPA id 5666C7C39C9;
	Mon, 10 Apr 2017 09:12:28 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pbarker@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.61.168])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Mon, 10 Apr 2017 09:12:28 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pbarker@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Reaction-Hook: 738d11f6513849d4_1491815548680_2654852109
X-MC-Loop-Signature: 1491815548680:1237321895
X-MC-Ingress-Time: 1491815548680
Received: from cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net
	([82.34.23.153]:16279 helo=host0.betafive.co.uk)
	by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.87)
	(envelope-from <pbarker@toganlabs.com>)
	id 1cxVN1-000m3m-Uv; Mon, 10 Apr 2017 11:12:25 +0200
Date: Mon, 10 Apr 2017 10:12:20 +0100
From: Paul Barker <pbarker@toganlabs.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170410101220.614ee044@host0.betafive.co.uk>
In-Reply-To: <CAJTo0Lac+CqnXxzJoanw9iAQii_oeeKum1ebkFCT+3ExJVhAMQ@mail.gmail.com>
References: <20170402213135.21193-1-pbarker@toganlabs.com>
	<CAJTo0Lac+CqnXxzJoanw9iAQii_oeeKum1ebkFCT+3ExJVhAMQ@mail.gmail.com>
Organization: =?UTF-8?B?VG9nw6Fu?= Labs
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pbarker@toganlabs.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ethtool: Switch to download mirror
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
X-List-Received-Date: Mon, 10 Apr 2017 09:31:12 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Apr 2017 09:57:15 +0100
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 2 April 2017 at 22:31, Paul Barker <pbarker@toganlabs.com> wrote:
> 
> > The md5sum & sha256sum for ethtool-4.8.tar.gz have changed upstream :(
> >  
> 
> Have you verified with upstream that they haven't been compromised?
> 
> Ross

Now verified with upstream:

On Wed, 5 Apr 2017 10:00:04 -0400
"John W. Linville" <linville@tuxdriver.com> wrote:

> Yes, the .tar.gz file got regenerated locally as I was tinkering with
> the release scripts that I inherited from the former ethtool maintainer,
> and the regenerated .tar.gz file got uploaded. The newly updated one
> is properly signed and the signature is there to verify. (Note that
> the signature is against the .tar file and not the .tar.gz file.)

Looks like this has already been merged to master anyway but good to
have that confirmation.

Cheers,
Paul

