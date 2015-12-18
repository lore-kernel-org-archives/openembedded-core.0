Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC606FFCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 18:23:55 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id m11so38474458igk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 10:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=b1C3AULhWeezvBcFrFOf2hH0O+LGwPjvKO8EO4lHGsE=;
	b=Ds6dOhSl5qed59ux0PB+GfKTuz8c8RcGXJtPCGRD6lDhemFwAwcVN1rS73dI445q3T
	+ih2RbIlDnUARmicYk2TjMJCyJGveduE+NyE92//SV614EXg3lbZ4TCpkmmdfwGJbedQ
	48j62/d+jh4konvWBfR76X2XVISXZLyxz3mYF+CzgUeBdCoaIefKUmDi77mGJVz9JuKc
	z5pr5vbxfOhS4iAX+6ROSeLm4lvICjRAiQjQ3pfYzseUmeEb6jBHkfeF7BVe3S6EYUE5
	WmnPbBX67h7Qn671y/pxLWtnp2hd024xjfxLURIhtbiabhaT7j2iDXoYvJLeJo8v8nE5
	dI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=b1C3AULhWeezvBcFrFOf2hH0O+LGwPjvKO8EO4lHGsE=;
	b=E36dWFe0tdBqTdaRYECYyiTts1AUeY6SVv3LMfcvfYhG0cmWnsYh7BoThmPoiw+rx2
	oJH0wJyhubAQNfiCYujGmRgp0H7HF59Yq9a507MNxwCnRH9hswfKtuGw2KNDnlX2P2qt
	AaYubvSXsZUDzZ3vzxFTq+W5FjLKkNFiwowIfjsJddnGI56DiNUEyFrDwywF+ZFfpI27
	GHNaAEsiD9+3OvvKQDEos/VtG7cZftOhDGIX7S0k70rIEHs6H1UXvUex0muaFte40B2I
	6Q/Z/gz8O0uRukqoGb69ZqFXvgBdIUIAf86N3uPKEviOhqXlxX/ODzMsKfPuLfCO0Sl4
	HU0Q==
X-Gm-Message-State: ALoCoQmLASdpwI1/V41zFbvqKA9PexRst2vGSwAC+MiPr9tIWol270beHln3IL3VqMcYPbxUXoi9crA+y4D7q1Qpq/o0PBQS5X9x4CZbqVxz6xixd/2Xx0M=
X-Received: by 10.50.13.100 with SMTP id g4mr4375792igc.64.1450463036126; Fri,
	18 Dec 2015 10:23:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 18 Dec 2015 10:23:36 -0800 (PST)
In-Reply-To: <20151218180904.GB2556@jama>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
	<20151218180904.GB2556@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Dec 2015 18:23:36 +0000
Message-ID: <CAJTo0LYoyn-couSP8VVjkWCevgEQ3NyNgGacM9Vf39BQWuk_Gw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro][RESEND 00/11] Backports for jethro
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
X-List-Received-Date: Fri, 18 Dec 2015 18:23:57 -0000
Content-Type: multipart/alternative; boundary=089e013c66140756080527303ebf

--089e013c66140756080527303ebf
Content-Type: text/plain; charset=UTF-8

On 18 December 2015 at 18:09, Martin Jansa <martin.jansa@gmail.com> wrote:

> PING
>

I think Robert is on leave until Christmas, hopefully he'll notice this
when he returns.

Ross

--089e013c66140756080527303ebf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 December 2015 at 18:09, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5bb" clas=
s=3D"a3s" style=3D"overflow:hidden">PING<br></div></blockquote></div><br>I =
think Robert is on leave until Christmas, hopefully he&#39;ll notice this w=
hen he returns.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--089e013c66140756080527303ebf--
