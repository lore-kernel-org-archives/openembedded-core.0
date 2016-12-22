Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0803B775E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 12:55:00 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kp2so36144860wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 04:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yzHSFonXiCMRDOabFAMRLszRzEQ34hnvtt+cPngPjAc=;
	b=n4RdEYs49EO8e2d7VO35tV5kvi4mxpiLj5UlNLRrNYZ56ZiN9aZYc0Dvhg1KR0E5OP
	r/DRy0xGJRj2B4ffbc7ZdGRM67RijhPBBF3tmgK/XpSR1VDZuNnSTZ+HEc+zUs0s2gdb
	jKl/Qe2hv8G2MgO0t04FiyJZOo/mxNyMAyEd6UH19CCJJPyW70WSHumnVs3wFzr52EWJ
	c3Es4a/PcB2jOVtbjEbYIT8CYd2GnW4cfEe5Kx8WpssNXCl9UvYdwcO4tlQMfJlX1quX
	V8f5Oo1smO9G0nZP6YuxAtYQSAZkWHyRLI19MqntNtGuKiMSLnBBg6YdFmT3ZhSeHwy8
	nUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yzHSFonXiCMRDOabFAMRLszRzEQ34hnvtt+cPngPjAc=;
	b=aUMARxYNRLbe35l9Fmm0spGynl9PbSgxfWCA8VVSgjxm7k2P2mlTOrz1ifueGnGTqi
	vyRxI/RFtV5+sgXVrvE7ASkntE86Bud15HvP0AvscYbjM2JUIOK7mcXRJwHn8RLJCbir
	wGqFqz28qvEpTkKwPDW+nnsxL1+SHec8XoTk1GwnatxMCl9pTuzKB+aaVlH/jZCJoNZl
	LK5V6heUKmu5YIWKc0eZSKvmHQqNkJXEzGstaflnWIAzi9Q+BWHRvJ21sQj5KgMHwAxj
	TAtxB9Fzs7Hl2T9Svj8f9ZN78i8/aKKuFy/YhK3NlOdZXzeOjeSqazn0Ck6JniLL4MrX
	Lmyw==
X-Gm-Message-State: AIkVDXKcvhOpv2X6ubAZAV0cukNSub8QkfJOd3N3zXxLY7FUBBpfIF1EuCnjaY3KFlaN7j/VJdBo7AknCqTI6g==
X-Received: by 10.194.115.226 with SMTP id jr2mr8780815wjb.75.1482411301631;
	Thu, 22 Dec 2016 04:55:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Thu, 22 Dec 2016 04:55:01 -0800 (PST)
In-Reply-To: <6ed769b3-f938-1ce1-7f26-c51cb47a5d40@windriver.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
	<6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
	<CAJ86T=X_cPiiTWb_mdrcWre=XmAkB=kk7QE0kJ-SKu9Z1B1Fxw@mail.gmail.com>
	<67916363-806f-7f9e-e9e8-941bb2614cfb@windriver.com>
	<6ed769b3-f938-1ce1-7f26-c51cb47a5d40@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 22 Dec 2016 04:55:01 -0800
Message-ID: <CAJ86T=W4_4=20KLEucUYhHmZvSXX44QQ45QfGp7zwUBJRVr7Gw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] hdparm: 9.48 -> 9.50
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
X-List-Received-Date: Thu, 22 Dec 2016 12:55:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 21, 2016 at 6:49 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> On 12/22/2016 10:47 AM, Robert Yang wrote:
>> On 12/21/2016 09:27 PM, Andre McCurdy wrote:
>>> On Tue, Dec 20, 2016 at 10:17 PM, Robert Yang <liezhi.yang@windriver.com>
>>> wrote:
>>>>
>>>> Add 0001-Makefile-use-weak-assignment-for-LDFALGS.patch to fix issues
>>>> like:
>>>> ERROR: hdparm-9.50-r0 do_package: QA Issue: File '/sbin/hdparm.hdparm'
>>>> from
>>>> hdparm was already stripped, this will prevent future debugging!
>>>> [already-stripped]
>>>> ERROR: hdparm-9.50-r0 do_package: Fatal QA errors found, failing task.
>>>
>>> Passing LDFLAGS on the make command line might be a cleaner solution
>>> than patching the Makefile.
>
> To be clear, passing LDFLAGS on the make command line doesn't work.

You need to remove "-e MAKEFLAGS= " from EXTRA_OEMAKE and add CC and
LDFLAGS (and anything required by the install target which isn't
passed on the command line already) but that's all worthy clean up
too.

