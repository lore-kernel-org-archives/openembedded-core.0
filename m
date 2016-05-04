Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEAE60232
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 21:10:47 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id d62so67165755iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A9J8fkl6aHkm/0at45RWuaLTOtdRhEj/raWT1UekHJc=;
	b=EuxYD0faHcC1xMvdac5KynR9UpyhiLEbt0P5Aw1i9KF6lLJ7T+Br6emVs721GrkhZf
	Wkjq7VuymV3xYs0ERnnd5QF8RAnPpy6K93UpZX8z7nYJiwzuhjc/Gbzpc40bbuEjfspc
	fC4gze6qjplu9B+5j/+YHBECAuDiaHj2Twr7VjAMyBaeUDv9qRVVulMiSVWDN6owt5bZ
	WofUSiR9fhEw6RErdX0xLmxT4CAOHkIScmkr4HorUj+NNAErNTnSFjK+H8fqfv8o3OI5
	BxsOV/ik4vOyM4LaaC59sYkrX5vORORdh9DV7iz1mn2XHFz0P3EYFUGrrQc3YPNKBdnd
	75xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A9J8fkl6aHkm/0at45RWuaLTOtdRhEj/raWT1UekHJc=;
	b=h7+GtWsfWaI3cOm7zwTm21j4pYH7yLWcbFrLwn3MLVEVdkRXk0av8Sm8W4g6JjJ9Vj
	0JosxntQWg66kxReEctcmpv66pkZZJ4Ab5c4Ny5PabFTGkLQ61cKkc/WIHcr2b4jvLyW
	Ow7tN2v2GKJbIH38ZbxM8Z/72FIt8E4Qyi9fuF7TTnGsU5pkfKtWMGz2+HOpJDMG0TMQ
	p1EAwf9OjO3FyvXKiZOWw06ITPB7WexupHXNDIS4UJZlj9ZKWyuuao1j5amRmzRCPGeC
	AAi+iWFy8kKdveRyOFpl3RedVlUMBNv01L24uMmaqdxSXRJt3j49RWBhgg/5kYavoTwz
	nR5Q==
X-Gm-Message-State: AOPr4FVelFCelrTSHGs2TBolhOFCbCLjswHMKSLUmxNs4eNmL7dvhATMovqmDhzFib+DdYLWflh4pCygKUEHwzNl
X-Received: by 10.107.179.136 with SMTP id c130mr12644614iof.99.1462396248292; 
	Wed, 04 May 2016 14:10:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 14:10:28 -0700 (PDT)
In-Reply-To: <f9b227a491fa86e74f5f84df68fd7181b1f9bd37.1462188303.git.mariano.lopez@linux.intel.com>
References: <cover.1462188303.git.mariano.lopez@linux.intel.com>
	<f9b227a491fa86e74f5f84df68fd7181b1f9bd37.1462188303.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 22:10:28 +0100
Message-ID: <CAJTo0Lb97awuHSD0BeNb+j7_LR3xYTeLXN4td+qQ-0kREor84A@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sshcontrol.py: Add methods to copy dirs and delete files
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
X-List-Received-Date: Wed, 04 May 2016 21:10:48 -0000
Content-Type: multipart/alternative; boundary=001a1148578ce6901805320aa88f

--001a1148578ce6901805320aa88f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 May 2016 at 12:27, <mariano.lopez@linux.intel.com> wrote:

> +            tree:   .
> +                    =E2=94=94=E2=94=80=E2=94=80 work
> +                        =E2=94=9C=E2=94=80=E2=94=80 dir1
> +                        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 file1
> +                        =E2=94=94=E2=94=80=E2=94=80 dir2
>

This is very pretty, but:

SyntaxError: Non-ASCII character '\xe2' in file
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/me=
ta/lib/oeqa/utils/sshcontrol.py
on line 212, but no encoding declared; see
http://python.org/dev/peps/pep-0263/ for details

Add encoding tags or ASCIIfy the comments, please.

Ross

--001a1148578ce6901805320aa88f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 May 2016 at 12:27,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mariano.lo=
pez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":1ij" class=3D"">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree:=C2=A0 =C2=A0.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=
=94=94=E2=94=80=E2=94=80 work<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 dir1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 file1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 dir2</div></blockquote></div><br>Thi=
s is very pretty, but:</div><br>SyntaxError: Non-ASCII character &#39;\xe2&=
#39; in file /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-self=
test/build/meta/lib/oeqa/utils/sshcontrol.py on line 212, but no encoding d=
eclared; see <a href=3D"http://python.org/dev/peps/pep-0263/">http://python=
.org/dev/peps/pep-0263/</a> for details<div><br></div><div>Add encoding tag=
s or ASCIIfy the comments, please.</div><div><br></div><div>Ross</div></div=
>

--001a1148578ce6901805320aa88f--
