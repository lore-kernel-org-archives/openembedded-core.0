Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 201CC6E716
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 14:18:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2014 06:14:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,593,1389772800"; d="scan'208";a="467058400"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by orsmga001.jf.intel.com with ESMTP; 05 Mar 2014 06:18:42 -0800
Message-ID: <53173239.4000504@intel.com>
Date: Wed, 05 Mar 2014 16:18:33 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, =?ISO-8859-1?Q?David_?=
	=?ISO-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
References: <cover.1394018657.git.paul.eggleton@linux.intel.com>
	<531719E1.2080501@enea.com>
	<3814042.TXeI6vvODN@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <3814042.TXeI6vvODN@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] gnutls fixes for master
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
X-List-Received-Date: Wed, 05 Mar 2014 14:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 03/05/2014 03:24 PM, Paul Eggleton wrote:
> Hi David,
>
> On Wednesday 05 March 2014 13:34:41 David Nyström wrote:
>> On 2014-03-05 12:25, Paul Eggleton wrote:
>>> Turns out we're using the same old version of gnutls in master as in
>>> dylan and dora, and we need a fix for a compile failure.
>>>
>>> The following changes since commit
> 82c773e88aaefd9321481ad297554d5b4a3ae0b2:
>>>     Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03
>>>     15:52:26 +0000)>
>>> are available in the git repository at:
>>>     git://git.openembedded.org/openembedded-core-contrib paule/gnutls
>>>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
>>>     paule/gnutls>
>>> Karl Hiramoto (2):
>>>     gnutls: CVE-2014-0092 correct return codes
>>>     gnutls: Fixed bug that prevented the rejection of v1 intermediate CA
>>>     
>>>       certificates.
>>>
>>> Paul Eggleton (1):
>>>     gnutls: fix failure during do_compile
>> Any specific reasons why we still have the old gnuTLS-2.12.23 ?
> I'm not sure - there's no NO_UPGRADE_REASON set in our inc files to suggest
> why. Googling turned this up:
>
>   https://wiki.debian.org/gnutls3
>
> Valentin, Saul - we probably ought to have NO_UPGRADE_REASON set for gnutls if
> we have a good reason for staying with 2.12.x.
>
> Cheers,
> Paul
>

There is no valid regex for gnutls at the moment. I'll update it. As for 
the recommended version Saul or Ross might  know more.



