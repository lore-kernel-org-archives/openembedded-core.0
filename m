Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9E2B60762
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 14:37:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m72so5833089wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zfkOUiar4jVcjL/HDH7uG9iRw7zE+MjsyJ8s3Du+AwU=;
	b=TlMvjCxHPNufz1Qi6O0C1lxoeRYpf9hTXCkM3FM6LedyOLBRx1Pt0Mvzcc5/GQQrgC
	QhJ9z69xmn6EPi9EFUaqi5uxJK5DxIlzLn4WH/2+rUASHLYTNhqX2uIptNC3/hBSLFSy
	lBSvlJxQgx1ezp8z3J/860vYnGXDFTagbgVfweO+soGks7z//ucGpdWIy5sA0gCZ8hRY
	EFigEHhvvSO1CLHC+JtF8xSvvaXT0lRHpKomfwjRnSg93cnBEDFCA+uY4d6+d8vVaV0G
	q6R25a9D8SsXA2SBmluzwUxqhs5A6hgrsCiTT1UlsVEZpgDPT7snTCYBs99C0vncQMYY
	GwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zfkOUiar4jVcjL/HDH7uG9iRw7zE+MjsyJ8s3Du+AwU=;
	b=YvhcZ4f3EeQSdC/mxPiLWJ97Wj0O9b+2LvXyVR2Ax4K643VV8XqXaiUbwkqIgREK/+
	QlnoYOM51n0BJ3v1zdgxubWp/OQLE9oWutJEU1Z3hiwSgs6wVINJWj2m9GZ/Gc7a8f4q
	LkXtAR3NwHoZ5FN/NRe5xRTnlSYx0UMTZP0xxoz5snYo1eTvRdxPrBPAdAHzcEY4cemw
	T0Td5D/jcG5UdEhT3LdeCuDfRSkUZD0zYeaufMKnNZ/X4t/ElQx5tr3W04WRsXT7NU0U
	jCHrb4l5Ash2l3eXnk4BZGMoWouaTGCNi7zukVPCH/AK/EdrUMXT7SmpQej80QHxaMl5
	8wwQ==
X-Gm-Message-State: AMCzsaXt0eFsL7+NWPcKyGrLD9np283re3fSO6HfI082fZBkQwbftGWk
	rzNvr/ijK3HeuNk7gCsiqvtZ9chbMx6A6JYctJQ=
X-Google-Smtp-Source: AOwi7QDmIHS72+VbHICfhvgyOY/Rq7IqgwlO1FSG/r9ByDY9rumh4U+027Rged9ioYNrq87U5c6SDCQBCr0oIJKnCTA=
X-Received: by 10.28.58.81 with SMTP id h78mr11519472wma.10.1507646240446;
	Tue, 10 Oct 2017 07:37:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 10 Oct 2017 07:37:19 -0700 (PDT)
In-Reply-To: <6a454b42-aeeb-c3d0-53ca-d26f4eab32c2@linux.intel.com>
References: <20171009141227.21795-1-otavio@ossystems.com.br>
	<d31de312-7137-d95d-7cf6-2f15ac4ac1b6@linux.intel.com>
	<CAJ86T=UGY1LciuKpDvpDFot8fQaJHaQEGp=N0zVHo9nMP+4vJw@mail.gmail.com>
	<0eea3119-a905-9a62-6572-1cab90a43a2d@linux.intel.com>
	<c4183a19150d4970881e5a06d0b327a6@XBOX02.axis.com>
	<6a454b42-aeeb-c3d0-53ca-d26f4eab32c2@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Oct 2017 16:37:19 +0200
Message-ID: <CA+chaQdVM5ngN2Hufi+8F52SK=c3Uv9VweC6-0+HTEznvNhn+A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Tue, 10 Oct 2017 14:37:20 -0000
Content-Type: multipart/alternative; boundary="001a1148d7089bfebc055b323e98"

--001a1148d7089bfebc055b323e98
Content-Type: text/plain; charset="UTF-8"

> How many recipes do you guys keep up to date on a regular basis? :-)

If this is some kind of pissing contest, then over 700 just in our internal
layers (not counting any work on meta-oe, meta-qt5, meta-webos-ports or
meta-smartphone layers).

On Tue, Oct 10, 2017 at 4:29 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 10/10/2017 04:57 PM, Peter Kjellerstedt wrote:
>
> That is not the entire story though. If you have COPY_LIC_MANIFEST and
>> COPY_LIC_DIRS set in your configuration, the relevant licenses will be
>> installed in the image, and for licenses specified with beginline and/or
>> endline this only includes the specified lines.
>>
>
> Thanks, I did not know that.
>
> Then, if the license requires that you include the copyright information,
>> which is pretty common, e.g., BSD, leaving out that part just to avoid
>> having to update the recipe once a year means that you are not really
>> complying with the license... And neither will any users of the layer
>> be who believe they are covered license wise by including the license
>> information bitbake produces and installs in their images.
>>
>
> Once a year times the amount of recipes one maintains. Which, for me is
> 111 oe-core recipes, plus 76 oe-core recipes that Jussi Kukkonen left
> behind. How many recipes do you guys keep up to date on a regular basis? :-)
>
> We actually have an open bug to provide better tooling for manually
> comparing the licenses [1], but no progress has been made with that for a
> long time. Paul, how is it now?
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10801
>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1148d7089bfebc055b323e98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">How many recipe=
s do you guys keep up to date on a regular basis? :-)</span><div><span styl=
e=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8p=
x">If this is some kind of pissing contest, then over 700 just in our inter=
nal layers (not counting any work on meta-oe, meta-qt5, meta-webos-ports or=
 meta-smartphone layers).</span></div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Tue, Oct 10, 2017 at 4:29 PM, Alexander Kanav=
in <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.co=
m" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><span class=3D"">On 10/10/2017 04:57 PM=
, Peter Kjellerstedt wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
That is not the entire story though. If you have COPY_LIC_MANIFEST and<br>
COPY_LIC_DIRS set in your configuration, the relevant licenses will be<br>
installed in the image, and for licenses specified with beginline and/or<br=
>
endline this only includes the specified lines.<br>
</blockquote>
<br></span>
Thanks, I did not know that.<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Then, if the license requires that you include the copyright information,<b=
r>
which is pretty common, e.g., BSD, leaving out that part just to avoid<br>
having to update the recipe once a year means that you are not really<br>
complying with the license... And neither will any users of the layer<br>
be who believe they are covered license wise by including the license<br>
information bitbake produces and installs in their images.<br>
</blockquote>
<br></span>
Once a year times the amount of recipes one maintains. Which, for me is 111=
 oe-core recipes, plus 76 oe-core recipes that Jussi Kukkonen left behind. =
How many recipes do you guys keep up to date on a regular basis? :-)<br>
<br>
We actually have an open bug to provide better tooling for manually compari=
ng the licenses [1], but no progress has been made with that for a long tim=
e. Paul, how is it now?<br>
<br>
[1] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10801" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/=
show_bug.cgi?id=3D10801</a><br>
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1148d7089bfebc055b323e98--
