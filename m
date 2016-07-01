Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5C960111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 14:16:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2016 07:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,557,1459839600"; d="scan'208";a="987106264"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.67])
	([10.219.5.67])
	by orsmga001.jf.intel.com with ESMTP; 01 Jul 2016 07:16:24 -0700
To: Michael Halstead <mhalstead@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <ae4e2654-ca20-85d1-d53b-b0b05ab25a26@linuxfoundation.org>
	<CAMKF1srZ=NCMop1BWgZ9PACGJEjVguDngZT4tcAt0jqnBZt_rA@mail.gmail.com>
	<a4af0a4c-f6f2-a46d-2a0c-97220b0c3dc4@linuxfoundation.org>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <e825ee2d-7304-3227-1589-f1d58385185c@linux.intel.com>
Date: Fri, 1 Jul 2016 09:18:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <a4af0a4c-f6f2-a46d-2a0c-97220b0c3dc4@linuxfoundation.org>
Subject: Re: [oe] Patchwork upgrade tonight
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
X-List-Received-Date: Fri, 01 Jul 2016 14:16:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Perhaps it is worth mentioning that the new instance has a REST API, so 
you can send requests directly or use the more friendly tool git-pw.

http://patchwork-freedesktop.readthedocs.io/en/latest/manual.html#git-pw

With it, so can easily fetch, merge, etc. patch series coming from 
patchwork.



On 07/01/2016 02:37 AM, Michael Halstead wrote:
> The new patchwork is in place at https://patchwork.openembedded.org/.
> The performance changes appear to be working well. Please e-mail if you
> notice any problems.
>
> On 06/30/2016 04:11 PM, Khem Raj wrote:
>> On Thu, Jun 30, 2016 at 4:03 PM, Michael Halstead
>> <mhalstead@linuxfoundation.org> wrote:
>>> Please reach out if you have concerns.
>> Hi Mike
>>
>> I have been playing with the new instance no issues so far. Send a
>> note when you bring down the system and again another when its all up.
>>
> There should have been no down time. Both systems remain running and the
> cut over was done with a DNS change.
>


