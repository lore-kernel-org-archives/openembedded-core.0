Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 624146014F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 09:09:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 26 May 2016 02:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="989106138"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2016 02:08:59 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 626756A4008; Thu, 26 May 2016 02:56:29 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 26 May 2016 12:56:29 +0300 (EEST)
Message-ID: <62087.10.252.8.31.1464256589.squirrel@linux.intel.com>
In-Reply-To: <61959.10.252.8.31.1464255292.squirrel@linux.intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
	<285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
	<52090.10.252.8.31.1464187330.squirrel@linux.intel.com>
	<CAHiDW_G9jEcP6MSB4+zGh_PPTBc87+C+5HBcGbEhFEoBNqVnoQ@mail.gmail.com>
	<61959.10.252.8.31.1464255292.squirrel@linux.intel.com>
Date: Thu, 26 May 2016 12:56:29 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: alexander.kanavin@linux.intel.com
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
X-List-Received-Date: Thu, 26 May 2016 09:09:02 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> How can you be sure that other index.html files aren't similarly out of
> date? We should stick to the ftp directory listings for upstream checks
> until the upstream sorts this. I'm not sure if the patch should be held
> off altogether, or fixed so that the upstream check uri explicitly points
> to ftp for each affected recipe.


Right, here's another out of date index.html, so they simply cannot be
relied on:
https://www.gnupg.org/ftp/gcrypt/pinentry/

I think we can solve this, if for everything except gnutls, upstream check
uri is set to
https://www.gnupg.org/download/index.html
(perhaps via a class).

For gnutls, it should still be set to the ftp:
ftp://ftp.gnutls.org/gcrypt/gnutls/

Alex

