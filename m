Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlpjA-0006OG-Gf
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 01:08:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2012 15:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="165993821"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2012 15:57:18 -0700
Message-ID: <4FF2274D.70102@linux.intel.com>
Date: Mon, 02 Jul 2012 15:57:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341268076-1331-1-git-send-email-sgw@linux.intel.com>
	<1341268444.2886.46.camel@x121e.pbcl.net>
In-Reply-To: <1341268444.2886.46.camel@x121e.pbcl.net>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [RFC] package.bbclass: enable the use of ERROR_QA
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
X-List-Received-Date: Mon, 02 Jul 2012 23:08:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 03:34 PM, Phil Blundell wrote:
> On Mon, 2012-07-02 at 15:27 -0700, Saul Wold wrote:
>> +		if "installed_vs_shipped" in = (d.getVar('INSANE_SKIP_' + pn, True) or "").split()
>> +			bb.note("Package %s skipping Packging installed vs shipped QA test" % pn)
>> +			continue
>
> Does that actually compile?  It doesn't look entirely like valid python
> to me.
>
Apparently not, I am really not sure what I tested this, but I did test 
something that gave me the messages I wanted.  I am going back to my 
code and well, I feel stupid right now.

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
>


