Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1912D60043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 13:57:43 +0000 (UTC)
Received: by ioir85 with SMTP id r85so119287535ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jdsyzIjwnKDRaVv+HRmSzYeI6pQdGQcUzgRksL84vPM=;
	b=PpuhmYCK8FbYc1gcmaHcyCX5tLb/o3tGbA3k+/tb2m0WaXvsfpvtcowgBMYuAZ5qTT
	OQTQNOiqQnpNwl2JlG3mo+e8PcW4flFFz/cox7yyi6d8rYoh6+P6YVqtt5Tvg3y/zlrL
	299MgbA8ST7OVeLjnAqIol69u+JtI7i9bIDWCGvmlLyc2T1pT4XkoOCMBmacEcRBUbkL
	3GHHIUHHQZxZA3DmZnNgKHjz30Z/Oe1mjgVEuypcxie7cnP+sst5YM41jSyxegX9od/j
	cZWSavkAHhL0jFxvVqfoNQQqBZPy99Em/OURClD6uZGef+1z18RNtl+Jt1n0671zhzsD
	z/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jdsyzIjwnKDRaVv+HRmSzYeI6pQdGQcUzgRksL84vPM=;
	b=ObuUHozG6rfhgPs+dZ+JFEDGtpjJ7zT1mrPK4uZKF4H88aUGIkqNOdK0ah+YUWLF8Z
	Gz9C12zEnoDecdYXcS2rUSE3sJfP81ANAFW7qzkIMXGSa/PkGQfgYKVNatYo/eV7xZhY
	cLFLF9TD2jxTnfTV/7phdJr0oupwwEddxZsGQ5hYD8wMNXxkXCfkx0H51yPI8x3wjnb/
	TSsWRc/vFBGqNBQNeLdXMeVFK+jud4UgbMrdkHJGcGu7mrLKhH9PaUiCrrlt6cLXXn9b
	b1LyeN+yzSHZMMpLVzWY2gm2iVCF91DVbUwbvdK5JgNHlMtT7dylyYmAponJd0West3A
	v/DQ==
X-Gm-Message-State: ALoCoQn5ViwwRsycJqlbI3caa88hjbnwHc2agC9zwyDCCfnPajnsbg3hmj3zbsReX8tSY8Gkn0Ak
X-Received: by 10.107.130.155 with SMTP id m27mr36476353ioi.133.1447682263796; 
	Mon, 16 Nov 2015 05:57:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 05:57:24 -0800 (PST)
In-Reply-To: <cover.1447659023.git.wenzong.fan@windriver.com>
References: <cover.1447659023.git.wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 13:57:24 +0000
Message-ID: <CAJTo0Lb_4Cyt+40faL1tddvJv5PDiG4cWcN9bjfGsBRU5yfY6Q@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] qemu: fix CVE-2015-5225, CVE-2015-6855, CVE-2015-7295
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
X-List-Received-Date: Mon, 16 Nov 2015 13:57:45 -0000
Content-Type: multipart/alternative; boundary=001a113ecd9414e1f40524a8cb0b

--001a113ecd9414e1f40524a8cb0b
Content-Type: text/plain; charset=UTF-8

On 16 November 2015 at 07:32, <wenzong.fan@windriver.com> wrote:

> Wenzong Fan (3):
>   qemu: fix CVE-2015-5225
>   qemu: fix CVE-2015-6855
>   qemu: fix CVE-2015-7295
>

Master has the 2.4.0.1 upgrade now, can you rebase this series?  At least
5225 is fixed there already.

Ross

--001a113ecd9414e1f40524a8cb0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2015 at 07:32,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenz=
ong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3u5" class=3D"a=
3s" style=3D"overflow:hidden">Wenzong Fan (3):<br>
=C2=A0 qemu: fix CVE-2015-5225<br>
=C2=A0 qemu: fix CVE-2015-6855<br>
=C2=A0 qemu: fix CVE-2015-7295</div></blockquote><div><br></div><div>Master=
 has the 2.4.0.1 upgrade now, can you rebase this series?=C2=A0 At least 52=
25 is fixed there already.</div><div><br></div><div>Ross=C2=A0</div></div><=
/div></div>

--001a113ecd9414e1f40524a8cb0b--
