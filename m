Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SUn0F-000575-SF
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 00:47:32 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-MD5; 16 May 2012 15:37:28 -0700
Received: by pbbro8 with SMTP id ro8so1738058pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 15:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=iCutpCyKDxHhLtVKGPgs/cJ81YxHqxp1Ac6Jqji41uk=;
	b=n4g7DZTJYHhRDuvDbPXDSfffLI3aB0sFSED9ymEUvf3m6JNA7qHRTRM2uCGdmfr0oA
	qhKrOH8Xl8GH3UrWa6tcbPDaDlM8qFzezfFnbouboWamQCQ7TKoUY4Xt0Wj67RGHYJFr
	ZNy72ajlShRdXWtdHgu4116IJkkcM2sDZCXnofttbMLUY0uJIplmVy2LdpZ8R2Y3HI1o
	RtrbLz6JAadhDJIfKvg4+uIhI3JP8pS1eU4OHxvWlUChPMwB/h3pD5pmO+x5KcbD4zWd
	SbBl6p33jR5J976nQo5GredryE/XWkj+E9RSIYg0fa6XnbM38bAXTkEK9s6dDciA4aX7
	198w==
Received: by 10.68.134.8 with SMTP id pg8mr20620762pbb.152.1337207847523;
	Wed, 16 May 2012 15:37:27 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id mr6sm6842438pbb.29.2012.05.16.15.37.24
	(version=SSLv3 cipher=OTHER); Wed, 16 May 2012 15:37:25 -0700 (PDT)
Message-ID: <4FB42C29.9060203@intel.com>
Date: Wed, 16 May 2012 15:37:29 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1336524034.git.raj.khem@gmail.com>
	<4FAD4E28.5030206@linux.intel.com>
	<CAMKF1sriuhZq6vP9XYvFbS=WEfyBeXJDQP56mSJK7HgmjbeQSw@mail.gmail.com>
In-Reply-To: <CAMKF1sriuhZq6vP9XYvFbS=WEfyBeXJDQP56mSJK7HgmjbeQSw@mail.gmail.com>
X-Gm-Message-State: ALoCoQnhmUlJ17wLu074HJoHhhq1sY+0DLL37ln2qEsWELy/oVxBSiVuCHb70fFyPHiRJPJfOOOO
Subject: Re: [PATCH 0/2] Let uclibc provide rtld(GNU_HASH)
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
X-List-Received-Date: Wed, 16 May 2012 22:47:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2012 12:09 PM, Khem Raj wrote:
> On Fri, May 11, 2012 at 10:36 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>> On 05/08/2012 05:43 PM, Khem Raj wrote:
>>>
>>> We have seen reports where rtld(GNU_HASH) is found missing
>>> on uclibc based images infact uclibc rtld does provide GNU_HASH
>>> support as default so we add that to PROVIDES
>>>
>>> snapshot mirror url is changed. Currently the url will fetch
>>> html files which will end in corrupted downloads so we
>>> update the url location in mirrors class.
>>>
>>> The following changes since commit
>>> 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:
>>>
>>>    kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)
>>>
>>> are available in the git repository at:
>>>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
>>>
>>> Khem Raj (2):
>>>    uclibc.inc: uclibc rtld does support GNU_HASH
>>>    classes/mirrors.bbclass: Point snapshot.debian.org mirror to working
>>>      location
>>>
>>>   meta/classes/mirrors.bbclass        |    2 +-
>>>   meta/recipes-core/uclibc/uclibc.inc |    3 ++-
>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>
>> Merged into OE-Core
>
> FWIW both these fixes are needed on denzil too.

Merged to sgarman/denzil-next:

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


