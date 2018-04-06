Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC127745BE;
	Fri,  6 Apr 2018 22:00:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36M0UEq030892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 23:00:31 +0100
Message-ID: <1523052030.2942.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 06 Apr 2018 23:00:30 +0100
In-Reply-To: <CA+chaQdiX_GKXAfWJMMc_oZQ5XW-oiuxzxPyMEF2LKZ-rMgDgQ@mail.gmail.com>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
	<CA+chaQdiX_GKXAfWJMMc_oZQ5XW-oiuxzxPyMEF2LKZ-rMgDgQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>
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
X-List-Received-Date: Fri, 06 Apr 2018 22:00:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 20:25 +0200, Martin Jansa wrote:
> FWIW: I've updated some layers with this LAYERSERIES_COMPAT_<layer>
> today and I think it's good idea.

Thanks. I know its late in the cycle but I think it will help.

> It probably won't be enough to stop questions like this:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-April/
> 149696.html

If the layers did have the settings I think it would have fatally
errored out before that. The way this was designed, it will not parse
further that the layer.conf files if mismatch is detected.

> but it's still better to show warning first and then some often
> harder-to-read exception or error log.

Agreed.

> Updating layer.conf in meta-qt5 was a bit more tricky as people tend
> to mix the meta-qt5 branches with different branches of other layers,
> just because their requirements for Qt are often very different than
> for other layers (e.g. many people still using meta-qt5/krogoth with
> Qt 5.6 because of the license, even with much newer morty, pyro,
> rocko, sumo, master branches of other layers and vice versa that
> someone is stuck with krogoth release for whatever reason, but needs
> newer LTS Qt 5.9 from meta-qt5/rocko). So for meta-qt5 I've used
> multiple values for LAYERSERIES_COMPAT_<layer> for combinations I use
> somewhere (so that I cover at least some testing with such uncommon
> combination) and I'm willing to accept more values to it if someone
> really uses another combination regularly. The rest of combination
> (like meta-qt5/krogoth with dizzy, which is usable as described in
> meta-qt5 commits which introduced incompatiblitites, will eventually
> trigger the warning which is fine, because people should be aware
> that they are doing something less tested and that they might to
> implement some work arounds to make it usable).

That sounds good. The system was flexible enough to allow "mismatch",
*if* the layer maintainer supports it. I'm also not expecting people to
backport this to older releases, just to start doing it now so things
improve going forward.

Cheers,

Richard

