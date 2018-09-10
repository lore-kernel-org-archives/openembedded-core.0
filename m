Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 12CF1797B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:43:59 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id 8-v6so41477711oip.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Chrt/1FaPdLyUlHaoavZD9NbD7WAHTcuLSt/OkArxL0=;
	b=sld6E9TRFvPJOYWEBLHwujuxKL2JZV3v6sDE2EdC4rasZ4IXU9NONT81WtgIziyePT
	X7dd6bDClZRNl1X1P5Y+sRzJ+LpbiYssLxsHzJrUsc9bGGxo9BEYv1DC4ZjUKZODhUoa
	vO3ZEKpIZ9R7XVNNFo/U8rrRN9xfl/3Mj+b67iciBR0qivhYy6FGVxGpoo2gmTPWB3Ld
	LXkADUxE//x6FO1w90zPJsDuwyoiDGDgGy/iqDtzUdWuZmgEP8S8n68IXeGIfoJPghgv
	rICOAOgNQLysPo/Yqx4xytXfDG/TfgX6G29ezkNet332ZAoqrk0RQFgDigxWVAFhy3c6
	HpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Chrt/1FaPdLyUlHaoavZD9NbD7WAHTcuLSt/OkArxL0=;
	b=dQ23JABLq276gXTr2P+GXhVontVJRZOKcEXiXAGpl20ak0muzVdffnbB7T7MP7OQKA
	n793BHgUvO/dqfdGT2Az6SQijdUfcn6oAHNR8nYoq+MMPt4IHOkVu/bZVyJPLofidTei
	askkWXIQEHh9YNiuacorCMF+Nk+eCY3tzu7vkptzL4wjV6IlAQMmrUqAuBwy7kHdApd6
	UoXbRgkVKcGMHLdxLizVp0l3nkosWl8E9RZ6Z8PGoDEVkGy36xICSr9VJuml457c5u71
	d54pg1padFw5fH4kbzYuOH97TF9P3Jv8PwEAHoEWjkQM3WqKJT3piulhYHpOXZEsfAxt
	CwGw==
X-Gm-Message-State: APzg51C9oVgurW6GtzVgEibVGOg7gULrDOACIwR5YQdKwfiweSGCWW39
	W8xJt031Pt41UuVMC/WHl/JalgkjEinw4gW5Ipg=
X-Google-Smtp-Source: ANB0VdZ0RptI/jQtqDWvIVGmje228EtoJS04Mb3xttm+QnSOaBcvluYZCOXldIQWI3g111DOallmLY5+Xw6bx0pho+w=
X-Received: by 2002:aca:edd8:: with SMTP id
	l207-v6mr23574885oih.65.1536597841018; 
	Mon, 10 Sep 2018 09:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 09:44:00
	-0700 (PDT)
In-Reply-To: <6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Sep 2018 18:44:00 +0200
Message-ID: <CANNYZj_6dF2675VQtB9j1qzM=ESyQ3eanAWvAf2U8Gc=uTX7Qg@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: =?UTF-8?Q?Sven_H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Mon, 10 Sep 2018 16:44:00 -0000
Content-Type: text/plain; charset="UTF-8"

If you want to sort the perl situation, I guess this is not a bad
starting point:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity

Alex

2018-09-10 18:36 GMT+02:00 Jens Rehsack <sno@netbsd.org>:
>
>
> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>
> Large parts of dnf and friends have been rewritten in c++. I have not
> yet updated and reviewed that, that will happen in the next cycle.
>
>
> If I can prepare something for you - drop me a note.
> Otherwise - the perl-5.28 update ("." in @INC, regex buffer overflow, ...)
> is also
> awaiting some progress (I can keep "myself" busy).
>
> There's already enough disruption to deal with (postinsts errors,
> openssl 1.1, both caused by me :)
>
>
> You know, corner, ash, ... things happen. But there is progress! Great!
>
> Good that we got all the way to do_rootfs though with 3.7.
>
>
> Yeah, but than came postinst (coreutils :P) :D
>
> Cheers
>
> Alex
>
> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com>:
>
> I did not review the patches closely, but I did try to build
> core-image-full-cmdline with the tip of poky and these patches applied.
> Everything was fine until do_rootfs... I've attached the log.
>
> Essentially, there are some bits of dnf and so on which are not ready for
> Python 3.7. We have dnf version 2.7.5, but the latest upstream release is
> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
> helped.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Jens Rehsack - rehsack@gmail.com
>

