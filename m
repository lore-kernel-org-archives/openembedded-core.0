Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AF980734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 12:18:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 05:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="779012767"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2015 05:17:49 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.29]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.22]) with mapi id
	14.03.0224.002; Thu, 6 Aug 2015 13:17:48 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in
	mkdosfs
Thread-Index: AQHQ0CcDZeLXLbZJ5kaSJN/ZSXAkUp3+nv+AgAADmICAAEAd7g==
Date: Thu, 6 Aug 2015 12:17:47 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC37FD8262@irsmsx110.ger.corp.intel.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<55C32503.3050800@linux.intel.com>,
	<13325469.N9zhAzKaIU@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <13325469.N9zhAzKaIU@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Thu, 06 Aug 2015 12:18:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Alex & Paul,

Thanks both of you, I have resubmitted the patch as per you suggestions.

- Amarnath
________________________________________
From: Paul Eggleton [paul.eggleton@linux.intel.com]
Sent: Thursday, August 06, 2015 12:25 PM
To: Alexander Kanavin; Valluri, Amarnath
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in=
 mkdosfs

On Thursday 06 August 2015 12:12:35 Alexander Kanavin wrote:
> On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
> > Added new patch that fixes the memory leak that was introduced in
> > mkdosfs-dir.patch.
>
> You should update the original patch then, not pile additional patches
> on top. The least painful way is:
>
> 1) unpack the sources (manually from tarball, or using bitbake -c unpack)
> 2) 'git init; git add *; git commit' to create an git repository from
> the sources
> 3) apply the patch that needs fixing, then do the fix
> 4) make a git commit, then produce a patch using git format-patch, then
> move the new patch back to the recipe directory and update the recipe
> 5) build the recipe to make sure it still builds
> 6) make a git commit with the recipe update, and submit it here :)

On the contrary - the much less painful way (as of fido) is to use devtool:

1) Extract source and set the build system up to use it:
   devtool modify dosfstools -x ~/projects/dosfstools

2) Make whatever changes you want to in the git tree that has been set up in
the specified path

3) Build the recipe (as you would normally) to make sure it still builds

4) Write the modified/added commits as patches back to the recipe:
    devtool update-recipe dosfstools

5) Make a git commit with the recipe update, and submit it here :)

I'd really like people to start using devtool for this kind of thing. If it=
's
not working for some reason please do let me know.

Cheers,
Paul

--

Paul Eggleton
Intel Open Source Technology Centre
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


