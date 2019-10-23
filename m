Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5141B7F833
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:29:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 08:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="191865223"
Received: from adahiya-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.249.39.45])
	by orsmga008.jf.intel.com with ESMTP; 23 Oct 2019 08:29:14 -0700
To: openembedded-core@lists.openembedded.org
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
Date: Wed, 23 Oct 2019 16:29:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 15:29:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/10/2019 14:03, Khem Raj wrote:
> Hi Richard
> 
> New master-next I see these fails
> 
> https://errors.yoctoproject.org/Errors/Build/91645/
> 
> First two are important one's we already know why
> ti-display-sharing-fw fails to fetch

ERROR: QA Issue: libiio: Files/directories were installed but not 
shipped in any package:
   /usr/lib/python2.7
   /usr/lib/python2.7/site-packages
   /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-info
   /usr/lib/python2.7/site-packages/iio.pyc
   /usr/lib/python2.7/site-packages/iio.py

That may have been triggered by some change in oe-core but that's 
definitely an issue with libiio.

WARNING: 
TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/temp/run.do_configure.7679:1 
exit 1 from 'NO_FETCH_BUILD=1 
TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3 
setup.py clean'
ERROR: Execution of 
'TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/temp/run.do_configure.7679' 
failed with exit code 1:
Traceback (most recent call last):
   File "setup.py", line 17, in <module>
     setup(**config['options'])
   File 
"TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/setuptools/__init__.py", 
line 145, in setup
     return distutils.core.setup(**attrs)

Looks like whatever astor is doing with setuptools doesn't agree with 
the upgrade to 41.4.0?

Ross

