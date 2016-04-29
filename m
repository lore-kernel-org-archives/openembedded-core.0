Return-Path: <kad@kad.name>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9A19B77041
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 08:38:38 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id u10so15948201igr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=nnsxmw0wqIMxX+x4QjUJOem1FB4hRJeC+KAACUDOIpI=;
	b=atzbj6O57P6PG81iIcqlS7X/mSSkVxJMx3ToPT4QBW0WWS1EbImQX/ztYwC3QtoYwx
	u4B4OGpPBuC2If7kWblCmgcb0M1dYxWErvZwq2s6BlOikAW9e0SAraP8e2v/a1ICDF0D
	aAWZImGCyubAYGvse0kMf8klTU5YX/qhfzqyGY/Iu1n18JxK7221n2w0pwG+SdYgM+0n
	C8dm2nM5Q8QkmAEiV0NN27p26+d9LTWKQ2e/ExrVnsXucgPpsDZ9C1XwzyXzYr26pTwx
	vSmSOR6FwOleSFJOpdR+wcolh0wBL1T+JPz4OZmU4dromoTBx7oGQToyqgsSj50RTubi
	jDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=nnsxmw0wqIMxX+x4QjUJOem1FB4hRJeC+KAACUDOIpI=;
	b=ht/MTd3PjNb/k68g9/Hufj0rhJ7vvJPLNUzLW0caTqpc2g6f2rlA3x6F5IcSDCjY2y
	YsYjxBU1zgwQ81uofNRiYjkAc1Rwcc93M+ieGWKqIrrVtE2gx8Xfg3SSV1FSZePge+ah
	w40X/WUfhIBysrv9QpnM/Ox5DvulsWqGc058QK7Nxm8aQXk+qWFlwwaocIGIpRg3v7EK
	dZKIiWhhM3LPRuKiTM0Q69fY/JSFm3pcIDXCB00dWGXHajsuQ4THd+WQYK1yEhnfPjJE
	mSkh6utrCpnVzz+mKbefkbbVfhoFdBv44FMuBaFi7cYXNraomx9eUUsFooB1C7AyK3eD
	V4xw==
X-Gm-Message-State: AOPr4FW2qjMRFrdkB7Nq2HE7hbH/gyD8a80Ny4KLrvOtmM+aCnAdx7bbBsgpfdE6EATG3r33NGpaRT1MpImwVw==
MIME-Version: 1.0
X-Received: by 10.50.27.99 with SMTP id s3mr2976680igg.88.1461919118796; Fri,
	29 Apr 2016 01:38:38 -0700 (PDT)
Received: by 10.107.35.137 with HTTP; Fri, 29 Apr 2016 01:38:38 -0700 (PDT)
In-Reply-To: <9947705.d0hNahSzfP@peggleto-mobl.ger.corp.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
	<c32880f5e89776d3515079d6c8ebe86111cb10ed.1461749328.git.ed.bartosh@linux.intel.com>
	<CANFkWpnEAFoBRf=oAnKLUasuVhxDgoYswk_o0s3HFT-4W8yiMw@mail.gmail.com>
	<9947705.d0hNahSzfP@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 29 Apr 2016 11:38:38 +0300
Message-ID: <CANFkWpkNKn84OYakUYmD7piyyK=9TLbf=+yM+Zy2mJnqg=wdjA@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] bmap-tools: initial commit, version 3.2
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
X-List-Received-Date: Fri, 29 Apr 2016 08:38:38 -0000
Content-Type: multipart/alternative; boundary=047d7b10ce9bc4574905319b91ee

--047d7b10ce9bc4574905319b91ee
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 29, 2016 at 7:55 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Fri, 29 Apr 2016 01:07:56 Alexander Kanevskiy wrote:
> > On Wed, Apr 27, 2016 at 12:36 PM, Ed Bartosh <ed.bartosh@linux.intel.com
> >
> >
> > wrote:
> > > Bmap-tools - tools to generate block map (AKA bmap) and flash images
> > > using bmap. Bmaptool is a generic tool for creating the block map
> > > (bmap) for a file and copying files using the block map.
> > >
> > > The idea is that large file containing unused blocks, like raw system
> > > image files, can be copied or flashed a lot faster with bmaptool than
> > > with traditional tools like "dd" or "cp".
> > >
> > > [YOCTO #9414]
> > >
> > > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> >
> > better to use recipe that would create in deploy/tools standalone version
> > of the tool.
> > Otherwise, there is no easy way for user to utilize generated bmap files.
>
> You both probably have had notification already, but just to close the
> loop I
> found the issue with the do_deploy version, see the comments on bug 9414:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9414
>
>
Thank you Paul for your help! Your fix mentioned in the bug for do_depoly
is indeed the best solution.


-- 
br, Alexander Kanevskiy

--047d7b10ce9bc4574905319b91ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 29, 2016 at 7:55 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div class=3D"HOEnZb"><div class=3D"h5">On Fri, 29 Apr 2016 01:07:56 Alexa=
nder Kanevskiy wrote:<br>
&gt; On Wed, Apr 27, 2016 at 12:36 PM, Ed Bartosh &lt;<a href=3D"mailto:ed.=
bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt;<br>
&gt; wrote:<br>
&gt; &gt; Bmap-tools - tools to generate block map (AKA bmap) and flash ima=
ges<br>
&gt; &gt; using bmap. Bmaptool is a generic tool for creating the block map=
<br>
&gt; &gt; (bmap) for a file and copying files using the block map.<br>
&gt; &gt;<br>
&gt; &gt; The idea is that large file containing unused blocks, like raw sy=
stem<br>
&gt; &gt; image files, can be copied or flashed a lot faster with bmaptool =
than<br>
&gt; &gt; with traditional tools like &quot;dd&quot; or &quot;cp&quot;.<br>
&gt; &gt;<br>
&gt; &gt; [YOCTO #9414]<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.=
intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>&gt;<br>
&gt; better to use recipe that would create in deploy/tools standalone vers=
ion<br>
&gt; of the tool.<br>
&gt; Otherwise, there is no easy way for user to utilize generated bmap fil=
es.<br>
<br>
</div></div>You both probably have had notification already, but just to cl=
ose the loop I<br>
found the issue with the do_deploy version, see the comments on bug 9414:<b=
r>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9414" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D9414</a><br>
<br></blockquote><div><br></div><div>Thank you Paul for your help! Your fix=
 mentioned in the bug for do_depoly is indeed the best solution.</div><div>=
=C2=A0</div></div><div><br></div>-- <br><div class=3D"gmail_signature">br, =
Alexander Kanevskiy</div>
</div></div>

--047d7b10ce9bc4574905319b91ee--
