Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF53785C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:15:12 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id n134so3722714itg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ohpGErLo9IqU4qJ3sji46aaM8omJe4ltTuu3VxxYJg=;
	b=kSY+Dhfg5BACY5Xp3DlFTLU8Mib1jUzSGIRB5pQITgZfOiiYWD3eCBN0BZumAXDlB5
	ynvgVoUjCVtiTEzjUuTWd0N/HTt6/bbOzphRvW08l6sx5p0N86/5rem55YQxjGykVgZZ
	i1lPJilMfJ1yg+Iba3HFjkkbytCYjMJ67RUwfFj9D19PFwPP29wXkhzTDXR8icdqyY2M
	ULTwXIS7dpXTXac9UFjaDjbizLz4WwDkpi9OLAVXN6YQt/kbVY5Rhc8cWuNPjITqVK4j
	s81MwcP/wCWSr1ftTLiP3B5kHA2r84LLBSXpJKyOdWRKOn+1h49Rb2RjG1lTFP7z6BbO
	da4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ohpGErLo9IqU4qJ3sji46aaM8omJe4ltTuu3VxxYJg=;
	b=QofLvIpfitQOyZmZ2KmxmjU739u56rlKaGbKo6+CGMmhD5QgZaBG6oEWm3iAfbv7kl
	KkKDVnPTxgZZ/5PUlvioqs15JrNC//cw5MEwtwiFL1dWfqyWnEMzwKgZNH+RbjJj0ZZb
	H8ytGTGHK4teQpfjj1aCQPv/Tk3XbtZgJwApsh5yxtEJ2JxWPar8fKcEl6KT5tMmrBPU
	I4DTquUC6/5gpLve6t9pOIqlQpfE0LlmRHMB4uIsDROA/M9WK5iuOG2ow4Gl5GJaesP3
	+B18anFxcW+FDjYT63e6PCx/3gCTya0V4kEqsD1oXITGf5+8mc/ga8IoL4+3WBe0dnj7
	vhiw==
X-Gm-Message-State: AJaThX6TtsTbUTansdyX4awwTJzMvBD3Niwh+LGsN0SQkeSvmmMAauvO
	Gpq9aFogy/VZALwn6+FxXmX0s9ryOCLHEt8KkFzn1A==
X-Google-Smtp-Source: AGs4zMaqAvzgz8DoySCebF+RaT1z9vIhOzq5iMX5BSedMwqLy4ZHHe6r3K9FsbeLfmxTfBs5AOtskG0eT58H+idJ6h4=
X-Received: by 10.36.189.196 with SMTP id x187mr147459ite.85.1510316113810;
	Fri, 10 Nov 2017 04:15:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 04:14:53 -0800 (PST)
In-Reply-To: <5b090c26-d7b9-477c-a39c-28da0ea3e172@streamunlimited.com>
References: <1510311749-14198-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAJTo0LaBthRjJ_v9v8KrunCEQypOrMYiMOpLRv+nZb2mm25_eg@mail.gmail.com>
	<5b090c26-d7b9-477c-a39c-28da0ea3e172@streamunlimited.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 12:14:53 +0000
Message-ID: <CAJTo0LaMGc1zc2pD5odyfg0zEF4xnrsXHVCBM3cu+7+Hc+cKSA@mail.gmail.com>
To: =?UTF-8?Q?Radek_Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sbc: fix license
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
X-List-Received-Date: Fri, 10 Nov 2017 12:15:12 -0000
Content-Type: multipart/alternative; boundary="94eb2c19ac88766e99055d9fdf98"

--94eb2c19ac88766e99055d9fdf98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perfect :)

Ross

On 10 November 2017 at 12:13, Radek Dost=C3=A1l <radek.dostal@streamunlimit=
ed.com
> wrote:

> Hi Ross,
>
> On 2017-11-10 12:10, Burton, Ross wrote:
> > Are the test applications packaged?  If you split the packaging into tw=
o
> > packages then you could set the right license per-package.
>
> thank you for your feedback. I moved examples to their own package and
> configured licenses individually. Please see the new patchset I just
> posted.
>
> Thanks,
> Radek
> --
> Radek Dost=C3=A1l
> Project Leader, Embedded Systems Architect
>
> StreamUnlimited Engineering GmbH
> High Tech Campus, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
> Office: +43 1 667 2002 4777, Fax: +43 1 667 2002 4401
> Skype: radekdostal, e-mail: radek.dostal@streamunlimited.com
>
> www.streamunlimited.com
>
> Meet us at:
> CES - Las Vegas, 9-12 January, Westgate Hotel
> ISE - RAI Amsterdam, 6-9 February, booth 7-S197
> Sound & Vision - Bristol, 23-25 February
>
>

--94eb2c19ac88766e99055d9fdf98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Perfect :)<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 10 November 2017 at 12:1=
3, Radek Dost=C3=A1l <span dir=3D"ltr">&lt;<a href=3D"mailto:radek.dostal@s=
treamunlimited.com" target=3D"_blank">radek.dostal@streamunlimited.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Ross,<br>
<span class=3D""><br>
On 2017-11-10 12:10, Burton, Ross wrote:<br>
&gt; Are the test applications packaged?=C2=A0 If you split the packaging i=
nto two<br>
&gt; packages then you could set the right license per-package.<br>
<br>
</span>thank you for your feedback. I moved examples to their own package a=
nd<br>
configured licenses individually. Please see the new patchset I just posted=
.<br>
<br>
Thanks,<br>
Radek<br>
--<br>
Radek Dost=C3=A1l<br>
Project Leader, Embedded Systems Architect<br>
<br>
StreamUnlimited Engineering GmbH<br>
High Tech Campus, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria<br>
Office: <a href=3D"tel:%2B43%201%20667%202002%204777" value=3D"+43166720024=
777">+43 1 667 2002 4777</a>, Fax: <a href=3D"tel:%2B43%201%20667%202002%20=
4401" value=3D"+43166720024401">+43 1 667 2002 4401</a><br>
Skype: radekdostal, e-mail: <a href=3D"mailto:radek.dostal@streamunlimited.=
com">radek.dostal@streamunlimited.<wbr>com</a><br>
<br>
<a href=3D"http://www.streamunlimited.com" rel=3D"noreferrer" target=3D"_bl=
ank">www.streamunlimited.com</a><br>
<br>
Meet us at:<br>
CES - Las Vegas, 9-12 January, Westgate Hotel<br>
ISE - RAI Amsterdam, 6-9 February, booth 7-S197<br>
Sound &amp; Vision - Bristol, 23-25 February<br>
<br>
</blockquote></div><br></div>

--94eb2c19ac88766e99055d9fdf98--
