Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8D94C77D48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:25:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="87450283"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2017 06:25:14 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8519c496-eafb-fac3-190c-5eb0e4dbe6e2@linux.intel.com>
Date: Tue, 16 May 2017 16:23:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH v2 00/20] support profile-optimized build for Python
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
X-List-Received-Date: Tue, 16 May 2017 13:25:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2017 04:18 PM, Markus Lehtonen wrote:
> This patchset makes it possible to make a PGO (profile-guided-optimization)
> build of python. This version of the patchset is almost identical to v1
> submitted back in February, with these changes:
> - rebased on top of latest oe-core master
> - exclude profile data for Modules/posixmodule of Python 2.7 as it was not
>   working correctly

How about doing this only for Python 3.x? We'd like to stick to our 
resolution of deprecating 2.x, which means not introducing any new 
dependencies or images that need it.

Also, python-pgo-image commits should probably be all squashed into one 
(with comments within files replacing the commit messages).

Alex


