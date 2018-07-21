Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id BB83878AF8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 17:27:21 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id z8-v6so13023175qto.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eSotHEOiTxuB1Y9wkz1k7V6ruacDDsvZ+/fNCd1fL0E=;
	b=bdKHWRV4zI0U6/rbEJia5F2BtJHdWzW69Cd/AecsYms+aJYHTPOB4T8Kh3rb3/ecFt
	IhNXTJuoWHtYrXk8tR1uomYYqJ6RytWVKwYGfJbDuwvkl+btzHZO3YqBapfRN50W0JOd
	ZvocKGWxzsLskHRqQroh2RchV4d8CiMuTCSfaMgDNoHhvVmRVbOvMsCM4WkAAD0mrfMb
	QiPVHIrtIoutRGtXRJH5HJyU/DdzofFoeL+7vyrt5K4aYtqCcNbbHAtPx5lHIIbVWFxh
	Ca8d53OUWVn1gg8grlEI/DYJNiLNvNZ5C1Z9qcjBEJ2a7QSfRXg/CX2kLerlOMu+WVw8
	/M0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eSotHEOiTxuB1Y9wkz1k7V6ruacDDsvZ+/fNCd1fL0E=;
	b=JrM21t9X66LUrc4Se8Keq26lhHbn4hhSzBW4pL2RR0pnMpAl1EIHOUmaE92w3Q6/dA
	d1r3mMhlxMSt2HQpELbvmNKvAEWNSl89xVqlqCWbRrtPObEPIJWrPPKL81X5vqz0o4w4
	sOsjtr3Gay9XTQNXWBovPiMkkjdWn0LPMEGOQFd0D+BE0HGjfy80JOgIJ26EKD/22p9j
	6whrYD1DTB4OPwYko3GQe8Beh6WUwalF5CMAsAChUbSlaFsh6QpNkJVHrpmh9uZCQuhd
	7hBcUB8UiOCw/6l1SmobLYqL7EFe8Ebm1ekCyQO1y01geUtaWV0RnU8ipFwe6HJ9MVuQ
	/fkw==
X-Gm-Message-State: AOUpUlGNjbUnyUPIaadYBDkt5Ab7UgLLdmgsa93cspxrjzIi7U/R7Mfp
	HOCWMJ0ULu29D4jWSjJI0xkcZn/mDT92wrJ4Vik=
X-Google-Smtp-Source: AAOMgpdpqYfSzhY7cEdO9PuFdE94cobc5oa8FvXS/ywBa+D4gvpWf6KPBYN7v4W6EI185Cazly9YSb6dR3Kjz/hk0Dc=
X-Received: by 2002:a0c:8441:: with SMTP id l59-v6mr5839147qva.5.1532194042575;
	Sat, 21 Jul 2018 10:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180721162715.12611-1-raj.khem@gmail.com>
	<CANNYZj8xEFn1inNpWqRcYd7Zu9=PwYVMGdm6QKEzK3ErhVHHcQ@mail.gmail.com>
In-Reply-To: <CANNYZj8xEFn1inNpWqRcYd7Zu9=PwYVMGdm6QKEzK3ErhVHHcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Jul 2018 10:26:56 -0700
Message-ID: <CAMKF1srNM3yVNb3sCyVCiwWygtnuZq4g63DhK1EZEZGFo+f=9g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] glibc-locale: Fix host-user-contaminated QA errors
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
X-List-Received-Date: Sat, 21 Jul 2018 17:27:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 21, 2018 at 10:03 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> 2018-07-21 18:27 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> > Fixes
> >
> > ERROR: glibc-locale-2.27-r0 do_package_qa: QA Issue: glibc-locale: /gli=
bc-binary-localedata-hy-am/usr/lib/locale/hy_AM/LC_MEASUREMENT.tmp is owned=
 by uid 3004, which is the same as the user running bitbake. This may be du=
e to host contamination [host-user-contaminated]
> >
>
> This long-standing yet elusive error has acquired something of a
> mythical status. Can you explain what was going on and how the patch
> is fixing it?
>

-p option to cp was preserving original ownership of these files which
is actually same as build user
we were doing chown operation but it was escaping some of these files
especially these .tmp files
aside from this, why these tmp files are left in transition needs more
investigation meanwhile this
fix makes sure that we do not preserve the ownership when installing
into staging sysroot.

> Alex

