Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id BA9EA60068
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 21:40:50 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p64so141534652qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 13:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8defNFGtUzeBIAbPFOpXWt/Ybs3Tj7I/EAYdEXW3rPw=;
	b=Yn9iTIgjTfcdHPkIzi8OLZB93XQKTuWerMr6fgv7fD8x+q3YmHR+5i88vCU8sxoHEk
	0N5CzLkczLYjzI1pSlfucL3mQnkjUDkhx65BZ9aLKmOGl7//MbYm16Ryf8v2taLHmRo9
	WKjrwR583f9NHMhIqErEqIrpPDtPZWUJIy8UQTWymFRcGyEJPfTTbCewaRD+s+uXCU2p
	n/rrxpiDvjJUReeHSChTEaIQvxXPNp2blogAG8fTN4x6zq9Y23HJdP2XlWNAGYJVkRSB
	1f0Q+ZZ7e/RofW79y7acgPOA4bpaKMH+Ds3eIr8Qd0k9r/nmKg5u7w410PQ+vTWYjNtJ
	XNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8defNFGtUzeBIAbPFOpXWt/Ybs3Tj7I/EAYdEXW3rPw=;
	b=XiXE0Wkvn9q0VyLZ5bWRdYbsu2bNTImQReF0Ytis1fM4WOUHBPzuuWd5r6bJ30GMYj
	yHmxiqfJm83CDcIy51GyDkv0wtRFLlIiTPl3OsUyp/oqkdByMWAZi3jCcaMdUccD4lEl
	2js7wmYS9y9vL1N5gd/5HKVVnPPQufVtCaYadyg1anW3hXIgo7w3dG+UxiECesn5bNs6
	8g+U8DYiaFGZMuQpQWvlc8GztkO/dtPfJmvt9HgQAqEJ3S7F5HEUVfhtA2ZJdZfT6U77
	VzUz9aT1KBMkWqTbEbu3OyH3GB5LnoEhFU/a4pDUOxaH6mouJcrUl8s9korQSdFg8Ubd
	CNXg==
X-Gm-Message-State: AMke39mvSlTcwFRkaaw+PsxD0wO+Kr1BIW9A9eI2RT1aPhblVwij/USepN12hkYIP2+Y7OTBeFx6DsbrP73kTAzO
X-Received: by 10.55.3.151 with SMTP id 145mr15695070qkd.244.1489095651850;
	Thu, 09 Mar 2017 13:40:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 9 Mar 2017 13:40:31 -0800 (PST)
In-Reply-To: <d1ddc89b-02a0-a4c7-6e13-45fc917d8e10@linux.intel.com>
References: <1485209611-23858-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LZNJx08iHnc7G6ka57ky0=NbkV2WDE9ihT29-pba+8Y1g@mail.gmail.com>
	<d1ddc89b-02a0-a4c7-6e13-45fc917d8e10@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Mar 2017 21:40:31 +0000
Message-ID: <CAJTo0LYHqXgsO+k2x_xK=0KtKkHt9fWC+ok6MhM9XihtNVhK5g@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/devtool: Add test to verify "modify virtual/kernel"
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
X-List-Received-Date: Thu, 09 Mar 2017 21:40:50 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a05d9155054a5319bf

--94eb2c0b93a05d9155054a5319bf
Content-Type: text/plain; charset=UTF-8

On 9 March 2017 at 20:29, Jose Perez Carranza <
jose.perez.carranza@linux.intel.com> wrote:

> Annoyingly this bit is failing on some autobuilders:
>
> Do you have a list of workers where this is failing ?


https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/843,
so at least opensuse 13.2.

It may be related to the recent binutils upgrade though, not sure how
strings links to libbfd.

Ross

--94eb2c0b93a05d9155054a5319bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2017 at 20:29, Jose Perez Carranza <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jose.perez.carranza@linux.intel.com" target=3D"_blank">jose.pere=
z.carranza@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span =
class=3D"gmail-"><blockquote type=3D"cite"><div dir=3D"ltr">Annoyingly this=
 bit is failing on some autobuilders:<br>
        <br>
      </div>
    </blockquote></span>
    Do you have a list of workers where this is failing ? </blockquote></di=
v><br><a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly=
-oe-selftest/builds/843">https://autobuilder.yoctoproject.org/main/builders=
/nightly-oe-selftest/builds/843</a>, so at least opensuse 13.2.<br></div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It may be rel=
ated to the recent binutils upgrade though, not sure how strings links to l=
ibbfd.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--94eb2c0b93a05d9155054a5319bf--
