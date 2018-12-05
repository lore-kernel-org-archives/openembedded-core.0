Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEE16C123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 10:18:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB5AHgm2030525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2018 02:18:08 -0800
Received: from [128.224.163.204] (128.224.163.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 5 Dec 2018 02:17:41 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Bruce Ashfield
	<bruce.ashfield@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <3fdeffd5-0d20-b50a-0d8c-8aec3715ebb2@windriver.com>
Date: Wed, 5 Dec 2018 18:17:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
X-Originating-IP: [128.224.163.204]
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?SXMgaXQgbmVjZXNzYXJ5IHRvIGZpeCB0aGUgQnVnemlsbGEg4oCTIEJ1ZyAxMTgwNyBhbmQgNTg3NiA/?=
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
X-List-Received-Date: Wed, 05 Dec 2018 10:18:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi all,

I don't know if it is necessary to do this enhancement.

1. Bug 11807:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11807


'CONFIG_EXTRA_FIRMWARE' is used to be set to the names of firmware files 
which

should be provided by driver vendors.

'CONFIG_EXTRA_FIRMWARE_DIR' is set to a path which contains above firmware

files. The default path is /lib/firmware if the 
'CONFIG_EXTRA_FIRMWARE_DIR' is not set.


The path and firmware files must exist in rootfs eventually.


2. Bug 5876:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5876


I think it mean that bbclass should check the state of menuconfig.


I don't know if is necessary to fix these bugs. Could you give me help?


--Honghzi



