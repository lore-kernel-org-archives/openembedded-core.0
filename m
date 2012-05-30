Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZl50-0007vp-9W
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 17:44:58 +0200
Received: by wibhm14 with SMTP id hm14so3534516wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=vDPh0eVEUnPM+1yt1/t4OBUgFlouOF+UePEK+uG1STQ=;
	b=pdbwUxLYZoZioYRHQRhoQfccUnrnAYibndYvX5vrE7W/fOK6BuO6qaA/MDyecFEKQ6
	hMwUqcwV20ecX0n4d1zaoW9Q6Eip0TfWczgzoX24Rtqi5JY6vl09+rEeiXOr3X1gq06P
	Z0lihn4RzRFhq9pwT2HD2hlUo+bsBqq2kp2LLuBTrU9RW12jE3J7bmGCq2TPUoxAJqLE
	YlWOaTdpWoDW+Z5izIXZdpdkVr1k+YTlJpk+4T+iUMgJM6GXgfmceVy9l+MhGV0VGM0a
	I2C3D71gJMVOSW8UsfqLY6qfS1lg15JKu5Qx1BAbId1f2voojgLaSMr/iBz4D95I42p6
	Dvlg==
Received: by 10.216.227.101 with SMTP id c79mr11025876weq.188.1338392079747;
	Wed, 30 May 2012 08:34:39 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id fl2sm116281wib.2.2012.05.30.08.34.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 08:34:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sqhA4UMK7xWwpGjF4SOvVBAwGST7uv1nwgu6aa1QCRuKg@mail.gmail.com>
Date: Wed, 30 May 2012 17:34:41 +0200
Message-Id: <FE4821DE-4305-4850-94FA-5248620FF105@gmail.com>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
	<2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
	<CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
	<CAAB-1yxXDY4O-JV_gpW8eBmfXU=-Jcp4yc0oqZe1WVr6T-rn_w@mail.gmail.com>
	<559834C0-53F2-4E17-8A48-4061CDB0B63B@gmail.com>
	<CAMKF1sqhA4UMK7xWwpGjF4SOvVBAwGST7uv1nwgu6aa1QCRuKg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 15:44:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On May 30, 2012, at 5:00 PM, Khem Raj wrote:

> On Wed, May 30, 2012 at 7:47 AM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
>>=20
>> What does the -nf suffix do ?
>>=20
>=20
> indicates no float

What should I call the tune configuration file: tune-ppc440.inc or =
tune-ppc440-nf.inc ?

For the initial build tests, I will first try to get this running =
without a hardware FPU. By default the embedded PowerPC 440 processor on =
the Xilinx Virtex-5 doesn't have a hardware FPU. But one can configure a =
LogiCORE IP Virtex-5 APU Floating-Point Unit (v1.01a) to get single or =
double precision FPU support.=20

How would I handle file naming and configuration for these 3 possible =
variants (i.e. software floating point emulation, hardware FPU single =
precision & hardware FPU double precision)?

Best regards,

Elvis Dowson



