Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A3EC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:36:15 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.197820.1673966166370984892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=khwxxiUf;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id k6so23459159vsk.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hi/iQIR6m3LpQrLu6jyI0xs3gTVweU4sq6zRJRMyvRk=;
        b=khwxxiUf4BnO5jyp2/6R+E650mFY31UdrqXAEV8a2w5CkFJEYCGFfy4YQooJ1cG3m7
         wXTSCVDeS3P3/z90UAMtABxhInZ2FxCWCNYdbJaO4JTHJ8MJrhDUx7kkMRY3xDJyOHz7
         lWo1yKGQ9ZLfZSDO+gAZcm7GuCpG2GPw2n8h99ZZ2UIbTd2QoxG+xsKss7loV4Y3gSkB
         b8vU3FWbzJro9RgNeERT4G/Ga3KYjEAN7ZDWsdGDSMHG+ZKVdtxOp/ZzZnOIpE8NuN1i
         +Xia5WBrYPm+Nl9zteP8Qnhpd+adG2dpNapq/QGl2ONCEP+fIiHcHUmR8PaXKOtD4kGt
         nMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi/iQIR6m3LpQrLu6jyI0xs3gTVweU4sq6zRJRMyvRk=;
        b=Y6Y+ExVK74lcDzhSAybQJF7EuOwt9eYLKVwAl5yLMY9jf/Oafm16t35SXTtC3MBKry
         yBShAC1ZqciAeQcFd+H2ESIqNY4I1l+dVq3olYt2P9bnS4l9iB+8pfqWkENGSbvmSNjn
         KTZKHwK9YRH7iYnK5L11hbqX17Dx0OXdK4LJbVMpyFOBblO8j4nkyEk6wqrcfee8Khhs
         cRYfSzl3iOHfpLEWbzVVGG6YsMkRME8dAMH1zaF/xdi0tZ2H2t7YiZcOY7p/wVyHQEyF
         bwOeLgHC7WGmruk2I3GXr2fcHtlRPrwHT/TPU+z0mWmCIAxXh9BqD5XpYV6uiEbDxn9k
         MeFw==
X-Gm-Message-State: AFqh2kqbU2Al3/+SNCoA6Mor0sOmgDmpLnmlMxT+Ww9nm9tUrzmZmOUD
	NrNxGM1TEUG/MBJbS84BG8l0oKUtm5lIBvfDGCQ=
X-Google-Smtp-Source: AMrXdXuiv1svOby5apF+RDoyFhAI+QQ+CqwdakT3KE2IxEjN/S/0TZSjl8TFkLM3Aglez1LlZncZPp3e3+Se2mPsN+k=
X-Received: by 2002:a67:ee4d:0:b0:3d3:d863:551d with SMTP id
 g13-20020a67ee4d000000b003d3d863551dmr373976vsp.60.1673966165281; Tue, 17 Jan
 2023 06:36:05 -0800 (PST)
MIME-Version: 1.0
References: <20230109134930.1409270-1-richard.purdie@linuxfoundation.org>
 <CANPvuRmQiEXiZ7+9_N5O=FmKcMPcjhqBU-Fn8bJ-KYirNg0Z3g@mail.gmail.com> <60471b4cad9af5016e08174e3e7d7878be89d5a1.camel@linuxfoundation.org>
In-Reply-To: <60471b4cad9af5016e08174e3e7d7878be89d5a1.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 17 Jan 2023 14:35:54 +0000
Message-ID: <CANPvuRmjUHFVO4DgkFOSmU_2nLb8j6XJVA6nyqYOKt+rUBUugA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uninative-tarball: Add libgcc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5d13105f2769e76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176048

--000000000000a5d13105f2769e76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 16/01/2023 =C3=A0(s) 23:42:

> On Mon, 2023-01-16 at 19:21 +0000, Jose Quaresma wrote:
> > Hi Richard,
> >
> > I am seeing some build errors like this at the end of the build whre
> bibake segment fault.
> > My problem is this happens on a build that doesn't use uninative,
> > does bitbake require uninative to build on master?
>
> No, it doesn't.
>
> My worry was that uninative didn't contain libgcc which meant that
> builds could fail like this if it wasn't present. The reason for the
> change is threading in bitbake itself and the thread.join() calls which
> seem to trigger pthread_cancel() calls under some circumstances. Having
> libgcc present in uninative seemed like a good idea so I've ensured
> that. I wasn't entirely convinced it would solve it, I half expected to
> see a new/different error replacing it.
>
> Is libgcc present on your build system? It would seem strange for it
> not to be but that is what the error message suggests.
>

No, I don't have libgcc installed on my build container and this is the
main reason.
I know that we now need the libgcc on the build host and this can satisfied
in two different ways:

1 - installing the libgcc on the build host
2 - using the unative

For now I will use the [1] because I don't use the uninative.
Maybe the documentation needs to be updated adding the libgcc
as a requirement of bitbake.


> I've also seem mention of issues with this in some versions of python
> but I've not seen any errors on the autobuilder since I ensured it was
> present in uninative.
>
> > This is my build log where bitbake crash at the end:
> >
> > INFO: Build completion summary:
> > INFO:   do_populate_sysroot: 100.0% sstate reuse(387 setscene, 0 scratc=
h)
> > INFO:   do_deploy_source_date_epoch: 100.0% sstate reuse(5 setscene, 0
> scratch)
> > INFO:   do_deploy_archives: 100.0% sstate reuse(400 setscene, 0 scratch=
)
> > INFO:   do_create_spdx: 100.0% sstate reuse(364 setscene, 0 scratch)
> > INFO:   do_create_runtime_spdx: 100.0% sstate reuse(342 setscene, 0
> scratch)
> > INFO:   do_package_qa: 100.0% sstate reuse(243 setscene, 0 scratch)
> > INFO:   do_package: 100.0% sstate reuse(26 setscene, 0 scratch)
> > INFO:   do_packagedata: 100.0% sstate reuse(243 setscene, 0 scratch)
> > INFO:   do_package_write_ipk: 100.0% sstate reuse(243 setscene, 0
> scratch)
> > INFO:   do_populate_lic: 100.0% sstate reuse(395 setscene, 0 scratch)
> > INFO: Writing buildhistory
> > INFO: Writing buildhistory took: 10 seconds
> > libgcc_s.so.1 must be installed for pthread_cancel to work
> > /lmp/bb-build.sh: line 24: 91770 Aborted                 (core dumped)
> bitbake -D ...
>
> This is the build system's python saying it can't find libgcc_s.so.1 so
> I'd start by checking it is there. I'm assuming you're not using
> buildtools?
>

No, I am not using the buildtools nor the uninative.
My build container is ubuntu 20.04 based and dont have libgcc.
This is not the first time I see this error in the last few weeks
but I'll go install libgcc and it should fix my issue, if not i will come
back.

Jose



>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a5d13105f2769e76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia segunda, 16/01/2023 =C3=A0(s) 23:42:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Mon, 2023-01-16 at 19:21 +0000,=
 Jose Quaresma wrote:<br>
&gt; Hi=C2=A0Richard,<br>
&gt; <br>
&gt; I am seeing some build errors=C2=A0like this at the end of the build w=
hre bibake segment fault.<br>
&gt; My problem is this happens on a build that doesn&#39;t=C2=A0use uninat=
ive,<br>
&gt; does bitbake require uninative to build on master?<br>
<br>
No, it doesn&#39;t.<br>
<br>
My worry was that uninative didn&#39;t contain libgcc which meant that<br>
builds could fail like this if it wasn&#39;t present. The reason for the<br=
>
change is threading in bitbake itself and the thread.join() calls which<br>
seem to trigger pthread_cancel() calls under some circumstances. Having<br>
libgcc present in uninative seemed like a good idea so I&#39;ve ensured<br>
that.=C2=A0I wasn&#39;t entirely convinced it would solve it, I half expect=
ed to<br>
see a new/different error replacing it.<br>
<br>
Is libgcc present on your build system? It would seem strange for it<br>
not to be but that is what the error message suggests.<br></blockquote><div=
><br></div><div>No, I don&#39;t=C2=A0have libgcc installed on my build cont=
ainer and this is the main reason.</div><div>I know=C2=A0that we now need t=
he libgcc on the build host and this can satisfied</div><div>in two differe=
nt ways:</div><div><br></div><div>1 - installing the libgcc on the build ho=
st</div><div>2 - using the unative</div><div><br>For now I will use the [1]=
 because I don&#39;t use the uninative.<br>Maybe the documentation needs to=
 be updated adding the libgcc</div><div>as a requirement=C2=A0of bitbake.<b=
r><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;ve also seem mention of issues with this in some versions of python<b=
r>
but I&#39;ve not seen any errors on the autobuilder since I ensured it was<=
br>
present in uninative.<br>
<br>
&gt; This is my build log where=C2=A0bitbake crash at the end:<br>
&gt; <br>
&gt; INFO: Build completion summary:<br>
&gt; INFO: =C2=A0 do_populate_sysroot: 100.0% sstate reuse(387 setscene, 0 =
scratch)<br>
&gt; INFO: =C2=A0 do_deploy_source_date_epoch: 100.0% sstate reuse(5 setsce=
ne, 0 scratch)<br>
&gt; INFO: =C2=A0 do_deploy_archives: 100.0% sstate reuse(400 setscene, 0 s=
cratch)<br>
&gt; INFO: =C2=A0 do_create_spdx: 100.0% sstate reuse(364 setscene, 0 scrat=
ch)<br>
&gt; INFO: =C2=A0 do_create_runtime_spdx: 100.0% sstate reuse(342 setscene,=
 0 scratch)<br>
&gt; INFO: =C2=A0 do_package_qa: 100.0% sstate reuse(243 setscene, 0 scratc=
h)<br>
&gt; INFO: =C2=A0 do_package: 100.0% sstate reuse(26 setscene, 0 scratch)<b=
r>
&gt; INFO: =C2=A0 do_packagedata: 100.0% sstate reuse(243 setscene, 0 scrat=
ch)<br>
&gt; INFO: =C2=A0 do_package_write_ipk: 100.0% sstate reuse(243 setscene, 0=
 scratch)<br>
&gt; INFO: =C2=A0 do_populate_lic: 100.0% sstate reuse(395 setscene, 0 scra=
tch)<br>
&gt; INFO: Writing buildhistory<br>
&gt; INFO: Writing buildhistory took: 10 seconds<br>
&gt; libgcc_s.so.1 must be installed for pthread_cancel to work<br>
&gt; /lmp/bb-build.sh: line 24: 91770 Aborted =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (core dumped) bitbake -D ...<br>
<br>
This is the build system&#39;s python saying it can&#39;t find libgcc_s.so.=
1 so<br>
I&#39;d start by checking it is there. I&#39;m assuming you&#39;re not usin=
g<br>
buildtools?<br></blockquote><div><br>No, I am not using the buildtools=C2=
=A0nor the uninative.<br>My build container is ubuntu 20.04 based and dont =
have libgcc.<br>This is not the first time I see this error=C2=A0in the las=
t few weeks</div><div>but I&#39;ll go install libgcc and it should fix my i=
ssue, if not i will come back.<br><br>Jose</div><div><br></div><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000a5d13105f2769e76--

