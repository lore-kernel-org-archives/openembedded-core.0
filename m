Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id C32B165F45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 14:48:41 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Thu,  8 May 2014 16:48:35 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-03-01.atm.binero.net (Postfix) with ESMTPA id D52A43A183;
	Thu,  8 May 2014 16:48:34 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 08 May 2014 16:48:34 +0200
From: petter@technux.se
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20140508105039.GO30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<f9d97da2b459cde8ed023d1f130b1af580eb436e.1399497346.git.petter@technux.se>
	<20140508105039.GO30955@jama>
Message-ID: <3f3cb656d31802085af85ef566e1d065@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/13] linuxdoc-tools: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 08 May 2014 14:48:45 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-05-08 12:50 skrev Martin Jansa:

> On Wed, May 07, 2014 at 11:19:54PM +0200, Petter Mabäcker wrote:
>
>> Fixes [YOCTO #4497] Usage of FILESPATH is discouraged, since it can
>> make recipes harder to bbappend. Instead FILESEXTRAPATHS should be 
>> used
>> to extend the path. Signed-off-by: Petter Mabäcker 
>> <petter@technux.se>
>> --- .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 3 +-- 1 
>> file
>> changed, 1 insertion(+), 2 deletions(-) diff --git
>> 
>> a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
>> 
>> b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
>> index fce4178..4f908c3 100644 ---
>> 
>> a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
>> +++
>> 
>> b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
>> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931" DEPENDS =
>> "groff-native openjade-native" +FILESEXTRAPATHS_prepend :=
>> "${THISDIR}/linuxdoc-tools-native:"
>
> Please use
>
> git mv meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native
> meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools
>
> instead

Good point, feels like a better way to solve it that way. Will fix this 
in v2.

>
>> SRC_URI =
>>
> 
> "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.gz
>> file://disable_sgml2rtf.patch [1] @@ -15,8 +16,6 @@ SRC_URI =
>> 
>> "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.
>> SRC_URI[md5sum] = "1d13d500918a7a145b0edc2f16f61dd1" 
>> SRC_URI[sha256sum]
>> = "7103facee18a2ea97186ca459d743d22f7f89ad4b5cd1dfd1c34f83d6bfd4101"
>> -FILESPATH = "${FILE_DIRNAME}/linuxdoc-tools-native/" - inherit
>> autotools-brokensep native do_configure () { -- 1.7.9.5 --
>> _______________________________________________ Openembedded-core
>> mailing list Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core [2]


Links:
------
[1] file://disable_sgml2rtf.patch
[2] http://lists.openembedded.org/mailman/listinfo/openembedded-core

