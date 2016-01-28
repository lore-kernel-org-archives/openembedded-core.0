Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A985276EBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:01:08 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id h5so11332108igh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 05:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rQ1+OMjyXkRdEMPX0eitlPVYr8OGrprNCZ0tk25EDJI=;
	b=cUDM4HtjQ8mxBDInv/RbxxcW+ie3WN5Qfa8USPnEjeRQpmgLmNJwqaznWz65YMgdhU
	GKzSF2j550ybdS0YPq1Qr38BtW4Y0Q6IYPusm+5hSgimUwD4GS640MXbhtxyeDsRjZp6
	tpHy5ZOjI626fDE90/two8G8RIsipTNFxPZxAytxBj8DnXR+fu4GfVoSbqXzjh3MYXxs
	thXzPMca0Op0AoLx9IL89uf7o3FZrXWL+Aga0puJSLV6GHc14cTf5Si99kT//LRGdK/C
	8z5eYTqhAXPuoILrYD/oXgRXS8ojWfoo/JN3ZQ9/mtRU1q1c5AiIGUkwK+zAtKh2Snem
	N5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rQ1+OMjyXkRdEMPX0eitlPVYr8OGrprNCZ0tk25EDJI=;
	b=WR2Ceqqj/Y+zVYancocjjEeYOf5GloyB2U3JBC3tl2UBW5MLhG1Hf2kXemzIWdBh/z
	HDUHHO47qj6GIcjhCIGM7st+h62XtBCfk0KIDmHHr/TSAxjYJUjlCwKWAjaoV+6GR2Cc
	jbrhcrxypRT9RUd9NysN/Kgt8BhnmZxVBL7ZaO09a0v48LVoIHj8Bot4BOF6hcxIeWYH
	j8FT99AHHHkjAJD0SFkp0rF3w/DxxQwQbole4ide6pSXjK3RdX/wdAmdra9zefQviHXF
	IyMFBmtCbmATkXzQHM216f3j1ifMJAVMglXCel98u/05p+rguhPAUqPToGwlKs59AcAb
	SwLw==
X-Gm-Message-State: AG10YOTqMUbJxB/2Xg0+m3QDK0o91e2CPH3cTSOKrG3TR+MZr3BpnnjJgnutgCfNMPx5qHWk4t5UOZbRD0Z9qbCp
X-Received: by 10.50.111.111 with SMTP id ih15mr3279396igb.78.1453986069270;
	Thu, 28 Jan 2016 05:01:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 28 Jan 2016 05:00:49 -0800 (PST)
In-Reply-To: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
References: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jan 2016 13:00:49 +0000
Message-ID: <CAJTo0La7EzDZ5ocG+++=7gp0PqNNquVv6a4H66p3orL3+c+GLA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libical: update to 2.0.0
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
X-List-Received-Date: Thu, 28 Jan 2016 13:01:11 -0000
Content-Type: multipart/alternative; boundary=089e0149be342aed9c052a648368

--089e0149be342aed9c052a648368
Content-Type: text/plain; charset=UTF-8

On 28 January 2016 at 12:37, Maxin B. John <maxin.john@intel.com> wrote:

> +RDEPENDS_${PN} = "libicuuc libicui18n libicudata"
>

Do these not get detected automatically?

Ross

--089e0149be342aed9c052a648368
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 January 2016 at 12:37, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":19m" class=3D=
"a3s" style=3D"overflow:hidden">+RDEPENDS_${PN} =3D &quot;libicuuc libicui1=
8n libicudata&quot;<br></div></blockquote></div><br>Do these not get detect=
ed automatically?</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--089e0149be342aed9c052a648368--
