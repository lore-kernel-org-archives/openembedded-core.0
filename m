Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SymVF-0007Xh-IA
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 18:19:29 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Aug 2012 09:07:42 -0700
Received: by ghbg10 with SMTP id g10so1880498ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 09:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=wC1XSTFoeb4/+v+FlCvxjYy+jZ23uoNbm9xgoy4G2oI=;
	b=STDeQxoD/ExJNsS+2bfNwN1TwSVwMS/jhTuKI9sas+sftv67K0hLT/OBqiMttU2Yq2
	L8lW94uTliUxl1fOp4knzyBJ7+GioKoZgBAj3aVKV3fdAoAAbAMtecZIFPvvmGyx40lW
	4q8W2GEEdKIpiacOeXQRliHGJRb6HRW6tGr5lXPBZRLteOre4gkcDen6ND1NSrBvScB2
	7EfMUSL4Q0ZCrW6ythFdfeVt0Yonx5dWg1OMBKLktXrkTkudtS680CE7OCwPtMsGMaUd
	aCFmcNQW4RQaaY1QUcpu7tY5Lkda2kEoxbuGMReY00RDo7wLZyUC11TRfY2dDCGfRV5g
	voKQ==
Received: by 10.66.78.69 with SMTP id z5mr27023404paw.14.1344355660990;
	Tue, 07 Aug 2012 09:07:40 -0700 (PDT)
Received: from [10.1.10.192] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id tv6sm8005494pbc.24.2012.08.07.09.07.39
	(version=SSLv3 cipher=OTHER); Tue, 07 Aug 2012 09:07:40 -0700 (PDT)
Message-ID: <50213D45.2070802@intel.com>
Date: Tue, 07 Aug 2012 09:07:33 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
	<20120807081710.GQ3267@jama.jama.net>
	<9A466F05-060B-442E-ADD5-A015FE979942@dominion.thruhere.net>
In-Reply-To: <9A466F05-060B-442E-ADD5-A015FE979942@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmq0HORlUq7r0xtZDpJ3sLW713Ss32+VwnMjxry7FKKqUqtFAywF9DK5wlyff+NvY3xdnrY
Subject: Re: [PATCH][for-denzil 1/8] opkg-utils: bump SRCREV for Packages cache fix and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 16:19:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 01:19 AM, Koen Kooi wrote:
>
> Op 7 aug. 2012, om 10:17 heeft Martin Jansa <martin.jansa@gmail.com> het volgende geschreven:
>
>> On Tue, Aug 07, 2012 at 09:44:41AM +0200, Koen Kooi wrote:
>>> From: Martin Jansa <martin.jansa@gmail.com>
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -----------
>>> .../opkg-utils/arfile_header_split.patch           |   27 --------
>>> .../opkg-utils/index-ignore-filenotfound.patch     |   73 --------------------
>>> .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
>>> .../opkg-utils/opkg-utils/shebang.patch            |   46 ------------
>>> meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +-
>>> 6 files changed, 1 insertion(+), 221 deletions(-)
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> index 4fe4038..1996c75 100644
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> @@ -6,16 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>>                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
>>> RDEPENDS_${PN} = "python"
>>> RDEPENDS_${PN}_virtclass-native = ""
>>> -SRCREV = "16665959c330b5958c0f0f4624a9ca7f823f98de"
>>> +SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
>>
>> Better to use latest for this (only 3 commits, 2 of them fixing
>> python-2.6)
>
> Should I cherry-pick them from master to keep history or just make a single, new update to latest SRCREV for the denzil branch?

I slightly favor cherry-picks from master when possible.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


