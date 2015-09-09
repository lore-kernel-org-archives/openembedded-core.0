Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA397404E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 21:37:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 Sep 2015 14:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,499,1437462000"; d="scan'208";a="801798620"
Received: from dblythe-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.17.144])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2015 14:37:13 -0700
To: Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1441748721-32485-1-git-send-email-bruno.bottazzini@intel.com>
From: Saul Wold <sgw@linux.intel.com>
Message-ID: <55F0A688.6050609@linux.intel.com>
Date: Wed, 9 Sep 2015 14:37:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1441748721-32485-1-git-send-email-bruno.bottazzini@intel.com>
Subject: Re: [PATCH V3] mkefidisk: Create interactive menu for the script
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
X-List-Received-Date: Wed, 09 Sep 2015 21:37:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2015 02:45 PM, Bruno Bottazzini wrote:
> Differences from v2:
> - Removing unecessary \n as Saul Wold has suggested.
>
> Differences from v1:
> - Now it will show only unmounted devices as Saul Wold has suggested
> - Commit message changed as Saul Wold has suggested
>
> Bruno Bottazzini (1):
>    mkefidisk: Create interactive menu for the script
>
>   scripts/contrib/mkefidisk.sh | 63 ++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 58 insertions(+), 5 deletions(-)
>
I think this still does not address my concern about showing disks that 
are currently mounted and allows for easier overwriting of root or other 
disks.

Sau!


