Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C889670A7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 14:44:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2015 07:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="497071872"
Received: from cestaunt-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.15.40])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 07:44:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Date: Fri, 22 May 2015 15:44:24 +0100
Message-ID: <2968009.Jcp0e3iZx0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
	<bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 22 May 2015 14:44:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 May 2015 17:15:45 Tanu Kaskinen wrote:
> +# meta/conf/bitbake.conf sets ALLOW_EMPTY_${PN}-dev = "1", but we don't
> want an 
> +# empty alsa-plugins-dev package. The empty package would depend
> on +# alsa-plugins, which is a package that doesn't exist.
> +ALLOW_EMPTY_${PN}-dev = "0"

Wouldn't it make sense to actually have a pulseaudio-plugins package which 
depends on all of the actual plugin packages? This way you would also avoid 
the other issue we've seen in similar recipes where users try to add the main 
package to their image, which the build system thinks will be produced, and 
then get the "package not found in base feeds" error at do_rootfs time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

