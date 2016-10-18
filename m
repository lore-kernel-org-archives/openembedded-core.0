Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9E341719B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 14:38:48 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 128so15337607pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 07:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xfN8PfvaWn6TwL2ZRU5TXedoRJ6hl3+AkN0ZujUM5F4=;
	b=oA7kzUTl308qde0jmlXTgNfHZsijJpW4hkfs9lid5Nrc3AsJpuqo7ZhyZgYUEmxq4X
	SSevsylgBGM397RfejKBXDIye5b5t6j71t5xB+xlKeHLlBVKK5k2uCL1ZAFhgtk/D/n/
	dPJZnxA1rWhY2b/5znLXwQr3gMvmnMRgj8aBhF9O6QKj0QRdgswDxoHNI0eCu2g9Wo2M
	reXDPkC30u+j6Ls14WUDdjxqYograxElOysKxr3HAnw48kaAksO6cJVIXlLIqQHFfUK7
	ZXxfBh8pEo1EaaQSSvazgWEnaS08MMEi+sdhfTgI5SsckfkCuCc80K/0RbnmO6h19Osg
	Ar8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xfN8PfvaWn6TwL2ZRU5TXedoRJ6hl3+AkN0ZujUM5F4=;
	b=Zn5dpZO1JRilV4paR4sIkSrRkynof9piYi9DIyxwdjrZwu5kW4z7fN6kurEwKUsC9E
	SyipOoCZlLAXM6EGM3iuEzge8JPVApO0mOWVHNPNtTKbdSUIJaxeJydQo7yTsv8gvbQ4
	+iy9b85NZupbuPcCYsWogkscl75DyMi3r+NRWiJoUK8uVf7dVRB3W+BjsiXgjYOyWGSJ
	bPuXJ6e6g2ToUkQjo4hTVGwV9H0ngqH9G6l7F9sOqs8GnAWFZwDWmpsex0I0fT2oNQQQ
	yz95RKJpNSp2coJhWhnjlbaw2XShz6Jc0ZYCENT9i4kPQxFNIf+5h0+8ZSdIDngY9U7G
	5bow==
X-Gm-Message-State: AA6/9RnPWyq2Mir7qEF+4J1/FgN6yfJH1y7FBM9DmDbxw3TAN6vjXBsIk+89VTO4l3j1ew==
X-Received: by 10.98.97.68 with SMTP id v65mr1259099pfb.81.1476801529594;
	Tue, 18 Oct 2016 07:38:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:10af:7454:ca4e:95f6?
	([2601:646:8882:b8c:10af:7454:ca4e:95f6])
	by smtp.gmail.com with ESMTPSA id 3sm56615607pfo.31.2016.10.18.07.38.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 07:38:49 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Khem Raj <raj.khem@gmail.com>
X-Mailer: iPad Mail (14B71)
In-Reply-To: <e6c381fc-a7e3-a1ae-399b-636bb1208130@qt.io>
Date: Tue, 18 Oct 2016 07:38:48 -0700
Message-Id: <7DAA6609-2261-4C8A-98AE-2890A5217368@gmail.com>
References: <1476198850-1529-1-git-send-email-samuli.piippo@qt.io>
	<64ADE2BA-C5CE-47C5-975F-05C11DE145D2@gmail.com>
	<e6c381fc-a7e3-a1ae-399b-636bb1208130@qt.io>
To: Samuli Piippo <samuli.piippo@qt.io>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] systemd-serialgetty: add dependency to agetty
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
X-List-Received-Date: Tue, 18 Oct 2016 14:38:48 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Oct 18, 2016, at 3:00 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
>=20
>> On 18.10.2016 02:36, Khem Raj wrote:
>>=20
>>> On Oct 11, 2016, at 8:14 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
>>>=20
>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>> ---
>>> meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/rec=
ipes-core/systemd/systemd-serialgetty.bb
>>> index 768b130..c4e5310 100644
>>> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
>>> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
>>> @@ -38,7 +38,7 @@ do_install() {
>>>    fi
>>> }
>>>=20
>>> -RDEPENDS_${PN} =3D "systemd"
>>> +RDEPENDS_${PN} =3D "systemd util-linux-agetty=E2=80=9D
>>=20
>> Does it need agetty specifically ? since there are other providers of get=
ty as well.
>> I wonder if its possible to use those too
>=20
> serial-getty@.service is using /sbin/agetty, so currently it's the one.
> systemd also has util-linux-agetty in RECOMMENDS, but that could perhaps b=
e removed.

I see, in this case its fine however it means we need to edit out more if no=
t using a Getty
>=20
>>=20
>>>=20
>>> # This is a machine specific file
>>> FILES_${PN} =3D "${systemd_unitdir}/system/*.service ${sysconfdir}"
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20

