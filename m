Received: from exprod5og111.obsmtp.com ([64.18.0.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martyn.welch@ge.com>) id 1QRlOX-0007SD-Qd
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:23:34 +0200
Received: from Cinmlip06.e2k.ad.ge.com ([165.156.4.1]) (using TLSv1) by
	exprod5ob111.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTeY8loJQmTJOgWPm6heWldQXPAj4nA3J@postini.com;
	Wed, 01 Jun 2011 06:20:25 PDT
Received: from unknown (HELO cinmlef12.e2k.ad.ge.com) ([3.159.213.59])
	by Cinmlip06.e2k.ad.ge.com with ESMTP; 01 Jun 2011 08:34:29 -0400
Received: from [3.138.54.92] ([3.138.54.92]) by cinmlef12.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 08:32:28 -0400
Message-ID: <4DE631D3.9070703@ge.com>
Date: Wed, 01 Jun 2011 13:34:27 +0100
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306865217.git.scott.a.garman@intel.com>	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1306921632.2529.18.camel@phil-desktop>
In-Reply-To: <1306921632.2529.18.camel@phil-desktop>
X-Enigmail-Version: 1.1.2
X-OriginalArrivalTime: 01 Jun 2011 12:32:28.0229 (UTC)
	FILETIME=[F8060750:01CC2057]
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Wed, 01 Jun 2011 13:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/06/11 10:47, Phil Blundell wrote:
> On Tue, 2011-05-31 at 12:53 -0700, Scott Garman wrote:
>> This adds a -native recipe for the shadow utilities.
>>
>> The custom --root option allows the the following utilities to be
>> run within a chroot when invoked under pseudo:
> 
> Rather than patching the code for all these utilities, can't you just
> wrap them in a call to chroot(8)?  That is, make useradd.bbclass do:
> 
> eval $PSEUDO chroot ${STAGING_DIR_TARGET} useradd ...
> 
> rather than the existing
> 
> eval $PSEUDO useradd --root ${STAGING_DIR_TARGET} ...
> 
> ?
> 

You'd need root privileges to use chroot wouldn't you? I'm assuming you
wouldn't with the existing.

Martyn

-- 
Martyn Welch (Principal Software Engineer) | Registered in England and
GE Intelligent Platforms                   | Wales (3828642) at 100
T +44(0)127322748                          | Barbirolli Square, Manchester,
E martyn.welch@ge.com                      | M2 3AB  VAT:GB 927559189


