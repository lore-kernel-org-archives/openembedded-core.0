Return-Path: <yamane07ynct@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7877FDE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 07:19:20 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v18so923512iol.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 23:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HR0eItcWbs/D9LT9azi33g7DXy1Wjq/YvxjF9rDqltc=;
	b=WVk8u5j8SAbjnrVp7p9gTKuf5B/dbuTKwY9BsEoRuxBk09TDREiFNBs6vEEgz3riZN
	rtvBPraRCgRSUbNHtmU/aUQhfugRBMF0M/UWeFs4eEnuqvtSlvqru5obGPdN0o9pCL7W
	lGCMDxzWRFEU1JhS28iHEk7E2ROgasJqqgGwRhJDtpP9Abq3odLb5JXLocY27zopxKEi
	93dHBO30SQh1oRUzwo7J0PgNmc0uU8dhFdTKLXSTr/5H79GLHG0g6R+jlkPIdHKGMBA/
	1u8yKyvhNrQNRfveAMOhynLHmWZNGCujQ/ll2G4XoJTsLGSZlK+Aki2sQawe+oR12GeJ
	vAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HR0eItcWbs/D9LT9azi33g7DXy1Wjq/YvxjF9rDqltc=;
	b=bg56E0is7dMWCvTkWBJnt3uxfV0WcnV33POxW0Mhqn9QXNcnScQtICX5+I1QT00j4Q
	6aWEA5OO3N2r7UHfqjIqe8VIISVSX8JPl7axL1rfJFsb/TIYesVhIFf5MKSsJSF8ri+u
	dBM95OjEVVhaAVsjSaH4qYTkuxnP53yaGoy7GIsdLQnzZC/59tO4Uuc94z+mE5hbv/bx
	vwxefnPKETlnKL+SXDhanrO9oXOY0diJDW9/ve9sjXs31VeCafO06YsPOWjF7MI0j7oJ
	kR5109FM6fJcOMcoU/OpNuTBcXBkcK1P4ek1L19PdUS8ud7GNH+zP/WfOsofkFoicxQS
	tHrQ==
X-Gm-Message-State: APjAAAU6iiFQQXSVUH04EItJ1qS/hGFgW1H0ebtQn7gWE8A9GZC3hVLq
	ITzPMw5MTzzLnRQXpKhv8ktpgOPBf6Lqc63+iE8=
X-Google-Smtp-Source: APXvYqyMX6m4Fa5Q1Ocr6z7A/nQ4EdAklRl/R7prAlbsLLR3VGQ+Y/0macs3ye1WtNxwImfLgnm+R4lrj0pCXqy5teA=
X-Received: by 2002:a6b:8d43:: with SMTP id p64mr518647iod.215.1576653561166; 
	Tue, 17 Dec 2019 23:19:21 -0800 (PST)
MIME-Version: 1.0
References: <1575988313-2868-1-git-send-email-yamane07ynct@gmail.com>
	<6f603eda-0c10-5cc1-ddeb-c1f23da9596a@intel.com>
In-Reply-To: <6f603eda-0c10-5cc1-ddeb-c1f23da9596a@intel.com>
From: Daisuke Yamane <yamane07ynct@gmail.com>
Date: Wed, 18 Dec 2019 16:18:45 +0900
Message-ID: <CAHZ3=rp_x2rAsvAoi9KzyV9Mw0homj+yFddfS-=-xSuQ=w5rrA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Move B from u-boot.inc to u-boot-common.inc
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
X-List-Received-Date: Wed, 18 Dec 2019 07:19:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh.. sorry for a bad patch.
I'll resend patch-set that fixes those errors.

2019=E5=B9=B412=E6=9C=8818=E6=97=A5(=E6=B0=B4) 0:57 Ross Burton <ross.burto=
n@intel.com>:
> u-boot-fw-utils:
>
>    cp
> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/qemux86_64-poky-=
linux/u-boot-fw-utils/1_2020.01~rc3-r0/git/include/version.h
> tools/version.h
> cp: cannot create regular file 'tools/version.h': No such file or directo=
ry
In upstream, this error has already fixed[1], so I'll backport it.

[1]: https://gitlab.denx.de/u-boot/u-boot/commit/fb013eee68d08403572ef3c579=
f6688bbe33fd47

