Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 93EE960248
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 05:46:51 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id t196so56062891lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 22:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ss/0meRMTg1/D+5EofJHbCmDLNqX74iR6jPfxwSOnS8=;
	b=p0n9mRWQIKyqMtlH4rHmTT+0tq+/vSLC+DWqXvtOyPcOMyYBKgx9dNzYSGPhh1EmAI
	DOoUQsaR69NlyK3ikm4e9Ctjv2zkXcmonKKW8OlEtt6/PdPXu4+EXeOzuPLjO9FcbI9j
	xy6i8Fg5NkcXlC/rlEgx+cnP2vIwThsM5wslR52Y1Y3FUmVchFUHiE+VAb5hCb/b3KkH
	1CN0GZQ44krVGIb+ppHxp06cxwvO/83gYtUyNGbGHb8fX0NKRJKgr1qexPR5H9a2VIO8
	2pnIrT7waWJwexaiy7Yul/Yaa7zIXL1B00rrZhuCRb1kHY267gg63bOTKIXAmC0yqS2b
	bPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ss/0meRMTg1/D+5EofJHbCmDLNqX74iR6jPfxwSOnS8=;
	b=k3+0ThOhtploWzdmr/si5E84FKPqh86NnBRKA8iFmRjNOJRYG7DU60gu1/oxPON6P/
	UXCnpI69crC9yCS7zJPH2MFKK0JiGFEHf54TXpHoz3/TMq4R57r6JR/oTjzCOk/Ykron
	h2u2+2gXCwWtEcbayx7eOI/C7T2j+b53i1jp52Quk9CQhsQFlBxFH3PidL0TZXpxrkvT
	AZZ+49rwnbHHVhjusTyu7X7Fvqh5TAxamB3SI7FuMXY/MW7pTn0nCmrp+vzBoWEgIPDu
	J3XdP26uWw+CtoULk/OY2IokPqTCD4hrUY5tGKaEwytBfGpLqwYW3GG42ddmZkIuWbK+
	5zJQ==
X-Gm-Message-State: ABUngvdEFqzAUFJPcy0tIfmeBdoiGrQuH0Kt2yZsFYSaBkVoh+ERpMf03J79rItaDAZVWA8HwLEkjzfYpU1wrO+Z
X-Received: by 10.25.99.12 with SMTP id x12mr6786666lfb.174.1478238412022;
	Thu, 03 Nov 2016 22:46:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.186.69 with HTTP; Thu, 3 Nov 2016 22:46:51 -0700 (PDT)
In-Reply-To: <CAJTo0LbvVLrkAJuF3uEMm-_DPmJQLsX2=rT0a4hvKUi9k79MYQ@mail.gmail.com>
References: <1478196294-7594-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LbvVLrkAJuF3uEMm-_DPmJQLsX2=rT0a4hvKUi9k79MYQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Fri, 4 Nov 2016 11:16:51 +0530
Message-ID: <CAD3vsf7VFWyN72TAZu9yUs4Rq0Vurc1R8AR1rCeQ-rF8M7tykA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][morty][PATCH 1/2] ltp: Fix QA warning
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
X-List-Received-Date: Fri, 04 Nov 2016 05:46:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c0eb7687136db05407333c7

--94eb2c0eb7687136db05407333c7
Content-Type: text/plain; charset=UTF-8

>
>
> On 3 November 2016 at 18:04, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>
>> WARNING: ltp-20160126-r0 do_package_qa: QA Issue:
>> /opt/ltp/share/licenses/ltp/run_freezer.sh contained in package ltp-lic
>> requires /bin/bash, but no providers found in RDEPENDS_ltp-lic? [file-rdeps]
>>
>
> So the common problem "if PN-lic contains a license statement embedded in
> a file with a hashbang, file-rdeps is triggered", so I'd say file-rdeps
> should be added to INSANE_SKIP_${PN}-lic in bitbake.conf instead of dealing
> with this per recipe.
>
>  Thanks for the review. I will send v2 adding INSANE_SKIP_${PN}-lic =
"file-rdeps" in bitbake.conf file.

Regards,
Jagadeesh


Ross
>

--94eb2c0eb7687136db05407333c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D"gma=
il-"><br><div class=3D"gmail_quote">On 3 November 2016 at 18:04, Jagadeesh =
Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanappa@mv=
ista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div id=3D"gmail-m_6721955320836053959:1a8" class=3D=
"gmail-m_6721955320836053959a3s gmail-m_6721955320836053959aXjCH gmail-m_67=
21955320836053959m1582b6c357bbac23">WARNING: ltp-20160126-r0 do_package_qa:=
 QA Issue: /opt/ltp/share/licenses/ltp/ru<wbr>n_freezer.sh contained in pac=
kage ltp-lic requires /bin/bash, but no providers found in RDEPENDS_ltp-lic=
? [file-rdeps]<br></div></blockquote></div><br></span>So the common problem=
 &quot;if PN-lic contains a license statement embedded in a file with a has=
hbang, file-rdeps is triggered&quot;, so I&#39;d say file-rdeps should be a=
dded to INSANE_SKIP_${PN}-lic in bitbake.conf instead of dealing with this =
per recipe.</div><span class=3D"gmail-HOEnZb"><font color=3D"#888888"><div =
class=3D"gmail_extra"><br></div></font></span></div></blockquote><div>=C2=
=A0Thanks for the review. I will send v2 adding=C2=A0INSANE_SKIP_${PN}-lic =
=3D &quot;file-rdeps&quot; in bitbake.conf file.</div><div><br></div><div>R=
egards,</div><div>Jagadeesh</div><div><br></div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:=
1ex"><div dir=3D"ltr"><span class=3D"gmail-HOEnZb"><font color=3D"#888888">=
<div class=3D"gmail_extra"></div><div class=3D"gmail_extra">Ross</div></fon=
t></span></div>
</blockquote></div><br></div></div>

--94eb2c0eb7687136db05407333c7--
