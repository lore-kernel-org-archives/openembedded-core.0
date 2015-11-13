Return-Path: <kei@nohguchi.com>
Received: from love.nohguchi.org (love.nohguchi.org [76.191.185.49])
	by mail.openembedded.org (Postfix) with ESMTP id D6133772AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by love.nohguchi.org (Postfix) with ESMTP id B76EF26C6272
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 17:46:28 -0800 (PST)
X-Virus-Scanned: amavisd-new at nohguchi.org
Received: from love.nohguchi.org ([127.0.0.1])
	by localhost (love.noguchis.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zk9qRZX58RwU
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 17:46:28 -0800 (PST)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by love.nohguchi.org (Postfix) with ESMTPSA id 4698B26C625F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 17:46:28 -0800 (PST)
Received: by wmvv187 with SMTP id v187so60460201wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 17:46:26 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.194.23.104 with SMTP id l8mr16820368wjf.132.1447379186378;
	Thu, 12 Nov 2015 17:46:26 -0800 (PST)
Received: by 10.28.86.68 with HTTP; Thu, 12 Nov 2015 17:46:26 -0800 (PST)
In-Reply-To: <CABcZANnj9gRXiSHyomVOxP1V-YS_mp5+cfbnzV9yTvP4+GRdQg@mail.gmail.com>
References: <1447365562-23888-1-git-send-email-kei@nohguchi.com>
	<CABcZANnj9gRXiSHyomVOxP1V-YS_mp5+cfbnzV9yTvP4+GRdQg@mail.gmail.com>
Date: Thu, 12 Nov 2015 17:46:26 -0800
X-Gmail-Original-Message-ID: <CAOrTOC-PuBEv7Ppdgo29FU2nyhF-ZXdxWDgcUKmVid8--n+jiQ@mail.gmail.com>
Message-ID: <CAOrTOC-PuBEv7Ppdgo29FU2nyhF-ZXdxWDgcUKmVid8--n+jiQ@mail.gmail.com>
From: Kei Nohguchi <kei@nohguchi.com>
To: Christopher Larson <clarson@kergoth.com>
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
X-List-Received-Date: Fri, 13 Nov 2015 01:46:29 -0000
Content-Type: multipart/alternative; boundary=047d7b41cdd04271e30524623a56

--047d7b41cdd04271e30524623a56
Content-Type: text/plain; charset=UTF-8

Thank you, Chris, for your quick reply!

I've re-formatted and send it to the list.

http://patchwork.openembedded.org/patch/107551/

Let me know if there is any other issue with this patch.

Cheers,

Kei

On Thu, Nov 12, 2015 at 3:22 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
>
> On Thu, Nov 12, 2015 at 2:59 PM, Kei Nohguchi <kei@nohguchi.com> wrote:
>
>> Adding python-ast package in the generate-manifest-2.7.py, to
>> automatically generate the python-ast package in the
>> python-2.7-manifest.inc file.  As mentioned in the [YOCTO #8684],
>> python-ast is required by the Ansible script on our OpenSwitch target
>> system, and we don't believe we can layer this package inside our
>> OpenSwitch specific layer.  And also, generate-manifest-2.7.py is the
>> right place, as python-ast might be used by other recipes.
>>
>> Signed-off-by: Kei Nohguchi <kei@nohguchi.com>
>>
>
> The commit message summary violates our commit message guidelines. See
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines and
> https://www.yoctoproject.org/docs/1.2/dev-manual/dev-manual.html section
> "3.9. How to Submit a Change" for the OE/Yocto requirements, and
> http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html for
> general guidelines.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>

--047d7b41cdd04271e30524623a56
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, Chris, for your quick reply!<div><br></div><div=
>I&#39;ve re-formatted and send it to the list.</div><div><br></div><div><a=
 href=3D"http://patchwork.openembedded.org/patch/107551/">http://patchwork.=
openembedded.org/patch/107551/</a><br></div><div><br></div><div>Let me know=
 if there is any other issue with this patch.</div><div><br></div><div>Chee=
rs,</div></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=
=3D"gmail_signature"><div dir=3D"ltr">Kei</div></div></div>
<br><div class=3D"gmail_quote">On Thu, Nov 12, 2015 at 3:22 PM, Christopher=
 Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=
=3D"_blank">clarson@kergoth.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Thu, Nov 12, 2015 at 2:59 PM, Kei Nohguchi <span dir=
=3D"ltr">&lt;<a href=3D"mailto:kei@nohguchi.com" target=3D"_blank">kei@nohg=
uchi.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">Adding python-ast pack=
age in the <a href=3D"http://generate-manifest-2.7.py" rel=3D"noreferrer" t=
arget=3D"_blank">generate-manifest-2.7.py</a>, to<br>
automatically generate the python-ast package in the<br>
python-2.7-manifest.inc file.=C2=A0 As mentioned in the [YOCTO #8684],<br>
python-ast is required by the Ansible script on our OpenSwitch target<br>
system, and we don&#39;t believe we can layer this package inside our<br>
OpenSwitch specific layer.=C2=A0 And also, <a href=3D"http://generate-manif=
est-2.7.py" rel=3D"noreferrer" target=3D"_blank">generate-manifest-2.7.py</=
a> is the<br>
right place, as python-ast might be used by other recipes.<br>
<br>
Signed-off-by: Kei Nohguchi &lt;<a href=3D"mailto:kei@nohguchi.com" target=
=3D"_blank">kei@nohguchi.com</a>&gt;<br></blockquote><div><br></div><div>Th=
e commit message summary violates our commit message guidelines. See=C2=A0<=
a href=3D"http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines"=
 target=3D"_blank">http://www.openembedded.org/wiki/Commit_Patch_Message_Gu=
idelines</a> and <a href=3D"https://www.yoctoproject.org/docs/1.2/dev-manua=
l/dev-manual.html" target=3D"_blank">https://www.yoctoproject.org/docs/1.2/=
dev-manual/dev-manual.html</a> section &quot;3.9. How to Submit a Change&qu=
ot; for the OE/Yocto requirements, and=C2=A0<a href=3D"http://tbaggery.com/=
2008/04/19/a-note-about-git-commit-messages.html" target=3D"_blank">http://=
tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html</a> for gener=
al guidelines.</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--=
 <br><div>Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bit=
Bake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Eng=
ineer, Mentor Graphics</div>
</font></span></div></div>
</blockquote></div><br></div>

--047d7b41cdd04271e30524623a56--
