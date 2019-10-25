Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 14E957FA87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:19:06 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id o3so2205991qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7ms7QrZMR8Zq8EclEaoUszY37+l/SjMIO9TfW95N6KI=;
	b=ksoNkRKb6dH1gg7Y6PNa4Q5zyvgBmfbKSWUsTl3aiz6h/tOuQHOTgjV2WWMnSDWnYA
	QevTgGcCMhK9+5wRCHwNdPAiSrfJnNa/swIODorBA7pg5tBqWkAwGAcJpoqUJW1urhXU
	3QPuEaYmZNDZFZqkDibe0JPfxc5vK27x/o0IHQwxncebnL+DqdDlAnN8t7ratp6oLj5+
	vykP9DDZbJ+vQBVAv2OArIZO0Py6oyUXht4iIDXUQa32R6I+ekp5uKh5jRvWwYu0Q4yE
	CcEke3/+C6ZKoN3dIc+3VnA/4wZ+7RAMBvqoDLkWthnxsFa5tXXMPxHLJGI/UUJl1Jkk
	wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7ms7QrZMR8Zq8EclEaoUszY37+l/SjMIO9TfW95N6KI=;
	b=snQCzGSO8gpijQwJbKQ6DmqXxE0kSu34H+ixjilSd7yVVQaPdl4ELUnk400/+Qa3NB
	w/7amycsbJnQT+kL/vuRUa3HTZYDo1ndfn+P/j6uRfz1RQakW139B10rNWLU67cbYMf5
	kI89j1zxwFqclPB7eiQPYQ7Ma5fgZsPa4tj0HfGOv3jTlllHYpe8zugkcsNo8YZ3n43h
	STVQZmQ/j8QDX+hKWvMGUP5CEHsevDQZjTT27UQWcHuGqDbOUK27+AzU6elZG3gCR6DV
	QycxwAmxjxsu04fQIJXGSFFddgBT9K3nbuMhTU7MNPJ+DBKSUVrgmKkajI7O8CmS6MeP
	g1Rw==
X-Gm-Message-State: APjAAAXaDV9JWx3AvWHyrkm11TN6nfi5ChbzUomfK8ZujGgrR5pgP9Oa
	VJzXquSHiMMpaF1bywY3aLnO/c3BHXMm2cQscmE=
X-Google-Smtp-Source: APXvYqxKkADd3GxaYv9xDr2XKXj1bXcwu9lRFGYMCcYVNhsk4PD0TNoYycH4vGBdkL3eb9Ky4vW5ZYDe+Cm3Ieln54U=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr2007532qti.80.1571995147570;
	Fri, 25 Oct 2019 02:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
In-Reply-To: <20191024172908.68056-1-alexander.j.kube@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 10:18:56 +0100
Message-ID: <CAMKF1srShdu_W4S5pnFJNwtFWptPnho1cteCW4NsNvKG0eVF2w@mail.gmail.com>
To: Alexander Kube <alexander.j.kube@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add recipes for Go v1.13
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
X-List-Received-Date: Fri, 25 Oct 2019 09:19:07 -0000
Content-Type: multipart/alternative; boundary="0000000000005c15600595b8a470"

--0000000000005c15600595b8a470
Content-Type: text/plain; charset="UTF-8"

1.12 should be removed along with this

On Thu, Oct 24, 2019 at 6:29 PM Alexander Kube <alexander.j.kube@gmail.com>
wrote:

> This patch set adds various go-1.13 recipes and changes the
> poky GOVERSION to 1.13%. It leaves the existing go-1.12
> recipes untouched and available for existing users of
> those recipes.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005c15600595b8a470
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">1.12 should be removed along with this=C2=A0</div></=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Oct 24, 2019 at 6:29 PM Alexander Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com">alexander.j.kube@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">This patch set adds various go-1.13 recipes=
 and changes the<br>
poky GOVERSION to 1.13%. It leaves the existing go-1.12<br>
recipes untouched and available for existing users of<br>
those recipes.<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000005c15600595b8a470--
