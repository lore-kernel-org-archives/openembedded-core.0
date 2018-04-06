Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00DF675417;
	Fri,  6 Apr 2018 21:53:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36LqFpt029915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 22:52:16 +0100
Message-ID: <1523051535.2942.31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 06 Apr 2018 22:52:15 +0100
In-Reply-To: <20180406185844.GB3228@denix.org>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406185844.GB3228@denix.org>
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
X-List-Received-Date: Fri, 06 Apr 2018 21:53:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 14:58 -0400, Denys Dmytriyenko wrote:
> I understand the need to reduce the support burden. But there are
> some valid 
> cases when you want to use components/layers from a different set of
> releases. 
> 
> It can sometimes be an older component in otherwise newer setup (i.e.
> one 
> layer hasn't been updated yet from rocko, but it still works fine
> with 
> everything else from sumo).
> 
> Alternatively, sometimes you need to bring a newer version of the
> component to 
> your older release - as long as it works for me, I don't want this to
> be 
> artificially restricted.
> 
> In other words, the intention is good, but it needs to be either more
> flexible or allow overriding this from distro config or local.conf...

Whilst I will admit I've not extensively tested it, I think that should
be possible to override things as this only gets validated after all
the layer.conf files are pulled in. It would need to be from the
distro's layer.conf though, or a layer.conf in the build directory as
local.conf comes in much later. Basically its possible but not easy,
which I think is probably the right thing to do here.

Cheers,

Richard

