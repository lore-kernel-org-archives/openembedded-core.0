Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1D700607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 15:58:21 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id i206so2862417ybc.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 07:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3BJBdPqHNyNyRew2dTfVwtQEagawrlPSGxkiOh7+Sl0=;
	b=WQJ/HEbv7huj6F9WzclpZRQvZpPoplAHC8bwrVghqlbeFVVbVbPt2kFD8HsnQch5ui
	Ke56aGrP+Wi5rkCVixZnoiAqpI7rpzpnjqtm4m66kHsYr83ebVDmKvFk7Wi4UEMZwCSM
	plV9WFG7kkh0AQATxxb5qrv/J8z245LFzyXau7C+KlgFw8YYSt9IgttGzpcrFCeXBksL
	2rzBQVmkddYnx0ejgqoeJiQ6CnuLprM+WFhAyIUInUfLoxN/9F78xaAvzHiGPK48miY4
	4ENLypsCFENCdK0d2oAyHD6ePgeZjyb4LyFe7eI3yjzQi+L//iIy3WjgbzSnkCt5nB0u
	pIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3BJBdPqHNyNyRew2dTfVwtQEagawrlPSGxkiOh7+Sl0=;
	b=uhzv7OEqku1KeGPF6azN0pNwZoUhLbl9vmwzPEp3xCtB3i9ze93E18Y0faR5Z8Z/hr
	st8lJOySV7/2u90ciAurH0355vB7dogmsl8jkSK/FYDOuzXNpUowBOaRzd3czhhjG4fE
	xaknRt1ZBoBQLjSd3do4MsNPjcXeF5m73NnUF4lth9zhCpxQm4dybK/lWHKIlBppRYvB
	3+uvP/Ld45NfZ5Fu8AnxBLm2xfyn7dixmQUptBTdeHXVIkO/2eHFN6bOVGNTmw8xM46v
	cXiGLWwVcxUvgvTAEL8sUei6eYlj/2GGjsNDABcOPq4G1VTZY6cg+rquNdIPwTRZktJd
	zS4A==
X-Gm-Message-State: AJaThX7y+lsKCQaqMFsf9GhopUKA7tAFld7dxZvOo0A4SbcuHzN4twug
	ez3GKVoS/wMTyg4HcNHuyDdvsRYR7cO8xyiPtb8=
X-Google-Smtp-Source: AGs4zMbTFgn64tcuaBVf4HrzVPvYpanEKy8yA798irA4/0S3twAOVYoBXKBa7W8CISN2KM1qadjAVyWxeWfaRrdg4lo=
X-Received: by 10.37.39.194 with SMTP id n185mr1754714ybn.523.1512057502831;
	Thu, 30 Nov 2017 07:58:22 -0800 (PST)
MIME-Version: 1.0
References: <CAFeBWL4nTUMB2DDDXc=_hpZ6Aabaygi=_hekGY7ixE7vy1Y+7Q@mail.gmail.com>
	<CAJTo0LZ_L6rP-AMKFMM-iPwnA-NVmoT4x7TZCS2=-oqKWmDKRg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ_L6rP-AMKFMM-iPwnA-NVmoT4x7TZCS2=-oqKWmDKRg@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 30 Nov 2017 15:58:12 +0000
Message-ID: <CAFeBWL4t-bvgPUULDwbiO=mncDVQr4kD1fq7X4f229_K-Kjnrw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libopkg header files (opkg.h) no longer installed..?
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
X-List-Received-Date: Thu, 30 Nov 2017 15:58:22 -0000
Content-Type: multipart/alternative; boundary="94eb2c1368ca561c99055f3552f9"

--94eb2c1368ca561c99055f3552f9
Content-Type: text/plain; charset="UTF-8"

Great. Thank you for the pointer.

On Thu, Nov 30, 2017 at 10:54 AM Burton, Ross <ross.burton@intel.com> wrote:

> opkg's configure says:
>
> # The current libopkg API is deprecated so only build it if requested
>
> If you want to install the deprecated API headers, then
> pass --enable-libopkg-api.
>
> Ross
>
> On 30 November 2017 at 15:30, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
>> It doesn't look like inclusion of libopkg or libopkg-dev do not put
>> headers (such as opkg.h) in the target.
>> Can someone guide me on what I might be doing wrong?
>>
>> Thank you,
>>
>> Adam
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>

--94eb2c1368ca561c99055f3552f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great. Thank you for the pointer.</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr">On Thu, Nov 30, 2017 at 10:54 AM Burton, Ross =
&lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">opkg&#39;s =
configure says:<div><br></div><div># The current libopkg API is deprecated =
so only build it if requested<br></div><div><br></div><div>If you want to i=
nstall the deprecated API headers, then pass=C2=A0--enable-libopkg-api.</di=
v><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote"></div></div><div class=3D"gmail_extra"><div class=3D"g=
mail_quote">On 30 November 2017 at 15:30, Adam Lee <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:adam.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.=
com</a>&gt;</span> wrote:<br></div></div><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">It does=
n&#39;t look like inclusion of libopkg or libopkg-dev do not put headers (s=
uch as opkg.h) in the target.<div>Can someone guide me on what I might be d=
oing wrong?</div><div><br></div><div>Thank you,</div><div><br></div><div>Ad=
am</div></div>
<br></blockquote></div></div><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div></div></blockquote></div>

--94eb2c1368ca561c99055f3552f9--
