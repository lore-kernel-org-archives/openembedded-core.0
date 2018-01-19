Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 62848787BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 16:42:05 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 68so2793884ite.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sqA21nGz28QBE5wh/8GQAZTxJ/lLKlB+7bwvTafRVHI=;
	b=UwxZ4OMIIdH0AneZCvtu3XtShpDhuTB2H5QI9638f7r4hNPSxpuUNolVK4WyyCJbYw
	cr7PoCM2bdVVsdl9ULiu961w4QJmMgWpAHpksLmHXiqXmNWaI5DUJt0yzzKMFAuCE6Fj
	QUH890Y1HwAlsf7gJ3wruQ8at1qvtIr+TV7q2JnUA7tTbBMoJUuWSxZdt3d38D4GMniB
	014JrWuOYGe462Z94YiR2Bkf24uPzDiHfOmQoZVkbGeZgX3NYrWBFpgr5i/hGhvyD4Q8
	rCybsZipK79u3Nh+hTX1FuSLAbA/52QUlftjN+nXoaiJiGUOqi3fr3yL+OL5OxtNSVCH
	j07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sqA21nGz28QBE5wh/8GQAZTxJ/lLKlB+7bwvTafRVHI=;
	b=X/52Z6pOV1HjJaVwVP5CYH1iFe0kHwBNI/zXqYpOqw0tSAE7Uake4HQBPcpVwuLI/E
	2fz6GpARNncY32zRMqObO/8BNWNLhdM9Km60kYZJV5V620LPG6kybh9rMl7O/pW6qOpJ
	Zt4cqr/TV0uTV8gxT+6ykX4Y+rPsXrrvgiQX8k74DzXlDF2tVY3SP8NRIUiX7F/iDmWu
	NUKqVF9rhOUN9w+RBXrzrQdZtTgcK3zG7NbAAmfGSSp4JAg7j3mEh+e7LVD0UB86bZJ+
	Axaij3yK47fi6PQBTeBRSbIlBdpPBoluLKQayJ0muGahBzRbh8Y+9yNMWaReC3+psh0e
	+agw==
X-Gm-Message-State: AKwxytfwukFaWsDcMn7filkbBRjSujpA9c9lATl80+x0tUoDaYXtA62b
	8mxqaKVQtBZjC15bGRobTZknxpzzxwCyV5aANVWI3A==
X-Google-Smtp-Source: ACJfBosHjPF/q975VTeuwetaxc2B0jyk5z6CyrEyCXAjpcY0qpaOhUS0fXWjRi93tb7MBihOLfuKuku87ICBi0OPehY=
X-Received: by 10.36.86.20 with SMTP id o20mr13465270itb.53.1516380126636;
	Fri, 19 Jan 2018 08:42:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 08:41:46 -0800 (PST)
In-Reply-To: <1516246916-2966-2-git-send-email-Haiqing.Bai@windriver.com>
References: <1516246916-2966-1-git-send-email-Haiqing.Bai@windriver.com>
	<1516246916-2966-2-git-send-email-Haiqing.Bai@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 16:41:46 +0000
Message-ID: <CAJTo0LagHV+d1CBiQuabonCRYYTrV5ui0+D6G=eSWdp_nDgRAA@mail.gmail.com>
To: Haiqing Bai <Haiqing.Bai@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grep: support Perl regular expression
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
X-List-Received-Date: Fri, 19 Jan 2018 16:42:05 -0000
Content-Type: multipart/alternative; boundary="001a1144d5eacb0ee5056323c2cb"

--001a1144d5eacb0ee5056323c2cb
Content-Type: text/plain; charset="UTF-8"

On 18 January 2018 at 03:41, Haiqing Bai <Haiqing.Bai@windriver.com> wrote:

> +PACKAGECONFIG[pcre] = ",--disable-perl-regexp,libpcre"
>

For clarity and ensure consistent behaviour if the defaults change, this
should also be passing --enable-perl-regexp.

Ross

--001a1144d5eacb0ee5056323c2cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 January 2018 at 03:41, Haiqing Bai <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:Haiqing.Bai@windriver.com" target=3D"_blank">Haiqing=
.Bai@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"=
><div class=3D"h5">+PACKAGECONFIG[pcre] =3D &quot;,--disable-perl-regexp,<w=
br>libpcre&quot;<br></div></div></blockquote><div><br></div><div>For clarit=
y and ensure consistent behaviour if the defaults change, this should also =
be passing --enable-perl-regexp.</div><div><br></div><div>Ross=C2=A0</div><=
/div></div></div>

--001a1144d5eacb0ee5056323c2cb--
