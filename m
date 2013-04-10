Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPp3K-0008BQ-Kz
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 09:02:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2013 23:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,444,1363158000"; d="scan'208";a="315819786"
Received: from unknown (HELO [10.255.14.7]) ([10.255.14.7])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 23:45:20 -0700
Message-ID: <51650A7F.2020904@linux.intel.com>
Date: Tue, 09 Apr 2013 23:45:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: ptest results
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 07:02:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Bjorn:

I ran ptest-runner finally I saw that there were failures, I am 
wondering if these are expected?

http://pastebin.com/PAH3gJT0

The bash packages did not seem to get split out correct, the ptest seem 
to land in ${PN} not in ${PN}-ptest, you might want to look into this also.

With your patch, the ptest related debug files did go into the 
${PN}-dbg, is this what you intend or should they go into a 
${PN}-ptest-dbg package?

Thanks


-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



