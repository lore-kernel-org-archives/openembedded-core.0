Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5740F6018C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 08:47:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2016 01:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="974859590"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 01:47:22 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 4ABA76A4008; Thu, 26 May 2016 02:34:52 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 26 May 2016 12:34:52 +0300 (EEST)
Message-ID: <61959.10.252.8.31.1464255292.squirrel@linux.intel.com>
In-Reply-To: <CAHiDW_G9jEcP6MSB4+zGh_PPTBc87+C+5HBcGbEhFEoBNqVnoQ@mail.gmail.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
	<285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
	<52090.10.252.8.31.1464187330.squirrel@linux.intel.com>
	<CAHiDW_G9jEcP6MSB4+zGh_PPTBc87+C+5HBcGbEhFEoBNqVnoQ@mail.gmail.com>
Date: Thu, 26 May 2016 12:34:52 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Jussi Kukkonen" <jussi.kukkonen@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gnupg.org-hosted recipes: Change SRC_URI to https site
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
X-List-Received-Date: Thu, 26 May 2016 08:47:23 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> I could add a UPSTREAM_CHECK_URI for the ftp site... except I can't
> actually test that since the server has not really responded to me in
> days (apparently a known issue for the gupnp.org people).

Can you say which URL you cannot open? Everything works for me both behind
and outside of proxy, and the RRS server is reporting upstream versions
correctly as well:
http://recipes.yoctoproject.org/rrs/recipes/2.2/M1/

> I'll see about using http://gnutls.org/download.html page for that but
> in my opinion the patch is a clear improvement as it is...

You can't use http://gnutls.org/download.html because it doesn't have the
latest version anywhere on it.

And https://www.gnupg.org/ftp/gcrypt/gnutls/index.html has another issue:
it's out of date and doesn't have v3.5 directory listed at all, even
though it's there (visible via ftp and linked to from the downloads page).
How can you be sure that other index.html files aren't similarly out of
date? We should stick to the ftp directory listings for upstream checks
until the upstream sorts this. I'm not sure if the patch should be held
off altogether, or fixed so that the upstream check uri explicitly points
to ftp for each affected recipe.

Alex


