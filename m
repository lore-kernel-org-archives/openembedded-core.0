Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7D235730B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 20:49:50 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id v125so112581185qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 12:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fAYcaVzQIHnRr+qia+szzfD97tk49RuOuHGoTXaJ2Rw=;
	b=1yqCqqzmMjgRpPWligPzjMeUYs4+3s701HuWJ1ZuXZPp+Vej/SLAwsWLCNfrF4gKkz
	G9+aAfxMthSS0zb+bKxsuX34kRyrXVJeFm2ze3tELIry4wiTgL5ps8rg1KLOLAx5uQ+q
	lvu0lOIwGMZ6dWOOvL3wqFH31ZooCBf+jj7q5o5yRqJFodT65ITp+ehEkhA6rhGHrTc+
	vhPq6goRaQ0IiokscmJ9Sn6WLUQEGaAO2hfBZRQBomdP9KdMsJFGcHXIkjDIB5/viTIx
	dBpZ+1qu/YJYNLpz3kSPm3VXK3KrpN5HjqfpWF4Iw+WYF/MGylGAi/+SzyRXjx40SroM
	Pdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fAYcaVzQIHnRr+qia+szzfD97tk49RuOuHGoTXaJ2Rw=;
	b=OynKrSCutsj93RFURvEhr+EbzkFhpKPhBKBgliecgRun/FtfkcQHD7jfxzstbhw/Ew
	Dy25VgUqL1mBVXPm2nF6O0KQ4abrnqQemx0iFBEhs0+9qmhxay/pVMExV0OFaMlQa5ZD
	0VECKMDKdox6d9wQV04uZC/QPQOZ/j/LcDz7QRoO53zEetR6TJOl6DqIbj3Xt03LddZ0
	T0PYlNSgPAQIDnL1miq/4Zj/1CiKJ2wildTkwqv+yKx02E3rA+EY2pijIK9Zpqau1GT3
	fsizez3yS816U5pXacXTc92/oy+rAGVq+E55aRg1UcSvpoU9+LWVbSbPtDNCUiPnb+Gf
	g3lA==
X-Gm-Message-State: AMke39luS6GO8gweZgAX4yEtxq/ozecWBjUpi6e3Qf598qbiamdPM22OT9OW200qEZ6ELoy2hLeI0MHPmIfArAg+
X-Received: by 10.55.175.195 with SMTP id y186mr17030862qke.26.1488833392401; 
	Mon, 06 Mar 2017 12:49:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 12:49:31 -0800 (PST)
In-Reply-To: <20170306175010.GA18369@linux.intel.com>
References: <CAJTo0LaafDCfjH_cCHJDx0BCeZxVi7DPv3Cw_QdXvqYD+ehseA@mail.gmail.com>
	<1488814260-8668-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LY7pOtUWsbCJQ8_4A=Bxws04Sdfr1M-59fa6K5gdqJk-Q@mail.gmail.com>
	<20170306175010.GA18369@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 20:49:31 +0000
Message-ID: <CAJTo0Lbkqew75OtdLe+Tpqk7yk7XehtOYF7Jy=kRVNEsNqu3Xg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Mon, 06 Mar 2017 20:49:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c7c12f3054a160952

--94eb2c06093c7c12f3054a160952
Content-Type: text/plain; charset=UTF-8

On 6 March 2017 at 17:50, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> I don't think it will as '&&' and '||' lists are among other special cases
> where
> shell doesn't exits on error.
>

Ah, fair enough.  Another quirk of sh I wasn't aware of :)

Ross

--94eb2c06093c7c12f3054a160952
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2017 at 17:50, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":24n" cl=
ass=3D"a3s aXjCH m15aa4cb0b1944387">I don&#39;t think it will as &#39;&amp;=
&amp;&#39; and &#39;||&#39; lists are among other special cases where<br>
shell doesn&#39;t exits on error.<br></div></blockquote></div><br>Ah, fair =
enough.=C2=A0 Another quirk of sh I wasn&#39;t aware of :)</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c06093c7c12f3054a160952--
