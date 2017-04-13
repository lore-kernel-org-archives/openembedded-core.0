Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 61E9A71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:49:52 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t189so50176791wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eB44Is+4B6HiP2EecQ2Vp24eG1a7PCPTFuJOtz0dNPU=;
	b=RTuw8RADeapxIlRiPB4j6fpYGTDuC6ipCiiL2yG81chQKOJmO3BsY4gn81t7eZct1B
	WqIQRMN6fXI1TD0xkSkFJ1lPdZrl7bGu+pZ1onCVdaJQ62z9E+LZw4fBXtPwh150Yh2K
	dp3BYh4kIaKpzeVCYN4/SWm9FGrnjuDs42Fi1OF6t2wOn5xc60uhKeVAwBBuT2Mbdh/R
	oka5GAT7VYs5z1Guwsasjws6fyBEoxRA6U8j0cBY8WPEOGhS1pQarOqYMWXcO0veOCJT
	yxstJDT6gGAeD+d8mFRBX9bZUWbMLGye9+qloiATE0SRU2+a4uRroM4m7XTl0iwkXc21
	HKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eB44Is+4B6HiP2EecQ2Vp24eG1a7PCPTFuJOtz0dNPU=;
	b=q/MY5QLjE3qkjgAZ41tNwqwYhLPkditY44qLHNJ6ITtyBsOZGvr4rv3MnXdIs0sgNE
	QTpIloHaTIoOLADHTzlnZQPaWl5hMNzh5KUTNpg8CBZS/liYT8/bg7Qn2O+ZRDWz3lvf
	T4PvaqHIw4e54wIjxtFGzrKEPeE0y0D3m6nDiaAdwx7ZXdJZDquK8fPvmjr+b9zSBC9i
	jgw3hbzSqDQAABFTwAXzOeXU5aI7PeDM9jJE+vCDYY5n12mZbNApTs+moFEj9vy6bzy7
	UbZow68M4+wdEsRZmDgn4alEByJnv4BIfLE6W/Iu/cvL6+GLz7BfGky4xvuxO0GiJlX4
	SkMg==
X-Gm-Message-State: AN3rC/6QE3fT3lS5ouvs8jVBoDV5aakMFQHL3Z1M+I51DDzsAwRK863K
	szPbG5gGNMDTgOVYyFOmsryv+nel7A==
X-Received: by 10.28.48.70 with SMTP id w67mr3818505wmw.124.1492098594107;
	Thu, 13 Apr 2017 08:49:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 13 Apr 2017 08:49:53 -0700 (PDT)
In-Reply-To: <CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Apr 2017 17:49:53 +0200
Message-ID: <CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 15:49:53 -0000
Content-Type: multipart/alternative; boundary=001a11424692abfae4054d0e460b

--001a11424692abfae4054d0e460b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Some recipes like firefox depend on unzip even outside the do_unpack task:
https://github.com/OSSystems/meta-browser/commit/1e9c2d21cd4757b8d2352c2ff5=
aa72f3409d59f9
https://github.com/OSSystems/meta-browser/commit/bd2c39ddba00a3e0171e30ee4a=
4585b56122990a

but I agree these cases should be fixed by DEPENDS in the recipes which
need it instead of adding unzip globally for all.

On Thu, Apr 13, 2017 at 5:47 PM, Christopher Larson <kergoth@gmail.com>
wrote:

>
> On Thu, Apr 13, 2017 at 8:44 AM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com> wrote:
>
>> fixes do_unpack for *.zip-files:
>>
>> | /bin/sh: unzip: command not found
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index af3937a..1ea0dea 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -461,7 +461,7 @@ HOSTTOOLS +=3D " \
>>      mktemp mv nm objcopy objdump od patch perl pod2man printf pwd pytho=
n
>> \
>>      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh
>> sleep \
>>      sort split stat strings strip tail tar tee test touch tr true uname
>> uniq \
>> -    wc wget which xargs \
>> +    unzip wc wget which xargs \
>>  "
>>
>
> unzip-native is already added to the depends of do_unpack in
> base.bbclass.. there should be no need to use an unzip on the host at all=
.
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11424692abfae4054d0e460b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Some recipes like firefox depend on unzip even outside the=
 do_unpack task:<div><a href=3D"https://github.com/OSSystems/meta-browser/c=
ommit/1e9c2d21cd4757b8d2352c2ff5aa72f3409d59f9">https://github.com/OSSystem=
s/meta-browser/commit/1e9c2d21cd4757b8d2352c2ff5aa72f3409d59f9</a><br></div=
><div><a href=3D"https://github.com/OSSystems/meta-browser/commit/bd2c39ddb=
a00a3e0171e30ee4a4585b56122990a">https://github.com/OSSystems/meta-browser/=
commit/bd2c39ddba00a3e0171e30ee4a4585b56122990a</a><br></div><div><br></div=
><div>but I agree these cases should be fixed by DEPENDS in the recipes whi=
ch need it instead of adding unzip globally for all.</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 13, 2017 at 5:4=
7 PM, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gm=
ail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span=
 class=3D""><br><div class=3D"gmail_quote">On Thu, Apr 13, 2017 at 8:44 AM,=
 Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@=
googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_43870357884738521:=
1zg" class=3D"m_43870357884738521a3s m_43870357884738521aXjCH m_43870357884=
738521m15b67fe0d9c4ee15">fixes do_unpack for *.zip-files:<br>
<br>
| /bin/sh: unzip: command not found<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index af3937a..1ea0dea 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -461,7 +461,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0mktemp mv nm objcopy objdump od patch perl pod2man prin=
tf pwd python \<br>
=C2=A0 =C2=A0 =C2=A0python2.7 python3 ranlib readelf readlink rm rmdir rpcg=
en sed sh sleep \<br>
=C2=A0 =C2=A0 =C2=A0sort split stat strings strip tail tar tee test touch t=
r true uname uniq \<br>
-=C2=A0 =C2=A0 wc wget which xargs \<br>
+=C2=A0 =C2=A0 unzip wc wget which xargs \<br>
=C2=A0&quot;</div></blockquote></div><br></span>unzip-native is already add=
ed to the depends of do_unpack in base.bbclass.. there should be no need to=
 use an unzip on the host at all.<span class=3D"HOEnZb"><font color=3D"#888=
888"><br>-- <br><div class=3D"m_43870357884738521gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christophe=
r Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></di=
v>
</font></span></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a11424692abfae4054d0e460b--
