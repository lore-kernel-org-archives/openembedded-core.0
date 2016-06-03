Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 405CE774B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 13:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u53Ddn27013717; Fri, 3 Jun 2016 14:39:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nmcjXmt5OW3t; Fri,  3 Jun 2016 14:39:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u53Ddk4S013704
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Jun 2016 14:39:48 +0100
Message-ID: <1464961186.13979.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Jun 2016 14:39:46 +0100
In-Reply-To: <57512CE8.4030607@mlbassoc.com>
References: <57512CE8.4030607@mlbassoc.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 03 Jun 2016 13:39:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-06-03 at 09:08 +0200, Gary Thomas wrote:
> After the change over to Python3, I'm getting this error:
> 
> ERROR: Unable to parse /local/poky-cutting-edge/meta-gnome/recipes
> -gnome/gnome-vfs/gnome-vfs_2.24.4.bb
> Traceback (most recent call last):
>    File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line
> 151, in 
> SignatureGeneratorOEBasicHash.finalise(fn='/local/poky-cutting
> -edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb', 
> d=<bb.data_smart.DataSmart object at 0x7f3d6ec78b38>, variant=None):
>               try:
>      >            taskdeps = self._build_data(fn, d)
>               except:
>    File "/local/poky-cutting-edge/bitbake/lib/bb/siggen.py", line
> 104, in 
> SignatureGeneratorOEBasicHash._build_data(fn='/local/poky-cutting
> -edge/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb', 
> d=<bb.data_smart.DataSmart object at 0x7f3d6ec78b38>):
> 
>      >        tasklist, gendeps, lookupcache =
> bb.data.generate_dependencies(d)
> 
>    File "/local/poky-cutting-edge/bitbake/lib/bb/data.py", line 438,
> in generate_dependencies(d=<bb.data_smart.DataSmart 
> object at 0x7f3d6ec78b38>):
>                       if dep not in deps:
>      >                    deps[dep], values[dep] =
> build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
>                       newdeps |=  deps[dep]
> 
> This is from a recipe in meta-openembedded
> 
> Any ideas how to fix it?

Did you have the python3 patches I sent to oe-devel yesterday applied?

Cheers,

Richard

