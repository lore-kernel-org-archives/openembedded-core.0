Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 353B06A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 22:50:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 15:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,790,1367996400"; d="scan'208";a="374238778"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2013 15:49:51 -0700
Message-ID: <51F9948F.1000908@linux.intel.com>
Date: Wed, 31 Jul 2013 15:49:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
In-Reply-To: <13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Wed, 31 Jul 2013 22:50:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 03:31 PM, Khem Raj wrote:
>
> On Jul 31, 2013, at 1:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> On Jul 31, 2013, at 1:40 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>>
>>> Tried to build this set and received failures in python3-jinja (do_sanitize) and python3-distribute (do_compile)
>>>
>>>
>>>> DEBUG: Executing shell function do_sanitize
>>>> /srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/python3-jinja/1.2-r1/temp/run.do_sanitize.22474: line 85: /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/python3-native/python3: No such file or directory
>>
>> seems like missing dependency on python3-native. I will take a look.
>
>
> I have pushed two patches on top of the current pull tree. That hopefully should fix both the issues. Please try them
> out.
>

Still seems to failing in Jinja, I wonder if the dependencies are 
correctly sinec it's nooking for native bits and the python3-native had 
not been installed yet.

> |  #: the singleton instance of `DebugHelper`
> | Traceback (most recent call last):
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/python3-native/2to3", line 5, in <module>
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/main.py", line 259, in main
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/refactor.py", line 706, in refactor
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/refactor.py", line 299, in refactor
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/refactor.py", line 319, in refactor_dir
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/refactor.py", line 747, in refactor_file
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/refactor.py", line 354, in refactor_file
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/refactor.py", line 386, in refactor_string
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/refactor.py", line 460, in refactor_tree
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/fixes/fix_map.py", line 85, in transform
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/fixer_util.py", line 216, in in_special_context
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/patcomp.py", line 205, in compile_pattern
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/patcomp.py", line 50, in __init__
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/pgen2/driver.py", line 121, in load_grammar
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/pgen2/pgen.py", line 385, in generate_grammar
> |   File "/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/pgen2/pgen.py", line 15, in __init__
> | FileNotFoundError: [Errno 2] No such file or directory: '/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/lib2to3/PatternGrammar.txt'

Also, I notice that you have PRs in some those python recipes, can they 
be dropped or have packages been created with them that are available in 
feeds someplace?


Sau!


