Return-Path: <Lu.Jiang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAB0870057
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 02:00:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w83200Z3015712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Sep 2018 19:00:00 -0700 (PDT)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 2 Sep 2018 18:59:59 -0700
Reply-To: <lu.jiang@windriver.com>
To: Tom Rini <trini@konsulko.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-3-git-send-email-lu.jiang@windriver.com>
	<20180831135324.GO26633@bill-the-cat>
From: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <e7261e4b-1d4b-afaf-7078-3884021878d3@windriver.com>
Date: Mon, 3 Sep 2018 09:58:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180831135324.GO26633@bill-the-cat>
X-Originating-IP: [128.224.162.214]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] wic:move wic src into meta/receipt-support/wic
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
X-List-Received-Date: Mon, 03 Sep 2018 02:00:00 -0000
X-Groupsio-MsgNum: 115732
Content-Type: multipart/mixed; boundary="------------123755065B75C4449EBBF5D6"
Content-Language: en-US

--------------123755065B75C4449EBBF5D6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

This patch simply move code from script/lib/wic into 
meta/recipes-support/wic/files. I didn't touch code in this patch.

Please see attachment for patch formatted with -M.

Thanks
Jiang Lu

在 2018年08月31日 21:53, Tom Rini 写道:
> On Fri, Aug 31, 2018 at 10:15:05AM +0800, Jiang Lu wrote:
>
>> Move wic src into package directory.
>>
>> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>> ---
>>   meta/recipes-support/wic/files/wic.py              |  542 ++++++++++
>>   meta/recipes-support/wic/files/wic/__init__.py     |   20 +
>>   meta/recipes-support/wic/files/wic/engine.py       |  578 +++++++++++
>>   meta/recipes-support/wic/files/wic/filemap.py      |  600 +++++++++++
>>   meta/recipes-support/wic/files/wic/help.py         | 1055 ++++++++++++++++++++
>>   meta/recipes-support/wic/files/wic/ksparser.py     |  235 +++++
>>   meta/recipes-support/wic/files/wic/misc.py         |  263 +++++
>>   meta/recipes-support/wic/files/wic/partition.py    |  424 ++++++++
>>   meta/recipes-support/wic/files/wic/pluginbase.py   |  149 +++
>>   .../wic/files/wic/plugins/imager/direct.py         |  611 ++++++++++++
>>   .../wic/files/wic/plugins/source/bootimg-efi.py    |  274 +++++
>>   .../files/wic/plugins/source/bootimg-partition.py  |  207 ++++
>>   .../wic/files/wic/plugins/source/bootimg-pcbios.py |  207 ++++
>>   .../files/wic/plugins/source/isoimage-isohybrid.py |  443 ++++++++
>>   .../wic/files/wic/plugins/source/rawcopy.py        |   91 ++
>>   .../wic/files/wic/plugins/source/rootfs.py         |  126 +++
>>   scripts/lib/wic/__init__.py                        |   20 -
>>   scripts/lib/wic/engine.py                          |  578 -----------
>>   scripts/lib/wic/filemap.py                         |  600 -----------
>>   scripts/lib/wic/help.py                            | 1055 --------------------
>>   scripts/lib/wic/ksparser.py                        |  235 -----
>>   scripts/lib/wic/misc.py                            |  263 -----
>>   scripts/lib/wic/partition.py                       |  424 --------
>>   scripts/lib/wic/pluginbase.py                      |  149 ---
>>   scripts/lib/wic/plugins/imager/direct.py           |  611 ------------
>>   scripts/lib/wic/plugins/source/bootimg-efi.py      |  274 -----
>>   .../lib/wic/plugins/source/bootimg-partition.py    |  207 ----
>>   scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  207 ----
>>   .../lib/wic/plugins/source/isoimage-isohybrid.py   |  443 --------
>>   scripts/lib/wic/plugins/source/rawcopy.py          |   91 --
>>   scripts/lib/wic/plugins/source/rootfs.py           |  126 ---
>>   scripts/wic                                        |  542 ----------
>>   32 files changed, 5825 insertions(+), 5825 deletions(-)
> Please re-format this with -M so that git determines the renames and
> this becomes reviewable, thanks!
>


--------------123755065B75C4449EBBF5D6
Content-Type: text/x-patch;
	name="0002-wic-move-wic-src-into-meta-receipt-support-wic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0002-wic-move-wic-src-into-meta-receipt-support-wic.patch"

From 17fcafe4c935f88620c765a93cde6c2527ca2a58 Mon Sep 17 00:00:00 2001
From: Jiang Lu <lu.jiang@windriver.com>
Date: Wed, 29 Aug 2018 11:39:48 +0800
Subject: [PATCH 2/7] wic:move wic src into meta/receipt-support/wic

Move wic src into package directory.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 scripts/wic => meta/recipes-support/wic/files/wic.py                      | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/__init__.py           | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/engine.py             | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/filemap.py            | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/help.py               | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/ksparser.py           | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/misc.py               | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/partition.py          | 0
 {scripts/lib => meta/recipes-support/wic/files}/wic/pluginbase.py         | 0
 .../lib => meta/recipes-support/wic/files}/wic/plugins/imager/direct.py   | 0
 .../recipes-support/wic/files}/wic/plugins/source/bootimg-efi.py          | 0
 .../recipes-support/wic/files}/wic/plugins/source/bootimg-partition.py    | 0
 .../recipes-support/wic/files}/wic/plugins/source/bootimg-pcbios.py       | 0
 .../recipes-support/wic/files}/wic/plugins/source/isoimage-isohybrid.py   | 0
 .../lib => meta/recipes-support/wic/files}/wic/plugins/source/rawcopy.py  | 0
 .../lib => meta/recipes-support/wic/files}/wic/plugins/source/rootfs.py   | 0
 16 files changed, 0 insertions(+), 0 deletions(-)
 rename scripts/wic => meta/recipes-support/wic/files/wic.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/__init__.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/engine.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/filemap.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/help.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/ksparser.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/misc.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/partition.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/pluginbase.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/plugins/imager/direct.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/plugins/source/bootimg-efi.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/plugins/source/bootimg-partition.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/plugins/source/bootimg-pcbios.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/plugins/source/isoimage-isohybrid.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/plugins/source/rawcopy.py (100%)
 rename {scripts/lib => meta/recipes-support/wic/files}/wic/plugins/source/rootfs.py (100%)

diff --git a/scripts/wic b/meta/recipes-support/wic/files/wic.py
similarity index 100%
rename from scripts/wic
rename to meta/recipes-support/wic/files/wic.py
diff --git a/scripts/lib/wic/__init__.py b/meta/recipes-support/wic/files/wic/__init__.py
similarity index 100%
rename from scripts/lib/wic/__init__.py
rename to meta/recipes-support/wic/files/wic/__init__.py
diff --git a/scripts/lib/wic/engine.py b/meta/recipes-support/wic/files/wic/engine.py
similarity index 100%
rename from scripts/lib/wic/engine.py
rename to meta/recipes-support/wic/files/wic/engine.py
diff --git a/scripts/lib/wic/filemap.py b/meta/recipes-support/wic/files/wic/filemap.py
similarity index 100%
rename from scripts/lib/wic/filemap.py
rename to meta/recipes-support/wic/files/wic/filemap.py
diff --git a/scripts/lib/wic/help.py b/meta/recipes-support/wic/files/wic/help.py
similarity index 100%
rename from scripts/lib/wic/help.py
rename to meta/recipes-support/wic/files/wic/help.py
diff --git a/scripts/lib/wic/ksparser.py b/meta/recipes-support/wic/files/wic/ksparser.py
similarity index 100%
rename from scripts/lib/wic/ksparser.py
rename to meta/recipes-support/wic/files/wic/ksparser.py
diff --git a/scripts/lib/wic/misc.py b/meta/recipes-support/wic/files/wic/misc.py
similarity index 100%
rename from scripts/lib/wic/misc.py
rename to meta/recipes-support/wic/files/wic/misc.py
diff --git a/scripts/lib/wic/partition.py b/meta/recipes-support/wic/files/wic/partition.py
similarity index 100%
rename from scripts/lib/wic/partition.py
rename to meta/recipes-support/wic/files/wic/partition.py
diff --git a/scripts/lib/wic/pluginbase.py b/meta/recipes-support/wic/files/wic/pluginbase.py
similarity index 100%
rename from scripts/lib/wic/pluginbase.py
rename to meta/recipes-support/wic/files/wic/pluginbase.py
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
similarity index 100%
rename from scripts/lib/wic/plugins/imager/direct.py
rename to meta/recipes-support/wic/files/wic/plugins/imager/direct.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-efi.py
rename to meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-partition.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-partition.py
rename to meta/recipes-support/wic/files/wic/plugins/source/bootimg-partition.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-pcbios.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
rename to meta/recipes-support/wic/files/wic/plugins/source/bootimg-pcbios.py
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/meta/recipes-support/wic/files/wic/plugins/source/isoimage-isohybrid.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
rename to meta/recipes-support/wic/files/wic/plugins/source/isoimage-isohybrid.py
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/meta/recipes-support/wic/files/wic/plugins/source/rawcopy.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/rawcopy.py
rename to meta/recipes-support/wic/files/wic/plugins/source/rawcopy.py
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/rootfs.py
rename to meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
-- 
2.7.4


--------------123755065B75C4449EBBF5D6--
