Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id BC32773286
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:38:01 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id z190so43177356qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8TYkKF2B9b0D741Qm43ztOLal3j0nLEb9E2yjFuKMNo=;
	b=0kJSdBGV8UdLwlXJiJVEtcRi67okaWTfSInURX6wZu66gusw2YyERotoH/HeDT4Ob7
	x5M6AwU6ZAj3VWzH5edoNpvBe7icXR+IVrK7fjRYzcZinn8f24rTaICeUqoUYQeU5N0b
	thHQ8YL9xbANY5urgpX8PMO/wKOKAudKC9A4BOqdVIzZa0J7aGt9ouzzPCs7KVRpnc0X
	bghis/x96h3wxt9wwpZKL6K+WMsdSTSE7e9rYZyb0dVewY4z4QjE0kRbe77qVym87nMC
	dP/0kp6HLF4tyApR2B82MUrVBjQVYtQ49brL8UoiSyQnBBgYG+WPSF2w0R2w0LwD9Dxz
	w5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8TYkKF2B9b0D741Qm43ztOLal3j0nLEb9E2yjFuKMNo=;
	b=LGUTHyLpnGmCtgyCmtbI0fk1lY3gdJePb11zX4U0nr1abrQ9AJtxkraaIXaUyJ/vtp
	1olckpGjjS7XtAz596ooJFfPLaIU9TXqavQ490v9P4SlMffwamwXknnMmd7NlpebeUuB
	hBPVsZ3jua9j1Jl+sXkyWeb9S34IpU13ioFKOFwOnlrriykXuWWVoQvgqI9gkKoHpnE9
	Olv0+nWpkfXRNk07wH+APNiVjh0fgeb4nFJpC1JOuWux4yGyk9J3UIxPuiVgJtuybJFI
	Nw/Cs8RdlUzlew6axwyuro2qvBK65M6P95IzjveYiFXy+i/D7yVaHdq5IpoSfxgPxvDd
	ViQw==
X-Gm-Message-State: AE9vXwM8DSFXidaotTQZ6E+y2M2qmWH92+aZqs3aeK6g94woGeLYbL1P8cDFMwv0lJoDXzkP2eq/ewn13TFeIA==
X-Received: by 10.55.188.193 with SMTP id m184mr9606507qkf.129.1472629081934; 
	Wed, 31 Aug 2016 00:38:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.4.136 with HTTP; Wed, 31 Aug 2016 00:37:41 -0700 (PDT)
In-Reply-To: <c7e422d5-1d5e-1376-df7f-21c84ca362e5@linux.intel.com>
References: <1472474824-22715-1-git-send-email-sujith.h@gmail.com>
	<c7e422d5-1d5e-1376-df7f-21c84ca362e5@linux.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 31 Aug 2016 13:07:41 +0530
Message-ID: <CADyYWLmHCHWW3Vya_11biW7Enay2wJONa5jRKg5HrZ_i0fqu=Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ruby: ensure that .ext/rdoc is gone in compile
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
X-List-Received-Date: Wed, 31 Aug 2016 07:38:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c0430a6509069053b592d2b

--94eb2c0430a6509069053b592d2b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2016 at 6:17 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 08/29/2016 03:47 PM, Sujith H wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> rdoc gets unhappy if this already exists, so remove it before building.
>>
>> Without this, it's possible to hit this error:
>>
>>     Directory .ext/rdoc already exists, but it looks like it isn't an RD=
oc
>>     directory.
>>
>
> +
>> +do_compile_prepend () {
>> +    rm -rf .ext/rdoc
>> +}
>>
>>
> The fix may be fixing the symptom and masking a different issue, have you
> checked when and how the error occurs?
>

Sorry for the confusion. We can ignore this patch. I did consulted with
Chris regarding the same. Again extremely sorry for confusion.


>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--94eb2c0430a6509069053b592d2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 6:17 PM, Alexander Kanavin <span dir=3D"ltr">&l=
t;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">al=
exander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On 08/29/2016 03:47 PM, Sujith H wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" tar=
get=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
rdoc gets unhappy if this already exists, so remove it before building.<br>
<br>
Without this, it&#39;s possible to hit this error:<br>
<br>
=C2=A0 =C2=A0 Directory .ext/rdoc already exists, but it looks like it isn&=
#39;t an RDoc<br>
=C2=A0 =C2=A0 directory.<br>
</blockquote>
<br>
</span><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+do_compile_prepend () {<br>
+=C2=A0 =C2=A0 rm -rf .ext/rdoc<br>
+}<br>
<br>
</blockquote>
<br></span>
The fix may be fixing the symptom and masking a different issue, have you c=
hecked when and how the error occurs?<br></blockquote><div><br></div><div>S=
orry for the confusion. We can ignore this patch. I did consulted with Chri=
s regarding the same. Again extremely sorry for confusion.<br>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
Alex<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=
=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=
=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></div><=
div>&lt;Project&gt;Contributor to Yocto project<br></div><div><a href=3D"ht=
tp://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wik=
ia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh=
.info" target=3D"_blank">http://sujithh.info</a><br></div><div>C-x C-c<br><=
/div></div></div></div></div>
</div></div>

--94eb2c0430a6509069053b592d2b--
