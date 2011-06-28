Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QbROV-000215-3b
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 08:03:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jun 2011 22:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="21339240"
Received: from unknown (HELO [10.255.13.205]) ([10.255.13.205])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2011 22:59:49 -0700
Message-ID: <4E096DD7.8080504@linux.intel.com>
Date: Mon, 27 Jun 2011 22:59:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <dc56d07c4a034568b8860d7bcd41b31acbdb3e89.1309059243.git.sgw@linux.intel.com>	<598f1ae9f5b0adee5bf9cfae4fc6bf3522bdfd4f.1309059243.git.sgw@linux.intel.com>
	<1309168662.21613.265.camel@phil-desktop>
In-Reply-To: <1309168662.21613.265.camel@phil-desktop>
Subject: Re: [RFC - Staticdev 2/2] systemtap: add sqlite3 to DEPENDS
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
X-List-Received-Date: Tue, 28 Jun 2011 06:03:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2011 02:57 AM, Phil Blundell wrote:
> On Sat, 2011-06-25 at 21:36 -0700, Saul Wold wrote:
>> -DEPENDS = "elfutils"
>> +DEPENDS = "elfutils sqlite3"
>
> No doubt this is a fine change but I didn't quite understand what it has
> to do with staticdev.  Was this meant to be a separate patchset?
>
Well yes it not directly related to staticdev, other than I found it, it 
is a seperate pull within the patch request, I can break this into 2 
requests if needed.

Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


