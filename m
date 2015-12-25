Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id A50806FF56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Dec 2015 05:53:51 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id e126so255766344ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 21:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EMzzD0b15QOE4u0Tsg6g4OnfbdN7T//jNPpzZurqxSg=;
	b=c+ciHVLuQ6dxHYpSZQm+6uNrrzhCsA6JWLSPWavX55uWj7kprr3RqDniXGg1OGfYWs
	RBdEcVaI3E0o+C/d1cpR3A7oXWkLMW4CPR28JAoZxEDMREk2TgWeoZmhhix726/Yg9xJ
	MrGn0M3MQRYNlh4Rs8x3nHd6MNubrT8tXg8JkzTqpxwmTYZQlNnOzhqTIEONHLxof5jQ
	DK8CcKs/2mw3ZuoUaw1f2yn3QWKYp7Ti8cT7ojdZEoWlpPGdSbgkqn/J+6/PTvRqw/Vl
	OD7t7DIRMkYcpx7oS+YpENWVrTEXpEPrafy4VXl5mGvhjCOljxsYyy+I1RvEFnv4zr1b
	N/WQ==
X-Received: by 10.107.9.224 with SMTP id 93mr37675269ioj.112.1451022831533;
	Thu, 24 Dec 2015 21:53:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Thu, 24 Dec 2015 21:53:22 -0800 (PST)
In-Reply-To: <CAMKF1sqZbhW2DO-2d9M4hOqG2EGPn_vcKPWFJb1CjjpQH_KqLQ@mail.gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<379ef3716c72c2230a75294f4be5430903f17450.1450568936.git.raj.khem@gmail.com>
	<CAJTo0LaF5ByQoxkOzD22=A6Sq7eiNJCgbObX5E=-AWFVdm=9ng@mail.gmail.com>
	<CAMKF1sqZbhW2DO-2d9M4hOqG2EGPn_vcKPWFJb1CjjpQH_KqLQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Dec 2015 21:53:22 -0800
Message-ID: <CAMKF1soWBq24BTPnGg4MFJ4Ywuo-5CL9sZ36PKjeKt-Zn3UkCw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/17] fts: Add recipe
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
X-List-Received-Date: Fri, 25 Dec 2015 05:53:54 -0000
Content-Type: text/plain; charset=UTF-8

Ross

I have update the pull tree with all the comments addressed

On Mon, Dec 21, 2015 at 5:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Dec 21, 2015 4:15 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>>
>>
>> On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>  create mode 100644
>>> meta/recipes-core/fts/fts/fts-header-correctness.patch
>>>  create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patch
>>>  create mode 100644 meta/recipes-core/fts/fts/gcc5.patch
>>>  create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.patch
>>>  create mode 100644 meta/recipes-core/fts/fts/stdint.patch
>>
>>
>> None of these patches have headers.
>
> Thanks Ross. I will update the pull tree and send a note afterwards
>>
>> Ross

