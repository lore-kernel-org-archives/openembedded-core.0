Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5506560559
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 13:57:55 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so8787513qga.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KkIorwNDwNGG+uUTJUTbfemqJu7//DPelg8/tmMFX+Y=;
	b=o2vkf6AaVDscj/TS7JA+T6b1WLlvPsM20RBauGz4N5Sskq2ylMX40whkk3kbb0wh0q
	V/YppnVzUUlz35HGM18v61McqNGzA7SQ8XDEGU2QJByCZt/XeiL2FFVyqD4XE2uM7eyV
	IHoWGFriijCRt4+XGJtgt09OIXcIRA/s9ZiCbvgJLXGKIMCBL9EgFmHuZb0J+bDRFwHS
	uVTfqx6IMcSVw4yiVXhbtmOfKm9m1adXnE3psvcYoc0l3LvZqxzpWhuE1dW+IY/w2L+/
	dk9CHnpu4RvF93qNrOR+BRwYi0OGWsxlLHObgvaJDkGQJCC816gVT5oBFaxZHpJb4Gzh
	3LrA==
X-Received: by 10.140.103.74 with SMTP id x68mr34646913qge.34.1407160676547;
	Mon, 04 Aug 2014 06:57:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 4 Aug 2014 06:57:36 -0700 (PDT)
In-Reply-To: <lyy4v8imyg.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>
	<ly8un9biuj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKpYgA9jQ2u4Nwh2=+NoQJcZiydtZdkDu0-jvnKfZxHvvg@mail.gmail.com>
	<lyy4v8imyg.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 4 Aug 2014 19:27:36 +0530
Message-ID: <CADyYWLk3B5kRpwZ4kEYH7n5M_73uW02iC2+y+hqJXJE3M4su5A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] netbase: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 13:57:56 -0000
Content-Type: multipart/alternative; boundary=001a1134eda844843f04ffce20ce

--001a1134eda844843f04ffce20ce
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I will post the new patch with ROOTFS_POSTPROCESS_COMMAND.

Thanks for the feedback.



On Fri, Aug 1, 2014 at 2:52 PM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org> writes:
>
> >>> +     echo 127.0.1.1 "             "${MACHINE} >>
> ${D}${sysconfdir}/hosts
> >>
> >> This is a very questionable setup which causes a lot of harm.  When
> >> really wanted, it should be made optional and not the default.
> >
> > What kind of harm you see?
>
> e.g. in sshd_config
>
> | ListenAddress <hostname>
>
>
> When Fedora had such a setup, I had a lot of trouble with KRB5ized
> NFS4. See [1] for examples. Generally, external and internal DNS should
> be consistent.
>
> Beside this... afaik ${MACHINE} can contain '_' and '.' which are either
> forbidden ('_') or have special meanings in DNS.
>
>
> Enrico
>
> Footnotes:
> [1]  https://bugzilla.redhat.com/show_bug.cgi?id=3D648725
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

Thanks,

Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a1134eda844843f04ffce20ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br></div>I will post the new patch with ROOTF=
S_POSTPROCESS_COMMAND.<br><br>Thanks for the feedback.<br><br><div><div><di=
v><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, Aug=
 1, 2014 at 2:52 PM, Enrico Scholz <span dir=3D"ltr">&lt;<a href=3D"mailto:=
enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sigma-chem=
nitz.de</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">Otavio Salvador &lt;<a href=
=3D"mailto:otavio-fKevB0iiKLMBZ%2BLybsDmbA@public.gmane.org">otavio-fKevB0i=
iKLMBZ+LybsDmbA@public.gmane.org</a>&gt; writes:<br>


<br>
&gt;&gt;&gt; + =C2=A0 =C2=A0 echo 127.0.1.1 &quot; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;${MACHINE} &gt;&gt; ${D}${sysconfdir}/hosts<br>
&gt;&gt;<br>
&gt;&gt; This is a very questionable setup which causes a lot of harm. =C2=
=A0When<br>
&gt;&gt; really wanted, it should be made optional and not the default.<br>
&gt;<br>
&gt; What kind of harm you see?<br>
<br>
</div>e.g. in sshd_config<br>
<br>
| ListenAddress &lt;hostname&gt;<br>
<br>
<br>
When Fedora had such a setup, I had a lot of trouble with KRB5ized<br>
NFS4. See [1] for examples. Generally, external and internal DNS should<br>
be consistent.<br>
<br>
Beside this... afaik ${MACHINE} can contain &#39;_&#39; and &#39;.&#39; whi=
ch are either<br>
forbidden (&#39;_&#39;) or have special meanings in DNS.<br>
<br>
<br>
Enrico<br>
<br>
Footnotes:<br>
[1] =C2=A0<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D648725" =
target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D648725</a><=
br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks,=
<br><br></div><div class=3D"gmail_extra">Sujith H<br clear=3D"all"></div><d=
iv class=3D"gmail_extra"><br>-- <br>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=
=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=
=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<b=
r>

<a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">h=
ttp://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"h=
ttp://sujithh.info" target=3D"_blank">http://sujithh.info</a><br>
</div></div></div></div></div>

--001a1134eda844843f04ffce20ce--
