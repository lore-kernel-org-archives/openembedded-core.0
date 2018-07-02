Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0EC789C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 14:16:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z13-v6so8918087wma.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RJU5nPJ3orSEqzLLNYjdSIZMGSCOS9Pd8hlSh125LEs=;
	b=EALjL0cfJm0Clo6GWwehgnsr8LK2ER76n91sHole5r1BDAs41vFDYjYfI8TZzyzfWh
	KcwPsKKdRziNpiPfWUMGFAFU8dr8gQqZXoYrMQvJftzkFoWhqCps0bjKHv1v4eJLkgLe
	bu3/f3HTNr4fAqEtiMUCFI7tP2uitvY7o/WuFuWdIWUH/2r8nxbjz8a0tGSpMDUvVfoO
	tTekONVwY0Vs/7+2igmAFNMH2PT9aXGp5hFC6SirSzEoAw1m4ZB7ubmaDQVkNd3hJEF8
	5yYO4t1eFKV2iaKxIiFltelYgQiU132VdETvFdDPaRZHBDg1jIxl0ZJ0qC/VlLSWca9q
	kqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RJU5nPJ3orSEqzLLNYjdSIZMGSCOS9Pd8hlSh125LEs=;
	b=iLLVk7RhtcwxK3oTqgB92kMjXBq6orCunKXE3J2mfxvgAZ0vvyZ19Gm8toQeWOP8H6
	R7hNV7JWV8ACzM56o8Ha3HWcGX1Fki/bcNlqro2ze1ncCztkCk5AyiBIYbULR95vpTj8
	Jyi4ukZ2+rTtVTGa8uc+I+ElKmi1uE55gLRWZJLwuxsR/iYoxGuWfnazlxQdW0jndyt7
	NpVTo2yXESf+QHLxVTRP6DWSuK3fTwCNYlFUuXPfe7uEVPthuHhk7zFlUnWNG3sJQg1u
	8A9PmlJtDWvZOfcuVz7xB0RLOKS8CAPIr0HiHYCYwUoCx4Kmdxtr0LHSb0Vs0/+hDL/v
	2pZQ==
X-Gm-Message-State: APt69E0yditIKGoFXsQfvXneOe66+5rrms2IwrlifdvkJwDYspG8kmxR
	ZhSXmDdhRnUHtCjNCvHxJEqUQF9xozTfgCqOpb4=
X-Google-Smtp-Source: AAOMgpdYrfNmSdG/t26QjWg7pcJIlXuW2l9IEjzGg6T3kzYWApX9JJSu1mmDXc346m4JYP8Uac6AuPlIDSpXyckWydI=
X-Received: by 2002:a1c:f46:: with SMTP id 67-v6mr5704320wmp.122.1530541014170;
	Mon, 02 Jul 2018 07:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
	<CAP9ODKrVe=GTLqtXjF54a4sHoRymY85Q6y4=mN++-twUPHYk9Q@mail.gmail.com>
In-Reply-To: <CAP9ODKrVe=GTLqtXjF54a4sHoRymY85Q6y4=mN++-twUPHYk9Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Jul 2018 16:16:44 +0200
Message-ID: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/5] Kernel artifacts naming changes
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
X-List-Received-Date: Mon, 02 Jul 2018 14:16:54 -0000
Content-Type: multipart/alternative; boundary="00000000000076bfcc057004d9f3"

--00000000000076bfcc057004d9f3
Content-Type: text/plain; charset="UTF-8"

Any comment about this RFC?

Should I send rebased version?

On Tue, Nov 21, 2017 at 12:58 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello Martin,
>
> On Mon, Nov 20, 2017 at 6:11 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> ...
> > This RFC doesn't implement it all, but it makes naming all the artifacts
> in
> > consistent way a bit easier. If there is an agreement that OE should
> support
> > the naming scenario described above, I'll submit the rest of the changes.
>
> I think it all makes sense and if we preserve current behavior as
> default I see it as a very good addition :-)
>
> I didn't test the patches myself and I'd like to do a more extensive
> test once you send the full patchset.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--00000000000076bfcc057004d9f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any comment about this RFC?<div><br></div><div>Should I se=
nd rebased version?</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Tue, Nov 21, 2017 at 12:58 PM Otavio Salvador &lt;<a href=3D"mailto:=
otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Hello Martin,<br>
<br>
On Mon, Nov 20, 2017 at 6:11 PM, Martin Jansa &lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
...<br>
&gt; This RFC doesn&#39;t implement it all, but it makes naming all the art=
ifacts in<br>
&gt; consistent way a bit easier. If there is an agreement that OE should s=
upport<br>
&gt; the naming scenario described above, I&#39;ll submit the rest of the c=
hanges.<br>
<br>
I think it all makes sense and if we preserve current behavior as<br>
default I see it as a very good addition :-)<br>
<br>
I didn&#39;t test the patches myself and I&#39;d like to do a more extensiv=
e<br>
test once you send the full patchset.<br>
<br>
-- <br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile:=
 +1 (347) 903-9750<br>
</blockquote></div>

--00000000000076bfcc057004d9f3--
