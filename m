Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBDoh-0004Yf-3s for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 01:27:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r210IA7b004828; Fri, 1 Mar 2013 00:18:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ShqiXg6zbAv8; Fri,  1 Mar 2013 00:18:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r210I2OO004786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Mar 2013 00:18:05 GMT
Message-ID: <1362096628.1055.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 01 Mar 2013 00:10:28 +0000
In-Reply-To: <CAJTo0LbO5WcNeCBQo+FMSAteiE5rG41zL7EDeSE0g-YMF5vjhg@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
	<CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
	<CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
	<1361907835.5119.57.camel@ted>
	<CAJTo0LbwqK6wxJoB8FwXx_eHuyy71QhUH-cFvcDGDTOCAkjPDQ@mail.gmail.com>
	<CAP9ODKr0MgSyi7_nAdenhuyyGkfRw-hTPy3mWoHLjaRCD4DHcw@mail.gmail.com>
	<CAJTo0LbO5WcNeCBQo+FMSAteiE5rG41zL7EDeSE0g-YMF5vjhg@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Patches, Otavio Salvador <otavio@ossystems.com.br>,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Fri, 01 Mar 2013 00:27:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 14:47 +0000, Burton, Ross wrote:
> On 26 February 2013 20:52, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > I'd say to drop the AC_CANONICAL_HOST call and make it fake Linux as a
> > fixed value.
> 
> Did that in xorg-macros as that's where the definition is, but
> intltool's configure fragment links a program to set DATADIRNAME
> (although that appears to be deprecated), so it's trying to find a C
> compiler now.
> 
> How do I *properly* set allarch so sstate "works" but still allow a
> compiler to run so it can identify distribution-specific values (that
> have nothing to do with the architecture)?

Inherit the class, then set the compiler options to point to the native
compiler? I'm very nervous about doing that mind and would prefer to
"fix" the macros if we can.

Cheers,

Richard



