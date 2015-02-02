Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 75D886018F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:04:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2015 09:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,507,1418112000"; d="scan'208";a="671579828"
Received: from bbodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.158])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2015 09:04:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Mon, 02 Feb 2015 17:04:29 +0000
Message-ID: <5253630.c2vWHxRG0u@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1422662905-3598-1-git-send-email-paul.gortmaker@windriver.com>
References: <1422662905-3598-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtools: add a bb for git-manpages
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
X-List-Received-Date: Mon, 02 Feb 2015 17:04:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul,

On Friday 30 January 2015 19:08:25 Paul Gortmaker wrote:
> These could be created from scratch from git itself, but it
> requires asciidoc, xsltproc, python bits and too much other
> baggage.  Since the git folks issue a tarball with the manpages
> for each release, it is simpler to just go get that.

I'm just wondering, would it be simpler to just do this as part of the git 
recipe itself and have the manpages go into git-doc? Then you would get the 
documentation automatically if you had git in your image and doc-pkgs in 
IMAGE_FEATURES, plus we wouldn't have to remember to upgrade this every time 
we upgraded the git recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

