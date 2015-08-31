Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 73B2D76D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 14:01:57 +0000 (UTC)
Received: by wibq14 with SMTP id q14so1356192wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 07:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=d7LQB4X9zeOpP3uhEeyD+DsuGwwtrt5Em4LY0sw0hCI=;
	b=T6dk/5SsyoW+onzW90WlJZlLNhhnRyxMqniYuxDAwWEb6W2O8SND1rDoHqvsb2nGRz
	vK8kwV9WbKgLqYzJBfA06AVC4rIVMWBIzDPCHIhf2zaqgjWmm74H5mAy/8gYziV9HHZl
	3ozODEB0w6W2p0ItaakkYDdyHVv4pnN4EFQUC+5nHHikSx0NXhzJM+LJ8uIyoPK2f0gc
	q1djY1wRSk/nCYDqaIpKqx3KCK4Sl0XKnH0+QIPGiUclPXJESgAmrb69pSO9LT3HcxY2
	wVpy77+lW0Bc+Mtl6nD5u2zKYyP+l3x0gZbrBWiwRkTEFA002gMLEsFiAnlLNAy5UkAj
	84MA==
X-Gm-Message-State: ALoCoQkcj6I8IpdQaioL9qwZpDR+TfzKoSm5wh+h6LEzHaBUY7l9FgJaYFGiKLl4a5InzsOKS8fx
X-Received: by 10.180.108.39 with SMTP id hh7mr21307455wib.3.1441029714465;
	Mon, 31 Aug 2015 07:01:54 -0700 (PDT)
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com.
	[209.85.212.178]) by smtp.gmail.com with ESMTPSA id
	ja8sm22378263wjb.13.2015.08.31.07.01.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 07:01:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wibz8 with SMTP id z8so1291487wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 07:01:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.102.164 with SMTP id fp4mr8459329wib.2.1441029713576;
	Mon, 31 Aug 2015 07:01:53 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Mon, 31 Aug 2015 07:01:53 -0700 (PDT)
In-Reply-To: <1441029218.26554.21.camel@linuxfoundation.org>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
	<1441029218.26554.21.camel@linuxfoundation.org>
Date: Mon, 31 Aug 2015 11:01:53 -0300
Message-ID: <CAP9ODKqmnK_RGTQDVjsUppps2c7Tk7paEshLVEHAEOvoDkTD_Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Mon, 31 Aug 2015 14:01:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2015-08-31 at 10:22 -0300, Otavio Salvador wrote:
>> On Sat, Aug 29, 2015 at 7:18 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Sat, 2015-08-29 at 10:43 +0200, Martin Jansa wrote:
>> >> Did you enable thumb in that qemuarm build?
>> >>
>> >>
>> >> It's disabled by default and multiple components are broken when you
>> >> enable it, see:
>> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>> >
>> > I'm going to draw a line here. People are asking that the old version of
>> > gmp be brought back due license issues, fine. It doesn't mean that all
>> > the bugs in said old release should be fixed.
>> >
>> > If thumb on arm with old gmp is an issue for people, I'd suggest that
>> > those people figure out which patches are needed and send the patches.
>> > Asking Jussi to deal with this isn't right/fair though.
>>
>> I disagree. If it will be merged it ought to support what we are
>> testing nowadays otherwise the backlog will be kept growing forever...
>
> We cannot reasonably expect Jussi to do this work.
>
> OE needs to move onward, be it with kernel versions, compiler versions
> or library versions since not to do so effectively will result in OE
> becoming obsolete and out of touch.
>
> The GNU world moving to *GPLv3 is unfortunate in some ways but isn't
> something I/we have any choice over.
>
> We have a commitment right now to have some older licenced recipes. To
> make those work, *someone* is going to have to step up and work on them.
> Who is going to do it?

Well ... people wishing to use it needs to step up.

> By your comment, I should just refuse the old gmp version entirely?

Until proper fixed, yes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

