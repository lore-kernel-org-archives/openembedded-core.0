Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8B565D34
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 01:39:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2014 17:39:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,526,1413270000"; d="scan'208";a="643296721"
Received: from pcarro2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.53])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2014 17:39:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 06 Dec 2014 01:39:10 +0000
Message-ID: <2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Sat, 06 Dec 2014 01:39:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 05 December 2014 16:30:44 Otavio Salvador wrote:
> On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > Since the split out of git-perltools, some git tools (such as "git am",
> > "git send-email" and "git-submodule") have no longer been part of the
> > buildtools. We need these, so add them back in.
> > 
> > However, adding git-perltools to buildtools triggers perl itself being
> > brought into buildtools as well, and we don't want that; but we also
> > don't want to have to hack the git recipe or indeed anything else that
> > starts depending on perl. Thus, add a dummy package which gets installed
> > in its place, in a separate package architecture that is only enabled
> > for buildtools to ensure it doesn't start appearing in place of
> > nativesdk-perl anywhere else.
> > 
> > Fixes [YOCTO #7033].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> This dummy thing looks like a hack to me :-(

Perhaps - I'm all ears for an alternative solution, but it absolutely has to 
be fixed, and soon. Shipping an incomplete git (or incomplete perl) in 
buildtools basically defeats a major part of having the thing in the first 
place.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

