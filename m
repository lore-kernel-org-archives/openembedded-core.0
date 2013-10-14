Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DD9C56CD18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:50:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Oct 2013 02:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,491,1378882800"; d="scan'208";a="418778682"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2013 02:50:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Oct 2013 10:50:45 +0100
Message-ID: <3582326.YWLuugF7nd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1310120642340.21327@oneiric>
References: <alpine.DEB.2.02.1310120642340.21327@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: where is "packagegroup-core-qt-demoapps" defined?
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
X-List-Received-Date: Mon, 14 Oct 2013 09:50:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Saturday 12 October 2013 06:45:20 Robert P. J. Day wrote:
>   currently writing a tutorial on packagegroups and noticed in
> core-image.bbclass:
> 
> PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demoapps"
> 
>   is that packagegroup actually defined anywhere? i'm prepared to be
> told i'm being an idiot and that it's right under my nose.

meta/recipes-qt/packagegroups/packagegroup-core-qt.bb

This one isn't as easy to find as some of the other packagegroups. Given that 
the recipe only provides one actual output package we could possibly rename it 
for clarity.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

