Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 443DE60722
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 20:22:22 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n204so257672077qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 12:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aJuwBRLm1oxqw9wL11kzEUDW7iH1RbiMfU/58Q6WbFM=;
	b=ZOd7v2XhGD7bUZ2goshN2nWquA68frgYwoLvdqGQS73ACOqAOMI9NzmyuqEITAPhD1
	N1rZsskTf8HE3oOWk0W1zC0iLDQ/DL1kNgcrCWO4Q6bhtMgI+pzTURocKxxzKvx1WPtu
	7U+qN69EGcyXNDJG5AAiR9iUDi1ihRPS63d0MNJqRUkZ2bX042Q9afScRLb2mdhWHK+B
	VyZdv55isK8ihs0dJ28XU+jEULFmkERfPJ6Iv1Nrvj4q3nCEeoq01mQboJbqNqSMmzBY
	x5+w17Re1eRswOsruFHSSLCZprlZxlaGRfmKp0rI5O4VrYIBoNhxlxI0LOUNHqEHwE7l
	5c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aJuwBRLm1oxqw9wL11kzEUDW7iH1RbiMfU/58Q6WbFM=;
	b=gJeQ5/seawqdSoKVsVBiuaXz1JNzAZ6yoGzpE7Ojaz9hWbUHYOy1Yu0+VO59jgOrCc
	PXSJzkDgpqWSfMqJE+Vgki/1EGaqXk+iKtSu3FK98ON80Lt+QA02mbxIvRzyjCGSjvIv
	c8DaQWAL7sXfxwR/sjexZn+O1kSMZtbl9FiYxq3r8LGA0UbapP5CPkwptRC1El/u5sl8
	4cfGV4+wwu7cS/TJSCnmD32u/j7m2+mT7EsB+pW5dN+rkCs78qyHZTLEOsKkFsZ8uWHg
	2T5rGeFJe64qYC4LfTsV813VC2rQKFt7uXVsMqlZ3Ccv5IqZE/mfyGzkaU938TA6PKDy
	66+Q==
X-Gm-Message-State: AKaTC002+Vh8IiDB0MDvykRweuOXe22uLM3X1GgHIqN07+DG/0nAcaA398WNqVW+IvG4YVHNV3xvv3IFUUufI5ID
X-Received: by 10.55.31.157 with SMTP id n29mr33564346qkh.221.1480623744263;
	Thu, 01 Dec 2016 12:22:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 1 Dec 2016 12:22:03 -0800 (PST)
In-Reply-To: <20161128212606.26139-1-raj.khem@gmail.com>
References: <20161128212606.26139-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Dec 2016 20:22:03 +0000
Message-ID: <CAJTo0LY4K4mRh6_jCJj1pEGHRvx67kZuQ0DbNtkA_EOkP7GyRw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V5] systemd: Upgrade to 232
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
X-List-Received-Date: Thu, 01 Dec 2016 20:22:23 -0000
Content-Type: multipart/alternative; boundary=001a1147f22852bda205429e9427

--001a1147f22852bda205429e9427
Content-Type: text/plain; charset=UTF-8

On 28 November 2016 at 21:26, Khem Raj <raj.khem@gmail.com> wrote:

> -PV = "230+git${SRCPV}"
>

packages/corei7-64-intel-common-poky-linux/systemd-boot/systemd-boot-dev:
PKGV changed from 230+git0+3a74d4fc90 to 1.0 [default]

I'm starting to wonder if systemd and systemd-boot sharing a .inc is a good
idea!

Ross

--001a1147f22852bda205429e9427
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 November 2016 at 21:26, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div class=3D"gmail-">-PV =3D &quot;230+git${SR=
CPV}&quot;<br></div></blockquote></div><br>packages/corei7-64-intel-common-=
poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 230+git0+3a74d4=
fc90 to 1.0 [default]<br></div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">I&#39;m starting to wonder if systemd and systemd-boot =
sharing a .inc is a good idea!</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a1147f22852bda205429e9427--
