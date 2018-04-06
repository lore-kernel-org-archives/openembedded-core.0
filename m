Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 35DF7752E6;
	Fri,  6 Apr 2018 21:56:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36LuriZ030490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 22:56:54 +0100
Message-ID: <1523051813.2942.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Trevor Woerner <twoerner@gmail.com>
Date: Fri, 06 Apr 2018 22:56:53 +0100
In-Reply-To: <a04373f5-cb03-25a3-36fa-da92b0cdd71d@gmail.com>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
	<a04373f5-cb03-25a3-36fa-da92b0cdd71d@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Fri, 06 Apr 2018 21:56:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-04-06 at 13:46 -0700, akuster808 wrote:
> Shouldn't Master get all these changes first then we switch to stable
> branch when we have a new release?
> 
> My German genes are raging about "Rules" ; )

master did get them?

To be really clear, "master" is never a value that would appear in
LAYERSERIES. That would let everyone be lazy and master would match
everywhere, then this would all be pointless.

Early in the next cycle I'll add "thud" to the list in OE-Core master
branch. Later in the cycle, when we make more invasive changes which
break compatibility, I'll drop "sumo". At that point people who haven't
added "thud" will start to see errors but this should all work out
earlier in the cycle than happened this time around.

It was a choice of doing this now, or wait another six months to get
started and since we have had the variables for a while I've opted to
move us forward on this. I'd already had comments that "rocko" in
layer.conf was incorrect, which it was and changing that was always
going to cause some pain.

Cheers,

Richard

