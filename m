Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RaZGE-00060h-72
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:47:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 12:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="86191825"
Received: from unknown (HELO [10.255.12.215]) ([10.255.12.215])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2011 12:40:41 -0800
Message-ID: <4EE7B848.3070405@linux.intel.com>
Date: Tue, 13 Dec 2011 12:40:40 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1323807692.git.josh@linux.intel.com>
	<ae691bf123b40864556a105f325aff26a6878cdb.1323807692.git.josh@linux.intel.com>
	<CAMKF1soA84UGCpx12gsTU_aL0uGSYau_=qoLDXkj9fRrhtGLmQ@mail.gmail.com>
In-Reply-To: <CAMKF1soA84UGCpx12gsTU_aL0uGSYau_=qoLDXkj9fRrhtGLmQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] clutter_git: update to 1.8.2 tag
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
X-List-Received-Date: Tue, 13 Dec 2011 20:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 13/12/11 12:34, Khem Raj wrote:
> On Tue, Dec 13, 2011 at 12:24 PM, Joshua Lock <josh@linux.intel.com> wrote:
>> -SRCREV = "39db46123ed6bbbc3e6ad359a64d4d344ca9e11b"
>> -PV = "1.8.0+git${SRCPV}"
>> +# the 1.8.2 tag
>> +SRCREV = "9041ea42655dfc1422ce88eab931382dd400d13a"
>> +PV = "1.8.2+git${SRCPV}"
> 
> you could also use the tag name instead of SHA for SRCREV I think

Indeed we can, however we've seen problems which I can't recall the
details of in the past when doing so. Therefore I decided to avoid it
this time.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


