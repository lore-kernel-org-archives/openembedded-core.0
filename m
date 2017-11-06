Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id CF6E26FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 12:51:57 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id m198so6959505oig.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 04:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=dGNQ7BRl1pUdawT3nfWJ9XNbeVXdyE/a2hIvpUcPSQ0=;
	b=OmeRDL15WNfIlvsd0Ji53YOsosFX8AV/UJuuh+oZGYgI+1lxGfHVHjkEnoCqhaPSPE
	F/gn0SeiMBQ6yznbrsfte8e+WyYaPERFOrabELTpbMr81wkbGzj8f9yv3ysDx+k2/FNP
	iDXxL4xlDhinM0ejecJvbp8VTKaTekyzGWktdnXyxFtmgFFEVsBQRcSttspNwBIovZSP
	hs0f0Pa9N6st8HJJQVjRSCp5fyQJhNADdLsimd87kGoQtG9iPawqa2mo9Rl0u9cyMjDC
	0lPPGJitV1NZqd5j5sBwoI8+xxUqvzA78qrsrgMxrRgzOvK7pW3Dz2V65W4shsjTTiKn
	KkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=dGNQ7BRl1pUdawT3nfWJ9XNbeVXdyE/a2hIvpUcPSQ0=;
	b=SC5TvHadPzyVQxpUI+SthltNjJQcElw3VJl0NgUyJ+d48IbMAwaerqIsAzzDehWO0T
	IYAGhjaDH5Jv29ISwkGNP6+4XTBoiSxnKk+u4pyGqhOONce8WGpLeM5p/8VYc4fxY1Bl
	a+CGbqPjaVTrtRzxegxMSBxXSVQ6nBDxpMvjEB6+h8w5DTujqKfyUkKcn5k/D4phuvem
	FRIzwwgEbxAvyG/jQMwyJPP+JXcIPDoFlMSEnafUfBdW8jNWl5eJcfCJLMqnJ1so8KTB
	n0irZi/O5F+ylPUEkHUwiuT77J791X8284xmwNQeEXa6hiPIc8v9GY/bUffurcRzFJ6y
	5YJw==
X-Gm-Message-State: AMCzsaUk8wrVrSRiQO2ktyEr4zg3DbcOdC0ZcZ4lcGDzS+iXfgkBd0Mp
	12tA8AJmStgK+0e31QJXUw12zVTK
X-Google-Smtp-Source: ABhQp+Q2pDryvBVJOk+w3/0oKLw633BOrfPKAHthddXfeY3s6oLZjjhvMSMM+u1xIcvKNsuMAmo8hg==
X-Received: by 10.202.230.18 with SMTP id d18mr9078806oih.61.1509972718321;
	Mon, 06 Nov 2017 04:51:58 -0800 (PST)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com.
	[74.125.82.180]) by smtp.gmail.com with ESMTPSA id
	p38sm1564031otc.71.2017.11.06.04.51.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 04:51:57 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f180.google.com with SMTP id c47so8292936otj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 04:51:57 -0800 (PST)
X-Received: by 10.157.9.106 with SMTP id 97mr9104688otp.189.1509972716862;
	Mon, 06 Nov 2017 04:51:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 6 Nov 2017 04:51:56 -0800 (PST)
In-Reply-To: <20171106124423.GG32663@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
	<20171106124423.GG32663@bill-the-cat>
Date: Mon, 6 Nov 2017 10:51:56 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo53a46vSpBD5JhnYjZ2cLwP27U+v-XrkboMH8q-05Rcw@mail.gmail.com>
Message-ID: <CAP9ODKo53a46vSpBD5JhnYjZ2cLwP27U+v-XrkboMH8q-05Rcw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Mon, 06 Nov 2017 12:51:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 6, 2017 at 10:44 AM, Tom Rini <trini@konsulko.com> wrote:
> On Mon, Nov 06, 2017 at 09:36:20AM -0200, Otavio Salvador wrote:
>> On Mon, Nov 6, 2017 at 8:08 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>> > On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
>> >> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
>> >> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
>> >> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
>> >> > > > When we have been told to use the UUID we should also update the fstab
>> >> > > > to make use of PARTUUID instead of hard-coding the device in question.
>> >> > > > This will make the resulting image much more portable.
>> >> > > >
>> >> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
>> >> > > > ---
>> >> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
>> >> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
>> >> > >
>> >> > > Where we did we end up with this?  Ed pointed out that you can tell wic
>> >> > > to use a specific UUID, so reproducible images are not a problem.  And
>> >> > > making images that are readily portable is why other distros use
>> >> > > UUID/LABEL and not device names as much as possible.  I personally enjoy
>> >> > > being able to put an image on uSD for minnow and have it work :)
>> >> > > Thanks!
>> >> >
>> >> > ping?
>> >>
>> >> I was just reminded about the real problems this solves (swap isn't
>> >> /dev/sda3, boot is being excessively slow), so, ping?
>> >>
>> >
>> > I'm generally ok with the patchset. The only thing I'm thinking of is if busybox mount
>> > supports PARTUUID syntax in fstab. Can you check this, please?
>>
>> It does.
>
> It doesn't, you need util-linux for a mount that figures these out (or,
> it did when I wrote the patch set).  That's why 2/2 only updates the
> systemd canned wks as that _will_ have full mount.  But please note that
> you can already make a wks file that doesn't work with busybox mount by
> using the --use-uuid flag for non-root partitions :)

For the root, why you don't use U-Boot to figure the uuid and pass it
as cmdline, in root=? It is just a question as this is how we fixed
this for meta-freescale.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

