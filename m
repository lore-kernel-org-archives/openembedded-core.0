Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8727113B
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 23:04:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2014 15:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="429341445"
Received: from unknown (HELO [10.255.13.117]) ([10.255.13.117])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2014 14:53:16 -0800
Message-ID: <1418684653.25212.39.camel@picadillo>
From: Tom Zanussi <tom.zanussi@intel.com>
To: nitin.a.kamble@intel.com
Date: Mon, 15 Dec 2014 17:04:13 -0600
In-Reply-To: <cover.1418667266.git.nitin.a.kamble@intel.com>
References: <cover.1418667266.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, dvhart@linux.intel.com,
	Openembedded-core@lists.openembedded.org,
	meta-intel@yoctoproject.org, saul.wold@intel.com
Subject: Re: [PATCH 0/2] commits for machine setup tool
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
X-List-Received-Date: Mon, 15 Dec 2014 23:04:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-12-15 at 10:47 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This pull request introduces a new feature called machine-setup-tool, which
> can be used by the BSP. With the use of the tool, BSPs for different boards
> which mainly differ in the text configuration for the target board, can be
> consolidated to use a common BSP.
> 
> The tool provides ability to configure the target image at runtime. It also

There doesn't seem to be any documentation for this tool that I can see
here.  How does a user set things up to configure the target image at
runtime, or does it just happen?

How do you know it's working or not - there doesn't seem to be any
instructions on how to use or test it.

> provides ability to detect the target boards for automatic configuration of
> the image. The tool can handle any text configuration for the target image.

Great, but how?  Are there some files or variables that need tweaking?

> All the configuration manipulation needed for the meta-intel BSP boards is
> already supported in the tool.
> 

That's great for meta-intel, but this is oe-core, not sure why that's
mentioned here.

> The tool's configuration is BSP specific and need to be specified separately
> in the BSP layer.  For example, for the meta-intel layer, the complementary
> commits can be seen here:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-contrib/log/?h=nitin/machinesetuptool
> 
> These commits are enabling the meta-intel layer to support 6 boards with 2
> common BSPs.
> 

It's good to have working examples, but I don't think that should
replace documentation.

Tom

> Thanks,
> Nitin
> 
> 
> 
> The following changes since commit 8657c2fd57600e0b0eaf2a14692de7453c78e1bb:
> 
>   serf: readded md5sum (2014-12-11 11:34:57 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib nitin/machinesetuptool
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/machinesetuptool
> 
> Nitin A Kamble (2):
>   alsa-plugins: a new recipe
>   machinesetuptool: a new recipe for setup of a machine
> 
>  .../machinesetuptool/machinesetuptool_git.bb       | 55 ++++++++++++++++++++++
>  .../recipes-multimedia/alsa/alsa-plugins_1.0.28.bb | 49 +++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta/recipes-bsp/machinesetuptool/machinesetuptool_git.bb
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.28.bb
> 



