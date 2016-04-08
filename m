Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1286E7327F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 09:17:14 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id gy3so9018737igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2016 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AME2ORrdMJ91UtGJC79GCsgyGExee+Hx7tq2mj6gUP8=;
	b=u9p+szGLfD5+92t47+m3FdV4NZ79QhbprPEP4r1s31Td2ahIwMLlsDlDszNG1kkaj3
	SkA0czYbpB/R9effj+mcl2DlJoOhzKbr2akWfeXg+ZFuwJ7dWEtdoF92ceqaeCPyZ+sF
	nDmj3VbbKHUSu3+JK0ZkgEkB4H+0kPeQrmIhr7KX7ILGlcvO3ZKlrTNaEjcLkzfDq1HE
	ibW9GxYOXjqirHs2H0XD+EBLJ53KrKK0Gi7+8L6wlU5mWHkyjixK4Tlsi1mL/ZDiCVWw
	ttaZ+XVf6WcWC6Pf9MWGNjBH1FtbvUoEybPC20vkqOsmto8HcSWvrXeUwDbZP3aYZNmk
	lmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AME2ORrdMJ91UtGJC79GCsgyGExee+Hx7tq2mj6gUP8=;
	b=h8zyIKOPEPAycx2weuSN/ey9AusIgMc9+aCtTzZthob54f3mc6e0+kpPutBFfGc+2a
	KvdOnJ8whHN9UF8eWa7Upvbn7bt0zrAiL95U86qn0m3gYeiWKhwazIMLSXbUoGN5D9k1
	hX64gKjt4Qw4aNmNbns1kKIUKR4g65SwR+vdyZSus8GMrl/CIaThx2eYwB8Ysc+lqGf4
	fwjukTx9JqRM7J5lyPUDxoBtxkpOpNYbrOqxWBuiAQyHv9ZDK+i4zRAA1vxwZ+WG4U+E
	HUzsk/DZTiGkjlBQEVX7L6oPPAu+2vVD3l3mVVH9rNqqnif0tWbDbqmncLc/OCdV6Wz+
	+ROg==
X-Gm-Message-State: AD7BkJJSmowgrE1JpRkKGAEMGTaZhtgASuvhQNIEKXZu1ysWXeKwd1iYKgRssMKH6Vq5I3o38vtZbVOVPeM6VIiI
X-Received: by 10.50.232.47 with SMTP id tl15mr2234632igc.64.1460107034890;
	Fri, 08 Apr 2016 02:17:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Fri, 8 Apr 2016 02:16:55 -0700 (PDT)
In-Reply-To: <1460098908.23253.6.camel@linuxfoundation.org>
References: <1460019387-1455-1-git-send-email-ross.burton@intel.com>
	<1460098908.23253.6.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Apr 2016 10:16:55 +0100
Message-ID: <CAJTo0LaMbD03K5Dp7_jKmDU2QcnD=sx0B4dsyk5CA+GTwCOg=w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package: ensure do_split_packages doesn't return duplicates
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
X-List-Received-Date: Fri, 08 Apr 2016 09:17:15 -0000
Content-Type: multipart/alternative; boundary=f46d04289bc92637b7052ff5a96a

--f46d04289bc92637b7052ff5a96a
Content-Type: text/plain; charset=UTF-8

On 8 April 2016 at 08:01, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> On Thu, 2016-04-07 at 09:56 +0100, Ross Burton wrote:
> > do_split_package() constructs a list of packages that were created as
> > it
> > iterates through the files, so if multiple files go into the same
> > package then
> > the package will be repeated in the output.
> >
> > Solve this by using a set() to store the created packages so that
> > duplicates are
> > ignored.
>
> Is this order sensitive? I know PACKAGES is :(
>

The order of the output is based on the order that files are found on
disk.  I'll review the users in oe-core to verify that nothing there has
expectations on the contents beyond a list of package names.

Ross

--f46d04289bc92637b7052ff5a96a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 April 2016 at 08:01, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Thu, 2016-04-07 at 09:56 +0100, Ross Burton wrote:<br>
&gt; do_split_package() constructs a list of packages that were created as<=
br>
&gt; it<br>
&gt; iterates through the files, so if multiple files go into the same<br>
&gt; package then<br>
&gt; the package will be repeated in the output.<br>
&gt;<br>
&gt; Solve this by using a set() to store the created packages so that<br>
&gt; duplicates are<br>
&gt; ignored.<br>
<br>
</span>Is this order sensitive? I know PACKAGES is :(<br></blockquote></div=
><br>The order of the output is based on the order that files are found on =
disk.=C2=A0 I&#39;ll review the users in oe-core to verify that nothing the=
re has expectations on the contents beyond a list of package names.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--f46d04289bc92637b7052ff5a96a--
