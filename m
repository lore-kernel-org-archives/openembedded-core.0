Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SMcHU-0006Un-MH
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:43:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2012 02:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="134578108"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 24 Apr 2012 02:33:56 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 24 Apr 2012 02:33:56 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.213]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.136]) with mapi id
	14.01.0355.002; Tue, 24 Apr 2012 17:33:54 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: is the virtual package <locale>-tanslation correct?
Thread-Index: Ac0h/Vy8VJZN1zvnQf+4XTcZKZy02Q==
Date: Tue, 24 Apr 2012 09:33:54 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD735E3@SHSMSX101.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: is the virtual package <locale>-tanslation correct?
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
X-List-Received-Date: Tue, 24 Apr 2012 09:43:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,

I found that in package.bbclass when generating the -locale packages, it se=
ts RPROVIDES to provide the virtual packages <locale>-translation,
  d.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln))

This would result different real packages provide the same <locale>-transla=
tion, i.e. eglibc-locale-ca and glib-2.0-locale-ca will both RPROVIDES ca-t=
ranslation, even though they contain different messages.

Is it desirable or should we remove the <locale>-translation in RPROVIDES?

Best Regards,
-Lianhao


