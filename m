Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBF16F648
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 01:16:38 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ik5so3425783vcb.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 17:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=2l9IOerfkoUao+FSgTZo+1cHiOy0oS0F6/qqAo7GE00=;
	b=Zg6kwzHiPAPBYGNKNDf92F0SbACBuY/2uIFoU1+fkzUBi+uT/qj4l/x/IrtEUH52hO
	nvOK6ySjKkM8vMUhXSCDY/DT5PNcd10ADwH4/ZRoYWeiFdondN9MCFrNvqBNe5H4aRG/
	JC609E0HVxS8nmUQENK7+5q1uF+Hy4be36rd6XLG3ZrDp37pJhV9hX42TuLRnhuyCe6M
	guV4/RubfEOqWz5g4Cm1MvJabIKzqD+YpOyEGh7sPllmBinNJfo/uurCZBj467LBWdrj
	zIHG4MycqlUHDg15uLNeti6vTmOG+jb/jAptprBIdNSQ8AUg/NRWXkFBMAJQm7uoExa2
	1BBA==
X-Received: by 10.52.26.161 with SMTP id m1mr243955vdg.24.1394154999597; Thu,
	06 Mar 2014 17:16:39 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Thu, 6 Mar 2014 17:15:59 -0800 (PST)
In-Reply-To: <CANyK_8e+MOp6TSL_-yAxeo7ebXWYQt+OsD_nGBYq9y2kuYC4vA@mail.gmail.com>
References: <cover.1394010463.git.Chong.Lu@windriver.com>
	<c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
	<1394011283.31845.97.camel@ted> <5316F554.1030201@windriver.com>
	<CANyK_8eviu1Tpoggak7UGEX_i7EJBfWN8ugwUoSMifC8hNXjDA@mail.gmail.com>
	<CANyK_8e+MOp6TSL_-yAxeo7ebXWYQt+OsD_nGBYq9y2kuYC4vA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 7 Mar 2014 01:15:59 +0000
X-Google-Sender-Auth: zpcXFBnzYE8avvHZVEjFMdDSuDc
Message-ID: <CANyK_8eEGr9DRy45jsCQb0LRHF6PfF_B=mVCXFMWq7EyWGB1_A@mail.gmail.com>
To: Lu Chong <Chong.Lu@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Fri, 07 Mar 2014 01:16:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 March 2014 13:45, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 5 March 2014 12:49, Paul Barker <paul@paulbarker.me.uk> wrote:
>> On 5 March 2014 09:58, Lu Chong <Chong.Lu@windriver.com> wrote:
>>>
>>> In flex 2.5.38, libfl.so was built by libtool.
>>>
>>> ipsec-tools shows this problem.
>>> When link libipsec.so to libfl.so, it uses '-lfl' flag. It will link from
>>> libfl.so.
>>> But libfl.so doesn't define yylex, we may get "libfl.so not found" through
>>> `ldd libipsec.so'.
>>
>> I've used flex before, this is correct, libfl is not supposed to
>> define yylex. See for example
>> https://www.mail-archive.com/tools-linking@mail.opensolaris.org/msg00601.html
>>
>> The problem is in how ipsec-tools is being linked, not in flex. I'd
>> suggest patching that recipe instead.
>>
>> Cheers,
>>
>
> I've patched ipsec-tools to fix this, will send the patch to the oe-devel list.
>

Sent.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

