Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id A690A61B2C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 09:29:23 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48c8tW3rxLz5tlH;
	Tue, 10 Mar 2020 10:29:23 +0100 (CET)
Date: Tue, 10 Mar 2020 10:29:21 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: JH <jupiter.hce@gmail.com>
Message-ID: <20200310092921.ezmnfiwemhcyno6a@qschulz>
References: <CAA=hcWTpbcM=_WCD6eRfD8jbq520R4jo++b=wC0m12d0cEJtQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA=hcWTpbcM=_WCD6eRfD8jbq520R4jo++b=wC0m12d0cEJtQw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] What is the Yocto / OE recipe for u-boot-fw-utils how can append it?
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
X-List-Received-Date: Tue, 10 Mar 2020 09:29:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JH,

On Tue, Mar 10, 2020 at 08:23:37PM +1100, JH wrote:
> Hi,
> 
> I could not find u-boot-fw-utils recipe from OE git repository, when I
> added it to build package, it did build u-boot-fw-utils/1_2019.07-r0
> from git://git.denx.de/u-boot.git, but I could not make a bbapend to
> it as I don't know what is the bb name.
> 

It was recently changed to libubootenv IIRC. Are you sure it was taken
from u-boot git repo?

In zeus you have both available if you have meta-swupdate layer but
u-boot-fw-utils is still present in openembedded-core.

In master, only libubootenv exists in openembedded-core.

Are you using master for poky/openembedded?

FWIW, what a recipe provides either at runtime or at buildtime is
(R)PROVIDES, c.f.:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-bsp/u-boot/libubootenv_0.2.bb?h=master

Quentin

