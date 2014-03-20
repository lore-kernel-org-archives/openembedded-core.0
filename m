Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id A22AB6EFB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 20:41:56 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id v1so1494606yhn.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+6N+4Vro2/Lw+bSYDaCU8SIBMQ5TqzuSR5WgQ3XA/UE=;
	b=xJmBLjr4hKro/I4bpKXU6DbWzNnlfl2GYovtI6DlOJmjBmdea4J1kUL9dHYlhyhfIF
	TqXCJ802JgbSuk5HqUOLrx0ZrS7kRiOiIk8oCtbPZu3eF2Y2kvoPI0h7266wD4Lxxrnp
	0nSkJTaUFSG49NWFmurML8wjQtxHIuuxCr3YM0cMdg+pXDWsMT6WTmKcNnYuPXMIFd6l
	yrk0l/6GQYDWzZNWP2nKr0lVkRFFtdRtLerdcZKJWY4ZiF6eh+ggOlzrjzPG6gLqhMUI
	+jj2f9m4N90ZG0kx2iLREqb5XkzBRYL3qp5idTh+J7zfHAlZmzmW4aEJKHzeNlR+rHdJ
	Wf6Q==
MIME-Version: 1.0
X-Received: by 10.236.139.70 with SMTP id b46mr37505999yhj.63.1395348117097;
	Thu, 20 Mar 2014 13:41:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 13:41:57 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CF441AC@DLEE11.ent.ti.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
	<1395147366.3808.70.camel@ted>
	<CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
	<532A36F3.2090800@mlbassoc.com>
	<CAMKF1spcWtVah6-F6AQaSs72Cmyrke-5+JrdmR5s7AA6QCuDJA@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015CF4380F@DLEE11.ent.ti.com>
	<CAP9ODKpVgwgr1gS6=u0dWbxgsvCiMd3b20h=thqiYBQ9d4DtKQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015CF441AC@DLEE11.ent.ti.com>
Date: Thu, 20 Mar 2014 17:41:57 -0300
X-Google-Sender-Auth: t4v1PwfdZWsB2gnspVVLNCIcQqA
Message-ID: <CAP9ODKqexww405uipv-Lvyu0WtTL-P5D6GOwm_2tJ=ThhrKLQw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Maupin, Chase" <chase.maupin@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Gary Thomas <gary@mlbassoc.com>
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Thu, 20 Mar 2014 20:41:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 11:27 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
>>-----Original Message-----
>>From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com]
>>On Behalf Of Otavio Salvador
>>Sent: Thursday, March 20, 2014 8:16 AM
>>To: Maupin, Chase
>>Cc: Khem Raj; Gary Thomas; Patches and discussions about the oe-
>>core layer
>>Subject: Re: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power
>>management test utils
>>
>>On Thu, Mar 20, 2014 at 9:23 AM, Maupin, Chase
>><chase.maupin@ti.com> wrote:
>>>>-----Original Message-----
>>>>From: openembedded-core-bounces@lists.openembedded.org
>>>>[mailto:openembedded-core-bounces@lists.openembedded.org] On
>>>>Behalf Of Khem Raj
>>>>Sent: Wednesday, March 19, 2014 7:46 PM
>>>>To: Gary Thomas
>>>>Cc: Patches and discussions about the oe-core layer
>>>>Subject: Re: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power
>>>>management test utils
>>>>
>>>>On Wed, Mar 19, 2014 at 5:31 PM, Gary Thomas <gary@mlbassoc.com>
>>>>wrote:
>>>>>
>>>>> What are you afraid of?  Putting this in OE-core _may_ make
>>>>sense
>>>>> if it serves a larger community, but having it there will not
>>be
>>>>> destabilizing, so why not?
>>>>
>>>>We should always strive towards making OE-Core leaner, therefore
>>>>we
>>>>should evaluate the real common usecase. which means there must
>>be
>>>>a
>>>>good justification to add it there
>>>
>>> So are there other people that have an interest in these
>>utilities for testing power management features of the kernel?  It
>>sounds like that is the question you have in order to help decide
>>whether this is a common use case or not.
>>>
>>> Koen,
>>>
>>> Do you know, or perhaps the Linaro QA team would know, how many
>>people are using these utilities?
>>
>>I do; and I appreciate it being add. My point is start in meta-oe
>>and
>>we move it here when needed.
>
> OK.  I'll make a patch for meta-oe.  Any issues with the second patch in the series adding mmc-utils?

I replied to it :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

