Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 14FA37A0E2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 14:30:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w91EUXMg029224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 1 Oct 2018 15:30:35 +0100
Message-ID: <fe91943fdc053f9804ca1a2a628e39d64de44d3c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kevin Hao <kexin.hao@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Oct 2018 15:30:33 +0100
In-Reply-To: <20180929070147.88203-4-kexin.hao@windriver.com>
References: <20180929070147.88203-1-kexin.hao@windriver.com>
	<20180929070147.88203-4-kexin.hao@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/4] bitbake.conf: Introduce variables used to access the other recipe specific sysroot directory in multilib case
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
X-List-Received-Date: Mon, 01 Oct 2018 14:30:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 15:01 +0800, Kevin Hao wrote:
> When multilib is enabled, there would be two different recipe
> specific
> sysroot directories:
>   libxx-recipe-sysroot
>   recipe-sysroot
> 
> We do need to access the files under the "recipe-sysroot" directory
> in some cases. So introduces these variables for this purpose.
> 
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>  meta/conf/bitbake.conf  | 4 ++++
>  meta/conf/multilib.conf | 1 +
>  2 files changed, 5 insertions(+)

This doesn't look like a good idea to me. With multilib its very easy
just to add in special case options and make it do the right thing
until something else needs 'fixing'. What is harder but works out
better in the long run is to figure out the real underlying problem and
the solution. This patch adds datadir but paves the way to add all the
other *dir variants.

Also, the name "RECIPE_ALT_SYSROOT" is horrible, its near impossible to
know what "ALT" means. Alternative to what?

So whilst I understand what this is trying to do, we need to come up
with a better way, sorry. I've tried thinking how to do it differently
but don't have a proposal right now, sorry.

Cheers,

Richard

