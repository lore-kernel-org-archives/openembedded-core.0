Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE85D6AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:24:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 22 May 2015 08:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; d="scan'208";a="497088496"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.3.49])
	([10.252.3.49])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 08:24:25 -0700
Message-ID: <1432308263.2882.17.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 18:24:23 +0300
In-Reply-To: <CAJTo0LZWra9U0Xj2fd-0oEL4=96GE9bYRJPNitd_BYjH2=TcSg@mail.gmail.com>
References: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
	<bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
	<2968009.Jcp0e3iZx0@peggleto-mobl.ger.corp.intel.com>
	<1432306848.2882.16.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<CAJTo0LZWra9U0Xj2fd-0oEL4=96GE9bYRJPNitd_BYjH2=TcSg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Fri, 22 May 2015 15:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-22 at 16:18 +0100, Burton, Ross wrote:
> 
> On 22 May 2015 at 16:00, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
> wrote:
>         That sounds like a reasonable approach too. To avoid
>         maintaining a list
>         of all modules in the recipe, it would be good to script the
>         dependencies:
>         
>         RDEPENDS_${PN} = "${@get_built_plugin_packages()}"
>         
>         I'm not experienced with bitbake scripting, so any pointers
>         for
>         implementing get_built_plugin_packages() would be helpful.
> 
> 
> do_split_packages() returns a list of packages that it created,
> gdk-pixbuf is a concise example.

Thanks a lot!

-- 
Tanu



