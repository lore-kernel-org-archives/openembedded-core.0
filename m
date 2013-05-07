Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1UZa9Z-0007Mb-O3
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 07:09:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 May 2013 21:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,625,1363158000"; d="scan'208";a="330014067"
Received: from fmsmsx108.amr.corp.intel.com ([10.19.9.228])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2013 21:50:06 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
	FMSMSX108.amr.corp.intel.com (10.19.9.228) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 6 May 2013 21:50:06 -0700
Received: from fmsmsx152.amr.corp.intel.com ([169.254.6.6]) by
	FMSMSX110.amr.corp.intel.com ([169.254.1.41]) with mapi id
	14.01.0355.002; Mon, 6 May 2013 21:50:06 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Jeff Shanab <jshanab@earthlink.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Hob interface
Thread-Index: AQHOSslq7g/QkkJbvEmIN5zoY3j9X5j5IkrA
Date: Tue, 7 May 2013 04:50:05 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C7077EBAD@fmsmsx152.amr.corp.intel.com>
References: <518863CB.4080001@earthlink.net>
In-Reply-To: <518863CB.4080001@earthlink.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: Hob interface
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
X-List-Received-Date: Tue, 07 May 2013 05:09:39 -0000
X-List-Received-Date: Tue, 07 May 2013 05:09:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

Yes, it is one of the change that we made in 1.4 for unify the config chang=
es between hob and underline bitbake, but we went a little bit too far by r=
emoving the template capability.  Restore template is one of the scheduled =
bug fixes for 1.5 and probably we'll push it into 1.4.1 release.

Thanks,
Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Jeff Shanab
Sent: Monday, May 06, 2013 7:16 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] Hob interface

I pulled day before yesturday and I am trying to start with a base image an=
d add stuff to make a custom build. But I cannot save, there is no template=
 button.
Does it now edit the files in the current conf dir?
I liked the concept of being able to start with a know image, save it out a=
s a named template then edit, save(before I spend hours building) then buil=
d and test.


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


