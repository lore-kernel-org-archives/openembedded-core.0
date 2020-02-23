Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07973608A7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:44:44 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id i4so1862820vkc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 06:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oMHq/R2mXQIV3J9nmHLsg/3LXWNSkwwSeRYfzJs3E4Y=;
	b=poXsj+Z+JXfhYU7SMfjGyowd9/gN7VWdM1M1eveaLc8ESxzPWhj1zIDF3R6HjXPHT0
	8hGnBzOkA42xLMPedDA+WkZjcf95p7AT74MrEjbTC9D0XQIjsXiXABfJJgy6IBNpxGdR
	LgAylwHpCvovVXrarQKNw38d61t36fF+mdGnsx3yEKrYAFx+m/LStzKTguUhxIhrvVtg
	GMkpAYSXwE/gm7eMYU3JVLO8n3A8MoOh3xhZK0mA5NbqVDEEPRtiWhBdaQCosiIQmwua
	XdY+3B2BanO5njrXKFp7gfr+9rkSLSSvVo7sCSvQnyW4HEA1PlL9ov8h2rFphBIt7jTk
	R/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oMHq/R2mXQIV3J9nmHLsg/3LXWNSkwwSeRYfzJs3E4Y=;
	b=Vu4yjjakxUNBU66QZi+JPIwt/YiAu6q71zwpf5HDXahfUrCqqCrIvU9ceb6/938Cd9
	pJ1VlgnYj2cqEuX1G7N7qs4rofMI+jbqgMbDdIZTwI+z5iho/8MG1YwF6sqwLXu48iXN
	ZZe7KzegVNbyygF44H4Kj6kbE3uMbWitUJu3G2Xo1gofDM05afIZSHuZI2PLEsR67tKC
	3F6ryq8M35fxlTR3kK7e2WDS4SjBN06+n7h18BsVZ2Ve3P0wvjKnihpLsxklE0rVHMsH
	SfFOYfdP0GkGEzCJOme0UPXDBhjZ5pyzob8TcAD2KkH1nY29Ra5B+aJ6R1udRKnVxJ8O
	C73w==
X-Gm-Message-State: APjAAAXl/vkRoGVG56R6RtLoLdBLWq+yhRlTp5CeMXL8iACKVhvtnoYm
	7y8oTCjXRNbdCGmSg3Sel9FPmwjxauGsjLDheGE=
X-Google-Smtp-Source: APXvYqxBRdEejxXWlTswpf5yLNV79j4Nv+ZctIaBLyJ7QQg208ewZvSVyLzR/nN7p05F4m9dJ0lwuH7km8MT7BcE1O4=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr22476964vkn.0.1582469085204; 
	Sun, 23 Feb 2020 06:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20200223143600.2282-1-bunk@stusta.de>
	<CANNYZj_-YGgjz8eF8fAyv=7r+ng58o_mvm7NhZhV+KkQP=YsPA@mail.gmail.com>
In-Reply-To: <CANNYZj_-YGgjz8eF8fAyv=7r+ng58o_mvm7NhZhV+KkQP=YsPA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Feb 2020 15:44:34 +0100
Message-ID: <CANNYZj_00roUszccv5g_-HDmuc-Z_XZmgWy3X0r=7hhxeHM2Dw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: Inherit upstream-version-is-even
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
X-List-Received-Date: Sun, 23 Feb 2020 14:44:45 -0000
Content-Type: multipart/alternative; boundary="000000000000b11648059f3f4bec"

--000000000000b11648059f3f4bec
Content-Type: text/plain; charset="UTF-8"

Ah right, 19.10 is not LTS. Nevermind.

Alex

On Sun, 23 Feb 2020 at 15:42, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Is there a link to this policy, or some other document stating the rule?
>
> I am seeing that Ubuntu 19.10 ships 1.9:
> https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=apt
>
> Alex
>
> On Sun, 23 Feb 2020 at 15:36, Adrian Bunk <bunk@stusta.de> wrote:
>
>> Even versions are shipped in Ubuntu LTS and Debian releases.
>>
>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>> ---
>>  meta/recipes-devtools/apt/apt.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/apt/apt.inc
>> b/meta/recipes-devtools/apt/apt.inc
>> index 50c4d8484a..13f5969f86 100644
>> --- a/meta/recipes-devtools/apt/apt.inc
>> +++ b/meta/recipes-devtools/apt/apt.inc
>> @@ -26,7 +26,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  # so we check the latest upstream from a directory that does get updated
>>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
>>
>> -inherit autotools gettext useradd
>> +inherit autotools gettext useradd upstream-version-is-even
>>
>>  EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000b11648059f3f4bec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ah right, 19.10 is not LTS. Nevermind.<br></div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, 23 Feb 2020 at 15:42, Alexander Kanav=
in &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>Is there a link to this policy, or some other document st=
ating the rule?</div><div><br></div><div>I am seeing that Ubuntu 19.10 ship=
s 1.9:</div><div><a href=3D"https://packages.ubuntu.com/search?suite=3Dall&=
amp;searchon=3Dnames&amp;keywords=3Dapt" target=3D"_blank">https://packages=
.ubuntu.com/search?suite=3Dall&amp;searchon=3Dnames&amp;keywords=3Dapt</a><=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 23 Feb 2020 at 15:36, Adrian=
 Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"_blank">bunk@stusta.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Even versions are shipped in Ubuntu LTS and Debian releases.<br>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"=
_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/apt/apt.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/=
apt.inc<br>
index 50c4d8484a..13f5969f86 100644<br>
--- a/meta/recipes-devtools/apt/apt.inc<br>
+++ b/meta/recipes-devtools/apt/apt.inc<br>
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPL;md5=3Db234e=
e4d69f5fce4486a80fdaf4a4263&quot;<br>
=C2=A0# so we check the latest upstream from a directory that does get upda=
ted<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/a/apt/&quot;<br>
<br>
-inherit autotools gettext useradd<br>
+inherit autotools gettext useradd upstream-version-is-even<br>
<br>
=C2=A0EXTRA_AUTORECONF =3D &quot;--exclude=3Dautopoint,autoheader&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>

--000000000000b11648059f3f4bec--
