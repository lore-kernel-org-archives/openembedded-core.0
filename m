Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4382606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:54:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 25 May 2016 06:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="814565358"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 25 May 2016 06:54:40 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id E712C6A4008; Wed, 25 May 2016 07:42:10 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 17:42:10 +0300 (EEST)
Message-ID: <52090.10.252.8.31.1464187330.squirrel@linux.intel.com>
In-Reply-To: <285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkone
	n@intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
	<285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
Date: Wed, 25 May 2016 17:42:10 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Jussi Kukkonen" <jussi.kukkonen@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 25 May 2016 13:54:41 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Change gnutls to use GNUPG_MIRROR as well: they have their own domain
> but the ftp site is the slow, unreliable gnupg.org one.

Doesn't work for gnutls I'm afraid:

https://www.gnupg.org/ftp/gcrypt/gnutls/v3.4/

Alex

