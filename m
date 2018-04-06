Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6105F74D56;
	Fri,  6 Apr 2018 15:29:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36FTl43027547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 16:29:48 +0100
Message-ID: <1523028587.2942.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 06 Apr 2018 16:29:47 +0100
In-Reply-To: <20180406141647.GA19068@linux-uys3>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
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
X-List-Received-Date: Fri, 06 Apr 2018 15:29:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 10:16 -0400, Trevor Woerner wrote:
> A) Some layers only switch to an official branch name when the find a
> reason to. E.g. branch "sumo" is created on openembedded-core but
> meta-A keeps working on master unless an incompatible change is
> created in openembedded-core that forces meta-A to create a "sumo"
> branch.
> 
> B) Other layers create official branches the moment they exist. E.g.
> branch "sumo" is created on openembedded-core and meta-B instantly
> creates a "sumo" branch to mark this point in time, and continues
> working on master. If meta-B's "sumo" branch fails to build against
> openembedded-core's "sumo" branch because an incompatible change is
> made to openembedded-core's sumo branch, meta-B fixes the issue on
> the sumo branch.
> 
> 
> I can see how the change you've implemented will be very useful for
> the A)
> cases. Will it be needed for the B) cases? In other words, does the
> code
> you're adding implicitly assume:
> 
> 	LAYERSERIES_COMPAT_<...> = "layer"
> 
> for any given "layer"?

No, there is no implicit assumption.

In both A) and B) cases the maintainer adds the new "codename" to the
list of compatible layer series in LAYERSERIES_COMPAT_<layer> for their
layer. They can list multiple layers in there, e.g. "rocko sumo".

The one annoying thing about all this is the layer maintainers do have
to update layer.conf each time a new release codename comes out. I
think that is a reasonable compromise to be able to give users a much
better idea of which layers are compatible or incomaptible with their
setup though. It means someone has looked at it and believes it will
work with a given release series.

Just to be clear, "layer" would never be a valid value there, it will
always be the release/branch codenames.

Cheers,

Richard



