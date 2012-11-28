Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TdlsV-0007og-4n
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:56:55 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so14484336ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EJAlkVTYE5VfMSbvX4RAPzvFQkJjZ1QVh8tisezFivM=;
	b=kLWdF7Ja2mPwkF5B44//YFwMPIqbeVjM0YSZXoFuNrdWzZtnDRJDwChGqJHEsuOlqi
	E6Ww356nirFpTwsvX85vpeOTvagVettvxQD8HQuQaRiQh1WkcqvZHO0MEAPf4Xo4aduc
	8hSbZZwanpdHtmOeh+X5syyUKjgni3gS8lISC9epSVASKMnQo5C1NhtdQApnDmu1sXnM
	msyK0H7oBeBQ9wjItSWUXGSDn5tzLhnedDN+9SryJ2R9iUGG1Rqta0rmrA4/HJ0ApwUb
	W7qMKy5092n6gW/9Yw2AtyAF4QQK0n6osHFnMJgxNmlyi4M1iWVKZOt6BBplhAA1Fljg
	OvUg==
Received: by 10.50.202.3 with SMTP id ke3mr22343328igc.49.1354124559984; Wed,
	28 Nov 2012 09:42:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 28 Nov 2012 09:42:09 -0800 (PST)
In-Reply-To: <lylidl3elv.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1354116375.git.raj.khem@gmail.com>
	<8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
	<lylidl3elv.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Nov 2012 09:42:09 -0800
Message-ID: <CAMKF1srgWb9Jm3s5Ho4270O0X_uXLvuy3xNTR+fx0VHUoL_CDg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] binutils-2.23.1: Add recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 17:56:56 -0000
Content-Type: multipart/alternative; boundary=f46d0447882d6127f004cf91b1f1

--f46d0447882d6127f004cf91b1f1
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 28, 2012 at 7:57 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
> > +EXTRA_OECONF_virtclass-native = "--enable-target=all ..."
>
> again: this option does not exist.  You want '--enable-targets=all'.
>
>
>
Thanks for reviewing. indeed I forgot to merge in changes
from 60fe4e80ca5845a0d03f918b80d6e980c13378b9
and bb67ddeb2eed3e25c626a279ef53a7e8c7bfe6f2 into the patch set. I have now
pushed a new commit
on top of the pull branch to take these changes into consideration.


> Enrico
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d0447882d6127f004cf91b1f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace"><br></font></font>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Nov 2=
8, 2012 at 7:57 AM, Enrico Scholz <span dir=3D"ltr">&lt;<a href=3D"mailto:e=
nrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sigma-chemn=
itz.de</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Khem Raj &lt;<a href=3D"mailto:raj.khem-Re5JQEeQqe8AvxtiuM=
wx3w@public.gmane.org">raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>=
&gt; writes:<br>


<br>
&gt; +EXTRA_OECONF_virtclass-native =3D &quot;--enable-target=3Dall ...&quo=
t;<br>
<br>
again: this option does not exist. =C2=A0You want &#39;--enable-targets=3Da=
ll&#39;.<br>
<br>
<br></blockquote><div><br></div><div>Thanks for reviewing. indeed I forgot =
to merge in changes from=C2=A060fe4e80ca5845a0d03f918b80d6e980c13378b9 and=
=C2=A0bb67ddeb2eed3e25c626a279ef53a7e8c7bfe6f2 into the patch set. I have n=
ow pushed a new commit</div>

<div>on top of the pull branch to take these changes into consideration.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex">


Enrico<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br></div>

--f46d0447882d6127f004cf91b1f1--
