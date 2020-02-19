Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id E09726153C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:29:10 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48Mv8k19dgz5tlH;
	Wed, 19 Feb 2020 11:29:10 +0100 (CET)
Date: Wed, 19 Feb 2020 11:29:08 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: JH <jupiter.hce@gmail.com>
Message-ID: <20200219102908.cpe7lxm3v64ff2hf@qschulz>
References: <CAA=hcWRUzFinBcNXf5EF+2mCwMhA5tz-vEFKubg6_QkwvxOEEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA=hcWRUzFinBcNXf5EF+2mCwMhA5tz-vEFKubg6_QkwvxOEEg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-core recipe for defining directories in /
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
X-List-Received-Date: Wed, 19 Feb 2020 10:29:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JH,

On Wed, Feb 19, 2020 at 09:12:08PM +1100, JH wrote:
> Hi,
> 
> Which recipe defines all directories in "/"? I need to make a bbapand
> to add directories to /.
> 

None. Or all of them, depends on how one sees it.

You just create a directory in do_install of a recipe.

You then make sure this directory is part of a package by checking it's
in one of the recipe's generated packages's FILES_<PACKAGE>.

Quentin

