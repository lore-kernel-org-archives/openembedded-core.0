Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7255765CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 19:24:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Aug 2015 12:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,747,1437462000"; d="scan'208";a="790797490"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.17.159])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2015 12:24:28 -0700
Message-ID: <1440530671.15187.38.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
In-Reply-To: <1440518117-6722-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1440518117-6722-1-git-send-email-mariano.lopez@linux.intel.com>
Organization: Intel Corporation
Date: Tue, 25 Aug 2015 14:24:31 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Subject: Re: [PATCH 0/4 v2] Get dumps when qemu fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2015 19:24:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Mariano, a minor correction below:

On Tue, 2015-08-25 at 10:55 -0500, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This provides classes for dump logs from the host
> and the target. This way it's easier to get dumps
> from the runner or the target and not just from
> the test. With this now the qemurunner instance
> get the dumps from the host when qemu fails.
> 
> This also allows to have datastore vars in the
> commands and removes the special case commands.
> 
> This fix the regresion regression when testin real
> hardware
*This fixes the regression encountered when tested
in hardware
> 
> This depends on:
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2015-August
> /108912.html
> 
> [YOCTO #8118]
> [YOCTO #8203]
> 
> Mariano Lopez (4):
>   dump: Created new classes for dump host and target
>   qemurunner: Added host dumps when there are errors
>   dump: allow to have datastore vars on dump commands
>   oetest: Fix regression when testing real hardware
> 
>  meta/classes/testimage.bbclass    | 14 +++++--
>  meta/lib/oeqa/oetest.py           | 56 ++++---------------------
>  meta/lib/oeqa/targetcontrol.py    | 16 +++----
>  meta/lib/oeqa/utils/dump.py       | 87
> +++++++++++++++++++++++++++++++++++++++
>  meta/lib/oeqa/utils/qemurunner.py | 14 ++++++-
>  5 files changed, 129 insertions(+), 58 deletions(-)
>  create mode 100644 meta/lib/oeqa/utils/dump.py
> 
> -- 
> 1.9.1
> 

