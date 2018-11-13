Return-Path: <mvanyulin@dev.rtsoft.ru>
Received: from mail.dev.rtsoft.ru (mail.dev.rtsoft.ru [213.79.90.226])
	by mail.openembedded.org (Postfix) with ESMTP id 1037F6BC7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 13:44:30 +0000 (UTC)
Received: from mail.dev.rtsoft.ru (localhost [127.0.0.1])
	by mail.dev.rtsoft.ru (Postfix) with ESMTP id 5EA7744986;
	Tue, 13 Nov 2018 16:44:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.dev.rtsoft.ru 5EA7744986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.rtsoft.ru;
	s=mail; t=1542116671;
	bh=zykc9VRpkBR6ZhhQRUOzF0tduQ40Z2e6AaOWNnAFQSY=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=OdF+k/0wxuZHI/UaWvGvtqFhhdJq7YYn4JMvoqLvNLTh5OzfPcicq7fCXBvNhrSLo
	WB63wT71C6QjUWqgO5JY2EqriAgl8i+KKLqTbhElq31z+j7bDF2C1PlZenUq0KyI9J
	fE9ZjbY3lwvT0jaTlDwzCgEHKwVHMEpu6lTVP3ms=
Received: from mvanyulin.dev.rtsoft.ru (mvanyulin.dev.rtsoft.ru [10.5.20.17])
	by mail.dev.rtsoft.ru (Postfix) with ESMTP id F0E56448CE;
	Tue, 13 Nov 2018 16:44:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.dev.rtsoft.ru F0E56448CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.rtsoft.ru;
	s=mail; t=1542116671;
	bh=zykc9VRpkBR6ZhhQRUOzF0tduQ40Z2e6AaOWNnAFQSY=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=OdF+k/0wxuZHI/UaWvGvtqFhhdJq7YYn4JMvoqLvNLTh5OzfPcicq7fCXBvNhrSLo
	WB63wT71C6QjUWqgO5JY2EqriAgl8i+KKLqTbhElq31z+j7bDF2C1PlZenUq0KyI9J
	fE9ZjbY3lwvT0jaTlDwzCgEHKwVHMEpu6lTVP3ms=
To: "Burton, Ross" <ross.burton@intel.com>
References: <f9d3e588-e159-f31c-1698-1903ebb4b0a5@dev.rtsoft.ru>
	<be39ebc7-47fe-07df-a419-b5725e43f7ac@dev.rtsoft.ru>
	<CAJTo0LY_0iUNfRGE0-fLuaPPQcQcHDf_N0haivyVDvP4ojJu=w@mail.gmail.com>
	<57ede211-3422-e8ef-8f1c-8bfd320f28f0@dev.rtsoft.ru>
From: Mikhail Vanyulin <mvanyulin@dev.rtsoft.ru>
Message-ID: <1231b8ff-b174-9eab-a79a-ecca39e9a613@dev.rtsoft.ru>
Date: Tue, 13 Nov 2018 16:44:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <57ede211-3422-e8ef-8f1c-8bfd320f28f0@dev.rtsoft.ru>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch for bug #12814
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
X-List-Received-Date: Tue, 13 Nov 2018 13:44:31 -0000
X-Groupsio-MsgNum: 118166
Content-Type: multipart/mixed; boundary="------------6BE7CFACFCED210C547EC38C"

--------------6BE7CFACFCED210C547EC38C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Resending email as "This mailinglist requires people to subscribe before 
posting. "

Best regards, / С уважением,
Mikhail       / Михаил

On 11/13/2018 04:38 PM, Mikhail Vanyulin wrote:
> Should be ok now.
>
> Best regards, / С уважением,
> Mikhail       / Михаил
>
> On 11/12/2018 01:29 PM, Burton, Ross wrote:
>> Please rewrite the commit message to follow the guidelines in
>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#New_Development. 
>>
>> The bug  reference is correct but should be at the end before your
>> SOB.  Something like:
>>
>> python: fix contents of python-xmlrpc package
>>
>> Add missing files etc etc.
>>
>> [ YOCTO #1234 ]
>>
>> Signed-off-by: Foo Bar <foo@bar>
>>
>> Also the patch needs rebasing onto master, the manifest was
>> reformatted since your patch was created.
>>
>> Thanks,
>> Ross
>> On Mon, 12 Nov 2018 at 06:59, Mikhail Vanyulin 
>> <mvanyulin@dev.rtsoft.ru> wrote:
>>> Adds a missing file to python-xmlrpc package.
>>>
>>> -- 
>>> Best regards, / С уважением,
>>> Mikhail       / Михаил
>>>
>>>
>


--------------6BE7CFACFCED210C547EC38C
Content-Type: text/x-patch;
 name="0001-python-fix-contents-of-python-xmlrpc-package.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python-fix-contents-of-python-xmlrpc-package.patch"

From 2b840184cb4dd99913baa96ef6040c08605e71cc Mon Sep 17 00:00:00 2001
From: mvanyulin <mvanyulin@dev.rtsoft.ru>
Date: Tue, 13 Nov 2018 17:27:16 +0400
Subject: [PATCH] python: fix contents of python-xmlrpc package

Add a missed xmlrpclib.py to python-xmlrpc package.

[ YOCTO #12814 ] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=12814

Signed-off-by: Mikhail Vanyulin <mvanyulin@dev.rtsoft.ru>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 260fa6f..95e639c 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -1031,7 +1031,8 @@
         ], 
         "files": [
             "${libdir}/python2.7/DocXMLRPCServer.py", 
-            "${libdir}/python2.7/SimpleXMLRPCServer.py"
+            "${libdir}/python2.7/SimpleXMLRPCServer.py", 
+            "${libdir}/python2.7/xmlrpclib.py"
         ]
     }, 
     "zlib": {
-- 
1.9.1


--------------6BE7CFACFCED210C547EC38C--
