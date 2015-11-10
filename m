Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2A23076E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 09:14:59 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so147819254wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 01:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=4SqhPy/uEXQmkOtu2AfV7s2XaeXS96/Z5ln88O01CDY=;
	b=w/Reh7ZczxjA8tDaMuEDWkrm7MA9sOQ5lihcp1ef5oG/M70zQt+ulDc57txPyPZZ2S
	biwHyoxjXr/hZMBTasPEEGNe/lxy9Cafhk3IWMh8vz6X2+kmzccNQQHiMM/AW5QYdm2I
	aRvdOIpZ9W4VK2GaH3b/vbecsl+Q4M0PYdtPqQFfvBAlnbS+5k7UGofFokq/Dya3ReZN
	e9aCT5GUEThH96+LJP2oytVAzwXf20aBqfS4q3xVg9/WVvCm8EHI0fum3Ij4d87qp+QM
	siGGIyws7FEKPoxkwflshJPWBI6r16DFCH2L7iPtjEFXlAxDNxWFrgP4CwLJukSOWWJy
	KISQ==
X-Received: by 10.28.4.7 with SMTP id 7mr3206190wme.85.1447146899426;
	Tue, 10 Nov 2015 01:14:59 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	b12sm18678241wma.6.2015.11.10.01.14.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 01:14:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
Date: Tue, 10 Nov 2015 10:14:57 +0100
Message-Id: <E909DBB3-5F90-4E81-949D-93E7D3960988@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
	<A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
	<CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Tue, 10 Nov 2015 09:15:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 08.11.2015 um 00:31 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 7 November 2015 at 10:36, Jens Rehsack <rehsack@gmail.com> wrote:
> I look into it and send a v2, if necessary
>=20
> Thanks Jens!

Since I couldn't reproduce it (on a 12-core machine using different -j =
settings),
I proved the Makefile.am and resulting Makefile - looks fine for me, =
libusb-1.0.la
has among other things ...linux-netlink.lo as dependency.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


