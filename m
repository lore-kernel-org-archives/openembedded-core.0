Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jic23@cam.ac.uk>) id 1QbFA1-0003p9-AT
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 18:59:45 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:47321)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1QbEqj-00026o-Dm (Exim 4.72) for
	openembedded-core@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Mon, 27 Jun 2011 17:39:49 +0100
Message-ID: <4E08B43A.7020004@cam.ac.uk>
Date: Mon, 27 Jun 2011 17:47:54 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110509 Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4E08B126.9090106@cam.ac.uk>
In-Reply-To: <4E08B126.9090106@cam.ac.uk>
X-Enigmail-Version: 1.1.2
X-Mailman-Approved-At: Mon, 27 Jun 2011 19:44:50 +0200
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
X-List-Received-Date: Mon, 27 Jun 2011 16:59:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/27/11 17:34, Jonathan Cameron wrote:
> Building a couple of different things today gave me an issue that boils down to the subject line.
> 
> Latest issue was eglibc where do_populate_sysroot ended with.
> 
> + autoconf
> /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autoconf: /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autom4te: /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroot: bad interpreter: No such file or directory
> /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autoconf: line 501: /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/autom4te: Success
> ERROR: Function 'do_siteconfig_gencache' failed (see /home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r15/temp/log.do_populate_sysroot.1218 for further information)
> 
> 
> Which is true. The directory is sysroots not systroot.
> 
> 
> I guess it could be a dead tmp issue so will try rebuilding from scratch overnight...
It wasn't.  Now getting the same error, on libtool native, but now with an apparently valid path..
> 
> Anyone have any other thoughts on what might have broken this?
> 
> Thanks,
> 
> Jonathan



