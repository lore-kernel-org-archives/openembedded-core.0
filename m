Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 53CE977226
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 22:47:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2016 15:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,507,1464678000"; d="scan'208";a="1039654307"
Received: from ahuong-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.129])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2016 15:47:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 10:47:03 +1200
Message-ID: <4446501.zJ7lKRIVTe@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.5-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <8aa96837fb9a30d03e547d7c7d58706f7d7a8aab.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
	<8aa96837fb9a30d03e547d7c7d58706f7d7a8aab.1470890478.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 09/10] classes/populate_sdk_ext: add some pre-install checks
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
X-List-Received-Date: Thu, 11 Aug 2016 22:47:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 11 Aug 2016 16:45:06 Paul Eggleton wrote:
> +        # Check setting of LC_ALL set above
> +	canonicalised_locale=`echo $LC_ALL | sed 's/UTF-8/utf8/'`
> +	if ! locale -a | grep -q $canonicalised_locale ; then
> +		echo "ERROR: the installer requires the $LC_ALL locale to be
> installed (but not selected), please install it first" 
> +		exit 1
> +	fi

Note that this will of course need updating if we go ahead with the fix for
the issue that Enrico brought up [1] then this will need to be changed as
well.

Cheers,
Paul

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-August/124896.html

-- 

Paul Eggleton
Intel Open Source Technology Centre

