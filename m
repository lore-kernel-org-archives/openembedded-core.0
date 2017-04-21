Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1646F77B38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 14:51:57 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id y33so71423490qta.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fvhp8fPxqZfYkE08mZKySvKh5CAN1EZUTYtGMzujFLQ=;
	b=sg58kGK8bPRjK/TlDAeVRtRFgzW8QHGZgVIjF9kNB8blakAH9rfsuOg+Q6uEsEHwCE
	QkoCMwarx4je63pALvgB1gOt+FxFAldwMmAHDEmKWe4zMtSe1bE3rSfPt5cGW/EyWzEN
	PhC6gS8fi1tHvgvnHfa/0s/fNk0ZlHd5pEqtx7EkRNSUMfr9X4jOT158Fo+l0hXWOhOv
	wRKG8Vwe+vChrQcl/Q9qLsA+G3LEa4atJyhqQqbsBhqUlCU9PNUl+3fbzjAMXbgsELfl
	woJsHyq7+2kC5CuAUkecUqy0P8mdgOeCUkUG38/xEAQWjQ2i5sd5cqMnQ/fnu72IlG60
	KvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fvhp8fPxqZfYkE08mZKySvKh5CAN1EZUTYtGMzujFLQ=;
	b=mcD1pWX/DbSxmt4NhR/HWPAYO83/H8e5CFuQzr7N5nv70FPuCzyu0DIUAvLH+z/bQZ
	PCBpsZLrde8UJUQL7STQpkaGj+QCTkgWtkn5aP02UXUrH0gAsBdyp+D/rqGAZN75DTNs
	FJW7+nFQAiYbix6tHmeMR2kQrCGnZxHqlwKdV2miTFFVsbd6BM4p6564CW1ga2O35Ad6
	7gfvRQqZ5Uikgnswlqapd8ICYV2lbTUFUQUdGqQ747uVBKKHuSToQCm5CJjgLVOnlAkX
	9tjXAKN6lz0SH+0m6L2CIZcj82hW5H4HRb+iwChkt4TJmJrZc3VbDuVlI2Ym2vxWKx4y
	CpOg==
X-Gm-Message-State: AN3rC/7Lfs0HD9MGTq//NGYp1ou+Y2xTBgM0jcM7tqs4Jhp5Pq1vemt5
	SLcrS6EBvcAKLMMm2RT+tJHjoxQBprXm
X-Received: by 10.200.3.105 with SMTP id w41mr13145230qtg.188.1492786318687;
	Fri, 21 Apr 2017 07:51:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 21 Apr 2017 07:51:38 -0700 (PDT)
In-Reply-To: <20170421055501.16435-1-raj.khem@gmail.com>
References: <20170421055501.16435-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Apr 2017 15:51:38 +0100
Message-ID: <CAJTo0LbOTv5iWYRt-cXLXnurgDE9uQikWUMAs7eHwu++OxU_yw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Upgrade to 2.16.1
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
X-List-Received-Date: Fri, 21 Apr 2017 14:51:58 -0000
Content-Type: multipart/alternative; boundary=f4030435cf58408299054dae66ea

--f4030435cf58408299054dae66ea
Content-Type: text/plain; charset=UTF-8

On 21 April 2017 at 06:55, Khem Raj <raj.khem@gmail.com> wrote:

> Drop patches that were backports or have been upstreamed
>

This doesn't apply to master, can you recheck?

Ross

--f4030435cf58408299054dae66ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2017 at 06:55, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":2kj" class=3D"a3s aXjCH =
m15b8f152d5fd49b9">Drop patches that were backports or have been upstreamed=
<br></div></blockquote></div><br>This doesn&#39;t apply to master, can you =
recheck?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--f4030435cf58408299054dae66ea--
