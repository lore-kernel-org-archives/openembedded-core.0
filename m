Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SXW2G-0005YR-FB
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 13:16:52 +0200
Received: by bkcjm2 with SMTP id jm2so7284845bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 04:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=37F1FGHJcKttEpu4ZBjhSXYiQ3l0V4YM5K+o6uQKTec=;
	b=Kq0vuOC0ZQEpS2GJQDEmJKPuyxvwtQwN+DdmQtiqnCrPjE8O0qDReXqzwbKFsPbT1m
	37jAUmhE93YZtuysKZDNBuqh3895xAI3SYXZ6yI0knVPbdBMYl5ro/ZfPyAr7bZC6M7z
	+QzuwX+vyKOoMRW1nycCnyCmMh1rnYRu/UjMLb7+qpWoF9PvYkVRjSrU6+xZfAJeoUg0
	1hsAw3I8nDwfAII8ERrZirdV2amL+xFdWGCKxDmaxvaNOCZVeHgKTnyhP6TuNWt55+Rc
	vXdAkGMiQSqcdqq82SGkEZN+aqJ5SbWSLBvOSOrne3bYjcWSrxnRb2ZXidFh+4PupfDR
	PPUQ==
Received: by 10.204.150.2 with SMTP id w2mr13783148bkv.101.1337857601400;
	Thu, 24 May 2012 04:06:41 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id h18sm2213190bkh.8.2012.05.24.04.06.39
	(version=SSLv3 cipher=OTHER); Thu, 24 May 2012 04:06:40 -0700 (PDT)
Message-ID: <4FBE163E.2090008@dresearch-fe.de>
Date: Thu, 24 May 2012 13:06:38 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1337696160-26734-1-git-send-email-sledz@dresearch-fe.de>
	<4FBC8DC0.706@dresearch-fe.de> <4FBCEE15.5050008@linux.intel.com>
In-Reply-To: <4FBCEE15.5050008@linux.intel.com>
X-Enigmail-Version: 1.4.1
X-Gm-Message-State: ALoCoQnwCUL7w60gwMvVVWzxfeM5ph+Luhgo443de5nGeMAPtDWMFShQS3A07VijnOclCWvm9O+p
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: fix include dependent PR generation
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
X-List-Received-Date: Thu, 24 May 2012 11:16:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.05.2012 16:03, Saul Wold wrote:
> On 05/23/2012 12:12 AM, Steffen Sledz wrote:
>> On 22.05.2012 16:16, Steffen Sledz wrote:
>>> Signed-off-by: Steffen Sledz<sledz@dresearch-fe.de>
>>> ---
>>>   meta/recipes-core/dropbear/dropbear.inc        |    2 ++
>>>   meta/recipes-core/dropbear/dropbear_2012.55.bb |    2 +-
>>>   2 files changed, 3 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
>>> index 2d6aeb2..2de442c 100644
>>> --- a/meta/recipes-core/dropbear/dropbear.inc
>>> +++ b/meta/recipes-core/dropbear/dropbear.inc
>>> @@ -2,6 +2,8 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
>>>   HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
>>>   SECTION = "console/network"
>>>
>>> +INC_PR = "r0"
>>> +
>>>   # some files are from other projects and have others license terms:
>>>   #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
>>>   LICENSE = "MIT"
>>> diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
>>> index 4f0ef80..8323a33 100644
>>> --- a/meta/recipes-core/dropbear/dropbear_2012.55.bb
>>> +++ b/meta/recipes-core/dropbear/dropbear_2012.55.bb
>>> @@ -3,4 +3,4 @@ require dropbear.inc
>>>   SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
>>>   SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
>>>
>>> -PR = "r0"
>>> +PR = "${INC_PR}.0"
>>
>> Did this message made it to the ML?
>>
> I guess not, please resend as a proper patch.

I've resent the original message. Patchwork catched it this time. :)

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


