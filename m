Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Qo9ry-0004o4-Je
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 09:58:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2011 00:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,305,1309762800"; d="scan'208";a="34148679"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by azsmga001.ch.intel.com with ESMTP; 02 Aug 2011 00:53:03 -0700
Message-ID: <4E37ACE5.6000300@intel.com>
Date: Tue, 02 Aug 2011 15:53:09 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311858056.git.edwin.zhai@intel.com>	<dbe75b1d05a85f17c749a45fdfbca0025c481c24.1311858056.git.edwin.zhai@intel.com>
	<2074233.Hg07R4aRha@perseus>
In-Reply-To: <2074233.Hg07R4aRha@perseus>
Subject: Re: [PATCH 4/7] apr-util: Upgrade to 1.3.12
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
X-List-Received-Date: Tue, 02 Aug 2011 07:58:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Khem Raj wrote:
>
> On Thursday, July 28, 2011 09:03:06 PM edwin.zhai@intel.com wrote:
> >
> >
> > +FILES_${PN}-dev += "${libdir}/aprutil.exp"
> > +FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
> > +FILES_${PN}-dbg += "${libdir}/apr-util-1/* 
> ${libdir}/apr-util-1/.debug/*"
>
> do you really want ${libdir}/apr-util-1/* wildcard to go into a dbg 
> package
> here ?
>

2nd thought make them into dev package like following:

+FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
+FILES_${PN}-dev += "${libdir}/aprutil.exp 
${libdir}/apr-util-1/apr_dbm_gdbm.*"
+FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"


> > +
> -- 
> Khem Raj
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


