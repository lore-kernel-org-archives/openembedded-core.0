Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id C7DC26FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 10:25:41 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id bi2so134012500igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oj69ZlGzb4+qDOauucJjpq/jnViWPyax+xSHkiNaReA=;
	b=ZAcxpqbBHjgOyqqe8LaJ0MJWP5mBIZ4Ee7hEiKwc3rwmUQQrJ2FqCDWvtx9mc4BQYZ
	Dsu9LbDSBxrapC273Yg4PXkMNepzQroYNWOHVmfhb/sn3yqc6zxBAwoMXIxW24GFH3fw
	OvbKFp53QnHPOpf3mLM9vMjJW+arZDOClAQ2Rxno44fjED+IyDoeSLudqawJgHlO5fcA
	yydpLGrD0SbIkJPlKl2/zNIrmnDGNoc6qZrgbdBS+99KtVoCe/gD37FuijULMhWLaKWG
	I9Y11GPPtYtQ3zr6Y6rzRpJJUcUQSdonYT2k+w3AhUccBFF9iNAWF/k2F3cTtkQuoYk+
	YzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oj69ZlGzb4+qDOauucJjpq/jnViWPyax+xSHkiNaReA=;
	b=iTfhq0OPRGhQct4HtHBmQHjBZXouB6eqeQtMjfc1R764OFWZWiqjtc3qFbXJOkJDlK
	3o7ytqduPhyMEmB8o9R9WL5wSANp4FYTK432/lFCW3FZwN5XVk8vPlTQHanSvndgWclq
	Utki387icpgD17osMOTVgIe9fxr+pfxfulvnwrIPFCi7jd53j+/RUAmY1rJcR8heCEsj
	m8cYRWmJXZk4MkMW+DkNuqONNt8V24lOKli9Wlnq2TGeVJyypZ1MaM1UVqIPzZItRHEc
	lhlLWcsJM0ZAZ53R5SY1my/lIelwJmcAPS+GSKf8Ox3hzGIaW9FtAFSBmT7zEUtlOIEx
	TDVQ==
X-Gm-Message-State: AOPr4FVX3YbKXmr8XoRnvf4e1xpv18cpJsCMTa5AjjXPmUigqs0tZu/5MzE6LGtRBKLEE3AqkuRYMSyrRpofeQHe
X-Received: by 10.50.62.20 with SMTP id u20mr2101169igr.52.1463739942196; Fri,
	20 May 2016 03:25:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 20 May 2016 03:25:22 -0700 (PDT)
In-Reply-To: <1463739192-30404-2-git-send-email-eu@felipetonello.com>
References: <1463739192-30404-1-git-send-email-eu@felipetonello.com>
	<1463739192-30404-2-git-send-email-eu@felipetonello.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 May 2016 11:25:22 +0100
Message-ID: <CAJTo0LbH2C2h2yKxyaE7QhJKmAFp1pnyZhciu5uqvfwRvygMxQ@mail.gmail.com>
To: "Felipe F. Tonello" <eu@felipetonello.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] rsync: Added native package
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
X-List-Received-Date: Fri, 20 May 2016 10:25:42 -0000
Content-Type: multipart/alternative; boundary=047d7bdca6064c722505334383c5

--047d7bdca6064c722505334383c5
Content-Type: text/plain; charset=UTF-8

On 20 May 2016 at 11:13, Felipe F. Tonello <eu@felipetonello.com> wrote:

> +BBCLASSEXTEND = "native"
>

rsync_3.1.2.bb already has this in.

Ross

--047d7bdca6064c722505334383c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2016 at 11:13, Felipe F. Tonello <span dir=3D"ltr">&lt;<a href=3D=
"mailto:eu@felipetonello.com" target=3D"_blank">eu@felipetonello.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":a85" class=3D=
"a3s aXjCH">+BBCLASSEXTEND =3D &quot;native&quot;<br></div></blockquote></d=
iv><br><a href=3D"http://rsync_3.1.2.bb">rsync_3.1.2.bb</a> already has thi=
s in.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--047d7bdca6064c722505334383c5--
