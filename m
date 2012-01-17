Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEMf-0001KM-PE
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:06:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 10:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97520191"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 10:58:59 -0800
Message-ID: <4F15C4F2.4010408@linux.intel.com>
Date: Tue, 17 Jan 2012 10:58:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326213043.git.chris_larson@mentor.com>
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/4] copyleft/license bits
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 19:06:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 08:31 AM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> The following changes since commit fff18970706913e7fd7f4a119d798dddb44b388a:
>
>    base-files: filesystems: fix mount order (2012-01-06 14:41:19 +0000)
>
> are available in the git repository at:
>    https://github.com/kergoth/oe-core license-bits
>
> Christopher Larson (4):
>        copyleft_compliance: add control of recipe types to include
>        copyleft_compliance: add debug message with the reason for exclusion
>        oe.license: add is_included convenience function
>        oe.license: avoid the need to catch SyntaxError
>
>   meta/classes/copyleft_compliance.bbclass |   56 ++++++++++++++++------------
>   meta/lib/oe/license.py                   |   59 ++++++++++++++++++++++++++++--
>   meta/lib/test.py                         |    3 ++
>   3 files changed, 90 insertions(+), 28 deletions(-)
>   create mode 100644 meta/lib/test.py
>
> Christopher Larson (4):
>    copyleft_compliance: add control of recipe types to include
>    copyleft_compliance: add debug message with the reason for exclusion
>    oe.license: add is_included convenience function
>    oe.license: avoid the need to catch SyntaxError
>
>   meta/classes/copyleft_compliance.bbclass |   56 ++++++++++++++++------------
>   meta/lib/oe/license.py                   |   59 ++++++++++++++++++++++++++++--
>   meta/lib/test.py                         |    3 ++
>   3 files changed, 90 insertions(+), 28 deletions(-)
>   create mode 100644 meta/lib/test.py
>
Merged into OE-Core

Thanks
	Sau!


