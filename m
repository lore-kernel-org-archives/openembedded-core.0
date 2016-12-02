Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2B871BB7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 16:14:18 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id p16so255461121qta.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 08:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VJ8P/GxEeD8/1gpRDjq1foNMAhpDiAmAYPYOnuhN01g=;
	b=Y2NypEHY7XbkzYErLgAtPWXe0A+tLoZfVxhYCaA+YYTM5ck93sHM2BlFIg2EZvul/6
	nVofPbIW5D0Kz3QLcMSuZ1rfDxRL+eG1obJIUfMYqPQ/nETR5T0ovzO5lOyRJ8OlAhGR
	QrloHVZMF371Dy3UL1PBFInN4Xtg9ufFrq+FW0w4JD9nO79RVFSbRNl2vClSmujCtGzr
	X7EpoEDgrvfrgAhy+eKbYj11hIjflr5hmubbrkWdGEmSSLqaQNxxIdBPQ8EdKhLcJV0h
	4QD6IOjMeP7wQyPKQF11A9ReocMxy/0WsgWnKn+0lQP0LRfWUTWDjqkqmp45JzTsvTxS
	vEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VJ8P/GxEeD8/1gpRDjq1foNMAhpDiAmAYPYOnuhN01g=;
	b=KCK9Al/rhjhCzb0gEG9bJzqzrlbGHmLA8NpzLAFErdg8rZOsxJG/5dsYBcWsvpdIqh
	jiictbZKZaa9qRq/rbsz2aOo51ONB0E3iDYmbPn86NzTNoNKeQZsQGM7tnHtVNGSsLPp
	4pAon6VsAnACiUBQ2L2512DusL+Bi8VB2NWN0unN2mSbh4TP3uOBju4tskuRGFAbZayx
	ssuNAKGhKuLv1RLSOc/ha5ukNz8gCsrP7RaHBaCdNS7LNFhdmbSKl4EV3imW8vXMJ7Tu
	VFhqVOWHo1n6i+BmqexPQ3if+dM7dh+x/pNeSzNr3wktopz2vzFsQrJGvnyQguX/B1NQ
	CARw==
X-Gm-Message-State: AKaTC01aloxBtj7igPK8F68NnetN2YhuJTPWvLt3flltB1RQ8xv6XCc73El0Lpr60hH2PX+VFIrMy229pt4c4u4p
X-Received: by 10.237.37.77 with SMTP id w13mr43585767qtc.197.1480695260237;
	Fri, 02 Dec 2016 08:14:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 2 Dec 2016 08:13:59 -0800 (PST)
In-Reply-To: <1480694061.30023.78.camel@linux.intel.com>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
	<o1jct4$pvp$1@blaine.gmane.org>
	<CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
	<8632C69E-1C6B-482D-AF15-965F55F0AF88@gmail.com>
	<CAJTo0LYTYa4A42+FA9Ou=bVA6ddH8gzVBpJZJvNfa9Jyb9QQfA@mail.gmail.com>
	<CAMKF1spw8bvo8guTWkhYeQcn+Vs0kU-2X5D-03etwOj3dGroaw@mail.gmail.com>
	<1480694061.30023.78.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Dec 2016 16:13:59 +0000
Message-ID: <CAJTo0LYT3o+W+RVNwegA6aLHhi-VKcq7d5kn+djM2fdJ5bhQSw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Fri, 02 Dec 2016 16:14:20 -0000
Content-Type: multipart/alternative; boundary=001a114108ea01e97e0542af3b1d

--001a114108ea01e97e0542af3b1d
Content-Type: text/plain; charset=UTF-8

On 2 December 2016 at 15:54, Saul Wold <sgw@linux.intel.com> wrote:

> I'm wondering if we should also move the gstreamer-vaapi-1.0 recipe to
> oe-core to be with it's brethren?
>

Yes, I think so.

Ross

--001a114108ea01e97e0542af3b1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2016 at 15:54, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":130" class=3D"a3s a=
XjCH m158c03ea3f13ceaa">I&#39;m wondering if we should also move the gstrea=
mer-vaapi-1.0 recipe to<br>
oe-core to be with it&#39;s brethren?<br></div></blockquote></div><br>Yes, =
I think so.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a114108ea01e97e0542af3b1d--
