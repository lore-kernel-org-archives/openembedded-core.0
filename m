Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id A7C0C65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 14:21:53 +0000 (UTC)
Received: by qcbjx9 with SMTP id jx9so28371951qcb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 07:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cKoxHHGVgMLg9Id8k/3eF6HVZyFW415G6hlSZdJ6MCA=;
	b=A3SR+tNMJ3sSngMIks65VxsRfo3GIx0PJD5HkdkDBh8sK6ziN0L1Ytb/is2TqBDXbj
	VgUfi79ZjRUY9qmZIGsjNG990HJIKPkq8Kk6VvVjRx0/Z79lGFK1xgkVPbl62pq8OxQP
	vKqFKm1y78Nsr3f13Mfi1MsaMmM4oygFf4XvMV5OlFveIqSsopZHFoUyZTFJs7rQyIn3
	EJcH9Bfp/9vS/rntsPTsFEe8vecTneo1zXQqRGYxT2+FaO8u8RBGqyrXlYFiwn2jyth/
	X7rnbz/PhzorHndATNnO3z2CpQbwfHmDPFkjVfDYcDsdu6HEor2ott9qmtTF9bkMCI8o
	OIcg==
X-Gm-Message-State: ALoCoQloU0VL79OKKZ37uG8WLKkWCUxgatv8MbwRBItR6okJz8NG+JnEHpb0ReRLQ2xGRP4oJ40u
X-Received: by 10.140.149.150 with SMTP id 144mr2503381qhv.16.1426774914949;
	Thu, 19 Mar 2015 07:21:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 19 Mar 2015 07:21:34 -0700 (PDT)
In-Reply-To: <CAMKF1spV93W=+jfSvC_7JsuC8xokm5V=4PB3y4TUEO03iCow-g@mail.gmail.com>
References: <1426681293-30112-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAMKF1spV93W=+jfSvC_7JsuC8xokm5V=4PB3y4TUEO03iCow-g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Mar 2015 16:21:34 +0200
Message-ID: <CAJTo0LZDFj=TXUyj9XAkK8yciQOXvhrU-eYDyVu96hv+xQg1Fg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Khemraj Sharma <khem.raj@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: avoid configure stall by feeding prompt
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
X-List-Received-Date: Thu, 19 Mar 2015 14:21:55 -0000
Content-Type: multipart/alternative; boundary=001a113577e2fafc100511a4eb1b

--001a113577e2fafc100511a4eb1b
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 18 March 2015 at 22:29, Khem Raj <raj.khem@gmail.com> wrote:

> That's ok
>

Does this complement, replace, or is obsoleted by the patch from you that
does the same yes| trick but at a different stage?

Ross

--001a113577e2fafc100511a4eb1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 18 March 2015 at 22:29, Khem Ra=
j <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><p dir=3D"ltr">That&#39;s ok</p><div class=3D"HOEnZb"></div></blockquo=
te></div><br>Does this complement, replace, or is obsoleted by the patch fr=
om you that does the same yes| trick but at a different stage?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113577e2fafc100511a4eb1b--
