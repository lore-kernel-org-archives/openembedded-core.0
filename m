Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B13496FF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:28:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jul 2016 07:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="992868987"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2016 07:28:23 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
	<b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
	<CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
	<CAHiDW_G_NZWhoq-Grt=jjpc4H+pkkuOdbGL7kf5Omho1dLhNFA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <71487947-2b12-ecb8-110f-be7002efb8d4@linux.intel.com>
Date: Mon, 11 Jul 2016 17:27:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_G_NZWhoq-Grt=jjpc4H+pkkuOdbGL7kf5Omho1dLhNFA@mail.gmail.com>
Subject: Re: [PATCH 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Mon, 11 Jul 2016 14:28:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2016 02:46 PM, Jussi Kukkonen wrote:

> Not sure where a URL like that comes from or why it would be accessed
> during build? Li Xin, any comment?

A few recipes in meta-oe have this issue, for example python-mccabe:

DEBUG: Executing shell function do_compile
Download error on https://pypi.python.org/simple/pytest-runner/: [Errno 
110] Connection timed out -- Some packages may not be found!
Couldn't find index page for 'pytest-runner' (maybe misspelled?)
Download error on https://pypi.python.org/simple/: [Errno 110] 
Connection timed out -- Some packages may not be found!
No local packages or download links found for pytest-runner
Traceback (most recent call last):
   File "setup.py", line 57, in <module>
     'Topic :: Software Development :: Quality Assurance',
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/core.py", 
line 111, in setup
     _setup_distribution = dist = klass(attrs)
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/dist.py", 
line 269, in __init__
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/dist.py", 
line 313, in fetch_build_eggs
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/pkg_resources/__init__.py", 
line 826, in resolve
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/pkg_resources/__init__.py", 
line 1092, in best_match
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/pkg_resources/__init__.py", 
line 1104, in obtain
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/dist.py", 
line 380, in fetch_build_egg
   File 
"/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/command/easy_install.py", 
line 659, in easy_install
distutils.errors.DistutilsError: Could not find suitable distribution 
for Requirement.parse('pytest-runner')
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_compile (log file is located at 
/home/ak/development/poky/build-meta-openembedded/tmp/work/i586-poky-linux/python-mccabe/0.4.0-r0/temp/log.do_compile.3493)


Alex

