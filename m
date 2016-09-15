Return-Path: <andre.draszik@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 646487706E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 07:12:00 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e20so3695916itc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 00:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0eZ6FX2Uq2NQGokontNyRI1XC0NFBpKB7jqkMLVFcns=;
	b=j//O5cWJNE0EKygLCIT0K5Si9ClQbtGBCNeeaC6lRyZOvKypCwbdckkMcw9xRRjgs0
	zBdbft9rGqYql/SVgW4s2DZjEo+qFyE3lzw0ihley+bFTCb4Dbs+wrtcYVNhmiZTmz+F
	xbiPWZ7ytuWa3MxuUkWBuVYgP4rP0xZ+aKHZE0c6M+xT5yvExPFltg+CvCidctOQ1zD5
	pitqQxtjIJ+sTuiLh8DkStJe7PapAPaMRMitWytNGxERfCdu5SsypEvC/0Z7mPBpEAbi
	Y4VmzVyWVtB0tzXEvYSkunOc2kwcyf4fBirbW5ErCPLqSnr2R8OZC4te+YveZgiW6pSk
	3jQw==
X-Gm-Message-State: AE9vXwP+QOQqzY/RUOaqXn+e/d9+fEU7ZLAqzCGcz0wQvYuy6AI1cor2gKazgLZwwYXURA==
X-Received: by 10.107.41.81 with SMTP id p78mr13444199iop.78.1473923521449;
	Thu, 15 Sep 2016 00:12:01 -0700 (PDT)
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com.
	[209.85.214.42]) by smtp.gmail.com with ESMTPSA id
	u32sm1188241iou.38.2016.09.15.00.12.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Sep 2016 00:12:01 -0700 (PDT)
Received: by mail-it0-f42.google.com with SMTP id o3so81887354ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 00:12:00 -0700 (PDT)
X-Received: by 10.107.174.142 with SMTP id n14mr13815409ioo.197.1473923520793; 
	Thu, 15 Sep 2016 00:12:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.36 with HTTP; Thu, 15 Sep 2016 00:11:59 -0700 (PDT)
Received: by 10.64.70.36 with HTTP; Thu, 15 Sep 2016 00:11:59 -0700 (PDT)
In-Reply-To: <20160915022102.GA25351@heinlein.lan>
References: <20160914162519.16212-1-patrick@stwcx.xyz>
	<CAKUP++va+C=1wLQPMdb+=Pd-CLGigC=RREQb0OfnFnwh5fzJJA@mail.gmail.com>
	<CA+chaQfb_L2VZUXiK07rd4aBUn508CjtWp1R1R8weYHUaJHRSg@mail.gmail.com>
	<20160915022102.GA25351@heinlein.lan>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Date: Thu, 15 Sep 2016 08:11:59 +0100
X-Gmail-Original-Message-ID: <CAKUP++tTkkgTBw2ntjDjxJ7t07SZQNfqLL3fwH0cqNXDi1dPyw@mail.gmail.com>
Message-ID: <CAKUP++tTkkgTBw2ntjDjxJ7t07SZQNfqLL3fwH0cqNXDi1dPyw@mail.gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: configure with enable-symlink
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
X-List-Received-Date: Thu, 15 Sep 2016 07:12:01 -0000
Content-Type: multipart/alternative; boundary=001a1144822ee23e08053c868fc1

--001a1144822ee23e08053c868fc1
Content-Type: text/plain; charset=UTF-8

On 15 Sep 2016 03:21, "Patrick Williams" <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 14, 2016 at 11:23:47PM +0200, Martin Jansa wrote:
> > It was also proposed and discussed some 15 months ago and it was
packaging
> > issue not handling hardlinks correctly:
> >
http://lists.openembedded.org/pipermail/openembedded-core/2015-April/103939.html
> >
> > I believe this was fixed then, but maybe it got broken again?
>
> Sorry, this is my fault.  I didn't think about hard-links.  I was just
> skimming the cpio extract for parts that could be trimmed out and
> noticed it.
>
>     $ ls -i *fsck*
>     19455718 e2fsck
>     19455671 fsck
>     19455718 fsck.ext2
>     19455718 fsck.ext3
>     19455718 fsck.ext4
>     19455718 fsck.ext4dev
>     19455679 fsck.minix
>     19455695 fsck.minix.util-linux
>     19455675 fsck.util-linux
>
> Is there a reason to prefer hardlinks over softlinks, for my own
> education?  My desktop system used softlinks for fsck.

Mine too. I don't really care, soft links are surely more obvious, though.

A.

--001a1144822ee23e08053c868fc1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 15 Sep 2016 03:21, &quot;Patrick Williams&quot; &lt;<a hr=
ef=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Sep 14, 2016 at 11:23:47PM +0200, Martin Jansa wrote:<br>
&gt; &gt; It was also proposed and discussed some 15 months ago and it was =
packaging<br>
&gt; &gt; issue not handling hardlinks correctly:<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-c=
ore/2015-April/103939.html">http://lists.openembedded.org/pipermail/openemb=
edded-core/2015-April/103939.html</a><br>
&gt; &gt;<br>
&gt; &gt; I believe this was fixed then, but maybe it got broken again?<br>
&gt;<br>
&gt; Sorry, this is my fault.=C2=A0 I didn&#39;t think about hard-links.=C2=
=A0 I was just<br>
&gt; skimming the cpio extract for parts that could be trimmed out and<br>
&gt; noticed it.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 $ ls -i *fsck*<br>
&gt; =C2=A0 =C2=A0 19455718 e2fsck<br>
&gt; =C2=A0 =C2=A0 19455671 fsck<br>
&gt; =C2=A0 =C2=A0 19455718 fsck.ext2<br>
&gt; =C2=A0 =C2=A0 19455718 fsck.ext3<br>
&gt; =C2=A0 =C2=A0 19455718 fsck.ext4<br>
&gt; =C2=A0 =C2=A0 19455718 fsck.ext4dev<br>
&gt; =C2=A0 =C2=A0 19455679 fsck.minix<br>
&gt; =C2=A0 =C2=A0 19455695 fsck.minix.util-linux<br>
&gt; =C2=A0 =C2=A0 19455675 fsck.util-linux<br>
&gt;<br>
&gt; Is there a reason to prefer hardlinks over softlinks, for my own<br>
&gt; education?=C2=A0 My desktop system used softlinks for fsck.</p>
<p dir=3D"ltr">Mine too. I don&#39;t really care, soft links are surely mor=
e obvious, though.</p>
<p dir=3D"ltr">A.<br></p>

--001a1144822ee23e08053c868fc1--
