Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <public@plane.gmane.org>) id 1QbU4H-0007M2-Pj
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 10:54:49 +0200
Received: from public by plane.gmane.org with local (Exim 4.69)
	(envelope-from <public@plane.gmane.org>) id 1QbTm6-0002V0-63
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 10:36:02 +0200
Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152])
	by plane.gmane.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1QbTm3-0002NQ-GW for
	public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org;
	Tue, 28 Jun 2011 10:35:59 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:53605)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1QbTm3-0001Aa-DB (Exim 4.72) for
	openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@public.gmane.org
	(return-path <jic23@cam.ac.uk>); Tue, 28 Jun 2011 09:35:59 +0100
Message-ID: <4E099454.30801@cam.ac.uk>
Date: Tue, 28 Jun 2011 09:44:04 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110509 Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org>
References: <4E08B126.9090106@cam.ac.uk> <4E08B43A.7020004@cam.ac.uk>
In-Reply-To: <4E08B43A.7020004@cam.ac.uk>
X-Mailman-Approved-At: Tue, 28 Jun 2011 11:24:09 +0200
Subject: Re: /build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autom4te: build/tmp-angstrom_2010_x-eglibc/sysroot: bad interpreter:
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
X-List-Received-Date: Tue, 28 Jun 2011 08:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/27/11 17:47, Jonathan Cameron wrote:
> On 06/27/11 17:34, Jonathan Cameron wrote:
>> Building a couple of different things today gave me an issue that boils down to the subject line.
>>
>> Latest issue was eglibc where do_populate_sysroot ended with.
>>
>> + autoconf
>> /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autoconf: /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autom4te: /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroot: bad interpreter: No such file or directory
>> /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autoconf: line 501: /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autom4te: Success
>> ERROR: Function 'do_siteconfig_gencache' failed (see /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r15/temp/log.do_populate_sysroot.1218 for further information)
>>
>>
>> Which is true. The directory is sysroots not systroot.
>>
>>
>> I guess it could be a dead tmp issue so will try rebuilding from scratch overnight...
> It wasn't.  Now getting the same error, on libtool native, but now with an apparently valid path..
>>
>> Anyone have any other thoughts on what might have broken this?
Missed wiping the caches, now looks like it might be working...



