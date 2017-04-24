Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A89CF71BA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:18:52 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id y33so109214969qta.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6vESzVvag/Vkglr+WZjCeVTqF4aPQ6ouNkWfMYuZ1Rs=;
	b=sRIA8/VbPdNXGvU8KZh+/jSLwAr8UuBekdKFS0Fw00T5LZBs8XTwPGZRUADWv4mmVb
	RIcdlg21yaaclYo+It1Gb2bxXSgJuVIb3FTrPwDOTrURGREkndThMtwi7f4T9hmJccJE
	H0gaKHffhXkKaFgClqCvTIV2gSFqhgJjt45H8MqKJZNVjgNA742pYjKyg5V2J9b3nicg
	wwTgF4bP/GbabOWKbmmc7DXWxxa37dBrR3pwyp+oN+LQLKAIDYsJlWDpA/15+jGu2zBY
	3LOuURtCGEqObMsO703SYQTuWnsu6Sjabx9aY7WVB/PB7i5k4ymkFiY1LsaFE2vp1YhY
	Jgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6vESzVvag/Vkglr+WZjCeVTqF4aPQ6ouNkWfMYuZ1Rs=;
	b=gc2xkrUijAwKJfQkuPzbC7mPt3V85BvpHbCpJz/MUsxbiKQ2+wJrmrvWfzGsepWPwT
	avSCXWtLfD7UxQBxuhaCSVOlXHLczwSJSiISMlxTXXnAeN8xMvPg/NX2prKdJ1Um1HWM
	1ecwzyB0mo/U/xxyebYECFg4kh61NQEWXX/Dryco0dIQ4VA6hrpJB9AvGI6yU3Y/ZuG3
	qb9TtXV5/AmagWaafCIdiFQnAip6cYNFqXxjhNKc8U5wfj+18p2ESN0xvwzPoip7DSju
	v9oygoOat+LjJJJynNi6b+lwKnOdmFp62w2AQe4cwkjY2+UfN7N48qeAUqECpjWuyUGx
	mAOA==
X-Gm-Message-State: AN3rC/66r+n4OGuBwCj9QjB5pVNvFGJkUHymNWUSd6A2HJrJjV5YSlyk
	EsnbPZ49ueoYCkZysvRZ870fWZANzU7M
X-Received: by 10.200.34.242 with SMTP id g47mr24266089qta.109.1493029133479; 
	Mon, 24 Apr 2017 03:18:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 03:18:32 -0700 (PDT)
In-Reply-To: <CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 11:18:32 +0100
Message-ID: <CAJTo0LbHfg3ra7ugc8Q9zq-dyf35pyocuBDEe9uVh09ZaNnr7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 10:18:53 -0000
Content-Type: multipart/alternative; boundary=001a114037d42409cf054de6ef48

--001a114037d42409cf054de6ef48
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 10:09, Burton, Ross <ross.burton@intel.com> wrote:

> All merged, I'll fire in a moment.
>

https://autobuilder.yocto.io/builders/nightly-non-gpl3/builds/237/steps/BuildImages/logs/stdio
shows that the old elfutils in meta-gpl2 doesn't like gcc7 either.

Ross

--001a114037d42409cf054de6ef48
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 10:09, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_extra">All merged, I=
&#39;ll fire in a moment.</div><div class=3D"gmail_extra"></div></blockquot=
e></div><br><a href=3D"https://autobuilder.yocto.io/builders/nightly-non-gp=
l3/builds/237/steps/BuildImages/logs/stdio">https://autobuilder.yocto.io/bu=
ilders/nightly-non-gpl3/builds/237/steps/BuildImages/logs/stdio</a> shows t=
hat the old elfutils in meta-gpl2 doesn&#39;t like gcc7 either.<br></div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a114037d42409cf054de6ef48--
