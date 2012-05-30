Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZkLj-000062-OZ
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 16:58:11 +0200
Received: by wibhm14 with SMTP id hm14so3444513wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=b692oAEIkgifrglpE5zw/Vw9U9SitAhZEmDsiU5mxL0=;
	b=jKBMWiPUq+xW4oS/J3Qd3aPg0jHt6x8vPW9Z7+ysp09tDmb2+5E21OpqxOnoXCaGYF
	EZmDwYkQtcn8xGGfIkA+blZbsVXHbfEOUflvMXjLHrY2Ot+yKIaGUqVpc7rkFCn3Jtcr
	yS56n1PXzo0OEOuY4YaW+puzAqCRWbJ9PiA5FBrJy6Wb4mEjAFR0OKwQ8f+/5bsRmG/u
	eUUPLLYfX79AATgStKuyTiz8mbc1fNOj5Go0RAEeOFYAwrPiwVtCM5VdFKmVl/wnZizJ
	pBI1OnxpBBTOkz0QtqnY61CNxugX56JNJVsse/ZMAQ4udMIjilVLBGRJLoYfKMEW9JTb
	TY3g==
Received: by 10.216.144.216 with SMTP id n66mr10339750wej.107.1338389273246;
	Wed, 30 May 2012 07:47:53 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id f19sm57065305wiw.11.2012.05.30.07.47.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 07:47:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAAB-1yxXDY4O-JV_gpW8eBmfXU=-Jcp4yc0oqZe1WVr6T-rn_w@mail.gmail.com>
Date: Wed, 30 May 2012 16:47:54 +0200
Message-Id: <559834C0-53F2-4E17-8A48-4061CDB0B63B@gmail.com>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
	<2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
	<CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
	<CAAB-1yxXDY4O-JV_gpW8eBmfXU=-Jcp4yc0oqZe1WVr6T-rn_w@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 May 2012 14:58:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,

> On Tue, May 29, 2012 at 9:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, May 29, 2012 at 12:46 PM, Elvis Dowson =
<elvis.dowson@gmail.com> wrote:
>>> PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc440"
>>=20
>> may be this should be be
>>=20
>>  PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
>>=20
>> other pieces look good


What does the -nf suffix do ?

Best regards,

Elvis Dowson=


