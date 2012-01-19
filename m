Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RngjG-0006KV-IK
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 02:23:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jan 2012 17:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113801832"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2012 17:16:10 -0800
Message-ID: <4F176EDA.2040305@linux.intel.com>
Date: Wed, 18 Jan 2012 17:16:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <f37166f3f48c2747fbcc4d9ca8e9c2ddbe9aa637.1326929307.git.nitin.a.kamble@intel.com>
	<19d739c1ea85da2d374665924b8d004f06a2f30e.1326929307.git.nitin.a.kamble@intel.com>
In-Reply-To: <19d739c1ea85da2d374665924b8d004f06a2f30e.1326929307.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCHv3 3/7] libunistring: new recipe for autogen
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
X-List-Received-Date: Thu, 19 Jan 2012 01:23:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/18/2012 03:32 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> libunistring recipe is needed by guile.
> And guile is needed by autogen.
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   .../libunistring/libunistring_0.9.3.bb             |   27 ++++++++++++++++++++
>   1 files changed, 27 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-support/libunistring/libunistring_0.9.3.bb
>
> diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
> new file mode 100644
> index 0000000..7d09761
> --- /dev/null
> +++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "libunistring provides functions for manipulating according to the Unicode standard."
> +
> +DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may consist of very\
> + different scripts – from Latin letters to Chinese Hanzi –, with many kinds of special\
> + characters – accents, right-to-left writing marks, hyphens, Roman numbers, and much\
> + more. But the POSIX platform APIs for text do not contain adequate functions for\
> + dealing with particular properties of many Unicode characters. In fact, the POSIX\
> + APIs for text have several assumptions at their base which don't hold for Unicode\
> + text. \
> + This library provides functions for manipulating Unicode strings and for manipulating\
> + C strings according to the Unicode standard."
> +
> +HOMEPAGE = "http://www.gnu.org/software/libunistring/"
> +SECTION = "devel"
> +LICENSE = "GPLv3&LGPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
> +
> +SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
> +SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"
> +
> +PR = "r0"
> +
> +inherit autotools
> +BBCLASSEXTEND = "native nativesdk"

Nitin,

Still seeing, the following:

NOTE: package libunistring-0.9.3-r1: task do_package_write_deb: Started
ERROR: Error executing a python function in 
/intel/poky/distro/meta/recipes-support/libunistring/libunistring_0.9.3.bb:
UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 96: 
ordinal not in range(128)

ERROR: The stack trace of python calls that resulted in this 
exception/failure was:
ERROR:   File "do_package_deb", line 194, in <module>
ERROR:
ERROR:   File "do_package_deb", line 119, in do_package_deb
ERROR:
ERROR: The code that was being executed was:
ERROR:      0190:        bb.utils.prunedir(controldir)
ERROR:      0191:        bb.utils.unlockfile(lf)
ERROR:      0192:
ERROR:      0193:
ERROR:  *** 0194:do_package_deb(d)
ERROR:      0195:
ERROR: (file: 'do_package_deb', lineno: 194, function: <module>)
ERROR:      0115:                     summary = 
localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', 
True) or "."
ERROR:      0116:                     description = 
localdata.getVar('DESCRIPTION', True) or "."
ERROR:      0117:                     description = 
textwrap.dedent(description).strip()
ERROR:      0118:                     ctrlfile.write('Description: %s\n' 
% unicode(summary))
ERROR:  *** 0119:                     ctrlfile.write('%s\n' % 
unicode(textwrap.fill(description, width=74, initial_indent=' ', 
subsequent_indent=' ')))
ERROR:      0120:                else:
ERROR:      0121:                     ctrlfile.write(unicode(c % 
tuple(pullData(fs, localdata))))
ERROR:      0122:        except KeyError:
ERROR:      0123:            import sys
ERROR: (file: 'do_package_deb', lineno: 119, function: do_package_deb)
ERROR: Function failed: do_package_deb
ERROR: Logfile of failure stored in: 
/intel/poky/builds/world/tmp/work/i586-poky-linux/libunistring-0.9.3-r1/temp/log.do_package_write_deb.31745
NOTE: package libunistring-0.9.3-r1: task do_package_write_deb: Failed
ERROR: Task 646 
(/intel/poky/distro/meta/recipes-support/libunistring/libunistring_0.9.3.bb, 
do_package_write_deb) failed with exit code '1'



