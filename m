Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 817FB65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:24:18 +0000 (UTC)
Received: by qgii95 with SMTP id i95so16556559qgi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wGWZ3lmrEltUX5Q/QCtKjrwfEdtSOcTk4+ZkKERGqaE=;
	b=aEyo6XomfdDn7MN3aZJUqGsWwCITm8XhhVFG69W2HF/U7LrNMovUSD4CtVXWjq2Lz/
	rCcVkSqYHT+xPTOxWZ+2W114jLZkPYMOiTG1i1zk8U2SRNVW3QIJlo1o/go6zvDC45wI
	kwZcdc8Iyo4bU8L9NpZTH+d9DX4skbAYRNj/KuUlju084i8EERU36F844FLJkzq5mclQ
	D+cVoPG19OQtbFD1d5zWRO2ED+HoBtZOKV+ktnU7tELO4DKmXbLRVBaPmqK9fpG3bTNh
	DPEw63qKlh16UvPoRxOcBMbGDfH2OUFu96zKCqfnoDDPoYN5AkjMnIB0dAkrDVkjjwnt
	xcYA==
X-Gm-Message-State: ALoCoQkbKl60wzFNCcMtbL1QplAMAQM9cSsySQGxtgNQli4jDe7LKhJ7/qUyaYHSeiKrR98k2XRg
X-Received: by 10.141.28.211 with SMTP id f202mr20286311qhe.93.1437143059032; 
	Fri, 17 Jul 2015 07:24:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 17 Jul 2015 07:23:59 -0700 (PDT)
In-Reply-To: <1437142674-8167-1-git-send-email-george.l.musat@intel.com>
References: <1437142674-8167-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 15:23:59 +0100
Message-ID: <CAJTo0La3bqO7ssvWgRKTFNm9K1WU-zAnmZ-69_1o7Q56A6Ze2w@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added skip condition to kernel module test
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
X-List-Received-Date: Fri, 17 Jul 2015 14:24:19 -0000
Content-Type: multipart/alternative; boundary=001a114218c6868613051b12f1fb

--001a114218c6868613051b12f1fb
Content-Type: text/plain; charset=UTF-8

On 17 July 2015 at 15:17, Lucian Musat <george.l.musat@intel.com> wrote:

> because it caused failures in core-image-lsb images.
>

Sounds ominous.  Can the commit log please say *what* the problems are for
someone curious in the future (or present, like I am).

Ross

--001a114218c6868613051b12f1fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 July 2015 at 15:17, Lucian Musat <span dir=3D"ltr">&=
lt;<a href=3D"mailto:george.l.musat@intel.com" target=3D"_blank">george.l.m=
usat@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">because it caused failure=
s in core-image-lsb images.<br></blockquote><div><br></div><div>Sounds omin=
ous.=C2=A0 Can the commit log please say *what* the problems are for someon=
e curious in the future (or present, like I am).</div><div><br></div><div>R=
oss=C2=A0</div></div></div></div>

--001a114218c6868613051b12f1fb--
