Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 429AE6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:44:18 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id mw1so49484447igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 06:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wnkA8kveIFmASgcGdMzIPUxzcn1hJqODER/1VXG98+E=;
	b=yl0tvA0KePvkVj7iCdrWclqOfMqAfl7jAa+aUNwfECEB6GSUuoequNI3C4mXseFnk/
	TDiHkch9n8o3Hx4MWgy48ZqcSR6XD2OnIazcusgxB8S94A8za0iud8xRhjGT38V/MHT/
	Gx3HsnmzbAyn34Ekupw8tOidhSUJi62GSj1MUlAvrQMwlRRThQ7wBNoniRQ6tT871wHP
	KG/90PvIorxbd5csrtXU/cvt3nX6LicUaYKE9IGt3VjOEXCss1SuAbTzafEAlIGqcmfU
	xC8lFlzVb7lLKcO897yIBblmXHx0sv6/Ds5QYxBaYqvUd4QyqU4TdV7FlUoYCRgXQXU/
	qMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wnkA8kveIFmASgcGdMzIPUxzcn1hJqODER/1VXG98+E=;
	b=WFMinJSjknQbZiCsOodSqxuhwTtmNGivezwYYh+SU2esAVf/4twifhjumLS24Clrdz
	PxlngrVZcbz89Ce++CnmKG4C9bRfD/jtEP2y5+Sbz8lcug9O43yNuoo39mMp0HRxJDD4
	E6IdBbhk273zqHS985sA+e3B+jNnCPBRhgXqjebTHeNXcpqqeEG2+EPUD2IqkGPa09Um
	2/QzqxBjYY5le9o0u0O52W+bcv78+X+U1vwThp99uWxZ/h0ffJ5hPTIkDem6bS/+uxHk
	4EPCWxeYHTKXOYaj8djX1zcrfY8kGb06d+nDR8ec1ba06kF3QUCXmYDSbnQT8LZGLNK1
	PhRA==
X-Gm-Message-State: AG10YOQtjbKcmRPmg9aPsnmBvVZC0vpHNXm15ohME+FRI6otIDASdI/+Ca9zwOErdFEM9jj2/gOMV5XkP5wY1SU1
X-Received: by 10.50.43.133 with SMTP id w5mr10512000igl.52.1453128259470;
	Mon, 18 Jan 2016 06:44:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 06:44:00 -0800 (PST)
In-Reply-To: <568FD7B7.7010703@collabora.co.uk>
References: <CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
	<c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LbyG07bauQnVJeHYCcZ9=zhjFZdj44E1vS-kXHMVuq0BQ@mail.gmail.com>
	<5683B790.7000905@collabora.co.uk> <20160108153451.GA2573@jama>
	<568FD7B7.7010703@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 14:44:00 +0000
Message-ID: <CAJTo0LaR8iqj_P4GuSufyOXy_MryV7jLVJYxgU+O4=qxFdfTCw@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cups: update systemd support
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
X-List-Received-Date: Mon, 18 Jan 2016 14:44:19 -0000
Content-Type: multipart/alternative; boundary=089e01175f2bb8240205299cc99c

--089e01175f2bb8240205299cc99c
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 15:37, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> Hmm, the whole point of my change is precisely fixing this issue, are
> you sure you have applied my patch?
>

Merged to my local staging branch, sorry it took so long!

Ross

--089e01175f2bb8240205299cc99c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 15:37, Andrew Shadura <span dir=3D"ltr">&lt;<a href=3D=
"mailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura@co=
llabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":5qu" class=3D"a3s" style=3D"overflow:hidden">Hmm, the whole point of=
 my change is precisely fixing this issue, are<br>
you sure you have applied my patch?</div></blockquote><div><br></div><div>M=
erged to my local staging branch, sorry it took so long!</div><div><br></di=
v><div>Ross=C2=A0</div></div></div></div>

--089e01175f2bb8240205299cc99c--
