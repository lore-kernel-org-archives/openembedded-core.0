Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id DBEE265CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 19:20:29 +0000 (UTC)
Received: by ykfc206 with SMTP id c206so32066606ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=X6QnO9uEYNDjsPreUR8vwBCY5dh5WK8O+0Z6FOamhNM=;
	b=N1ysXSPVh/qsL/Fi81IcFajOoaCIwjLVTWHd3UzCleaE4Qomv+9SpihoGDK70mVCeL
	yDimLv+i2cEo4qE30+uYgVP9Mvo6FwRYMKwbADuEbbSkOFn6iSH6eE99SDEq2jvhuIfU
	zrNc/fbWcGdh6mO4MA9v51UAqaAsf449WwZww002RlGJOePQJPL74QqD/aj8MRSzWFeI
	7Gr0ROFxMYj/jH0d/quohqZUKMI1Hi4o+VrWk5qxZYnlgAdgXW5v8hOm+khZpZPpQTpv
	A2cFSIbMl95ziIrZmcopzejOx6UfR2GlK1OCk05ApTFcoEo2RFLr6nEoEmSYAmG8ay1S
	qYTQ==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr80909422yhq.90.1426792830820; 
	Thu, 19 Mar 2015 12:20:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Thu, 19 Mar 2015 12:20:30 -0700 (PDT)
In-Reply-To: <550B1EF6.8000808@linux.intel.com>
References: <cover.1426762068.git.anibal.limon@linux.intel.com>
	<68b7c8a2b55dcd1ee14e22e61cb93bfea299116f.1426762068.git.anibal.limon@linux.intel.com>
	<CAP9ODKqW8cadpDE2FXLNVCh_sAXkAPttGcODR0m_Em4tRntUcA@mail.gmail.com>
	<550B1EF6.8000808@linux.intel.com>
Date: Thu, 19 Mar 2015 16:20:30 -0300
X-Google-Sender-Auth: SwF2Jauo9pu3JvBMoN5C4Z02UJE
Message-ID: <CAP9ODKrOVz5Ypaqa7NmSxXq0Bs3hToi6z-VsHPFvjOoJ=7ODOg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/2] initscripts: Add changetodefaultvt for 1, 2, 3, 4 runlevels
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
X-List-Received-Date: Thu, 19 Mar 2015 19:20:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 4:09 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Hi,
>
>
> On 19/03/15 13:04, Otavio Salvador wrote:
>>
>> On Thu, Mar 19, 2015 at 7:52 AM, An=C3=ADbal Lim=C3=B3n
>> <anibal.limon@linux.intel.com> wrote:
>>>
>>> When change between runlevel 5 to another non-graphic runlevel
>>> the console stays in the tty where X was launched.
>>>
>>> This patchs add a default switch to tty1.
>>>
>>> [YOCTO #5336]
>>>
>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>> ---
>>>   .../initscripts/initscripts-1.0/changetodefaultvt.sh           | 10
>>> ++++++++++
>>>   meta/recipes-core/initscripts/initscripts_1.0.bb               |  8
>>> ++++++++
>>>   2 files changed, 18 insertions(+)
>>>   create mode 100755
>>> meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
>>>
>>> diff --git
>>> a/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
>>> b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
>>> new file mode 100755
>>> index 0000000..bbef7ed
>>> --- /dev/null
>>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.s=
h
>>> @@ -0,0 +1,10 @@
>>> +#!/bin/sh
>>> +### BEGIN INIT INFO
>>> +# Provides:             changetodefaultvt
>>> +# Required-Start:
>>> +# Required-Stop:
>>> +# Default-Start:        1 2 3 4
>>> +# Default-Stop:
>>> +### END INIT INFO
>>> +
>>> +chvt 1
>>
>> You didn't answer the question. How general use distros are handling
>> this? It seems hackish!
>
> Yes, its like hackish this is handled by display manager but we don't hav=
e
> one in sato.
>
> I think it need to by installed by xserver-nodm-init instead of here. I'l=
l
> send another version.

Now it starts to make some sense.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

