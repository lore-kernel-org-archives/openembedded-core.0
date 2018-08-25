Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 406326058C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 09:15:59 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f21-v6so3579977wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TrnlztgtynRvYfk25as6z/HPNdCqq2i2JZdI2tjv4CY=;
	b=qBzifbvm+yWSJBx5TVDBrUKYP1a/XWjwEqRTC7mVjj8vhXpi0xTCV3/ck75CamWIoZ
	kX5uqDBhOl5yle818U7yDzJB/9+sILEpqNRXFjzV3Bp2hoORhs/u4MvFeFTOkjFhT5Yl
	PXvcHuagZrzYm5Cu2PVzKIfw/ujp1/Q5O9MZypDYmCqve3ivljLAM5AcXzUvfsKi4phx
	3hyD56kG33A+Ffd9aLJX+Obin7g8bw41fHD42Q3MCwnu3m2CTV2Q56jhV6chlD1gyQ9a
	jiDx5gvQ3tFFUxu1DyMvT3XYpqn8BWoP9jHFjPLo0DIGVRchqLKhVTCMcfpQsbIuUM6Y
	EqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TrnlztgtynRvYfk25as6z/HPNdCqq2i2JZdI2tjv4CY=;
	b=U9o6uD9/03HM2sl+IeM+n+X3dEk8cUCnvn+4FUx5UPZo0SuE+jat2mHXuDhp4Jr8z0
	hC25gg49erDLzigfFH5R1iylE90BqKQnZJHM9JYsaizvKfVjAORrvNL0eFqnsPiYf2f9
	2ScrFCg5tQ8Ud1PDCQdfld0wvIY1xyaVR+hfkPdgQZJjgF+bN2gZnmUJUuO0fWH60RyV
	fs5LRKiTzypFLFVrbdqxfparaNLPuZiLTzRT9eLk0/lgf0MsG+mqHRsDRvOU+ydTmKl5
	e3wmbhKhbjNHOqsgIDuTrPS7KKsbgdpl9wez9Kao6wMIMbIDmEXFEsU4agukJ96tNPRM
	P/hA==
X-Gm-Message-State: APzg51Adj3qV2MO/OM3GDaw55LekiNiPe3ST+aaYwDBwX0BgYUL4SU7r
	QP1/zs2iyqD/MS2/6Qr7PgxHLCQs6Os0WTfG1Eg=
X-Google-Smtp-Source: ANB0Vdaw43vK8NeKGfY6MkP9QHzSr+6ZOcYFzT/53sQ6FcQl2Fquv+zlrCGBPPn9wz8QMZQUfZf6iroZPqapeql+Zhs=
X-Received: by 2002:a1c:8c08:: with SMTP id o8-v6mr732158wmd.60.1535188559835; 
	Sat, 25 Aug 2018 02:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <6da833d1-a532-779e-8116-cb8b950bc8aa@gmail.com>
In-Reply-To: <6da833d1-a532-779e-8116-cb8b950bc8aa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 25 Aug 2018 11:15:48 +0200
Message-ID: <CA+chaQd0nDr4x1AdJW=4AGDSeRDA03_svGyA+TsL+poYSgzJkw@mail.gmail.com>
To: tomohiro.komagata.aj@gmail.com, Tom King <ka6sox@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Q&A] "http://sources.openembedded.org" is unavailable
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
X-List-Received-Date: Sat, 25 Aug 2018 09:15:59 -0000
Content-Type: multipart/alternative; boundary="000000000000c5b5ff05743ef036"

--000000000000c5b5ff05743ef036
Content-Type: text/plain; charset="UTF-8"

The server which is hosting this is I believe in transit and should be back
online in couple days.

On Sat, Aug 25, 2018 at 10:50 AM Tomohiro Komagata <
tomohiro.komagata.aj@gmail.com> wrote:

> Hi all,
>
> In this week, I have failed to bitbake,
> because "http://sources.openembedded.org" is unavailable and it occurs
> the fetch error.
>
> Does anyone have any information ?
> When will its server be available ?
>
> Best regards,
> T.Komagata
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c5b5ff05743ef036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The server which is hosting this is I believe in transit a=
nd should be back online in couple days.</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Sat, Aug 25, 2018 at 10:50 AM Tomohiro Komagata &lt;<=
a href=3D"mailto:tomohiro.komagata.aj@gmail.com">tomohiro.komagata.aj@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi all,<br>
<br>
In this week, I have failed to bitbake,<br>
because &quot;<a href=3D"http://sources.openembedded.org" rel=3D"noreferrer=
" target=3D"_blank">http://sources.openembedded.org</a>&quot; is unavailabl=
e and it occurs the fetch error.<br>
<br>
Does anyone have any information ?<br>
When will its server be available ?<br>
<br>
Best regards,<br>
=E3=80=80T.Komagata<br>
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

--000000000000c5b5ff05743ef036--
