Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF27774CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 07:08:25 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 840AE68A019; Fri,  3 Jun 2016 08:08:25 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 06CAD68A019;
	Fri,  3 Jun 2016 08:08:25 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id AA10D674028F;
	Fri,  3 Jun 2016 09:08:24 +0200 (CEST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57512CE8.4030607@mlbassoc.com>
Date: Fri, 3 Jun 2016 09:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
Subject: Python3 error?
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
X-List-Received-Date: Fri, 03 Jun 2016 07:08:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

After the change over to Python3, I'm getting this error:

ERROR: Unable to parse /local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
Traceback (most recent call last):
   File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line 151, in 
SignatureGeneratorOEBasicHash.finalise(fn='/local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb', 
d=<bb.data_smart.DataSmart object at 0x7f3d6ec78b38>, variant=None):
              try:
     >            taskdeps = self._build_data(fn, d)
              except:
   File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line 104, in 
SignatureGeneratorOEBasicHash._build_data(fn='/local/poky-cutting-edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb', 
d=<bb.data_smart.DataSmart object at 0x7f3d6ec78b38>):

     >        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)

   File "/local/poky-cutting-edge/bitbake/lib/bb/data.py", line 438, in generate_dependencies(d=<bb.data_smart.DataSmart 
object at 0x7f3d6ec78b38>):
                      if dep not in deps:
     >                    deps[dep], values[dep] = build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
                      newdeps |=  deps[dep]

This is from a recipe in meta-openembedded

Any ideas how to fix it?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

