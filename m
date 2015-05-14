Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 87D5A72207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 20:39:51 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so46586806qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 13:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Rsu1Rnv6zGopxl/1DtGJM9L/ZNGQQnWfxEmEqU5fAbA=;
	b=XSZL2QIzM2i0eSiU2g3puPMTsonjH1dBnLn9/O5jUH6mUeDHkAA09eybRf6sRYGZrx
	VQg0ix26IT0Jx0AGR3a1WJ435wKdXeviYLv7MFt/TJdYjgOlaStky4zAYjC0Td7j2/rM
	OypyRqES/c7ilXzX4m75V7hpobmaYQH5dWPCCYxeT5DCpEqOiLzAH8Y9s2sNF95DERUn
	az3fmzmQF9xhidANChGKooBe/iwHB2tRr5kwqByuvI7ts1xLLvDPuS5cBMDQCER+sqsR
	VNzEolO6WqkuUQTj0syZdBNBeV46KpxUvM+/iYtxDlauScEnokOSi+Mt8pzFQPxS5eZs
	K0eg==
X-Gm-Message-State: ALoCoQneW9BTpAroU59QVqa8+4QQNtPaocsbJPCLrn3+PVobFH4cfIDNZ6KNo3Oo9TEETKHc/NGC
X-Received: by 10.140.235.77 with SMTP id g74mr8549755qhc.64.1431635992662;
	Thu, 14 May 2015 13:39:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 14 May 2015 13:39:32 -0700 (PDT)
In-Reply-To: <554CDB2B.2090607@ni.com>
References: <1431040791-6559-1-git-send-email-haris.okanovic@ni.com>
	<1431040791-6559-2-git-send-email-haris.okanovic@ni.com>
	<554CDB2B.2090607@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 May 2015 21:39:32 +0100
Message-ID: <CAJTo0LbsWDv9ncSn85zjGB3Avx+WfmDVg=TYHQAKQwEmPRCE9w@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
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
X-List-Received-Date: Thu, 14 May 2015 20:39:52 -0000
Content-Type: multipart/alternative; boundary=001a11354a00ca66e0051610bab3

--001a11354a00ca66e0051610bab3
Content-Type: text/plain; charset=UTF-8

On 8 May 2015 at 16:50, Haris Okanovic <haris.okanovic@ni.com> wrote:

> Note that this patch is to apply to the Dizzy branch of openembedded-core (
> glibc 2.20). It might cleanly apply to other branches also using glibc
> 2.20, but I've only tested with Dizzy.
>
> CVE-2015-1781 is fixed in glibc 2.22 and later.
>

Will you be able to port this to master which is currently glibc 2.21?

Ross

--001a11354a00ca66e0051610bab3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2015 at 16:50, Haris Okanovic <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:haris.okanovic@ni.com" target=3D"_blank">haris.okanovic@ni.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7s0" class=3D"a=
3s" style=3D"overflow:hidden">Note that this patch is to apply to the Dizzy=
 branch of openembedded-core (<span class=3D"il">glibc</span> 2.20). It mig=
ht cleanly apply to other branches also using <span class=3D"il">glibc</spa=
n> 2.20, but I&#39;ve only tested with Dizzy.<br>
<br>
CVE-2015-1781 is fixed in <span class=3D"il">glibc</span> 2.22 and later.<b=
r></div></blockquote></div><br>Will you be able to port this to master whic=
h is currently glibc 2.21?</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a11354a00ca66e0051610bab3--
