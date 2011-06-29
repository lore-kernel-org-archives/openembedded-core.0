Received: from ppsw-41.csi.cam.ac.uk ([131.111.8.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jic23@cam.ac.uk>) id 1Qby0H-0006re-PN
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 18:52:41 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:34750)
	by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1Qbxdz-0005v9-QA (Exim 4.72) for
	openembedded-core@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Wed, 29 Jun 2011 17:29:39 +0100
Message-ID: <4E0B54D9.80108@cam.ac.uk>
Date: Wed, 29 Jun 2011 17:37:45 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110509 Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.1.2
Subject: meta-toolchain issues. Unsatisfied dependencies, eglic, eglibc-dev
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
X-List-Received-Date: Wed, 29 Jun 2011 16:52:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Prior to Koen's patch "libc locale split: fix some remaining problems"

I was getting the same issue but with libc6 and particular versions.

I'm guessing this is more fallout from the same issue Koen found?

Relevant chunk of log is (during populate_sdk) is:


| Downloading file:/home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/deploy/ipk/armv7a/task-core-standalone-sdk-target_1.0-r6_armv7a.ipk.
| libc6-dev: unsatisfied recommendation for eglibc-thread-db-dev
| libc6-dev: unsatisfied recommendation for eglibc-gconv-libgb-dev
| libc6-dev: unsatisfied recommendation for eglibc-gconv-libksc-dev
| libc6-dev: unsatisfied recommendation for eglibc-gconv-libjis-dev
| libc6-dev: unsatisfied recommendation for eglibc-gconv-libjisx0213-dev
| libc6-dev: unsatisfied recommendation for libsegfault-dev
| libc6-dev: unsatisfied recommendation for eglibc-gconv-libcns-dev
| libc6-dev: unsatisfied recommendation for eglibc-gconv-libisoir165-dev
| libc6-dev: unsatisfied recommendation for eglibc-extra-nss-dev
| libc6-dev: unsatisfied recommendation for libcidn-dev
| eglibc-dbg: unsatisfied recommendation for libsegfault-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-gconv-libjis-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-gconv-libksc-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-gconv-libgb-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-thread-db-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-extra-nss-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-gconv-libisoir165-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-gconv-libjisx0213-dbg
| eglibc-dbg: unsatisfied recommendation for libgcc-dbg
| eglibc-dbg: unsatisfied recommendation for eglibc-gconv-libcns-dbg
| eglibc-dbg: unsatisfied recommendation for libcidn-dbg
| Installing task-core-standalone-sdk-target-dbg (1.0-r6) to root...
| Downloading file:/home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/deploy/ipk/armv7a/task-core-standalone-sdk-target-dbg_1.0-r6_armv7a.ipk.
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for libsegfault-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for libstdc++-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-thread-db-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for locale-base-en-us-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-localedata-i18n-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-utils-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-ibm850-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-iso8859-15-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-cp1252-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for libgcc-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-iso8859-1-dbg
| task-core-standalone-sdk-target-dbg: unsatisfied recommendation for locale-base-en-gb-dbg
| Installing task-core-standalone-sdk-target (1.0-r6) to root...
| Installing eglibc-dbg (2.12-r17) to root...
| Downloading file:/home/jic23/src/beagle/setup-scripts/build/tmp-angstrom_2010_x-eglibc/deploy/ipk/armv7a/eglibc-dbg_2.12-r17_armv7a.ipk.
| Configuring eglibc-dbg.
| Configuring task-core-standalone-sdk-target.
| Configuring task-core-standalone-sdk-target-dbg.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-core-standalone-sdk-target:
|  *    eglibc *        eglibc-dev *
|  * opkg_install_cmd: Cannot install package task-core-standalone-sdk-target.


