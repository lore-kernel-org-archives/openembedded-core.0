Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id C6399719AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 17:50:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id t52so12805077qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 10:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jHjwcprj6ooxJww8uetn/N0ETv7SV8x2p0O1IDczdIE=;
	b=NwqY8MquE2lLJqYLzJIxdVoJsx3DTiKOJCeHh9Tkvw+/RuroqW0ns2vDfDnuDrhIN9
	AgZMM3I3258bjmDEKxZ9GwMYPB6W5BN5w+UXVEC595P7twN9o/eZlDgD9mqFBCk86COc
	obWzpmsA+LEOup0edpY8V6VMjpbPpVWyfVXK8vLcFPbSEb7fekaMVmJgZ4YOy8k+6fJ/
	kZouOBPPtIoQkUlw9Y580MhOWJDq04od3Ik9LEiMzmkYgCdmPA9kPS3zCLFDBPCBhLab
	Tvv44RUZ18nRvCWyhWLJXh7ESRnCctMTKm9dZNB/tLrjRo/CLVMFnLrdkJlLKZ9ktdv5
	Dw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jHjwcprj6ooxJww8uetn/N0ETv7SV8x2p0O1IDczdIE=;
	b=HATsknWMkozB38m32PKg0IYbFOe5N7xkYHRVvu1mqayXmC5G0wgxw73zY6GGAX9jVc
	BOalepM0GY2qlhEE81z4o2wyRDQnTrB57GqxJwZPOTvWvwXp4nAXEnYnG9P8vKNoiYCZ
	x1BGJ0alDmpJzWAVjRlSh2mBh/zMHVQEw1ws5ji6B+NvrrzZTqXDKPlX7mcoyZPAlqyh
	LZyITAaw8tVb5042ARXwqqxCZjahvbrdNG6Jh4r+SQ11GNyMbnZo+WOAZ7WjH4gG0AFs
	OvfA1C1aGRlrwEnCYNPWUhDGkzA85Cc/PyIDOSr53HnSs0+j/JHvFN1yZqB07JCWygfI
	3J8A==
X-Gm-Message-State: AN3rC/6jzVhiindHMRz6n+IiUCYqMPGLedmuOW3RrgfTFMnQ5R0RNdl+
	rMh6NafnlMFnmgMoCn/PlvapkPA0gQ==
X-Received: by 10.237.39.146 with SMTP id a18mr14447362qtd.5.1492797010467;
	Fri, 21 Apr 2017 10:50:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 21 Apr 2017 10:50:08 -0700 (PDT)
In-Reply-To: <bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2017 13:50:08 -0400
Message-ID: <CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 17:50:11 -0000
Content-Type: multipart/alternative; boundary=f403045f31bc87e02d054db0e386

--f403045f31bc87e02d054db0e386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>
> Anyone else seeing this as well?
>
>
> yes
>

If you see it, can you take a look at the linux source dir and see if the
directories are
present ?

I've been doing a tight loop on builds all day, and  haven't seen this yet.

Nothing has changed with the build process in months, so something else
underneath
is now causing this race/issue.

Bruce


>
> - armin
>
> I've updated to oe-core commit:
>
> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>
> from some revision maybe 20-40 commits older and now I'm seeing:
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
>
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

--f403045f31bc87e02d054db0e386
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_-3190757637650521301moz-cite-prefix">On 04/21/2017 01:3=
6 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_-3190757637650521301gmail-console-output" style=3D"=
box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:=
0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">Anyone else seein=
g this as well?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div><div>If you see it, can you ta=
ke a look at the linux source dir and see if the directories are</div><div>=
present ?</div><div><br></div><div>I&#39;ve been doing a tight loop on buil=
ds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div><div>N=
othing has changed with the build process in months, so something else unde=
rneath</div><div>is now causing this race/issue.</div><div><br></div><div>B=
ruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#=
FFFFFF" text=3D"#000000">
    <br>
    - armin<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_-3190757637650521301gmail-console-output" style=3D"=
box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:=
0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_-3190757637650521301gmail-console-output" style=3D"=
box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:=
0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">I&#39;ve updated =
to oe-core commit:</pre>
        <pre class=3D"m_-3190757637650521301gmail-console-output" style=3D"=
box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px=
"><font color=3D"#333333"><span style=3D"font-size:14px;white-space:pre-wra=
p">c6cd5865b6914521a841ae0c9f4e2b<wbr>cda99beff2
</span></font></pre>
        <pre class=3D"m_-3190757637650521301gmail-console-output" style=3D"=
box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px=
"><font color=3D"#333333"><span style=3D"font-size:14px;white-space:pre-wra=
p">from some revision maybe 20-40 commits older and now I&#39;m seeing:</sp=
an></font></pre>
        <pre class=3D"m_-3190757637650521301gmail-console-output" style=3D"=
box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:=
0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_-3190757637650521301gmail-console-output" style=3D"=
box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:=
0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">ERROR: linux-yoct=
o-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0 do_validate_branch=
es: Function failed: do_validate_branches (log file is located at linux-yoc=
to/1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0/temp/log.do_<wbr>=
validate_branches.5385)
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
<wbr>validate_branches) failed with exit code &#39;1&#39;</pre>
      </div>
      <br>
      <fieldset class=3D"m_-3190757637650521301mimeAttachmentHeader"></fiel=
dset>
      <br>
    </blockquote>
    <br>
  </span></div>

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

--f403045f31bc87e02d054db0e386--
