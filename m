Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E69F577BC3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 12:35:12 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l68so22990303wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 05:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=r/E8Zn3bdUnNuLm2roLB1ggS/f1TYb73H+phBFYWGN0=;
	b=WZ81+idPUqfMg6dIsXstoVRO9RMQHm7BVeqLz4Dut+8PBKCmkR6wzY21Fhc4nwyA61
	gYxQM56B3hNVWo7uc4VI1E95MIZB38qE7F23teEtt4yuNkmpARUwnOMhEtPXLyzcFiNR
	7OpPBrnLrk2Pat+ZdF9cUONQDY7tQD/vk/Dc27mCL8rURpZwvsjSlPbib9F+WAlDF2X3
	5mIDeX9sFvL83TaRGuPXcZ8eQ1qM/bss4FaW/CXoIx1gVLDecUywcRQ3P8USEvjwhThL
	Zjs25kKr9uHoF12gQIXBsoRaL7CId94T1Qos3mnNFtmbRGAdcz6naLEzO4pHb1WSN/8v
	jW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=r/E8Zn3bdUnNuLm2roLB1ggS/f1TYb73H+phBFYWGN0=;
	b=HfW+s3Ae4nwdc/ZGHJi21g3zFkeyHXObbCANULjCVPhkoDwjRFGbSJZ4f/fEGk9Qxw
	kMDTVb4xPHJDjlkNebypxcx+sNtQUsyHqACyMw0ScGvPpXkTp13CTf88X8XRq8cu5XWy
	idEdvqA2E2PN9W9D3Lir13mlDBAAYPLrIf2FuhZQyzVJNJ4RPi0UN7YsmoIF4BxXlnci
	g0PiWYb6Hv7ihmgykJScrWs5tKN3Xl/0QPiXsL+CJ/2weahAWRguo///nSD5qFKNZpX7
	j5Wqr/0HML8k4gv5WnedWaIRREwyhi8kTFqs2X7S1KPw47N3G/2wfWFxTj75dWF0lQJT
	NlTA==
X-Gm-Message-State: AMCzsaU91S8mjCnZvHvrNyi2f6TP7TumcJyW+8cYETtcdfau80lm3inP
	KxabuAXijq/Y+rXxMH5flIP7XdYAYX7NLQEydnCHNHQZ
X-Google-Smtp-Source: AOwi7QBpq56ot58aCsykUwJCEwbLbL4X4Ga6+4ep6UpVlNMJ+AJNTP1VES6zXyCjNs+90EnbIhSBU8OXSxKULytu6Y0=
X-Received: by 10.28.143.130 with SMTP id r124mr5078280wmd.122.1507552513546; 
	Mon, 09 Oct 2017 05:35:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Mon, 9 Oct 2017 05:35:13 -0700 (PDT)
In-Reply-To: <20171009123030.2783.41744@do.openembedded.org>
References: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
	<20171009123030.2783.41744@do.openembedded.org>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 9 Oct 2017 13:35:13 +0100
Message-ID: <CAPyrkgyxtx7faVZu0g7WQYMiTi=FwXabiGXPExtHt_sA_OhDRQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYmdjcnlwdDogRml4IGJ1aWxkaW5nIG9uIGFybXY2?=
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
X-List-Received-Date: Mon, 09 Oct 2017 12:35:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 1:30 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> =3D=3D Series Details =3D=3D
>
> Series: libgcrypt: Fix building on armv6
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9276/
> State : failure
>
> =3D=3D Summary =3D=3D
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Added patch file is missing Upstream-Status in the he=
ader [test_upstream_status_presence]
>   Suggested fix    Add Upstream-Status: <status> to the header of meta/re=
cipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-=
when-target-.patch (possible values: Pending, Submitted, Accepted, Backport=
, Denied, Inappropriate)
>

Huh, it has got an upstream status:

+Upstream-status: Backport

I think this is a false-positive.

>
>
> If you believe any of these test results are incorrect, please reply to t=
he
> mailing list (openembedded-core@lists.openembedded.org) raising your conc=
erns.
> Otherwise we would appreciate you correcting the issues and submitting a =
new
> version of the patchset if applicable. Please ensure you add/increment th=
e
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] -=
>
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

