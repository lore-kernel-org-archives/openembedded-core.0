Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 014F771D9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 17:14:43 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so9185093pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 09:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=B8vRGCxYN4TFV466EAg3IOF8DaXL9rJ1qCbjl1noYRk=;
	b=hDKjMhOuwrtVUtZZnQblFynIco5GhHAD9Cmj1SMgNzwg+x11iFKrnWHDq4bpNqT2lm
	L8onuAMZe/lFiEk0M0czgYyE2aLbGNT2C+b9NYPhAVB/D/8C0bKU6syJNIiCC1JpFKNe
	//HSfBowdQilph6JYFLG3RJbvGOtHg/gx4/mSHmzSjAanmgZqe2fpLe8jun3Dn2o1B+r
	Yt+WfPMKLYpvkHLmmRe0imWbuYCPPwPCnulU7JCsC8NYo2pwrMZA896Qj6Py/Wg2Zgmn
	wLtLVF49fFxCzWvzppHYQX0kP7RjZO3YNIJ71/uE1AGqc0zKXd6GhSGkeIhcSYFYY59Q
	j3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=B8vRGCxYN4TFV466EAg3IOF8DaXL9rJ1qCbjl1noYRk=;
	b=RPbNcunvGpwBXg/jp+Bzb0AHF9PnTSR7RL4Djjj+BLfmBRLzy14oe1icrb9RS5g+LK
	6WvtBaYgNF6b0RfyrYrTEyj8qKP49r25iZUefle1OYqW3GTIrY4pqCp/gkRl0FPbdBN+
	V4/PYLn7krSe8psRmDwTDjdD5pJYgCNg5TlsZ9+t3Ic9P++mC2906NIDUsJZPuj9f0O9
	oJ5vZD0EB067h/B5xOkuD0sGub69SSA6zP1XfRzv3O50rNTuGAJUKAEwUeR+hbdqoN+f
	0oXvCnDTn7G4HAzZRZJP7Z7ediyFUIY6QoCORivB/S9xTqg+Urlfwy8r8S+MY9vTXUjG
	8ZYg==
X-Gm-Message-State: AIkVDXKXsl0deNUq9eapnUtmrhxEwAe59R0YCENBUHBGgjFcR1wLqcT4HIkd83qXp4SuvQ==
X-Received: by 10.99.113.82 with SMTP id b18mr25780268pgn.118.1484327683987;
	Fri, 13 Jan 2017 09:14:43 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:4198:472b:7988:3451])
	by smtp.gmail.com with ESMTPSA id
	n84sm30575714pfk.25.2017.01.13.09.14.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 09:14:43 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1484312322.git.ross.burton@intel.com>
	<CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
	<CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
	<CADkTA4O0vhL8k+nvvwMsyBGt-YToan0KiSpMtSYOh+Qkwms6SQ@mail.gmail.com>
	<CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <35e72a1e-a77a-ee73-cd8b-7ee62db7ddd4@gmail.com>
Date: Fri, 13 Jan 2017 09:14:42 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 17:14:44 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/13/17 6:25 AM, Burton, Ross wrote:
> 
> On 13 January 2017 at 14:19, Bruce Ashfield <bruce.ashfield@gmail.com
> <mailto:bruce.ashfield@gmail.com>> wrote:
> 
>     I'm not much good with musl unfortunately, but honestly, I'm
>     wondering how long we
>     can keep this out with relatively few build issues. In tree, they'll
>     get more attention.
> 
> 
> This is a greater problem - the kernel guys seem to think that glibc is
> the only C library worth thinking about.  Khem took the action to talk
> with musl and get their headers fixed - which I believe is just adding a
> new #define to them.

There is an idea to preprocess the kernel headers for musl systems, I
will replicate whatever action community decides on.

> 
>     I'll continue stacking on 4.9 changes until they get sorted out. 
>     I'll probably have some
>     cycles near the end of next week to get lost in c library #ifdef's,
>     if the issues are still
>     around.
> 
> 
> I keep on pushing the kernel bits to mut2, so feel free to send an
> updated branch and I can merge that in too.
> 
> Ross
> 
> 

