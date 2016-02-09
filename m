Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 25B2A73174
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:31:27 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id l127so16800999iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qTop2Ivs2YJKapXH/DN/PBemoZ1MAqAUre6s8fDYrks=;
	b=tXbFUx/Ja8tbmnEpB1Y/U4P1Tb0modJ+H9nhKdiHRsie6ds6kE46f/HVCtlPTWWhsG
	bEKc3qRykhasHYRG5u9OtatYTyX3xLBC/LWiUW+eT1LdYIKYVANr/YZyYZi9QQuuAQ1H
	TXJ1xOzurOhU7h3YpEHyiBVa1472mBRXL17lTjdNpl2A3rGiAkprJ4qAhuGxef5UKPbM
	Z+jYS6Wbm8Su6QtZ5D1V0t2Xyl9UrQd5N3GPSd92zNAF/CeUor54YL5Gh33WL1b0bBq5
	XTzd8pQ1UoiiJGY7h2dd9cugonpmGhcLbp0Wigce95OYxlaiXPbxV/gjpTvZ366hanCJ
	7QtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qTop2Ivs2YJKapXH/DN/PBemoZ1MAqAUre6s8fDYrks=;
	b=Est/BwvcvLAuYViZZkTo36KKWz+dJOU1ej36J0kr8U6/E/pBb1xevBB1++ckbXkdQN
	px/Jl6HoThBUuaTsIGh+5A4l9w6fcqmRL5h/9UCjz7ZYCk6TEVlghGSj4hXqCklZiSt0
	eEPm+2QTQ/0Cmd1Vbh31sDiJ7x3cZcjB2/il64qMdFpRUOp9Cd8lUlzOroF4KTMWmt32
	Spnru/3YgTjh6WU9qeub/weHDhYrdyCybvEvbQl8q436q5XvDHwhdWZqswSxKzvTLa+T
	Ss5JL7Wr6hnAGGXidMj2CtbIa4MTFvOYSih8h5u4HWOD5ezVY9oGtD5bqrZB18hgXcUa
	q5Dw==
X-Gm-Message-State: AG10YOSnSqnKslUUSHqazZe9vr+aAbI1KLF/bF2JQYWriYPHMul2mP6iIeOodrNmkUpJpANdPBHXTc3NeKBeUD05
X-Received: by 10.107.164.15 with SMTP id n15mr31469907ioe.148.1455039088221; 
	Tue, 09 Feb 2016 09:31:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 09:31:08 -0800 (PST)
In-Reply-To: <1558558.pBdMUGvlJ2@peggleto-mobl.ger.corp.intel.com>
References: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaCMqE5kQR5SApPdBw-LYbdyxwtaFK+DpAfhbhU7LFScQ@mail.gmail.com>
	<CAJ86T=X3yr5YNmT+8UM5z2P8HVrWBgrvEo6=ZVqaSBtsFrFzHw@mail.gmail.com>
	<1558558.pBdMUGvlJ2@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 17:31:08 +0000
Message-ID: <CAJTo0LZ_zf3oexkfjxAFTywugBhB3zoMfPE1hPtG+kCHvXHfdw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libproxy: replace PACKAGECONFIG equivalent with the real thing
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
X-List-Received-Date: Tue, 09 Feb 2016 17:31:29 -0000
Content-Type: multipart/alternative; boundary=001a11377682fcf33e052b59afdb

--001a11377682fcf33e052b59afdb
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 17:29, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Well, slap my wrist then ;)
>
> Ross's suggestion does make it a bit tidier.
>

I've a follow-up locally that removes all the GPLv3 nonsense as I fixed the
need for that back in 2012. :)  I'll send it shortly.

Ross

--001a11377682fcf33e052b59afdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 17:29, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1mg" class=3D"a3s" style=3D"overflow:hidden">Well, slap my wrist then =
;)<br>
<br>
Ross&#39;s suggestion does make it a bit tidier.</div></blockquote></div><b=
r>I&#39;ve a follow-up locally that removes all the GPLv3 nonsense as I fix=
ed the need for that back in 2012. :) =C2=A0I&#39;ll send it shortly.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a11377682fcf33e052b59afdb--
