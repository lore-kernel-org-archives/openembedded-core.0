Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 33B9F784F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:54:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 07:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; 
   d="scan'208";a="4839939"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2017 07:54:40 -0800
To: "Viguera, Javier" <Javier.Viguera@digi.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB016B7958@dor-sms-xch01.digi.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <987bb588-d8dd-c2e8-52a7-1a7ce3d3865b@linux.intel.com>
Date: Tue, 14 Nov 2017 17:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB016B7958@dor-sms-xch01.digi.com>
Subject: Re: [Morty backports] tcf-agent fixes
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
X-List-Received-Date: Tue, 14 Nov 2017 15:54:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/14/2017 05:40 PM, Viguera, Javier wrote:

> There are a couple of commits in master fixing the tcf-agent bootscript 
> and systemd service files so the daemon is properly kill on reboot/shutdown.
> 
> This is failing also in past stable releases.
> 
> At least for Morty the cherry-picks apply just fine.
> 
> So could you do the cherry-picks for Morty?
> 
> git cherry-pick b33356d168c0fec9b2df387b51240fa6566ca145
> 
> git cherry-pick b467a22729bea886d7bde976c9606ac8e4589cde

Just send the patches here, with [morty] in the subject. If they need to 
go to pyro and rocko, that'd be appreciated too.

Alex

