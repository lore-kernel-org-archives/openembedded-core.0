Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id C2A4873289
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 23:35:03 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id z8so6103712ige.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 15:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tIxkWrc9MyyqEHRCbL1CisjPjs4XzH1tNUP0t5MvWoU=;
	b=bzxN2swv1JvqWFVyD0Bg6qFCsoxJLch5YxWhvbSUFwsC3Y2NVAl/tcchuSd1E8cmaB
	lem5K0Vcf/gasQA7JZyxdKfg98koV4x3MBfYFCvj37uZ5wKPzLGLKhX0aEhtgd8RfjVb
	RAH9A7rRalQ3Y0UTCDp1kwI+37jQqMc7UgY+3Klfr/woV9rUBUQ6Vb7qWZiOrXgsc8RI
	r2VGiAmOHOrJtCBJBoL8xznPZ2qRccEkQduwq6swm3Em6MBoc5lHdUTDWjiB6WoQjVE6
	YJnBKNCCj5m1irNOt+9qqN8RjBGNUfxEId5KvtlFSlgOSlDPA9drmpwOOaZmS788cVnY
	GK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tIxkWrc9MyyqEHRCbL1CisjPjs4XzH1tNUP0t5MvWoU=;
	b=Uk1p3VKkRq1rOqmAMJ+Nm1OWuVPDNjZ+g4M19/WOR/IvIo3c6ZAljEXqDiuFzE1pqM
	De7lY9nC+eqRXQ5btrz2W6jmCP9Cuc6MT4UTGFp6WE7HSk3xRj3cbmgAmmrQfmiW/uIM
	gDPgktuEFDu7AF/pwEkvMg3f8q7RL2hUSZ4+VwtMfNXC26qEMj+bZlxCiNkpZu8pxUtw
	UhGPmOjMgq6iYy4m4pyHT4XG4phrw+rwatqd+qA9GfpMFZfL041VldAn0q2iFz8gEsBD
	ESTDfqLhrGeSvpeRle5cnQSGj0MSi+hSZDuoFJi4+oqckQvuPngPNK5EW4VCfeY9VcpX
	ewiA==
X-Gm-Message-State: AD7BkJJxCoPjrrXhnY4ASjwEao77YFBD+AsWm/SMeCqTkwp5h0603Ie9SvJ0rH+MMG0Ki93H54dPrTYHT0JqUVQB
X-Received: by 10.50.112.101 with SMTP id ip5mr1474071igb.52.1457134504412;
	Fri, 04 Mar 2016 15:35:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 4 Mar 2016 15:34:45 -0800 (PST)
In-Reply-To: <1457131877.2804.65.camel@linuxfoundation.org>
References: <1457014986.25131.69.camel@linuxfoundation.org>
	<1457131877.2804.65.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Mar 2016 23:34:45 +0000
Message-ID: <CAJTo0Lbc02WNvywfmrAu8gmK46n+-tkSns71M4wLN2yF3eXFVg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Fri, 04 Mar 2016 23:35:05 -0000
Content-Type: multipart/alternative; boundary=047d7b3a845886a28d052d41905a

--047d7b3a845886a28d052d41905a
Content-Type: text/plain; charset=UTF-8

On 4 March 2016 at 22:51, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> * parallel make race in openssl (borrow patches from other distro?)
>

Assuming my build test passes, expect a patch for this one shortly.

Ross

--047d7b3a845886a28d052d41905a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2016 at 22:51, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":oi" class=3D"a3s" style=3D"overflow:hidden">* parallel make ra=
ce in openssl (borrow patches from other distro?)<br></div></blockquote></d=
iv><br>Assuming my build test passes, expect a patch for this one shortly.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--047d7b3a845886a28d052d41905a--
