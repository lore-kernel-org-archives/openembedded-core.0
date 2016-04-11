Return-Path: <kad@kad.name>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 310E9731BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:52:47 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id s2so25080141iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=nl/D1z+b8WnpPHGoTOsXuGis6f2JmAI6oiSVlsKTSc4=;
	b=zxTyDWT1Ip3L6i1QiVNfiSBz2fM2JO9Pk4o0MbyAh1IlPJgpRp9f/eFhjwn4UfeoZg
	ymQ9VhZCkPSOZn3p19A3AqgrKjr+95q8JlgiU3hg+U0PHiNPeYza6CKXCl+m6lN5rHLY
	a+aVcvsFAfOOrcknG5QIBGb2554En+r1/lCXxiER57plr7vcMrs0E/64QQ2TvVclXVdX
	mhCvghvpn8niN+xoCT+0OlC1fa252uxx2sSR6T88rbd3kHuwTNaJg8630MNruDeDECIN
	wAPIcVKjvI04Q7k19DA9L2naqs42JdkIf1E2gzHENbtvre/rQkLfwUIWzliWiopHHwOv
	TU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=nl/D1z+b8WnpPHGoTOsXuGis6f2JmAI6oiSVlsKTSc4=;
	b=ESDGJKi2qMqQwOCofRyGZvy3/ZaNW7J5e5Mzyzj9PfEm0vLsU9QYb+FgzRFF38Ypcu
	TTBVJEPCyrN6kVLy/kMT/e/FSbg3ht3YwUo0sjqzdFeX7ZSL2VJVYjHyChRJTuSFJX1p
	u782i6hphjJsv9sfahebMu286D4drUmC0JKwBYvJGqKalt/uV1RFujIb7sdejRUtvzow
	Nxcs07jYvCKgi7VgZlJyANNHjdrypuYRQpcRiX2KMChaXIMyYTPKcf0b9K+QIhdbocxo
	vPXgmcjL1cTOhqf4a8XNnrgnDTKNp/baBlFMvPAHxJJokySVLWPezJ7mRsw67XAIdKyG
	eEQw==
X-Gm-Message-State: AD7BkJIb2wzqDaxMuJ3fUxKfWhOZVGJ2adb4CPAn4m+FZ4E5wuKqBXVQJ4ERCXpXOiy0HRPcX89Rqp8ZGdLdxA==
MIME-Version: 1.0
X-Received: by 10.107.8.99 with SMTP id 96mr23633039ioi.60.1460375568421; Mon,
	11 Apr 2016 04:52:48 -0700 (PDT)
Received: by 10.107.35.137 with HTTP; Mon, 11 Apr 2016 04:52:48 -0700 (PDT)
In-Reply-To: <570930BD.6070203@balister.org>
References: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
	<CANFkWp=ynO2J38+k=mBH6Y3GFOb2kZhbM9zea2T09EL2BDZHxA@mail.gmail.com>
	<570930BD.6070203@balister.org>
Date: Mon, 11 Apr 2016 14:52:48 +0300
Message-ID: <CANFkWpkDak-9To5EkXr3K9P6F809_6W-9oJTt-TYSgErzw6Yyw@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Philip Balister <philip@balister.org>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Joshua Lock <joshua.lock@collabora.co.uk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Mon, 11 Apr 2016 11:52:50 -0000
Content-Type: multipart/alternative; boundary=001a113f2b4cfeac6b0530342e12

--001a113f2b4cfeac6b0530342e12
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 9, 2016 at 7:41 PM, Philip Balister <philip@balister.org> wrote:

> > This might be dangerous. Even in recent version of DD (coreutils 8.25),
> it
> > might not detect in source file mapped/unmapped blocks properly,
> > (just use is_nul() function to check if block contains only zeros,
> instead
> > of e.g. fiemap).
> > Result might be so, that in output file block which must be zeros is
> > actually become unmapped. And as consequence, if it might not be written
> to
> > destination drive.
>
> Does it work with bmaptool?
>

bmaptool can work with practically any sparse file (even if bmap file are
not provided) to flash it efficiently on raw device.
However, with such cases like "dd conv=sparse" it should be used with extra
caution, as some of needed zeroed blocks might not be written to
destination device.

Yocto bug #9099 now has two patches attached that adding initial bmap-tools
support to OE-core.
Those patches allows to create bmap files for simpler cases, like .hddimg
as well as shipping standalone version of bmaptool in deploy/tools/*
It probably would be content of next release, as I don't think anyone would
be merging them now.

For assembling images with wic, it would require a bit more work.

-- 
br, Alexander Kanevskiy

--001a113f2b4cfeac6b0530342e12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Apr 9, 2016 at 7:41 PM, Philip Balister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div class=3D""><div class=3D"h5">&gt;=
 This might be dangerous. Even in recent version of DD (coreutils 8.25), it=
<br>
&gt; might not detect in source file mapped/unmapped blocks properly,<br>
&gt; (just use is_nul() function to check if block contains only zeros, ins=
tead<br>
&gt; of e.g. fiemap).<br>
&gt; Result might be so, that in output file block which must be zeros is<b=
r>
&gt; actually become unmapped. And as consequence, if it might not be writt=
en to<br>
&gt; destination drive.<br>
<br>
</div></div>Does it work with bmaptool?<br></blockquote></div><div><br></di=
v><div>bmaptool can work with practically any sparse file (even if bmap fil=
e are not provided) to flash it efficiently on raw device.</div><div>Howeve=
r, with such cases like &quot;dd conv=3Dsparse&quot; it should be used with=
 extra caution, as some of needed zeroed blocks might not be written to des=
tination device.</div><div><br></div><div>Yocto bug #9099 now has two patch=
es attached that adding initial bmap-tools support to OE-core.</div><div><d=
iv>Those patches allows to create bmap files for simpler cases, like .hddim=
g as well as shipping standalone version of bmaptool in deploy/tools/*</div=
></div><div>It probably would be content of next release, as I don&#39;t th=
ink anyone would be merging them now.<br></div><div><br></div><div>For asse=
mbling images with wic, it would require a bit more work.</div><div><br></d=
iv>-- <br><div class=3D"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--001a113f2b4cfeac6b0530342e12--
