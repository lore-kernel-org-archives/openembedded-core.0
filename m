Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id BF2A365D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 13:15:50 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id o19so78939423ito.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=46mSEnnX/0VqORiXbc0Yzbz0ML2xgjWsn2+F2RTjvSE=;
	b=dojLSmlYAKeCDkZBPITyb8IpOeH6bgj5dZcHN1P/GKRVy4jdTjLZCgHrKuEFp4rHwE
	tOOua99g+EvmEOYWbUiaq/hFctHzhVky8Gm7rA8VkAo6A2MR7KpVJZRXgSJ+LnJnMI7Q
	i1h3swVBsC9UR+eaJEDfV3E8cFmIqKGYqffE6/cf58PWe7mi6B3QSqtpWCiEhWmMyK9O
	4VWED8XS27Y9wUiGzr3i6fix2wVfL/y1RWHpZQ2hVV7kY/Z+k3jsbmFOoJQ5gKYrxE2+
	6vf/kzCn39SoMxuvU21rgJZNpbGdNWzoF5u1w3lv6U3HrWyuVNMHhk6ED5R6D3/3oPYf
	CCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=46mSEnnX/0VqORiXbc0Yzbz0ML2xgjWsn2+F2RTjvSE=;
	b=JAlSt5tFG9TfHOlNihoMEx1Umvtc4hpCsAU4X+h4VFAq34BRVC3eCbYbrEA4AZE7C2
	bgg7EESr41JkysRQpvKT3ukRbcgXZbdMPAXMr03zT7DuZtR//57Pog7YnB8tNM6/Rr4y
	TNkAkmNhGdmPDt8rDqkRmf7JZ7XSffE2E4GB0zj1wyMjprK65/c3PZhv7Tt+ohML630z
	fcazKDbXTbpOmzujiMgWKNuDrxelJV1SW7dJRdNVnH3FEmlLWGwhwiwrfatac9lYHZsA
	FYYmjJQ1mMNtiX3gFmTjjk6eEgLPWpO+RmoUDl9gnT6nk+5X6ZBlhi4n17Hezi2rfkmJ
	QhQw==
X-Gm-Message-State: AA6/9RllklNr0EoMXKfcwO9iRN33n4vjUdwl5YStRf38I5TuZQbJqXA3A8MUOyosiiXFPE5yeg5lGCWa3z0gZR1J
X-Received: by 10.36.109.3 with SMTP id m3mr10630807itc.20.1476105351784; Mon,
	10 Oct 2016 06:15:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Mon, 10 Oct 2016 06:15:31 -0700 (PDT)
In-Reply-To: <1474872705-6005-1-git-send-email-zhe.he@windriver.com>
References: <1474872705-6005-1-git-send-email-zhe.he@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Oct 2016 14:15:31 +0100
Message-ID: <CAJTo0LbyTob6_exkY1Qw-xvLRRo-SUgd5E_E8pojoe2fg=QGkw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] guile: Remove bashisms
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
X-List-Received-Date: Mon, 10 Oct 2016 13:15:50 -0000
Content-Type: multipart/alternative; boundary=001a1146f5d82527a0053e828f0c

--001a1146f5d82527a0053e828f0c
Content-Type: text/plain; charset=UTF-8

On 26 September 2016 at 07:51, <zhe.he@windriver.com> wrote:

> Remove bashisms from do_populate_sysroot task
>

This causes a change of behaviour that results in a stage error:

ERROR: guile-2.0.12-r0 do_populate_sysroot: The recipe guile is trying to
install files into a shared area when those files already exist. Those
files and their manifest location are:

 /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/bin/crossscripts/guile-config
 Matched in b''
Please verify which recipe should provide the above files.

Ross

--001a1146f5d82527a0053e828f0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 September 2016 at 07:51,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe=
.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex"><div id=3D"gmail-:4lm" class=3D"gmail-a3s gmail-aX=
jCH gmail-m157654439018a42a">Remove bashisms from do_populate_sysroot task<=
br></div></blockquote></div><br>This causes a change of behaviour that resu=
lts in a stage error:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra"><div class=3D"gmail_extra">ERROR: guile-2.0.12-r0 do_popul=
ate_sysroot: The recipe guile is trying to install files into a shared area=
 when those files already exist. Those files and their manifest location ar=
e:</div><div class=3D"gmail_extra">=C2=A0 =C2=A0/data/poky-master/tmp-glibc=
/sysroots/intel-corei7-64/usr/bin/crossscripts/guile-config</div><div class=
=3D"gmail_extra">=C2=A0Matched in b&#39;&#39;</div><div class=3D"gmail_extr=
a">Please verify which recipe should provide the above files.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></d=
iv>

--001a1146f5d82527a0053e828f0c--
