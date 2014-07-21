Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2E2A70355
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 11:07:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2014 04:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,700,1400050800"; d="scan'208";a="576380313"
Received: from jrissane-mobl.ger.corp.intel.com (HELO [10.237.67.153])
	([10.237.67.153])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2014 04:07:21 -0700
Message-ID: <1405940840.2253.56.camel@jrissane-mobl.ger.corp.intel.com>
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jul 2014 14:07:20 +0300
In-Reply-To: <CAJTo0LZj_KrGLVXxkjJQPxQedTXUj9kOShm-Jk7RAcVxfZGD9Q@mail.gmail.com>
References: <1405936990-10656-1-git-send-email-jukka.rissanen@linux.intel.com>
	<CAJTo0LZj_KrGLVXxkjJQPxQedTXUj9kOShm-Jk7RAcVxfZGD9Q@mail.gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: Fix PPTP VPN plugin QA issue
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
X-List-Received-Date: Mon, 21 Jul 2014 11:07:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ross,

On ma, 2014-07-21 at 11:55 +0100, Burton, Ross wrote:
> On 21 July 2014 11:03, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
> > Fixing this error by skipping dev-so QA check for
> > connman-plugin-vpn-pptp package.
> 
> As discussed on IM but repeating for the list, plugins should always
> be real .so files and not symlinks to versioned files.
> 
> If a plugin is on disk as symlinks and versioned files, then you need
> to pass more flags to libtool: -shared -avoid-version -module is the
> canonical set to get a loadable module without a static counterpart
> and versioned symlinks.
> 
> Ideally a few patches to the build will remove the need for every
> dev-so insane skip in connman.

Sure, I can prepare a more sane version :)


Cheers,
Jukka



