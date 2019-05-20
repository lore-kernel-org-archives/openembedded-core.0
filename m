Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA4C07E094
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:14:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f204so639613wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cbXcwaZC084YOuHa9nlc7Z1fcVHELcPG2A4DupiAlKg=;
	b=cTLYIUy0kzZMynxTV6SJPBPT7/9VB7eTraPDKqwxqK5GYGnVCMFY5Wom8vCW9G0RIj
	IHsCXZh7NV7yAv5ut38L1sV85Bhz4ZYf+DDnhj0FGS8CrzFEnjUHIrAZDyPRkgQs0kmu
	664iNYtJ1BB1k6kAuafrV5UVh5TbPgmCoxR2MOMcJH2M9mC+N9k5zOGIqxV2tl2ygJBr
	Sc6h13uR/+dtoYTUrrKfwyre8GR3AZKT4XD29p7KaqoVVrJBtgzvUiDVD/oCGLlQSvfl
	jUtqnlyTEK5dH9Vkqu2/Ss2WBFLQfTC+TSfzWqoU+4SsvZntvIzXjjaeJFyph25EvtCW
	QTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cbXcwaZC084YOuHa9nlc7Z1fcVHELcPG2A4DupiAlKg=;
	b=g8mWyGvF9gkdrrGoPSLesmUEOhBFRIUJkyyzSrQZEZgYhy+XJP1MdGv3YqE3BgrkQr
	HRJSCj/Gs8qXOEioq/jYLp97KP7y1VG8B1q4b5L9b9E14zGaYbRGhaAa8R19S6Gupphe
	7w8PlwEujp8xmHOm9XD+p9/Ty8ZhP5e6YJ2NBA5B/SVojeI+vDHDhF5oIgx/JnmBzMdM
	i608gC8f6jHAowBiI6oqcEeHfHjZd4EbFoEa/O7sA6VxtIQt0lgOKlSInJAV5wXdWxh8
	lemBXAdDvZIH72O7AD51DZy/+lj/e5KnhOubMcrv/pZxIiQqbsqkGxnbfhUO95b0yIPJ
	LhKw==
X-Gm-Message-State: APjAAAVm0lxWU4LSjKCAMlOhq2Tjn7UdbuN85HluDa6guYlquJkFdtQb
	/pO3yKmjTOwf2k0/pDBb9nWT/JFrHG8ygTHm9NQ=
X-Google-Smtp-Source: APXvYqytP/THGCCXFAdDOxt93blJP/OFAZugpHeZ0ZRTQNbVBluogvY3VVWWjFzBaKFdygAGlrS+j74gTh2K0iWNBPE=
X-Received: by 2002:a1c:7ed2:: with SMTP id z201mr603862wmc.113.1558383293488; 
	Mon, 20 May 2019 13:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <1558213634-6468-1-git-send-email-liu.ming50@gmail.com>
	<1448604b61e334191648073b44d0f4ce0d773859.camel@linuxfoundation.org>
In-Reply-To: <1448604b61e334191648073b44d0f4ce0d773859.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 20 May 2019 22:14:42 +0200
Message-ID: <CALatG=5MJ1GPuAMGbKn4SOfUAo7j9fun_7zRUns4MN4xEdzn6Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: replace hard-coded alsa-utils with PN
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
X-List-Received-Date: Mon, 20 May 2019 20:14:53 -0000
Content-Type: multipart/alternative; boundary="000000000000a1eb130589576269"

--000000000000a1eb130589576269
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Richard:

you are right, it will break alsa-utils-scripts, will send a V2 soon.

//Ming Liu

Richard Purdie <richard.purdie@linuxfoundation.org> =E6=96=BC 2019=E5=B9=B4=
5=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=881:55=E5=AF=AB=E9=81=93=EF=BC=9A

> On Sat, 2019-05-18 at 23:07 +0200, liu.ming50@gmail.com wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > This is mandatory to support multilib build, and also to avoid being
> > redundant with plenty of hard-coded alsa-utils references.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>
> Doesn't this break the alsa-utils-scripts recipe?
>
> Cheers,
>
> Richard
>
>
>
>

--000000000000a1eb130589576269
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard:<div><br></div><div>you are right, it will bre=
ak alsa-utils-scripts, will send a V2 soon.</div><div><br></div><div>//Ming=
 Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org">richard.purdie@linuxfoundation.org</a>&gt; =E6=96=BC 2019=E5=B9=B45=
=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:55=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Sat, 2019-05-18 at 23:07 +0200, <a href=3D"mailto:liu.ming50@gmail.com" =
target=3D"_blank">liu.ming50@gmail.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; This is mandatory to support multilib build, and also to avoid being<b=
r>
&gt; redundant with plenty of hard-coded alsa-utils references.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
Doesn&#39;t this break the alsa-utils-scripts recipe?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a1eb130589576269--
