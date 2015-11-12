Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 69A0C6E268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:22:39 +0000 (UTC)
Received: by ioc74 with SMTP id 74so81392867ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FPLcNARUJ3JQCyAT/fdMKBc89dmUcFaJF7QcXhxgUWs=;
	b=h3SBKg9Th2QK5zfsfDllzLmlD3LRLqiC91YaIoIglS1VF7bQTcr41oJ1Suo/LdGJim
	dbu/3LCYDU+Olu8Dsg3cO842zwSFxIf4kWmtuAdpF548Het3tNIaW51FHnWL0E5uU+k/
	LTkJPKTrAWsTaJDcOUS6PYmcxrOC6beta78ovHuP8rZdT7MRJ/esCN9MeszPde4/CsMo
	mza6L5MKERzlvru8Y1pXh8BkAkZtlWXlXn2Wz49z7VrrYB8Aj/5T6HlViai9GDRwZ1cX
	hfFLDYX1dhEsCtTU3MEeDt34ZZOT/XvFh9nBBAkvPUYZzKOWyOYWaE3UTK7GJEs4i8pL
	dq7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FPLcNARUJ3JQCyAT/fdMKBc89dmUcFaJF7QcXhxgUWs=;
	b=lxMWdKsg4KrBEu7HakHynFAABt4UuTeBIcHQeUs8BdjFQw38yYWq3Bb3cKPZRiJ1Xb
	PH9dznKG984csA8ikDEmdAlsHNwgDTvQKmPU//n5dLD75+pidDQFDKO8/qcDSfUuAMWZ
	15o1FnmP1Uzzi5CUk5LMEB/gKUfRbs/Bc4bc+js1WLHyBKedk+TpvrVyEz/85J4uTtZq
	2f1bqJX32LoePlGjBGqDhxFd++SJoyga0DctMR41duNAIREdQslkWsSjOGr2y+Fg5ete
	qIEHIlmgiKcwhAlCKE/4sqZZHl6ibLdskh99f+mX8qvXyvNmTJVZwOYqOrTq4wlTX0qL
	Q3hw==
X-Received: by 10.107.134.28 with SMTP id i28mr16772384iod.74.1447370559636;
	Thu, 12 Nov 2015 15:22:39 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Thu, 12 Nov 2015 15:22:20 -0800 (PST)
In-Reply-To: <1447365562-23888-1-git-send-email-kei@nohguchi.com>
References: <1447365562-23888-1-git-send-email-kei@nohguchi.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 12 Nov 2015 16:22:20 -0700
X-Google-Sender-Auth: mmShnazUjNVaJ_cfYMdX4hZ2djU
Message-ID: <CABcZANnj9gRXiSHyomVOxP1V-YS_mp5+cfbnzV9yTvP4+GRdQg@mail.gmail.com>
To: Kei Nohguchi <kei@nohguchi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fixes [YOCTO #8684] Add python-ast, Python Abstruct Syntax Tree package
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
X-List-Received-Date: Thu, 12 Nov 2015 23:22:44 -0000
Content-Type: multipart/alternative; boundary=001a113ecc0a10cd620524603841

--001a113ecc0a10cd620524603841
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 2:59 PM, Kei Nohguchi <kei@nohguchi.com> wrote:

> Adding python-ast package in the generate-manifest-2.7.py, to
> automatically generate the python-ast package in the
> python-2.7-manifest.inc file.  As mentioned in the [YOCTO #8684],
> python-ast is required by the Ansible script on our OpenSwitch target
> system, and we don't believe we can layer this package inside our
> OpenSwitch specific layer.  And also, generate-manifest-2.7.py is the
> right place, as python-ast might be used by other recipes.
>
> Signed-off-by: Kei Nohguchi <kei@nohguchi.com>
>

The commit message summary violates our commit message guidelines. See
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines and
https://www.yoctoproject.org/docs/1.2/dev-manual/dev-manual.html section
"3.9. How to Submit a Change" for the OE/Yocto requirements, and
http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html for
general guidelines.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ecc0a10cd620524603841
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 12, 2015 at 2:59 PM, Kei Nohguchi <span dir=3D"ltr">&lt;<a =
href=3D"mailto:kei@nohguchi.com" target=3D"_blank">kei@nohguchi.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex">Adding python-ast package in the <a href=
=3D"http://generate-manifest-2.7.py" rel=3D"noreferrer" target=3D"_blank">g=
enerate-manifest-2.7.py</a>, to<br>
automatically generate the python-ast package in the<br>
python-2.7-manifest.inc file.=C2=A0 As mentioned in the [YOCTO #8684],<br>
python-ast is required by the Ansible script on our OpenSwitch target<br>
system, and we don&#39;t believe we can layer this package inside our<br>
OpenSwitch specific layer.=C2=A0 And also, <a href=3D"http://generate-manif=
est-2.7.py" rel=3D"noreferrer" target=3D"_blank">generate-manifest-2.7.py</=
a> is the<br>
right place, as python-ast might be used by other recipes.<br>
<br>
Signed-off-by: Kei Nohguchi &lt;<a href=3D"mailto:kei@nohguchi.com">kei@noh=
guchi.com</a>&gt;<br></blockquote><div><br></div><div>The commit message su=
mmary violates our commit message guidelines. See=C2=A0<a href=3D"http://ww=
w.openembedded.org/wiki/Commit_Patch_Message_Guidelines">http://www.openemb=
edded.org/wiki/Commit_Patch_Message_Guidelines</a> and <a href=3D"https://w=
ww.yoctoproject.org/docs/1.2/dev-manual/dev-manual.html">https://www.yoctop=
roject.org/docs/1.2/dev-manual/dev-manual.html</a> section &quot;3.9. How t=
o Submit a Change&quot; for the OE/Yocto requirements, and=C2=A0<a href=3D"=
http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html">http:=
//tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html</a> for gen=
eral guidelines.</div></div>-- <br><div class=3D"gmail_signature">Christoph=
er Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded,=
 OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graph=
ics</div>
</div></div>

--001a113ecc0a10cd620524603841--
