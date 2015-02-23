Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 54CBF706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:59:59 +0000 (UTC)
Received: by ykq19 with SMTP id 19so174044ykq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=MMPwSUcTYNIIvPZHyLq6dGIbdbKHc+DV6YVD32AiNk8=;
	b=s8gx0xJQ/8UXMQnhsZG+QxpfSuUzJGsA0kvfxeLSu8yujuF5sw4rOG/QzJ2a2mv/b1
	Om1hJyCua1SGPgH8SznghZNcxqjnznJZU/qiY0IA7j7B7nUOY2tNTePK6QM2yFh3nhB7
	sdNaubHLXFYjLroVJMJL5RMJd4DrKls4ZhQo6IND+LHArrplnO0uebtW6tTlt5gWw4E3
	X22Psz3lgVpVz8NX0aWID1rz7NKO4mREgD1wzXE7Pdiii5A8lTClIH89X0vTFAGvK65d
	absoxOhpvjNfpBk/KoI2Wza56JgGKjRY8k4JKP7MaMX4mMGd1VhFRcongU80NaCSPVbL
	kdHw==
MIME-Version: 1.0
X-Received: by 10.236.22.71 with SMTP id s47mr10786647yhs.37.1424714401043;
	Mon, 23 Feb 2015 10:00:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 23 Feb 2015 10:00:00 -0800 (PST)
In-Reply-To: <5866784.j6W0KFP0Zl@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
	<dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqa+7EZ_4hw=_-XOgQMyxeiSRRMAcXrGVpKwXLcLLrNPw@mail.gmail.com>
	<5866784.j6W0KFP0Zl@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 23 Feb 2015 15:00:00 -0300
X-Google-Sender-Auth: 1w_-4y3VnjvyGvKD0YvBnC1qr20
Message-ID: <CAP9ODKp4QG0iSUzUU8ZaAkKjsg34zo8FwHiXZkD-XoA_su1hpA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 18:00:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 2:54 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 23 February 2015 14:41:34 Otavio Salvador wrote:
>> On Mon, Feb 23, 2015 at 2:00 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > From: Randy Witt <randy.e.witt@linux.intel.com>
>> >
>> > This bbclass will create an SDK with a copy of bitbake and the metadata
>> > and sstate for the target specified for the task. The idea is to let
>> > "system" developers both work on applications and then test adding them
>> > to an image without having to switch between workspaces or having to
>> > download separate items.
>> >
>> > Rather than running bitbake directly however, the primary way of running
>> > builds within the extensible SDK is to use the "devtool" command. The
>> > rest of the build system is fixed via locked shared state signatures,
>> > and thus only the recipes you have added get built.
>> >
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> > Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>
>> Why another class? it could be tuned using SDKIMAGE_FEATURES
>
> If you look at what the class does it would be a bit messy to do it that way -
> I wanted to get something working with minimal impact. I don't doubt
> that it could be implemented as an SDKIMAGE_FEATURES item though
> with extra work.

As far this does not gets merged I am fine with that. This is clearly
a WIP code and shouldn't be merged as is.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

