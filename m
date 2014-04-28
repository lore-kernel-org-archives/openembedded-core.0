Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7B865ECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 11:01:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2014 03:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,943,1389772800"; d="scan'208";a="522300203"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.52])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2014 04:01:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 28 Apr 2014 12:01:14 +0100
Message-ID: <2043664.1uWp1HXphT@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <b734f87b706cb1ec48d4e5f9b7dde7b7803fd49f.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
	<b734f87b706cb1ec48d4e5f9b7dde7b7803fd49f.1398210385.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/10] sqlite3: Update to 3080403
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
X-List-Received-Date: Mon, 28 Apr 2014 11:01:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 22 April 2014 16:49:31 Saul Wold wrote:
> And rename the PV to match the upstream versioning
> This requires a PE Bump to ensure package versions don't
> go backwards.

Saul, we renamed this just recently and I'm pretty sure we discussed it at the 
time - the upstream version _is_ 3.8.4.3; the file naming should not determine 
the version used for the recipe because the file name version scheme does not 
match up with what upstream SQLite uses everywhere else (documentation, 
release notes, etc.). If our package reporting system can't understand this we 
should not be mangling the recipe (again) to work around it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

