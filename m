Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 881E365DB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 15:50:45 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so8952843qga.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 08:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TAlicwrD3J5UCS5r1XngCbFGLxZEYJOJ97NiXwqtnuo=;
	b=kSvq4ZN4ZWqna8H9k5Koiz2jj+/qOKslwk7uOjb+muAIeg+ykx8tBhF28SaHJJtMLR
	oAFa9HqQtWzwJYJupOzqcLy15cId0nqEe2unDon11W3KHxnr7v6523RZk5tBrRRw4X67
	9Nt5OdoFWPzNbvmgIKYuNTY0stcR7tItHk6B1pch8UnrpeBuTE3/yx35Fl+iR5Y244ns
	qhlM6sVkM3+oSYSR5Wmt6O8c2Ujog6l1MTko8+S0ap/4dU0qntqq8ewsVpNC6BDoTy7C
	ZtHcQwK9e0C5lFZbpJkGrfcceFePXpItTrHaF0/BNNVCxZWpE1qbeAIMXePhOhEgITsZ
	JOMQ==
X-Received: by 10.140.97.117 with SMTP id l108mr35760880qge.29.1407167447101; 
	Mon, 04 Aug 2014 08:50:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 4 Aug 2014 08:50:27 -0700 (PDT)
In-Reply-To: <lyoaw09sj2.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
	<lyoaw09sj2.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 4 Aug 2014 21:20:27 +0530
Message-ID: <CADyYWLkmXS4O=nRNmTzXPwxX+y_cWY0NM1OeFsrHS=LeYj7f3A@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 15:50:48 -0000
Content-Type: multipart/alternative; boundary=001a113941d6d2fadf04ffcfb30d

--001a113941d6d2fadf04ffcfb30d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2014 at 9:05 PM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Sujith H <sujith.h-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
> > If hostname is not added to /etc/hosts file then rpcinfo command fails
> > when hostname is passed as argument.
> > ...
> > root@mx6q:~# rpcinfo -s mx6q
> > rpcinfo: can't contact rpcbind: RPC: (unknown error code)
>
> Is this really a common/valid use case?  'rpcinfo' is a debug tool and
> when you want information about the local host, you can execute
>
> # rpcinfo -s localhost
>
> IMHO, when using network related functionality, you have to setup
> networking.  This means:
>
> - setup the hostname; using ${MACHINE} is ambiguous with more than one
>   device and the string can contain chars forbidden by DNS ('_')
>
> - setup name resolving; this can be done by ordinary DNS, (unambiguous)
>   /etc/hosts, mDNS
>
>
> When DNS mapping of ${MACHINE} (or better `hostname`) without working
> DNS is really required, 'systemd' contains 'libnss_myhostname.so' (which
> is to be registered in /etc/nsswitch) which returns '127.0.0.2' as a
> fallback.
>
>
Is it ok to read from /etc/hostname and then have that in the /etc/hosts
file, rather than using ${MACHINE}?

>
> Enrico
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
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a113941d6d2fadf04ffcfb30d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Aug 4, 2014 at 9:05 PM, Enrico Scholz <span dir=3D"ltr">&lt=
;<a href=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enric=
o.scholz@sigma-chemnitz.de</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">Sujith H &lt;<a href=3D"mail=
to:sujith.h-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sujith.h-Re5JQEeQqe8Av=
xtiuMwx3w@public.gmane.org</a>&gt; writes:<br>


<br>
&gt; If hostname is not added to /etc/hosts file then rpcinfo command fails=
<br>
&gt; when hostname is passed as argument.<br>
</div>&gt; ...<br>
<div class=3D"">&gt; root@mx6q:~# rpcinfo -s mx6q<br>
&gt; rpcinfo: can&#39;t contact rpcbind: RPC: (unknown error code)<br>
<br>
</div>Is this really a common/valid use case? =C2=A0&#39;rpcinfo&#39; is a =
debug tool and<br>
when you want information about the local host, you can execute<br>
<br>
# rpcinfo -s localhost<br>
<br>
IMHO, when using network related functionality, you have to setup<br>
networking. =C2=A0This means:<br>
<br>
- setup the hostname; using ${MACHINE} is ambiguous with more than one<br>
=C2=A0 device and the string can contain chars forbidden by DNS (&#39;_&#39=
;)<br>
<br>
- setup name resolving; this can be done by ordinary DNS, (unambiguous)<br>
=C2=A0 /etc/hosts, mDNS<br>
<br>
<br>
When DNS mapping of ${MACHINE} (or better `hostname`) without working<br>
DNS is really required, &#39;systemd&#39; contains &#39;libnss_myhostname.s=
o&#39; (which<br>
is to be registered in /etc/nsswitch) which returns &#39;127.0.0.2&#39; as =
a<br>
fallback.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>Is it ok to read from /etc/hostname and then have th=
at in the /etc/hosts file, rather than using ${MACHINE}? <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">

<span class=3D"HOEnZb"><font color=3D"#888888">
<br>
Enrico<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign<=
/a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div>

--001a113941d6d2fadf04ffcfb30d--
