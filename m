Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 692AA75D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 18:13:11 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id h5so58636405igh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1kTHDTP7n05VhQm9N/gdMRmD+OQFpfPubvlrpTKLaw4=;
	b=xCIWZG90ufxVuyDvDWv0sKWIv18+/ZGbT0tz6qN1d0rJMH5cDFoHACjhvGgZxVLXvm
	NG3ELcQECXSgJc4RZE9pJijab3h3bGkepaOji9YVJfTpue1izSMcF/Cm+Zj/k4gH7lE6
	xNQZEr3c0/+Q17VLAxGrkIFagIgnkJLDzAo2phHyVc68zBTJ/bMJlVqfUsw997Hd0YQ7
	HfFZCaa8LW+Ywin6Xrq4lmb2GUU4Gf6LF0KSM+yL0LJ+s6XcGGylNgJS8WmkRJPirnNX
	lX/hihyti1Ks+7hKMZSkXyAO9CzB7X826U3/YICUurPlLfM1WZd8oBGTaUY6G3hsStOX
	vxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1kTHDTP7n05VhQm9N/gdMRmD+OQFpfPubvlrpTKLaw4=;
	b=JUBq8GP/Ko13p0gmel5H8e7rejRsZwAK0W5pdO6t4F3qavHDCx/2d58IscOFc+Honj
	xvfr9UNNkcYnCBEGyXIg0p/wF23wfJxcI7Oxse6M+OwZ7r3Sbk9AuOsuKIQfWQAxcJiZ
	wzePVWscN5WzBFI8iIbzJ7/pFduT9t5QfQaOfA3pNI9K55vP5lfa4MlkycIyBVKLpu9R
	x4OCmfW9x5kWlXSbniCNqaad7lJdeI6WZqG0EvQGkVat5Vuw7I8sMyZLBy835/mWWTjA
	OSsBmmNuARJzG9kEGy2UwYMZjRQwH2VT2h/CWgN8ahClAZlkzXL+CecC8wkWbo8Y5wv9
	D2qA==
X-Gm-Message-State: AG10YOSOy4Vdixq8CMqkoaP9q5CWc325UfZGgqGlytXxRQwc5JNIxUcmjWBSBogsjW8wq08FWNdVMb8kexAwwV7y
X-Received: by 10.50.126.8 with SMTP id mu8mr4705677igb.52.1453486392581; Fri,
	22 Jan 2016 10:13:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 10:12:53 -0800 (PST)
In-Reply-To: <56A26F89.8080505@opendreambox.org>
References: <56A22767.7050000@linux.intel.com>
	<56A24CE8.8010501@opendreambox.org>
	<CAJTo0LaAY=Bru-JzaNMQe5KNuAH3+A0VW_mQ6sNy4GvDU7nk6w@mail.gmail.com>
	<56A26F89.8080505@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 18:12:53 +0000
Message-ID: <CAJTo0LZhW-wGySxDt5E5V_FYj3PdsRvDGxH5w8hwpL7ON7JG1Q@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 18:13:12 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf1dc0c20529f02c1c

--047d7b1635bf1dc0c20529f02c1c
Content-Type: text/plain; charset=UTF-8

On 22 January 2016 at 18:06, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Denis Oliver Kropp is the main developer of DirectFB and the description
> of https://github.com/deniskropp/DirectFB says "Official DirectFB GitHub
> Repository".
>

The owner being the main developer is good, thanks.

Ross

--047d7b1635bf1dc0c20529f02c1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2016 at 18:06, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":w1v" cla=
ss=3D"a3s" style=3D"overflow:hidden">Denis Oliver Kropp is the main develop=
er of DirectFB and the description<br>
of <a href=3D"https://github.com/deniskropp/DirectFB" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/deniskropp/DirectFB</a> says &quot;Offic=
ial DirectFB GitHub<br>
Repository&quot;.<br></div></blockquote></div><br>The owner being the main =
developer is good, thanks.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--047d7b1635bf1dc0c20529f02c1c--
