Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 75F80601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 11:25:02 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id h5so49021103igh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IKhROjXaEJVnHtmv31FfmizZBFsIM36jLSKb/+Z4KOc=;
	b=xgEuey0YDD5UfJeB5cHuKYfcf0PT6uNlvW+UpAeewfkBlHvSmKLWiT7UYggnX5grmT
	nQZmNhlvGa/Ljv643IsI74nwkPa0kIBQGpAAn+0AeheKlyyqDFizwVSRu+r+g7RudiUO
	M+dVcyeyho9zbTGH/105y8yZ9ZSB6oWu8rqgZKAfI5W2ewGM1AxZiqT65hmMxAoGtmFq
	o957BJTQtr7VMbZFVqd5wd6OeCdFn5E6Eo9VHqxni7fS/pxEhLeriQuHC31bKaP7M4pC
	jm3OyZC6EoM7zPvpM4HhQjj05CaM2hftlUL8MiabWky9Yke+HjLjmfBMBVU+f/CxZsiz
	ttVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IKhROjXaEJVnHtmv31FfmizZBFsIM36jLSKb/+Z4KOc=;
	b=goUUOa3y0K0uK5FtQDaV306QvHbrI9CsKn+pp7aUXScdiKNyOnlmwlU0eBG7XFoDCI
	KCu0LM6S4Y06E4EaEWyUjzFc1xfJHRiSwU0m+Py/NNjqOwHkEKmOy7y4lblbTzSfzw1t
	NvdL6o3NXUSDUTtrcRhfNg2prEYzVMbg2nNQ93skQcfbt40Nhu6y8ze1PSIfulaaydZt
	yp73Dx+WZLpERdJiubXz97ru3K54D2fV5k2tCEkjNJjNTophEGqVllW3nROUnjc69OT9
	tAX4QmLXIcON5AKIqD6gkLj/ekGXxqLS50Dlxt/YYtmnw4cJonSg+JERj07arFRqcVTZ
	yGfg==
X-Gm-Message-State: AG10YOQCL+cVJK9yfScsa7odCTP8XdTeWJJbzkOPQ97pWa3STTN1wQ8y46YHevj+QpUxiilO0ZLRc55T1QWEyoDA
X-Received: by 10.50.13.100 with SMTP id g4mr21108447igc.64.1453807503047;
	Tue, 26 Jan 2016 03:25:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 26 Jan 2016 03:24:43 -0800 (PST)
In-Reply-To: <1453779264-8652-1-git-send-email-denis@denix.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jan 2016 11:24:43 +0000
Message-ID: <CAJTo0LbSM2W2ZW_T69tSBWVR3Kg_TQXu7W6TqoG6=DivrU4C4A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 11:25:02 -0000
Content-Type: multipart/alternative; boundary=089e013c6614caa0fd052a3aef70

--089e013c6614caa0fd052a3aef70
Content-Type: text/plain; charset=UTF-8

On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> wrote:

> A clean room re-implementation and extension of the original stress tool.
>

What's the rationale for adding this to oe-core over another layer?

Ross

--089e013c6614caa0fd052a3aef70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 January 2016 at 03:34, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1bpw" class=3D"a3s"=
 style=3D"overflow:hidden">A clean room re-implementation and extension of =
the original stress tool.<br></div></blockquote></div><br>What&#39;s the ra=
tionale for adding this to oe-core over another layer?</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e013c6614caa0fd052a3aef70--
