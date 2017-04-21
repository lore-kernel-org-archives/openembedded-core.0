Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 19B4C71AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:26:34 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id t52so11660907qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mld90oISIWETwZhJnClnTADyXORSb59EeVdQKEREC4k=;
	b=Qg9NnYuFKXGRfZRjsqu57/jSCOlLmRGp/J/MTzjnpK2YwCshyuCrzsyXz+aBuE52mu
	ZraKjCzOo1cUBkCbuXs33lzPj0qupaOG+guFVGQHTlJCEPq1Mm+SQlhYsl9EQ+drigt0
	xXBKG2PJrHBYrfS9vbbh5xjzSWTgFomssp6M/XJFuHDjyhy+L1vegfQGu1FLdl5FEaZe
	cZ/UGG/jeffY+F/6OfOa/P5jU0pFurr23iYEFKuhUN9Ejdkn9iSWcUlOpCCRcQ6eCE//
	oBdq5ZDanLIlKS++QQW/cieod0dUfHWF95EDkDn4xQKendtvlvS6D7csXNQ1K6B2dCIz
	JZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mld90oISIWETwZhJnClnTADyXORSb59EeVdQKEREC4k=;
	b=WnZQNrYAyPksqMwaLuZf0Ksys09rvmYZG8yUVJtGo22m7XPXBiUWXas0wIT6istNkX
	tLzE/q7Kz4vG1ipla7cAK8qOG2UO2VpQorX41W3zXVJzT4xroBVyso/JZrz8Vw8VnmfX
	I23PQOwhMJpV03KPzBd9rLHaVfPttB+M8D4JaNE3Qp88TEzTV+dOMjmrfV79s3WzNqfN
	im+XOgCvS6Fd913DJJbrG+6kHqCMIDwNswq+XbRGnzS9Nuvyz8SoLhx5J8a1Y/oMqSpn
	w1vDF9OwAQsSLX5wg84j7o73avZOYoPtkahSDInTTJ1Oa3STgzRcI9f2GRWQEIuYNQIl
	sRrg==
X-Gm-Message-State: AN3rC/7bxRpyK5vVTUAJnarO1iAHok8ybc/bIkw2kxvE625wCmdWZE0L
	+1ssXrNTX+1x0KzRp9NH4WyLrW4jdg==
X-Received: by 10.237.39.146 with SMTP id a18mr12848950qtd.5.1492777595803;
	Fri, 21 Apr 2017 05:26:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 21 Apr 2017 05:26:35 -0700 (PDT)
In-Reply-To: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2017 08:26:35 -0400
Message-ID: <CADkTA4Pi7SWq_PrYYJZiJa0CQUU-EN+ZVxPTPZV0Z8SvAYjcaA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Fri, 21 Apr 2017 12:26:36 -0000
Content-Type: multipart/alternative; boundary=f403045f31bc539d05054dac5e58

--f403045f31bc539d05054dac5e58
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 4:36 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Anyone else seeing this as well?
>
>
>
Richard saw this once last week, and we weren't able to reproduce it. I've
just updated
and am doing builds now.

If anyone has info on their config, build steps, etc, I'm interested to
hear so I can figure
out what is going on.

Bruce


> I've updated to oe-core commit:
>
> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>
> from some revision maybe 20-40 commits older and now I'm seeing:
>
>
> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_valida=
te_branches: Function failed: do_validate_branches (log file is located at =
linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_valida=
te_branches.5385)
> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+ad2e=
885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
> Log data follows:
> | DEBUG: Executing shell function do_validate_branches
> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=E2=
=84=A2: File exists
> |
> | [ERROR] Can't find patch dir at ./patches/standard/base
> | usage: kgit s2q
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_validate_branches (log file is located at li=
nux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate=
_branches.5385)
> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: ta=
sk do_validate_branches: Failed
> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_val=
idate_branches) failed with exit code '1'
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045f31bc539d05054dac5e58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 21, 2017 at 4:36 AM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><pre class=3D"m_2783823567389143276gmail-console-output" style=3D"box-si=
zing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;ma=
rgin-bottom:0px;color:rgb(51,51,51);font-size:14px">Anyone else seeing this=
 as well?</pre><pre class=3D"m_2783823567389143276gmail-console-output" sty=
le=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margi=
n-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><br></pre><=
/div></blockquote><div><br></div><div>Richard saw this once last week, and =
we weren&#39;t able to reproduce it. I&#39;ve just updated</div><div>and am=
 doing builds now.</div><div><br></div><div>If anyone has info on their con=
fig, build steps, etc, I&#39;m interested to hear so I can figure</div><div=
>out what is going on.</div><div><br></div><div>Bruce</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><pre class=3D"m_2783823567=
389143276gmail-console-output" style=3D"box-sizing:border-box;white-space:p=
re-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,=
51,51);font-size:14px"></pre><pre class=3D"m_2783823567389143276gmail-conso=
le-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14p=
x">I&#39;ve updated to oe-core commit:</pre><pre class=3D"m_278382356738914=
3276gmail-console-output" style=3D"box-sizing:border-box;word-wrap:break-wo=
rd;margin-top:0px;margin-bottom:0px"><font color=3D"#333333"><span style=3D=
"font-size:14px;white-space:pre-wrap">c6cd5865b6914521a841ae0c9f4e2b<wbr>cd=
a99beff2<br></span></font></pre><pre class=3D"m_2783823567389143276gmail-co=
nsole-output" style=3D"box-sizing:border-box;word-wrap:break-word;margin-to=
p:0px;margin-bottom:0px"><font color=3D"#333333"><span style=3D"font-size:1=
4px;white-space:pre-wrap">from some revision maybe 20-40 commits older and =
now I&#39;m seeing:</span></font></pre><pre class=3D"m_2783823567389143276g=
mail-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fon=
t-size:14px"><br></pre><pre class=3D"m_2783823567389143276gmail-console-out=
put" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-wo=
rd;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">ERR=
OR: linux-yocto-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0 do_v=
alidate_branches: Function failed: do_validate_branches (log file is locate=
d at linux-yocto/1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0/tem=
p/log.do_<wbr>validate_branches.5385)
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+<wbr>gitAUTOINC+a=
d2e885015_<wbr>fe0fb8da3d-r0/temp/log.do_<wbr>validate_branches.5385
Log data follows:
| DEBUG: Executing shell function do_validate_branches
| HEAD is now at fe0fb8d Merge tag &#39;v4.10.9&#39; into standard/base
| mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=E2=
=84=A2: File exists
|=20
| [ERROR] Can&#39;t find patch dir at ./patches/standard/base
| usage: kgit s2q
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_validate_branches (log file is located at linu=
x-yocto/1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0/temp/log.do_=
<wbr>validate_branches.5385)
NOTE: recipe linux-yocto-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3=
d-r0: task do_validate_branches: Failed
ERROR: Task (oe-core/meta/recipes-kernel/<wbr>linux/linux-yocto_4.10.bb:do_=
<wbr>validate_branches) failed with exit code &#39;1&#39;</pre></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--f403045f31bc539d05054dac5e58--
