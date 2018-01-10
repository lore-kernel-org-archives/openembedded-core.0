Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3D407602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 18:49:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0AImp7o011223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 10 Jan 2018 18:48:52 GMT
Message-ID: <1515610131.29722.112.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Kelly <mkelly@xevo.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jan 2018 18:48:51 +0000
In-Reply-To: <64c07649-f0df-9acc-fbf3-e8f6a52db9f1@xevo.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
	<0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
	<64c07649-f0df-9acc-fbf3-e8f6a52db9f1@xevo.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Wed, 10 Jan 2018 18:49:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-10 at 09:55 -0800, Martin Kelly wrote:
> On 01/05/2018 06:57 AM, Alexander Kanavin wrote:
> > 
> > On 01/05/2018 01:47 PM, Burton, Ross wrote:
> > > 
> > > Do we even need gnomebase-meson with this?  I can see a future
> > > where 
> > > GNOME is entirely Meson and then we could just switch the
> > > default 
> > > GNOMEBASEBUILDCLASS from autotools to meson.
> > > 
> > > (prior art being the tarball compression type)
> > 
> > I'm fine with this. Just so everyone else knows: RP has actually
> > made 
> > the change already, and merged everything to master, so the YP
> > supports 
> > meson as a first class citizen now.
> > 
> > Alex
> Technically I'd call it a 0.9-class citizen, as the SDK doesn't work
> yet 
> :), but still a whole lot better than 0.

We'll get there and patches are very welcome.

Also *very* welcome would be some SDK tests which illustrate the
problem so we can a) fix it and b) ensure it doesn't regress again!

Cheers,

Richard

