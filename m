Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC857451F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 02:53:41 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id e2so4732481pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0eZNSTSWO5GE5Shjb1Ehp5DJ0zo7gfSRL2auA0oDXSU=;
	b=M96FFHW4SIk1M9rCKipjB78q1HvpsGVr1TM/OcwPs0iG3tC3kVMgKwa6P7GrFRLWSd
	mqgbJxEQrXafLfNiId40oZa5gBUZbDm9yEJ84HxQVQB0GYtbkkZTTY1JYRrryPApDR3+
	pSKCqf3963i/lBfCMX6OvWu/VBkpG9Nr5w+lXBRLJqyIt9O4eKFj6P47iwpQAbTPGRmb
	PIBhlY0pkz2I9iU7vEw1NuRlXO7UjBOY3iGu7liLp2Y2qt20zBAFHtnON5H963OUcGFJ
	Nke2xJYebp+SuX6fvbS1sS9jXIhdASqNNmox/oOIf1aoL3dopWd2MpFUU7ENrW0v1Hy1
	EvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0eZNSTSWO5GE5Shjb1Ehp5DJ0zo7gfSRL2auA0oDXSU=;
	b=Jkdpxru70Vf1bgWyvVoAabbFGsiNBVsjQ4J5fTiuw+QiPzhoVowvwMaqp+9a9kgvC6
	qAl95jaxcp/tsoZ84t1udMTzuhnv8ZsXN6PKQmMn61CMzz6+krJonSDfsw+9jI1Sz0mw
	xb9Hkhxhc03h65PhkB0ckrmVzjRAcvvY4Wlg/56ZmoML1Rb4khGr5BRVhEhzL4jN32nH
	FGTddL7GsiGC9mVvNEgl0tj6lxnA0GqWKPtf3VSZF/i9WitiINI5Frbgs+/csA/kuUcq
	od5kRl5eci9MO25H5/0jRCVfS11Dsq+KDsqqFNgzdgW1AYOqubp6U1YUYXip9DzFYykk
	PC4Q==
X-Gm-Message-State: ALQs6tBzv98Q6chOmoyQl8bkUPtKAT3Uu2X40yuo/1qPg8er1+SkVQPW
	/LnMj/0k2XuSVht9H9ToxuLqIVs91HbpN/NT3WU=
X-Google-Smtp-Source: AIpwx4/cqszR9yqob4EJW+J1XyV8FHfuhq/mOLxFp+j4phScpbbizewSIqV6u01XxQxq35FE1/ip/rd61ooXOVrDckc=
X-Received: by 10.98.147.10 with SMTP id b10mr319275pfe.7.1523933622353; Mon,
	16 Apr 2018 19:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRQ6Av0QFfDdiAk7Hc+9Tqoa7Zz0CTu-uigtfa=MLk93CA@mail.gmail.com>
	<b3c4df1f-602c-af55-5d64-5b0498ca3d53@windriver.com>
In-Reply-To: <b3c4df1f-602c-af55-5d64-5b0498ca3d53@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Apr 2018 02:53:31 +0000
Message-ID: <CAMKF1srXTmfT-k5+Qj5J=qNUWyYGpnZ_rRsr0R-WOTqaeHhuPw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: musl patches
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
X-List-Received-Date: Tue, 17 Apr 2018 02:53:41 -0000
Content-Type: multipart/alternative; boundary="94eb2c0dfb9438c374056a02721f"

--94eb2c0dfb9438c374056a02721f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 16, 2018 at 7:02 PM ChenQi <Qi.Chen@windriver.com> wrote:

> On 04/16/2018 07:05 PM, Andreas M=C3=BCller wrote:
> > Hi,
> >
> > I am not happy plastering patches around for musl. This gets even
> > worse when I see patches like this [1]: Just wipe away security checks
> > unconditionally - the developers did introduce this check not just for
> > fun I guess...
> >
> > I have seen this already elsewhere so: musl maintainers please take
> > care not to modify code for glibc!


The idea of musl is not to create a cocoon and live in it but on the
contrary it=E2=80=99s about fixing the packages such that they work on any =
posix
complaint libc regardless having said that there are packages which are
coded for glibc and we
Might have to keep trying to fix them upstream

So in the spirit we are making changes such that
They work across the board and then also push
These patches to respective upstreams so far we
Have done good job and upstreamed a whole bunch of patches this would not
have been possible if we did the conditional approach

We would not like to introduce regressions for sure and if you see
regressions please report them ASAP and if you have fixes even better

I am hoping that in the end applications will
Become more portable and we will also see
The cruft clearly that has gone into glibc over the years and be able to
address it as you can see  there is lot of cleanup happening in glibc
already as a result

>
> >
> > [1]
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipe=
s-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-availab=
le.patch
> >
> > Andreas
>
> Hi Anreas,
>
> I can see I rebased this patch. So I think I need to reply.
>
> I agree with you that musl related patches should not affect glibc.
> How about we using something like SRC_URI_append_libc-musl to organize
> the musl related patches?


No we should not unless the issue can=E2=80=99t be fixed in a compatible wa=
y

>
> Or do you have some other suggestion?


Fix in portable way and contribute the same to package upstream


>
> Best Regards,
> Chen Qi
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0dfb9438c374056a02721f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Apr 16, 2018 =
at 7:02 PM ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 04/16=
/2018 07:05 PM, Andreas M=C3=BCller wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am not happy plastering patches around for musl. This gets even<br>
&gt; worse when I see patches like this [1]: Just wipe away security checks=
<br>
&gt; unconditionally - the developers did introduce this check not just for=
<br>
&gt; fun I guess...<br>
&gt;<br>
&gt; I have seen this already elsewhere so: musl maintainers please take<br=
>
&gt; care not to modify code for glibc!</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">The idea of musl is not to create a cocoon and live =
in it but on the contrary it=E2=80=99s about fixing the packages such that =
they work on any posix complaint libc regardless having said that there are=
 packages which are coded for glibc and we</div><div dir=3D"auto">Might hav=
e to keep trying to fix them upstream</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">So in the spirit we are making changes such that</div><div di=
r=3D"auto">They work across the board and then also push=C2=A0</div><div di=
r=3D"auto">These patches to respective upstreams so far we</div><div dir=3D=
"auto">Have done good job and upstreamed a whole bunch of patches this woul=
d not have been possible if we did the conditional approach=C2=A0</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">We would not like to introduce re=
gressions for sure and if you see regressions please report them ASAP and i=
f you have fixes even better</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">I am hoping that in the end applications will</div><div dir=3D"auto">B=
ecome more portable and we will also see=C2=A0</div><div dir=3D"auto">The c=
ruft clearly that has gone into glibc over the years and be able to address=
 it as you can see =C2=A0there is lot of cleanup happening in glibc already=
 as a result</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openembedded/openembedded-core/blob/=
master/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versio=
ns-are-not-available.patch" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/openembedded/openembedded-core/blob/master/meta/recipes-core/syste=
md/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch</a>=
<br>
&gt;<br>
&gt; Andreas<br>
<br>
Hi Anreas,<br>
<br>
I can see I rebased this patch. So I think I need to reply.<br>
<br>
I agree with you that musl related patches should not affect glibc.<br>
How about we using something like SRC_URI_append_libc-musl to organize <br>
the musl related patches?</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">No we should not unless the issue can=E2=80=99t be fixed in a com=
patible way</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Or do you have some other suggestion?</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Fix in portable way and contribute the same to package=
 upstream=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
<br>
Best Regards,<br>
Chen Qi<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0dfb9438c374056a02721f--
