Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6271677F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 18:03:11 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id u12so115975579qth.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QF1rryTbdvvggXjKtPObsbzpBcAcNdch1H7iuN1QNUo=;
	b=WCQ+jY0AYdp9AMotWuNIRORwGYv8RQw7LlMW+9owWA5lQcDt29wXnLJQzPDJ9zngtv
	n2ppSpvOs5NMi0Xm0ZnKY5ezojGZJQsh9gfd936vAjZDKPkJVL/+3vZCUj7PxeM/KQAe
	rFYgjW57EYpLKMc9eqp3AI/EarsDeldUsk1vQIoFCdFTD6IVKo8K7s3OIL8JQsZv4axy
	kW50Z19+dolQllJvWURiaKbWJbw36HTCKYMhWREvB0E87vGjeyI5rbXOCwHCTy8t6A82
	ia+vZa37EtcZnYwWJSYn/2wanMJtNbSFhC0dSgUFZUp6bw8INQRhTFWH0KK89AAeVSjK
	iKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QF1rryTbdvvggXjKtPObsbzpBcAcNdch1H7iuN1QNUo=;
	b=ZDiMxl/s5hEHqmgI9SLF4mS97KShzWHkqqyioY3MmL+x1LljCyNHAOkjX6ZX3gu8v1
	w9qzITp3flFOwlqRJvxE2rxCiUMqC9P13FNpXR1KK87TE8GQjozPvRystb+t9VM0mCyF
	z4oTEET3W97j7khPWddMi3KdfRfFmA+QG6katyyGuD4ab4VEHcVmj9bOjitvRA0asoPo
	5f/yULt9nuQkOwTxkpFC/K/ooxCJLe5Qq1sBCYsoCi6jPqGvHF0DLJy6q4Y2FirIJkOG
	vDk+jy+MuB0/dcamkXvbPLrrbf0SI9gFs4zvjpMtbxW5fwqRtSUVL6aDF5Vcf3DT10Jv
	seww==
X-Gm-Message-State: AKS2vOxUsfubNe5PREUmno6MY4jwsXWp/Sz2i+akeEcI/CL/KRvWFgFh
	t5FXvc3jmooUHBN/vDSteSFvzQr0RZ3h
X-Received: by 10.55.221.24 with SMTP id n24mr12019258qki.46.1496772192242;
	Tue, 06 Jun 2017 11:03:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 6 Jun 2017 11:02:51 -0700 (PDT)
In-Reply-To: <CAMKF1sqWoPwONt_t+Qczw_Sm=CAefOnN82tkneYYZGJ=BekW6g@mail.gmail.com>
References: <20170606171346.21413-1-raj.khem@gmail.com>
	<CAJTo0Lad6-=shjk=C9_AJVyYsGP3dJ1dDUXcRH6j=coywGMqMQ@mail.gmail.com>
	<CAMKF1sqWoPwONt_t+Qczw_Sm=CAefOnN82tkneYYZGJ=BekW6g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jun 2017 19:02:51 +0100
Message-ID: <CAJTo0Lb30wh5YPhHJcAa3SDE6Aa-RnW=cPk7EWe6XvhNHkdojg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Add define to indicate missing 64bit atomics on armv5
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
X-List-Received-Date: Tue, 06 Jun 2017 18:03:12 -0000
Content-Type: multipart/alternative; boundary="001a11466c48d420d805514e6e07"

--001a11466c48d420d805514e6e07
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 18:33, Khem Raj <raj.khem@gmail.com> wrote:

> yes. and there is such a patch proposed as well to mesa but
> it has got some feedback so I did not bring that in. This patch
> instead is surgical.
>

Cool.  Just got to remember to back this out when upstream is fixed.

Thanks,
Ross

--001a11466c48d420d805514e6e07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 18:33, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":3b1" class=3D"a3s aXjCH m1=
5c7e791f31be2e9">yes. and there is such a patch proposed as well to mesa bu=
t<br>
it has got some feedback so I did not bring that in. This patch<br>
instead is surgical.</div></blockquote></div><br>Cool.=C2=A0 Just got to re=
member to back this out when upstream is fixed.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_=
extra">Ross</div></div>

--001a11466c48d420d805514e6e07--
