Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRx2w-0005LF-3u
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 03:50:02 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QRwzr-0000bP-Pk from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:46:51 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 18:43:16 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 1 Jun 2011 18:46:51 -0700
Message-ID: <4DE6EB88.9080509@mentor.com>
Date: Wed, 1 Jun 2011 18:46:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306218459.git.sgw@linux.intel.com>		<53e096ed690901bafdc3087b1591db60d16c6d0b.1306218459.git.sgw@linux.intel.com>		<1306433070.1777.7.camel@vorpal.jf.intel.com>		<4DDE9BC8.8000008@linux.intel.com>		<1306439668.1777.10.camel@vorpal.jf.intel.com>		<4DDEBE38.8090203@linux.intel.com>	<1306443683.5911.1.camel@vorpal.jf.intel.com>
	<4DDEC006.30701@linux.intel.com>
In-Reply-To: <4DDEC006.30701@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Jun 2011 01:43:16.0438 (UTC)
	FILETIME=[715C2760:01CC20C6]
Subject: Re: [RFC 1/2] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Thu, 02 Jun 2011 01:50:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/26/2011 02:03 PM, Darren Hart wrote:
[snip]

> Yeah, this wasn't clear to me either. And my question in 2/2 still
> stands - what is the goal of the overhead factor?

I know I'm late to the thread, sorry, but the problem is that the 'du'
estimation we use for the common case of "image is larger than our
default" sucks pretty bad.  Without some additional fudge factors (both
the multiplier and additional room) most images won't actually end up
fitting into an ext* image and genext2fs chokes.  I know the rpmdb was
mentioned before but really it's everything.  Take any image, poke at
what du says things take and what df shows it's taking and cry :(

-- 
Tom Rini
Mentor Graphics Corporation


