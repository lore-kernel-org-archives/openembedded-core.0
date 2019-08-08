Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id ED5B76B076
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 19:29:17 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k10so24282526qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 12:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IMC9Qansfse7HVOHesm70OQst+TmBd6F35TaAuTkT2A=;
	b=cd7RnF+roJ2VYPtuNKo7iW0IAXvlvxDn252tIjSnwjsRHO3dDwNfbODbpupYO6pE8v
	CWo+7lDkyAQPaXAZkMbzRZ+u0nMZMDOyym3qVK+OVN7A8kyF86w5grRF+Dad9j+PSBYw
	7FFcuPwvf32txGP9JgKbpa8crW/vuLzJHKSlb75ybbvcB9/XZYecM4USNwRkkJH0JOP7
	JDOOSl9Lu80DZ+y0xNqJczHQ9xJaq/8UadBNlBE+4aXGPGVQrEb7iEwq2zBUn+Z4lnRn
	W/qOhqn6siLcs9ykReJQgPSKr0WEWrwjXyf3+cgWq0bAgTOjgTCU9TvyXA0NhjEjL9m7
	HYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IMC9Qansfse7HVOHesm70OQst+TmBd6F35TaAuTkT2A=;
	b=bWJgLSdMgw1zRvku4qXTq12q/9XPAIrkq/vj6uSDG3339PWK/FZ0qwA5pOX1/pkEca
	oMTtVryLkLtxbJsXA/JRztePUH4tf2KQkAbTgRd+TX1YM8gdOcSONdnAFuTBQQHldkU+
	aacTzxiI+wz9zpojmW5e+wvku14SqkZcVUEFiU/Puaoe8qX67jR/JnS/CFB7lZPJJIzG
	zOHxQm4v15MkXQ5J9D/VI3/dIX5qJKq5iKvc2r0bvW2R3LhF7kczVIxFvCUOSbU62gK5
	byfddHh1d/XszSFsxu2LlM/ryh5x/yJbPjAwII6F2ypWRcxQPEQyLuQFo0pUC73d5gZx
	BEjA==
X-Gm-Message-State: APjAAAVVMnuVbriq5otKmqKMHypOpQAJie6z1oVNEPMHcPotkAnaubre
	z5OlTTWSLibqxvajngkRn5bb7hwUVUszZEcMwWM=
X-Google-Smtp-Source: APXvYqwdwM8iFW0IVPVh2RIY/CxrTCEEPLWJHbkHZE5xlk+pDUzZzVy6Ks74ZsIMx96ZYIanfdwOoQbddtRZBNfTs8c=
X-Received: by 2002:ac8:1183:: with SMTP id d3mr14761753qtj.53.1565292558571; 
	Thu, 08 Aug 2019 12:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
In-Reply-To: <CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2019 12:29:07 -0700
Message-ID: <CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Thu, 08 Aug 2019 19:29:18 -0000
Content-Type: multipart/alternative; boundary="000000000000ec5e51058fa0121e"

--000000000000ec5e51058fa0121e
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 8:44 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 8 Aug 2019 at 00:08, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> You might want to have a look at
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/621
>> and maybe other pieces of that build yet to finish, not sure...
>>
>
> I ran bitbake world to check for newly exposed missing dependencies, but
> gcc-cross-canadian wasn't included in that. Will fix that too now.
>

There are several packages in meta-openembedded which are showing these
errors one that I see is net kit-rusers seems to be failing for wrong
reason

I will send full list once I am close to computer

>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ec5e51058fa0121e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2019 at 8:44 AM Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr">On Thu, 8 Aug 2019 at 00:08, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">You might want to have a=
 look at <br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/621" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/56/builds/621</a><br>
and maybe other pieces of that build yet to finish, not sure...<br></blockq=
uote><div><br></div><div>I ran bitbake world to check for newly exposed mis=
sing dependencies, but gcc-cross-canadian wasn&#39;t included in that. Will=
 fix that too now.</div></div></div></blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">There are several packages in meta-openembedded which a=
re showing these errors one that I see is net kit-rusers seems to be failin=
g for wrong reason=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I will send full list once I am close to computer=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><d=
iv><br></div><div>Alex<br></div></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000ec5e51058fa0121e--
