Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id CEAE477CFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:45:20 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id m133so41936452ybb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8jhHlqFoYBOsiEFhkuIAd4x9f9AKMQi3m/hduhQZBVY=;
	b=uhLCcDpMuoLHiQLpiEwlErsYoabQhBcS4DtXDv7xuzZ7fGu1m2RD9W4X3yQSO6t80b
	EBI5DTH0k0Xsa0jr7vkZbOJyAkeHhcbbuW2O/ysl33ceWbof23I4vDhpPnAWtCOkaF4p
	vUGfTwohVHd/45HkJ5TK00rtgO0Pn/Jl6qKEfkXEOoENb7U/K6PsXztk7C6Q8bBSmVp7
	E3HFOwbLmciW5jHWbOYml9R/nqRW43O/OAdjdgoK9ADebTdMhcrUnQjroneoyqQBO8gI
	xVn4eh/TiM8WvvMiYaZC+rrs+URqY/Xh74DsVyNP41WJjFp9f1BexoOuMKc74d8LrCSc
	JrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8jhHlqFoYBOsiEFhkuIAd4x9f9AKMQi3m/hduhQZBVY=;
	b=jHvny7HIyc7gVs0nis3RtllDFSeGMenyCmknVzjmgqR27aBTIWPkPEF2vKxY8lLzsS
	Q6X8iNXuQjo6vqwm87qoKdtP0LV6wuR1P3UNZilRFV2NRqxOpmvbHgk0gl70aHxF73a4
	A8s5I1pC+bNrEMKHnab/YqH2gOg2qf77RbmIZfSgOWBw1uRIroGeGlXtKE0VjPKN1t4n
	fF1Jas4F+/AP9jsuLL834qjyi5qEhq/w6crPysekJhBTTZ7eiR6xAS0UMrsyZAvlV2+4
	UPkRyzPab/fiLU8VKMnRMRxDp7POimMT+RxdLyEl+SpcvV1UZrZhhyHY5vYcJxQ7St6b
	irNA==
X-Gm-Message-State: AN3rC/6PPmZm+dIqeMaYosjck7wwizYN83GVCl433SkObjw9ZNfdKk3ckWTeqZt1yJ/yfo1bhxQj6xPtuEmYhAin
X-Received: by 10.37.221.5 with SMTP id u5mr7185097ybg.51.1491900321869; Tue,
	11 Apr 2017 01:45:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Tue, 11 Apr 2017 01:44:51 -0700 (PDT)
In-Reply-To: <20170411083220.6645.78178@do.openembedded.org>
References: <1491898315-7457-1-git-send-email-dv@pseudoterminal.org>
	<20170411083220.6645.78178@do.openembedded.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Apr 2017 11:44:51 +0300
Message-ID: <CAHiDW_EOoUVr0E_J2Lr-Bp+j8o=gdhrhce9OP9fpr0x7wakKFQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Sandoval Gonzalez, Leonardo" <leonardo.sandoval.gonzalez@intel.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZDogVXBkYXRlIHBhY2thZ2Vjb25maWdzIGFuZCBjb25maWcgZmxhZ3MgKHJldjIp?=
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
X-List-Received-Date: Tue, 11 Apr 2017 08:45:21 -0000
Content-Type: multipart/alternative; boundary=001a114bd456b9c3b4054ce01ca4

--001a114bd456b9c3b4054ce01ca4
Content-Type: text/plain; charset=UTF-8

CCing Leo for patchwork issue (is that correct?)

On 11 April 2017 at 11:32, Patchwork <patchwork@patchwork.openembedded.org>
wrote:
>
> == Series Details ==
>
> Series: gstreamer1.0-plugins-bad: Update packageconfigs and config flags
(rev2)
> Revision: 2

Patchwork gets confused here. The comments are valid but they should be for
   gstreamer1.0-plugins-good: Backport patch for v4l2object videometa
which is not a revision of
   gstreamer1.0-plugins-bad: Update packageconfigs and config flags

Cheers,
  Jussi

>
> URL   : https://patchwork.openembedded.org/series/6284/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Added patch file is missing Upstream-Status in the
header [test_upstream_status_presence]
>   Suggested fix    Add Upstream-Status: <status> to the header of
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
(possible values: Pending, Submitted, Accepted, Backport, Denied,
Inappropriate)
>
> * Issue             A patch file has been added, but does not have a
Signed-off-by tag [test_signed_off_by_presence]
>   Suggested fix    Sign off the added patch file
(meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch)
>
>
>
> If you believe any of these test results are incorrect, please reply to
the
> mailing list (openembedded-core@lists.openembedded.org) raising your
concerns.
> Otherwise we would appreciate you correcting the issues and submitting a
new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114bd456b9c3b4054ce01ca4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">CCing Leo for patchwork issue (is that correct?)<br><br>On=
 11 April 2017 at 11:32, Patchwork &lt;<a href=3D"mailto:patchwork@patchwor=
k.openembedded.org">patchwork@patchwork.openembedded.org</a>&gt; wrote:<br>=
&gt;<br>&gt; =3D=3D Series Details =3D=3D<br>&gt;<br>&gt; Series: gstreamer=
1.0-plugins-bad: Update packageconfigs and config flags (rev2)<br>&gt; Revi=
sion: 2<br><br>Patchwork gets confused here. The comments are valid but the=
y should be for <br>=C2=A0 =C2=A0gstreamer1.0-plugins-good: Backport patch =
for v4l2object videometa<br>which is not a revision of<br>=C2=A0 =C2=A0gstr=
eamer1.0-plugins-bad: Update packageconfigs and config flags<br><br>Cheers,=
<div>=C2=A0 Jussi<br>=C2=A0<br>&gt;<br>&gt; URL =C2=A0 : <a href=3D"https:/=
/patchwork.openembedded.org/series/6284/">https://patchwork.openembedded.or=
g/series/6284/</a><br>&gt; State : failure<br>&gt;<br>&gt; =3D=3D Summary =
=3D=3D<br>&gt;<br>&gt;<br>&gt; Thank you for submitting this patch series t=
o OpenEmbedded Core. This is<br>&gt; an automated response. Several tests h=
ave been executed on the proposed<br>&gt; series by patchtest resulting in =
the following failures:<br>&gt;<br>&gt;<br>&gt;<br>&gt; * Issue =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Added patch file is missing Upstream-Status=
 in the header [test_upstream_status_presence]<br>&gt; =C2=A0 Suggested fix=
 =C2=A0 =C2=A0Add Upstream-Status: &lt;status&gt; to the header of meta/rec=
ipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-ad=
d-videometa-if-there-is-padding-to.patch (possible values: Pending, Submitt=
ed, Accepted, Backport, Denied, Inappropriate)<br>&gt;<br>&gt; * Issue =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A patch file has been added, but doe=
s not have a Signed-off-by tag [test_signed_off_by_presence]<br>&gt; =C2=A0=
 Suggested fix =C2=A0 =C2=A0Sign off the added patch file (meta/recipes-mul=
timedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videom=
eta-if-there-is-padding-to.patch)<br>&gt;<br>&gt;<br>&gt;<br>&gt; If you be=
lieve any of these test results are incorrect, please reply to the<br>&gt; =
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.openembedded.org</a>) raising your concerns.<br>&gt;=
 Otherwise we would appreciate you correcting the issues and submitting a n=
ew<br>&gt; version of the patchset if applicable. Please ensure you add/inc=
rement the<br>&gt; version number when sending the new version (i.e. [PATCH=
] -&gt; [PATCH v2] -&gt;<br>&gt; [PATCH v3] -&gt; ...).<br>&gt;<br>&gt; ---=
<br>&gt; Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.c=
gi/patchtest">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a><br>&g=
t; Test suite: =C2=A0 =C2=A0 <a href=3D"http://git.yoctoproject.org/cgit/cg=
it.cgi/patchtest-oe">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe=
</a><br>&gt;<br>&gt; --<br>&gt; ___________________________________________=
____<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Opene=
mbedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.o=
rg</a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/op=
enembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedde=
d-core</a></div></div>

--001a114bd456b9c3b4054ce01ca4--
