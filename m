Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0FA719A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:58:24 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id o68so23338149qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 08:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4DFaJld49UC2xRhzBQCAL0Ug4T5cE4FLu5y/iFYntv0=;
	b=dGE+cxYLxdY+8IqPaFc/ECzgZUYB0kBBezT2NjOaGa5N3ik9irJv1f4/NNTuPQGDmv
	VED8iZ0Xz8B8NQipwUOk8r5WUdkoHBhKdK53rHtOGwPG7Mb2NHvLu5ckBa65olg4kd7j
	DBjuBvAgqMD40PCMGD7pUUGhDJcJOilKLNGuAw7nMuMcGg+ZJZTAwMvtRlqY3X5H2Hry
	Y+SFWSf9HLe81Ant4m8SzhupimkNAhsWqRk8cPGojjW/V6by0b15xjjhDTDi6wGqhfem
	F2Nv4DYE3FWjQ8mtsUeTEUekF6M2VdMdE1ZotXSF7EIE3fUglJo4uvStK71u4+4VWkht
	w6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4DFaJld49UC2xRhzBQCAL0Ug4T5cE4FLu5y/iFYntv0=;
	b=YaU034WEpwORMV0UfkQD+5XX4/CwmRkmPm0FxnQS+lu46CAbV9+LA+qB3cSHMenAkj
	HRJ/lkA1rqmYgf0i8FltTVlkg/IyiyDkzBugeS3kUgQFievJbtzP8ux4FaRHfaILPLTs
	o96NHU2y2EqML5sm5tb8lgo8/1HZxZuuGYElVZtALSqi8IRaXT9HsDegyOdNFGT+vxBy
	dEtth0iA3qrSUGGj3Bzd4BIotglbeywzzJ+NOyuXFpdcMZk1AF8pSlfWLgCF4FNTZiH0
	fAClh0AG+hXA6kK080oSW6CeZ7BqIas+H8AmclgNoyaWDHBPl4rm34EQSlupsW1xB2hz
	pYGg==
X-Gm-Message-State: ABUngvfGJa3tqUIS8SUlMrA0G38PJjchptR0kLC3xxh4BTizyuyrxE+ZkqWpKQ4ztjkAAEs9P0OcoBJrpX1zaa85
X-Received: by 10.55.31.157 with SMTP id n29mr3697714qkh.221.1478102305637;
	Wed, 02 Nov 2016 08:58:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 08:58:05 -0700 (PDT)
In-Reply-To: <1478030040-20670-5-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-5-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 15:58:05 +0000
Message-ID: <CAJTo0LYcbvq5t_GKOGMzTw26_=UmGE8cHG4V+s=ExBsifRGWgQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] libsamplerate0: Update to version 0.1.9
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
X-List-Received-Date: Wed, 02 Nov 2016 15:58:24 -0000
Content-Type: multipart/alternative; boundary=001a1147f228de9c990540538240

--001a1147f228de9c990540538240
Content-Type: text/plain; charset=UTF-8

On 1 November 2016 at 19:53, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://src/samplerate.c;beginline=1;endline=17;md5=
> d0807c35fc906466d24a50463534815a"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
> +                    file://src/samplerate.c;beginline=1;endline=17;md5=
> c45e8e3c7371009f0a4a569f2f22e25c"
>

When you need to update the checksums always explain why they were
changed.  In this case as can be seen from Tanu's upgrade patch that he
just sent the change was required because the license has changed from
GPLv2+ to BSD.

Ross

--001a1147f228de9c990540538240
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 November 2016 at 19:53, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossyst=
ems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":fp" class=3D"a3s aXjCH m158217ae89e21748">=C2=A0LICENSE =3D &quot;GPLv=
2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>94d55d512a9ba36caa9b7=
df079bae1<wbr>9f \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/<span class=3D"il">samplerate</span>.c;<wbr>beginline=3D1;endline=3D=
17;md5=3D<wbr>d0807c35fc906466d24a5046353481<wbr>5a&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>336d6faf40fb600bafb00=
61f4052f1<wbr>f4 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/<span class=3D"il">samplerate</span>.c;<wbr>beginline=3D1;endline=3D=
17;md5=3D<wbr>c45e8e3c7371009f0a4a569f2f22e2<wbr>5c&quot;<br></div></blockq=
uote></div><br>When you need to update the checksums always explain why the=
y were changed.=C2=A0 In this case as can be seen from Tanu&#39;s upgrade p=
atch that he just sent the change was required because the license has chan=
ged from GPLv2+ to BSD.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1147f228de9c990540538240--
