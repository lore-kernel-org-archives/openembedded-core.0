Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA8574925
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 04:46:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 66so1317151wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 21:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CW+XvQUTaxuzhqyFr1KT75//hT2v1/e+ee3Y/sq0Qmk=;
	b=l9iRKee9TcKNEaxFdKIuQFlbm0Ehlp7mD6W/+HicDmqg0lpbSESo0hKKIAYHH6+2SM
	UHsFEnSEoLlh26D2N9ygRJWhcEqy5BtqhRAaD2JCDw9CWZTcc4UJWzvl6ZIqK7ZalXGD
	TJDh7P+6gfcJ3mnqpGw393hf7SwWO3WMaok7YjDnGAcF/X0ckPJC529ogwI79oEeqFr6
	Hs6mFaKzxUqV/ToTVMaaDNOBZArt9n+XVAwnCFVE+nXO2DxIiC/Qbq3JHSAdUgMZ/eU2
	FsnjwXk76RII1QxmH9V5sADjIWOxvAoOb6sPAfEFgT+04x+XC1lSIqoSYJQK2VL3aDst
	0jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CW+XvQUTaxuzhqyFr1KT75//hT2v1/e+ee3Y/sq0Qmk=;
	b=mv4DkneX4XIi4BT7pDBLqe8lyl/b7cLNUzSEp+2oox7FqLnPOE7uyrf4KXoncR5fOh
	9T51JkkJ28/YOl3hqycYsi7Xsd+YmWVFgW6LuU0jRKc8QTea8Nrv0nh4VEiLLZfXPl0c
	AMgGF93TeNdpFbDsPVWQJAPLyrB+udCsx8l15ElB9E2GB1cBbIZR7VFd0Nvx8HGa1pgo
	n7qUND9zCuKp7NKNBKfoJ0LS2f53E01aF9XaJJ09LmbsNf8WVBLnetdZEpJ1hgTSZZ9s
	JM3Dg/fST8nJvdV0AoGJiBBvCdupuMtnzVrT4jftRR28F3hQE1ZaJ+qDWZBJuhBCkgQh
	HMZA==
X-Gm-Message-State: ALQs6tC2iNOtz462tgD6zZDdrmAcD2s/hYire/0KNKMGHglFPanKmrYn
	zGr2iuPG2BqnizC6jITpVDcHz5sFFBZzFkfMgYw=
X-Google-Smtp-Source: AIpwx48bCCVmvtieWuSPL2j4S36ZxKc+M4SprtpRfTF08cfmvD6ATR8FVNDjsyByVqb52PgnE8qgkiKI9FU8x03TakE=
X-Received: by 10.28.124.14 with SMTP id x14mr1411065wmc.86.1523421966288;
	Tue, 10 Apr 2018 21:46:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.99 with HTTP; Tue, 10 Apr 2018 21:46:05 -0700 (PDT)
In-Reply-To: <CAJ86T=X7fLsJp==+bSY4BLf2kXxyWiumPKvNuS4Hv0p=wcH8tw@mail.gmail.com>
References: <1512524359-16132-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=U=fT8tTyRPDEzk78U2qxOXB7CW=R39TOCJfwfcLwxfTQ@mail.gmail.com>
	<CAJ86T=X7fLsJp==+bSY4BLf2kXxyWiumPKvNuS4Hv0p=wcH8tw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 10 Apr 2018 21:46:05 -0700
Message-ID: <CAJ86T=XfsBehUnJGyoi+ax==HbVCmD9KqTk1Rm+m0NGhEzqdew@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] bind: move libraries to own package
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
X-List-Received-Date: Wed, 11 Apr 2018 04:46:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 12:49 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Jan 23, 2018 at 12:25 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, Dec 5, 2017 at 5:39 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> From: "andreas.kling@peiker-cee.de" <andreas.kling@peiker-cee.de>
>>>
>>> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> (cherry picked from commit d74ebc91388941295a2321a295cdb06ee87fc38b)
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>
>> Ping.
>
> Ping again.

Ping number 3.

>>> ---
>>>  meta/recipes-connectivity/bind/bind_9.10.5-P3.bb | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
>>> index 13724a8..8309302 100644
>>> --- a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
>>> +++ b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
>>> @@ -67,6 +67,9 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
>>>  FILES_${PN}-dev += "${bindir}/isc-config.h"
>>>  FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
>>>
>>> +PACKAGE_BEFORE_PN += "${PN}-libs"
>>> +FILES_${PN}-libs = "${libdir}/*.so*"
>>> +
>>>  do_install_prepend() {
>>>         # clean host path in isc-config.sh before the hardlink created
>>>         # by "make install":
>>> --
>>> 1.9.1
>>>

