Return-Path: <smennetrier@connected-labs.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 31BB060144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 15:05:59 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hn15so8629663igb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 08:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/ZC0s1z6FrbRl+7ZtvgR/VFkuVbFHPhndr9eyuW897M=;
	b=IthoosJ+bj56W8z0lOuIGeIJhRhA+zrZZoAHgFLotpLRYErK0uFyf5lON2HWzDEMe0
	KChUYE3jW/UAXt50shOOqAY5n76U9Eh+/K5BGrT2imyt5MlOlRBD6myBIgeg5NyvVZ6Z
	PWjsDcJGB60hZZ2D6QYOiOqJtGLR8ePUN7JzH9jrFtsh/QQcCUO7XczAnGRcopqRDZ+a
	asHgFpcsIhHScnifz1yDQv59FMM/2ImRNoW8VU0gmUfBpa1wyPlej5C3czc0A7Q76PY1
	PZK2Ash7o+xPFtxKzfEtq27NoEsU0coFD8I44qOv/zP0aUK98PeW57kAXip0BT9UFXG3
	fTzQ==
X-Gm-Message-State: ALoCoQkNus+jtoZFK7MVBUztS8/CuIuBRbA9JMUMkaxcTCdDFajMLoie7L09hZ7rsK03X81WOAtr
MIME-Version: 1.0
X-Received: by 10.51.17.2 with SMTP id ga2mr5466011igd.12.1411657560308; Thu,
	25 Sep 2014 08:06:00 -0700 (PDT)
Received: by 10.107.9.91 with HTTP; Thu, 25 Sep 2014 08:06:00 -0700 (PDT)
X-Originating-IP: [94.103.137.126]
In-Reply-To: <53D85A83.7090405@windriver.com>
References: <1404915889-26159-1-git-send-email-smennetrier@connected-labs.com>
	<CAKCtLPy=a4EHgA1Nqvih9JMNxeyVuLp7UUEifGsfPaF-G1Srxw@mail.gmail.com>
	<53D85A83.7090405@windriver.com>
Date: Thu, 25 Sep 2014 17:06:00 +0200
Message-ID: <CAKCtLPyH9H6XuZmqGRnrcBp5bk7_t8rHmYPC426er2apFpYYRQ@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Mennetrier?= <smennetrier@connected-labs.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][backport from master] apmd.service: Fix typo (not mandatory EnvironmentFile prefix)
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
X-List-Received-Date: Thu, 25 Sep 2014 15:06:04 -0000
Content-Type: multipart/alternative; boundary=001a113491e46d65400503e52356

--001a113491e46d65400503e52356
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping. Can someone accept this patch in dora branch please?

Thanks.

Regards,
Seb M

2014-07-30 4:37 GMT+02:00 Robert Yang <liezhi.yang@windriver.com>:

>
> Sorry for the late response, it worked well for me, I will confirm
> with RP.
>
> // Robert
>
> On 07/18/2014 03:30 PM, S=C3=A9bastien Mennetrier wrote:
>
>> Ping
>>
>> Is it possible to cherry-pick this patch from Master to Dora ?
>>
>> Commit : b21468434c519927dace6a1433786ca7a0501172
>>
>>
>> Regards,
>> Seb M
>>
>>
>> 2014-07-09 16:24 GMT+02:00 S=C3=A9bastien Mennetrier <
>> smennetrier@connected-labs.com
>> <mailto:smennetrier@connected-labs.com>>:
>>
>>     From: Tobias Blom <tobias.blom@techne-dev.se <mailto:
>> tobias.blom@techne-dev.se>>
>>
>>     Prefix to EnvironmentFile should be preciding the filenamn.
>>
>>     (From OE-Core rev: 1f694e4cb493b0737b6009382c0957e6837ebbed)
>>
>>     Signed-off-by: Tobias Blom <tobias.blom@techne-dev.se
>>     <mailto:tobias.blom@techne-dev.se>>
>>     Signed-off-by: Saul Wold <sgw@linux.intel.com <mailto:
>> sgw@linux.intel.com>>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>>     <mailto:richard.purdie@linuxfoundation.org>>
>>     ---
>>       meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service | 2 +-
>>       1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>>     b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>>     index 62d6af1..ffab823 100644
>>     --- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>>     +++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>>     @@ -3,5 +3,5 @@ Description=3DAdvanced Power Management daemon
>>       After=3Dremote-fs.target
>>
>>       [Service]
>>     -EnvironmentFile-=3D @SYSCONFDIR@/default/apmd
>>     +EnvironmentFile=3D-@SYSCONFDIR@/default/apmd
>>       ExecStart=3D@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
>>     --
>>     1.8.3.2
>>
>>
>>
>>
>>

--001a113491e46d65400503e52356
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping. Can someone accept this patch in dora branch please?=
<div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><div>Tha=
nks.</div></div></div></div><div class=3D"gmail_extra"><div><div dir=3D"ltr=
"><div style=3D"font-family:arial;font-size:small"><br>Regards,</div><div s=
tyle=3D"font-family:arial;font-size:small">Seb M</div></div></div>
<br><div class=3D"gmail_quote">2014-07-30 4:37 GMT+02:00 Robert Yang <span =
dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_bla=
nk">liezhi.yang@windriver.com</a>&gt;</span>:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
Sorry for the late response, it worked well for me, I will confirm<br>
with RP.<br>
<br>
// Robert<span class=3D""><br>
<br>
On 07/18/2014 03:30 PM, S=C3=A9bastien Mennetrier wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
Ping<br>
<br>
Is it possible to cherry-pick this patch from Master to Dora ?<br>
<br>
Commit : b21468434c519927dace6a1433786c<u></u>a7a0501172<br>
<br>
<br>
Regards,<br>
Seb M<br>
<br>
<br>
2014-07-09 16:24 GMT+02:00 S=C3=A9bastien Mennetrier &lt;<a href=3D"mailto:=
smennetrier@connected-labs.com" target=3D"_blank">smennetrier@connected-lab=
s.<u></u>com</a><br></span>
&lt;mailto:<a href=3D"mailto:smennetrier@connected-labs.com" target=3D"_bla=
nk">smennetrier@connected-<u></u>labs.com</a>&gt;&gt;:<br>
<br>
=C2=A0 =C2=A0 From: Tobias Blom &lt;<a href=3D"mailto:tobias.blom@techne-de=
v.se" target=3D"_blank">tobias.blom@techne-dev.se</a> &lt;mailto:<a href=3D=
"mailto:tobias.blom@techne-dev.se" target=3D"_blank">tobias.blom@techne-<u>=
</u>dev.se</a>&gt;&gt;<span class=3D""><br>
<br>
=C2=A0 =C2=A0 Prefix to EnvironmentFile should be preciding the filenamn.<b=
r>
<br>
=C2=A0 =C2=A0 (From OE-Core rev: 1f694e4cb493b0737b6009382c0957<u></u>e6837=
ebbed)<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Tobias Blom &lt;<a href=3D"mailto:tobias.blom@=
techne-dev.se" target=3D"_blank">tobias.blom@techne-dev.se</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:tobias.blom@techne-dev.se" targe=
t=3D"_blank">tobias.blom@techne-<u></u>dev.se</a>&gt;&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.inte=
l.com" target=3D"_blank">sgw@linux.intel.com</a> &lt;mailto:<a href=3D"mail=
to:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;&gt;<b=
r>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@<u></u>linuxfou=
ndation.org</a><br>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@<u></u>linuxfoundation.org</a>&gt;&gt;=
<span class=3D""><br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 meta/recipes-bsp/apmd/apmd-3.<u></u>2.2-14/apmd.servic=
e | 2 +-<br>
=C2=A0 =C2=A0 =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0 =C2=A0 diff --git a/meta/recipes-bsp/apmd/apmd-<u></u>3.2.2-14/apmd.=
service<br>
=C2=A0 =C2=A0 b/meta/recipes-bsp/apmd/apmd-<u></u>3.2.2-14/apmd.service<br>
=C2=A0 =C2=A0 index 62d6af1..ffab823 100644<br>
=C2=A0 =C2=A0 --- a/meta/recipes-bsp/apmd/apmd-<u></u>3.2.2-14/apmd.service=
<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-bsp/apmd/apmd-<u></u>3.2.2-14/apmd.service=
<br>
=C2=A0 =C2=A0 @@ -3,5 +3,5 @@ Description=3DAdvanced Power Management daemo=
n<br>
=C2=A0 =C2=A0 =C2=A0 After=3Dremote-fs.target<br>
<br>
=C2=A0 =C2=A0 =C2=A0 [Service]<br>
=C2=A0 =C2=A0 -EnvironmentFile-=3D @SYSCONFDIR@/default/apmd<br>
=C2=A0 =C2=A0 +EnvironmentFile=3D-@SYSCONFDIR@<u></u>/default/apmd<br>
=C2=A0 =C2=A0 =C2=A0 ExecStart=3D@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_pr=
oxy $APMD<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 1.8.3.2<br>
<br>
<br>
<br>
<br>
</span></blockquote>
</blockquote></div><br></div></div>

--001a113491e46d65400503e52356--
