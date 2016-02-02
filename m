Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id BC620771D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:12:26 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id t15so62564328igr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WutxAB1C3scnB7mpeFEm+L5xsF1DzeubUEUQ7hd3YQY=;
	b=FaY7NtRFGL0wnXcTdr6RzCxTgTv6lKHxC1c+2vhpHIprVpQkdsuJDig9ERjhdbbnfD
	ifsVd6ggY6GZ5I8OhdnnYx3m8q7Py2Lw4gdDpHrl6UeQ6fFjN8mDZ6V8HAQ4C7cBKE4u
	d6lLi4/WPAJG0yP6lTTiu8bcBFtxvGyWJQQ44Z5Ns2dwUmSO9WQaoYzRvV6ZQLc3CZOH
	bqgk+dxSSEu9olZVWG7PSK+uccLxRR6vTMfGo0BWrEbFG7hV7GN8kNMV6cecOpPXDVbW
	JR4pDvFZ9gzXcNoBwRd4CsdSTOEm/sX2zpjh1RYrWzy674c+uBLiVyQ1xeOYTd7T/uz4
	iwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WutxAB1C3scnB7mpeFEm+L5xsF1DzeubUEUQ7hd3YQY=;
	b=HKfIOlC25BV4RR7JfjGneZ1aFTO5J321IMDCCWnjZzttHzehlNdZp3NOyjQJHoBPYf
	F4jL3xfm7/4feDHLFQ9XdvlVHUCSFNpHxLtR80bNQriFlUsFrEuMQ//Dcb1JClNf9570
	sbpIN/oeJaVs854a788a0DOCRO1zIQbpeyBw43LS11DXIa5peIc2NifzyZN2VXW5IjN4
	qUzaUAst/GXXwQTxG7KdKhmG70k9uD6JKNSCtRxg0Vd+m0RGlaN9op7OJnckxyAA8sHx
	biwvkUq0V/I9ksmL7Z/fLRSUDntUMov1elGRuXmSVmYMNOYTSbwgrIEqdZ1AMYMwMv7E
	qcfQ==
X-Gm-Message-State: AG10YOQHe6nI4wckY1e1SRB79Vn/GVhIzWyeebqSIFI1ajhjbD+EMe/QNUXs32j3EneOvGbNnxt/EYjxH+lTd6/G
X-Received: by 10.50.43.133 with SMTP id w5mr16832462igl.52.1454425947244;
	Tue, 02 Feb 2016 07:12:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 2 Feb 2016 07:12:07 -0800 (PST)
In-Reply-To: <20160202125511.GA10780@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
	<4a80d3209aa669db75e6343646ddb6a127ad8fc2.1454397260.git.ed.bartosh@linux.intel.com>
	<1454424619.27087.80.camel@linuxfoundation.org>
	<20160202125511.GA10780@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Feb 2016 15:12:07 +0000
Message-ID: <CAJTo0LY9_RAAiZYu5NOjZAr24b+97DTdJ3qQWVC03SpiuyX4QA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH 02/15] runqemu: don't use virtio for wic images
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
X-List-Received-Date: Tue, 02 Feb 2016 15:12:26 -0000
Content-Type: multipart/alternative; boundary=089e01175f2bf04538052acaeda6

--089e01175f2bf04538052acaeda6
Content-Type: text/plain; charset=UTF-8

On 2 February 2016 at 12:55, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> > > Removed if=virtio from qemu command line for wic images. This
> > > should fix above mentioned boot issue.
> >
> > Does this not change the command for other image types too?
> No, it doesn't. This patch changes qemu command line only for wic images.
>

Any idea why?  virtio is better, surely?

Ross

--089e01175f2bf04538052acaeda6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2016 at 12:55, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>&gt; &gt; Removed if=3Dvirtio from qemu command line for wic images. This<=
br>
&gt; &gt; should fix above mentioned boot issue.<br>
&gt;<br>
&gt; Does this not change the command for other image types too?<br>
</span>No, it doesn&#39;t. This patch changes qemu command line only for wi=
c images.<br></blockquote></div><br>Any idea why? =C2=A0virtio is better, s=
urely?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--089e01175f2bf04538052acaeda6--
