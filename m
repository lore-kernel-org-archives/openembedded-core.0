Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8DA65CBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 16:21:29 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 22 Sep 2016 09:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,379,1470726000"; d="scan'208";a="12174969"
Received: from aehernan-mobl1.zpn.intel.com (HELO [10.219.27.139])
	([10.219.27.139])
	by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2016 09:21:29 -0700
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <1474492215-39510-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<a826406c-2bff-0e51-014c-81203e0ec06c@gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <9c1a4aa5-e682-82fb-042b-66b0df67b1d3@linux.intel.com>
Date: Thu, 22 Sep 2016 11:21:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <a826406c-2bff-0e51-014c-81203e0ec06c@gmail.com>
Cc: akuster@mvista.com
Subject: Re: [PATCH] [krogoth] Fixes several python3 dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2016 16:21:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hey Armin, I just gave it another try and I got no errors, python 
manifests patches may cause problems sometimes because some lines may be 
longer than 998 characters, could you try merging it from my contrib branch?

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=hsalejandro/krogothpy3


On 09/22/2016 10:33 AM, akuster808 wrote:
> Alejandro,
>
>
> On 09/21/2016 02:10 PM, Alejandro Hernandez wrote:
>> This patch adds the packages python3-signal, python3-enum and 
>> python3-selectors,
>> while it also fixes python3-subprocess, this fixes the installation 
>> of python3-modules
>
> I can not get this to apply to my krogoth-next nor krogoth in Poky. 
> Can you double check and let me know if I am doing something wrong or 
> need any dependency changes?
>
> error pw is showing is:
> fatal: patch fragment without header at line 29: @@ -89,6 +89,10 @@ 
> SUMMARY_${PN}-email="Python email support"
>
> - armin
>
>> [YOCTO #10276]
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>> ---
>>   meta/recipes-devtools/python/python-3.5-manifest.inc | 18 
>> +++++++++++++++---
>>   scripts/contrib/python/generate-manifest-3.5.py      | 11 ++++++++++-
>>   2 files changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc 
>> b/meta/recipes-devtools/python/python-3.5-manifest.inc
>> index bce9ce1..0ad9186 100644
>> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
>> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
>> @@ -1,6 +1,6 @@
>>     # WARNING: This file is AUTO GENERATED: Manual edits will be lost 
>> next time I regenerate the file.
>> -# Generator: 
>> '../../../scripts/contrib/python/generate-manifest-3.5.py' Version 
>> 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
>> +# Generator: './generate-manifest-3.5.py' Version 20140131 (C) 
>> 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
>>   # Visit the Python for Embedded Systems Site => 
>> http://www.Vanille.de/projects/python.spy
>>      @@ -39,7 +39,7 @@ 
>> FILES_${PN}-compression="${libdir}/python3.5/gzip.* 
>> ${libdir}/python3.5/zipfile.
>>     SUMMARY_${PN}-core="Python interpreter and core modules"
>>   RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs 
>> ${PN}-io ${PN}-math"
>> -FILES_${PN}-core="${libdir}/python3.5/__future__.* 
>> ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* 
>> ${libdir}/python3.5/ast.* ${libdir}/python3.5/copy.* 
>> ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/configparser.* 
>> ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* 
>> ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* 
>> ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* 
>> ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* 
>> ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* 
>> ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* 
>> ${libdir}/python3.5/UserString.* 
>> ${libdir}/python3.5/lib-dynload/binascii.*.so 
>> ${libdir}/python3.5/lib-dynload/_struct.*.so 
>> ${libdir}/python3.5/lib-dynload/time.*.so 
>> ${libdir}/python3.5/lib-dynload/xreadlines.*.so 
>> ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* 
>> ${bindir}/python* ${libdir}/python3.5/_weakrefset.* 
>> ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* 
>> ${libdir}/python
>>   3.5/config/Makefile 
>> ${includedir}/python${PYTHON_BINABI}/pyconfig*.h 
>> ${libdir}/python${PYTHON_MAJMIN}/collections 
>> ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* 
>> ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* 
>> ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>> +FILES_${PN}-core="${libdir}/python3.5/__future__.* 
>> ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* 
>> ${libdir}/python3.5/ast.* ${libdir}/python3.5/copy.* 
>> ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/ConfigParser.* 
>> ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* 
>> ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* 
>> ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* 
>> ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* 
>> ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* 
>> ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* 
>> ${libdir}/python3.5/UserString.* 
>> ${libdir}/python3.5/lib-dynload/binascii.*.so 
>> ${libdir}/python3.5/lib-dynload/_struct.*.so 
>> ${libdir}/python3.5/lib-dynload/time.*.so 
>> ${libdir}/python3.5/lib-dynload/xreadlines.*.so 
>> ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* 
>> ${bindir}/python* ${libdir}/python3.5/_weakrefset.* 
>> ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* 
>> ${libdir}/python
>>   3.5/config/Makefile 
>> ${includedir}/python${PYTHON_BINABI}/pyconfig*.h 
>> ${libdir}/python${PYTHON_MAJMIN}/collections 
>> ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* 
>> ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* 
>> ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>>     SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
>>   RDEPENDS_${PN}-crypt="${PN}-core"
>> @@ -89,6 +89,10 @@ SUMMARY_${PN}-email="Python email support"
>>   RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime 
>> ${PN}-audio ${PN}-image ${PN}-netclient"
>>   FILES_${PN}-email="${libdir}/python3.5/imaplib.* 
>> ${libdir}/python3.5/email "
>>   +SUMMARY_${PN}-enum="Python support for enumerations"
>> +RDEPENDS_${PN}-enum="${PN}-core"
>> +FILES_${PN}-enum="${libdir}/python3.5/enum.* "
>> +
>>   SUMMARY_${PN}-fcntl="Python's fcntl interface"
>>   RDEPENDS_${PN}-fcntl="${PN}-core"
>>   FILES_${PN}-fcntl="${libdir}/python3.5/lib-dynload/fcntl.*.so "
>> @@ -197,10 +201,18 @@ SUMMARY_${PN}-resource="Python resource control 
>> interface"
>>   RDEPENDS_${PN}-resource="${PN}-core"
>> FILES_${PN}-resource="${libdir}/python3.5/lib-dynload/resource.*.so "
>>   +SUMMARY_${PN}-selectors="Python High-level I/O multiplexing"
>> +RDEPENDS_${PN}-selectors="${PN}-core"
>> +FILES_${PN}-selectors="${libdir}/python3.5/selectors.* "
>> +
>>   SUMMARY_${PN}-shell="Python shell-like functionality"
>>   RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
>>   FILES_${PN}-shell="${libdir}/python3.5/cmd.* 
>> ${libdir}/python3.5/commands.* ${libdir}/python3.5/dircache.* 
>> ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/glob.* 
>> ${libdir}/python3.5/popen2.* ${libdir}/python3.5/shlex.* 
>> ${libdir}/python3.5/shutil.* "
>>   +SUMMARY_${PN}-signal="Python set handlers for asynchronous events 
>> support"
>> +RDEPENDS_${PN}-signal="${PN}-core"
>> +FILES_${PN}-signal="${libdir}/python3.5/signal.* "
>> +
>>   SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
>>   RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email 
>> ${PN}-mime"
>>   FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.5/smtpd.* "
>> @@ -218,7 +230,7 @@ RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
>> FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so 
>> ${libdir}/python3.5/string.* ${libdir}/python3.5/stringold.* "
>>     SUMMARY_${PN}-subprocess="Python subprocess support"
>> -RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl 
>> ${PN}-pickle"
>> +RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl 
>> ${PN}-pickle ${PN}-signal ${PN}-selectors"
>>   FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* "
>>     SUMMARY_${PN}-syslog="Python syslog interface"
>> diff --git a/scripts/contrib/python/generate-manifest-3.5.py 
>> b/scripts/contrib/python/generate-manifest-3.5.py
>> index b90a84f..eac493a 100755
>> --- a/scripts/contrib/python/generate-manifest-3.5.py
>> +++ b/scripts/contrib/python/generate-manifest-3.5.py
>> @@ -259,6 +259,9 @@ if __name__ == "__main__":
>>       m.addPackage( "${PN}-email", "Python email support", 
>> "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image 
>> ${PN}-netclient",
>>       "imaplib.* email" ) # package
>>   +    m.addPackage( "${PN}-enum", "Python support for enumerations", 
>> "${PN}-core",
>> +    "enum.*" )
>> +
>>       m.addPackage( "${PN}-fcntl", "Python's fcntl interface", 
>> "${PN}-core",
>>       "lib-dynload/fcntl.*.so" )
>>   @@ -339,12 +342,18 @@ if __name__ == "__main__":
>>       m.addPackage( "${PN}-resource", "Python resource control 
>> interface", "${PN}-core",
>>       "lib-dynload/resource.*.so" )
>>   +    m.addPackage( "${PN}-selectors", "Python High-level I/O 
>> multiplexing", "${PN}-core",
>> +    "selectors.*" )
>> +
>>       m.addPackage( "${PN}-shell", "Python shell-like functionality", 
>> "${PN}-core ${PN}-re",
>>       "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* 
>> shutil.*" )
>>   -    m.addPackage( "${PN}-subprocess", "Python subprocess support", 
>> "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
>> +    m.addPackage( "${PN}-subprocess", "Python subprocess support", 
>> "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal 
>> ${PN}-selectors",
>>       "subprocess.*" )
>>   +    m.addPackage( "${PN}-signal", "Python set handlers for 
>> asynchronous events support", "${PN}-core",
>> +    "signal.*" )
>> +
>>       m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database 
>> support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io 
>> ${PN}-threading",
>>       "lib-dynload/_sqlite3.*.so sqlite3/dbapi2.* sqlite3/__init__.* 
>> sqlite3/dump.*" )
>
>


