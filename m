Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3983C6025F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 17:05:27 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id g71so4763129ioe.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Aug 2017 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zCb4krKTDIkyah27lD4UYup5cE0+gxpPXDHOdApnX7Y=;
	b=Dxj1n3skx3G74xLo9l9XrU6jAFTyXY29eHh0Wp2NS/ZGRVZhR9mhUeiVwbWdvTbiwV
	GMhygJF3rMgPdnGlTN9egvv3LKWof2f2Rhf8dn77CG2O0rDUag5f5TqdfopZjIip7lzX
	ugvGGGO62d6TIpapp/GEBrmGojqlv/YlSgQ4Uao0z+chu5b2uN1nt3P5zCdR31rDGetv
	lZsdC6TjLdaiIfr1MxhoYqjaGXZSGHi/tzzmi2yDLRAS0wiOMLUCENEdo7PnGb2B36DY
	SVLfyqt0SXXjSegvmKLJAxy9RGRsGCh5SrLWhUWVv92tXVv1+2Kzd5U/Pr0ersspmfft
	ISuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zCb4krKTDIkyah27lD4UYup5cE0+gxpPXDHOdApnX7Y=;
	b=koj4JWsc2rCsjMoILwEwZ5yt64O5TUmjkclujh/sO09MTHJygLKGof5BcRCOkDlSK1
	CoXy0lEiiVXw1jpeOS0M5y000fQ+rIc6g9444jEhQK2bkLQHfZDCW6cAXzjZxxv29EhN
	tzIbFYxTwVZsTzeMphRZ4DZqL95rOyKBqjH5dQBuz38NohBg1BXsbogSQjBFgkdKey/L
	VUVMKl1rcrBtg1iJDNNy9BamFF4coN+a9/9iGOR1ng044bkdENimAtCk/WsK724XxSmD
	7epdL+MdSlCVBEf+pZvONWADcUlV7PEK26ifNzBRziEmb26sosNFu5KUrasakcRUKlVr
	szTg==
X-Gm-Message-State: AHYfb5ifLc4ujpj5YHUln+4F35J1rHIuAX6k01v0WAN08NqcE7m+F1pE
	YkmoSd/D/GtA9L5DghR3PcwOSvAahGL2
X-Received: by 10.107.12.160 with SMTP id 32mr1224972iom.207.1502125529100;
	Mon, 07 Aug 2017 10:05:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 7 Aug 2017 10:05:08 -0700 (PDT)
In-Reply-To: <1502125572.2330.3.camel@linux.intel.com>
References: <20170804185703.51157-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170804185703.51157-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LY5mBjm586rFqHBofcZE3eSzY=kAaxp2P=4PBA-2nYwiA@mail.gmail.com>
	<1502125572.2330.3.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Aug 2017 18:05:08 +0100
Message-ID: <CAJTo0LbdWuxLS=4VKHbUZ_rcTrBk0MpJB78i11HbCnBmScm6CA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Mon, 07 Aug 2017 17:05:28 -0000
Content-Type: multipart/alternative; boundary="001a113f937692084005562cdaf7"

--001a113f937692084005562cdaf7
Content-Type: text/plain; charset="UTF-8"

On 7 August 2017 at 18:06, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> yes, but we this way, we are not listing those > 20 and I believe this
> is important. This fix just diffsigs the first 20, and the rest are just
> listed for convenience.
>

Good point.  You could neatly print the filenames in one iteration, and
then the first 20 diffs in another loop.

also, sets are not 'subscriptable' thus slicing is not possible on sets.
>

Which is why I called list() before slicing.

Ross

--001a113f937692084005562cdaf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 August 2017 at 18:06, Leonardo Sandoval <span dir=3D"=
ltr">&lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" targ=
et=3D"_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wro=
te:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">yes, but we this way, we are not listing those &gt; 20 and=
 I believe this<br>
is important. This fix just diffsigs the first 20, and the rest are just<br=
>
listed for convenience.<br></blockquote><div><br></div><div>Good point.=C2=
=A0 You could neatly print the filenames in one iteration, and then the fir=
st 20 diffs in another loop.</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
also, sets are not &#39;subscriptable&#39; thus slicing is not possible on =
sets.<br></blockquote><div><br></div><div>Which is why I called list() befo=
re slicing.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113f937692084005562cdaf7--
