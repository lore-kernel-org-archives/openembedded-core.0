Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id F3F5A7749D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 06:56:15 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 5BA7768A01C; Sat,  4 Jun 2016 07:56:14 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 7429E68A019;
	Sat,  4 Jun 2016 07:56:13 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 10FF267401CE;
	Sat,  4 Jun 2016 08:56:13 +0200 (CEST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <57512CE8.4030607@mlbassoc.com>
	<1464961293.13979.20.camel@linuxfoundation.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57527B8C.1010600@mlbassoc.com>
Date: Sat, 4 Jun 2016 08:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464961293.13979.20.camel@linuxfoundation.org>
Subject: Re: Python3 error?
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
X-List-Received-Date: Sat, 04 Jun 2016 06:56:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2016 03:41 PM, Richard Purdie wrote:
> On Fri, 2016-06-03 at 09:08 +0200, Gary Thomas wrote:
>> After the change over to Python3, I'm getting this error:
>>
>> ERROR: Unable to parse /local/poky-cutting-edge/meta-gnome/recipes
>> -gnome/gnome-vfs/gnome-vfs_2.24.4.bb
>> Traceback (most recent call last):
>>     File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line
>> 151, in
>> SignatureGeneratorOEBasicHash.finalise(fn='/local/poky-cutting
>> -edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb',
>> d=<bb.data_smart.DataSmart object at 0x7f3d6ec78b38>, variant=None):
>>                try:
>>       >            taskdeps = self._build_data(fn, d)
>>                except:
>>     File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line
>> 104, in
>> SignatureGeneratorOEBasicHash._build_data(fn='/local/poky-cutting
>> -edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb',
>> d=<bb.data_smart.DataSmart object at 0x7f3d6ec78b38>):
>>
>>       >        tasklist, gendeps, lookupcache =
>> bb.data.generate_dependencies(d)
>>
>>     File "/local/poky-cutting-edge/bitbake/lib/bb/data.py", line 438,
>> in generate_dependencies(d=<bb.data_smart.DataSmart
>> object at 0x7f3d6ec78b38>):
>>                        if dep not in deps:
>>       >                    deps[dep], values[dep] =
>> build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
>>                        newdeps |=  deps[dep]
>>
>> This is from a recipe in meta-openembedded
>>
>> Any ideas how to fix it?
>
> Also, this backtrace is unclear. Could you apply:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip&id=02d40b13690ac8e9aaad203d09d5158d2f1c16c8
>
> and see if you get a better backtrace?
>
> If so I'd better get that patch cleaned up.

Per your previous message, indeed I did not have your meta-oe patches applied.
I will do that now to move forward, but I have tested this patch as requested.

The messages are a bit better, but it might not tell me what/where to look for
in the failing recipe.  Here's what I see now (head only):

==============================================================================================
WARNING: /local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb: Exception during 
build_dependencies for populate_packages
WARNING: /local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb: invalid syntax 
(package.bbclass, line 1058)
WARNING: /local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb: Error during finalise of 
/local/poky-cutting-edge/meta-oe/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
ERROR: /local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb: invalid syntax (package.bbclass, 
line 1058)
ERROR: Unable to parse /local/poky-cutting-edge/meta-oe/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
Traceback (most recent call last):
   File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line 151, in 
SignatureGeneratorOEBasicHash.finalise(fn='/local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb', 
d=<bb.data_smart.DataSmart object at 0x7f25fa9aa3c8>, variant=None):
              try:
     >            taskdeps = self._build_data(fn, d)
              except Exception as e:
   File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line 104, in 
SignatureGeneratorOEBasicHash._build_data(fn='/local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb', 
d=<bb.data_smart.DataSmart object at 0x7f25fa9aa3c8>):

     >        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)

   File "/local/poky-cutting-edge/bitbake/lib/bb/data.py", line 439, in generate_dependencies(d=<bb.data_smart.DataSmart 
object at 0x7f25fa9aa3c8>):
                      if dep not in deps:
     >                    deps[dep], values[dep] = build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
                      newdeps |=  deps[dep]
   File "/local/poky-cutting-edge/bitbake/lib/bb/data.py", line 368, in build_dependencies(key='populate_pack
        ...
==============================================================================================

One other python3 comment - my [source] layers are now filling
up with lots of cache files, e.g. .../meta/lib/oe/__pycache__/*
While this may not bother me much, it might do so with some of
my customers as they like to be able to "prove" that their build
came from exactly the same source tree as what we support, etc.
Is this something that can be controlled or even disabled?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

