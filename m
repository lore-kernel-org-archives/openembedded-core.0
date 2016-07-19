Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1C95860290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 15:03:26 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c52so932380qte.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=D943u3bh/l8zTSPcIhso4+/ddaHZ9LaaDfM3jPZNhzM=;
	b=qzfnHgWBS8luVD9bo4TM1qo5mfEVR8G1zFpicr29bJw8KUeNMu+8chzUpc5YW9zWcf
	piXszaNbSgQLi1nYvtny/502VpTEdio8TxcfPSJ5uMa3ArTwbS1qntff3zwWrckNPGB/
	2qM8HHMNkKLjNT13Cnnf8KtAeag9BcRAlAaYrtAz2dObvXWvnj9Wz+UXMYGPUgCC7+Qi
	+Z5AdbNabcxBXmNWuYOkuIlTuGOwZEIDCpR42EAKpvV1H0c0DtJJrcqunTdCF+9ZvT39
	Gq42CTR8rUADO8BsO4RewM8hvgxgGGl1UyzUGO2p2IQ+iHT+AOKdcNBxi+6HrTovPQs8
	QYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=D943u3bh/l8zTSPcIhso4+/ddaHZ9LaaDfM3jPZNhzM=;
	b=CeoCPXRNF+acvzH718jUQusmVnyOt/xRH3G1qC3j+UCf/2nXwR0vFmyYyIzL3EXTbF
	Z+mIQgWTsFmSQEAv6BgO4Cv3U7NjwXvtgUCrjTfy5gB7Nq5sHzgAn+cG4dqmMO9xwH58
	3v2VJFcR4tiZ6M4BB7BFkg5R2+xB9tIFdclre1if00RrYEfbtThaSp+YzqnBDVBtc1MV
	fMZnf+MqdASKh5BFRF9kLBbX6QxikADVPCB+YFUkvMJNfo19XRqa2KtNO0OHKFKuZDiQ
	6O1Fi9pXrn5561cztkoqCR0b+dhuo8pcIgqWAo4C4X2qbncJCvD0g1CppHqxSewnIgyr
	xqNw==
X-Gm-Message-State: ALyK8tIwHFlLHeIXGD/YML4U6k0ILCNVPc661PoLhbbQ1W5t8RwndjVUSaNIvXOX0ypaLFhv5uNuiwLeFktlww==
MIME-Version: 1.0
X-Received: by 10.200.53.103 with SMTP id z36mr61364135qtb.5.1468940607535;
	Tue, 19 Jul 2016 08:03:27 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Tue, 19 Jul 2016 08:03:27 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Tue, 19 Jul 2016 08:03:27 -0700 (PDT)
In-Reply-To: <CADwFkYf23qz0t+gH4r80r3tstXkkQ_2hDDa0cKjZf7CGa62Pyw@mail.gmail.com>
References: <CADwFkYf23qz0t+gH4r80r3tstXkkQ_2hDDa0cKjZf7CGa62Pyw@mail.gmail.com>
Date: Tue, 19 Jul 2016 08:03:27 -0700
Message-ID: <CAMKF1sqZqH8n9S77XQucTFVTVjtyMeGEa-rvvBTvhV_SzDV+GA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [BUG] gcc: require neon on arch without neon
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
X-List-Received-Date: Tue, 19 Jul 2016 15:03:27 -0000
Content-Type: multipart/alternative; boundary=001a11441d5e1bc4930537fe6316

--001a11441d5e1bc4930537fe6316
Content-Type: text/plain; charset=UTF-8

Thanks. You can open a yp bugzilla to track it or even better send this
patch backported

On Jul 18, 2016 11:53 PM, "Yi Qingliang" <niqingliang2003@gmail.com> wrote:

> when compiling qtbase in meta-qt5, it says:
> | ../../include/QtCore/../../../git/src/corelib/global/qendian.h:143:36:
> fatal error: You must enable NEON instructions (e.g.
> -mfloat-abi=softfp -mfpu=neon) to use these intrinsics.
> |      return __builtin_bswap16(source);
> |                                     ^
>
>
> bug description:
>       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71056
> upstream patch:
>       https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=236910
> mirror on github:
>
> https://github.com/gcc-mirror/gcc/commit/84d2a5509892b65ed60d39e6e2f9719e3762e40e
>
> Yi Qingliang
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11441d5e1bc4930537fe6316
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Thanks. You can open a yp bugzilla to track it or even bette=
r send this patch backported</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Jul 18, 2016 1=
1:53 PM, &quot;Yi Qingliang&quot; &lt;<a href=3D"mailto:niqingliang2003@gma=
il.com">niqingliang2003@gmail.com</a>&gt; wrote:<br type=3D"attribution"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">when compiling qtbase in meta-qt5, it says:<br=
>
| ../../include/QtCore/../../../git/src/corelib/global/qendian.h:143:36:<br=
>
fatal error: You must enable NEON instructions (e.g.<br>
-mfloat-abi=3Dsoftfp -mfpu=3Dneon) to use these intrinsics.<br>
|=C2=A0 =C2=A0 =C2=A0 return __builtin_bswap16(source);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
<br>
bug description:<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D71056" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D71056</a><br>
upstream patch:<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://gcc.gnu.org/viewcvs/gcc?view=3Drevi=
sion&amp;revision=3D236910" rel=3D"noreferrer" target=3D"_blank">https://gc=
c.gnu.org/viewcvs/gcc?view=3Drevision&amp;revision=3D236910</a><br>
mirror on github:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/gcc-mirror/gcc/commit/84d2a5509=
892b65ed60d39e6e2f9719e3762e40e" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/gcc-mirror/gcc/commit/84d2a5509892b65ed60d39e6e2f9719e3762e40=
e</a><br>
<br>
Yi Qingliang<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--001a11441d5e1bc4930537fe6316--
