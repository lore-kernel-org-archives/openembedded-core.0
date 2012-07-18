Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrQwC-0006ff-G2
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 11:52:56 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 02:41:35 -0700
Received: by qcmv28 with SMTP id v28so752171qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 02:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=krVhZ8gY1hZV1+DW694BuL6QSf0I+cw4zIimbu+V19U=;
	b=f6IHQ+wrEw4BGRW4NCwbkN0MPSpnYI2y81oliQUrWuvJ7UNxfeatrciSKTG4nHCd84
	PL+RDkZBdByNTx4QnAfnLECgmFZc1MA/nK9cPKnwwchEPztA20V5+7gImZsFrNz+QKEw
	GejI/XguyGNv1VcwTE1BH52tdQj9BCumO40a2f8eJMyPSJCCoNxr7i8FYKgUkyrCO0/v
	ZJsg8Ek08HpkTLPQvtz8FEMHrXbIIHI/PsBhanvQJ9BMgRSk706HgGz5r//gM5KlaU74
	ZZ1qKGBDLSx6Y7L+Hz+Nu6DwejFqB9txhLcjYdQ29/Tb7TEZ8ahRDjeBzqwWamvKMyyD
	q42A==
Received: by 10.224.182.136 with SMTP id cc8mr4670683qab.60.1342604494098;
	Wed, 18 Jul 2012 02:41:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 02:41:13 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 10:41:13 +0100
Message-ID: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk+HLHi4tkl9UKxjaOK6cuBzv5PsYLY6QAeipo+h4DnYQp3PxYMUpL30Bs2ysSfxtHm2tXL
Subject: eglibc-initial trying to remove files in /usr
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
X-List-Received-Date: Wed, 18 Jul 2012 09:52:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

My nightly run of master failed last night, but not in a way that the
autobuilder is seeing...

ERROR: Function failed: do_install (see
/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/temp/log.do_install.10450
for further information)
ERROR: Logfile of failure stored in:
/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/temp/log.do_install.10450
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
'common-linux', 'common-glibc', 'i586-linux', 'common']
| DEBUG: Executing shell function do_install
| NOTE: make PARALLELMFLAGS=-j 8 cross-compiling=yes
install_root=/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/image
includedir=/usr/include prefix=/usr install-bootstrap-headers=yes
install-headers
...
| make[1]: Entering directory
`/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/eglibc-2_15/libc'
| /usr/bin/install -c -m 644 include/limits.h /usr/include/limits.h
| /usr/bin/install: cannot remove `/usr/include/limits.h': Permission denied
| make[1]: *** [/usr/include/limits.h] Error 1
| make[1]: Leaving directory
`/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/eglibc-2_15/libc'
| make: *** [install-headers] Error 2
| ERROR: oe_runmake failed

Any ideas?

Ross


