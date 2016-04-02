Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 26D6976C9F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 09:30:12 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id x3so108049577pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Apr 2016 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=GBPKrWbEkigvoAkpuHOu1WWvOftIQFhaa6+o7E7kaxc=;
	b=khAfSvy86dGioHeb1Xw3W3WlQJHL0g0fzoJHSKCbP1rufMwkrfwplJyalPtAaBb7Q7
	A63X6bd3Gj586OyWgL8gxdocKev3gndmu68ofBIxc94cM/Yw9ArfZNfhWLzdYam0Omxy
	YNH3r8rOcuA1D1mPGXciXz5w5P1ZBLo1VlEEznTbv1OFh5xDOFH/C6craFfqwE7lEMVg
	kq/mOedC3JQGqaZKPqigsB1RHbnZxqw7FP/F1R8tx1CXOc0jGv5Mez8RqFTrYu1wlnTO
	/BN80mD0qQU0IXUlZFyOgarxZa0Gn/C9K/0Rpq0zeFrFIUQIn1LWpvlqJTdU0uEpKTcE
	N6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GBPKrWbEkigvoAkpuHOu1WWvOftIQFhaa6+o7E7kaxc=;
	b=ebgE0nLSbCdLeRbzbbMpjsFmK9+rDOcgPhftl15UuKeAnWZ5Gn4qfuGpRBPin2X9ZE
	m9njvL750bWm0IZoS8UFIOA2UmwFzKuWurnSUxdeXdKhCgtGfSAGxlfTQUhXl2R6igFT
	ze8+7gCRIZo4RNEn4KffHyi3lplMGdnhLaGePDaiJ2H3KAckTAKe6mOOV4IlTljnwXTB
	uUGZvcWCaDcEV+/XX5hzUquXMz5ttlDNOFklYozC8iD941rK/qO1EpSqQAydpciJ15sj
	Ph55hPqN6YjFqzeLIEDol4Y8skF8oSMpx2pt57e6ZH9j8lQv19Frfzmb9eWKHGFADRUh
	p7gw==
X-Gm-Message-State: AD7BkJKdnLm/CjuX/yYqPLDKQhFohSuJC2EeS9ylzrFbpP3Shogirl+/h3dtgxN9HXvHxg==
X-Received: by 10.98.14.68 with SMTP id w65mr4965610pfi.144.1459589413673;
	Sat, 02 Apr 2016 02:30:13 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	17sm25440787pfp.96.2016.04.02.02.30.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Apr 2016 02:30:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1459586928.7348.75.camel@linuxfoundation.org>
Date: Sat, 2 Apr 2016 02:30:02 -0700
Message-Id: <79CCC584-CCE7-47D5-A8F5-912F1CF3E272@gmail.com>
References: <CAJ86T=VWi3JQoCs23RqrW95M=z9DszLfgAo3fOT2UaqiJty5jg@mail.gmail.com>
	<1459586928.7348.75.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Staging machine specific kernel headers in sysroot
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
X-List-Received-Date: Sat, 02 Apr 2016 09:30:13 -0000
X-Groupsio-MsgNum: 80427
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CE4EF7B1-A9E3-497A-8A2A-64C5448CE541";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CE4EF7B1-A9E3-497A-8A2A-64C5448CE541
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 2, 2016, at 1:48 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2016-04-01 at 20:38 -0700, Andre McCurdy wrote:
>> Say I have a kernel driver with a user space API (simple struct and
>> ioctl definitions) defined in a header file which is part of my
>> machine specific kernel. The header file is not found in the upstream
>> kernel, so doesn't clash with anything in linux-libc-headers.
>>=20
>> Is it OK to use something like the following in my kernel recipe?
>>=20
>>  sysroot_stage_all_append () {
>>    install -d ${SYSROOT_DESTDIR}/${includedir}/linux
>>    install -m644 ${S}/include/linux/foo.h
>> ${SYSROOT_DESTDIR}/${includedir}/linux/
>>  }
>>=20
>> I've tested it and everything seems to work fine, but I'm wondering
>> if
>> bypassing do_install like that is going to cause problems somehow?
>=20
> You can probably just do it in do_install to be honest, then on target
> development would also work.
>=20
> The trouble we usually have is that people expect more and more kernel
> headers to be installed/usable (e.g. to build complete modules =
against)
> until we have a complete build of the kernel there, at which point you
> really want to use the kernel shared work directory instead. We did
> pretty much the full circle on that.
>=20
> Or people go the other route and hack linux-libc-headers to install
> their header as well, and then the whole system including the compiler
> becomes machine specific. I appreciate you're not doing that, I just
> want this answer to mention it as that is a much worse idea and the
> comments in that recipe reflect some bad experiences for good reason.
>=20
> So in summary, you can probably do that reasonably safely, on the
> understanding that any user of that header will also become machine
> specific with a kernel build dependency. There is risk of overlap if
> upstream do create such a header or API but its probably not a huge
> deal.

if its really not to be treated as global kernel UAPI then wouldn=E2=80=99=
t it be
better to inherit kernelsrc and access it relative to STAGING_KERNEL_DIR =
?
if you put it in UAPI namespace doesn't matter which recipe brings it in
the SDKs will get those APIs regardless who puts it there so you still =
have
the global UAPI namespace contamination that you are trying to avoid in
first place.



--Apple-Mail=_CE4EF7B1-A9E3-497A-8A2A-64C5448CE541
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb/kSQACgkQuwUzVZGdMxT17gCfXGLbgDlHXRoBVdGOK8N7vuGT
CD0An3u/Bs1VzxzLF6o1IYHEDXGaNvUB
=tnwQ
-----END PGP SIGNATURE-----

--Apple-Mail=_CE4EF7B1-A9E3-497A-8A2A-64C5448CE541--
