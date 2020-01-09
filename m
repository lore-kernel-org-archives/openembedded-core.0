Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3367FE5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 11:23:02 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id s142so1856369vkd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 03:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p5080irL7wIXE9aVrpBgv/lKnJePzoDmePc1nZWYQfg=;
	b=IdRh71F2SzYyLk1nKwcG5nFpNpTih3ZfYslhxN//VUkKHIA+kAnZt3usouqHMAwBX1
	kfDVYxw5kOB7GZ9LfXG86HPeC8pMbhK48rVK/6EEV+/Q6rnijVT9eCWoKI5wYUP1K4TP
	Ju8YTFav7jFpz6j/F8AKldUQrpVRoYQyIZqKPqmqhFdqdS5l1SRzZmoVXqaBpRcCBzzF
	xXf3c4LYXzNBW0r5n0S7rTwvk/94X8ToS638/SqyIBjzosZWRycyEHx8wWtoeAN3fFiw
	bieMGXx4GfjU4gHArt2X4nS06IEjNisP63TQD8tLGM19ZHJD1TsJkLowWTbspdgXzhkx
	UOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p5080irL7wIXE9aVrpBgv/lKnJePzoDmePc1nZWYQfg=;
	b=XaeitlNgqbUBjTPFyAhl7+PKQsXIbcW5uJ7WLQEQM0mE9QdNxtZb9ByMg01s5P4sCx
	MSMKIfclyvNgPxPt9OjC70SL8V48X1o+WOTtdxEljETBpWpVz/5RKmqGB486CVmtrC/4
	8XMSIoporLNda6mKSaWJrmzUl/PhYyQ7APeGfLyCtZhPQxH0xdqvkF6PuZ4Ozr+343E0
	kPUVe5I6lv7GXkPwPhhzWXOKbCCVimNsmYev4+dj4/hoEHoLJ6QSvQ7ERAeAH0EqYvQ2
	yPtBwMyxEmvNyI7nxQtZPQ0eYqEeMTBgVo3lTKXsEJ6RTvU1jAXZ9Fx9rJJHt0T7IVue
	XNvQ==
X-Gm-Message-State: APjAAAVbmLZK4l7vO2tZj/VMmxShawYGRZZ+0drGjwCn79xA1NO/ARE7
	aIKQ6uRBA1+rXtGNE9oLWdGxoSlvWtHU6ksu/uo=
X-Google-Smtp-Source: APXvYqzTKeM3PCiiMXLW9eXlcflQmN9WYbSctcuB5LT/d99eHQVeTzrbNQV+OOn7uqAS6bai1ly9RqgwmK3p3DFjrKs=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr6317315vkq.49.1578568982944; 
	Thu, 09 Jan 2020 03:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20200109014307.37924-1-anibal.limon@linaro.org>
In-Reply-To: <20200109014307.37924-1-anibal.limon@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 12:22:51 +0100
Message-ID: <CANNYZj97iX9P1LFajY1GjQQ2JjEYP4EppaCM8YpHnt=QJ2TNcA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/menson.bbclass: Add python3 dependency
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
X-List-Received-Date: Thu, 09 Jan 2020 11:23:02 -0000
Content-Type: multipart/alternative; boundary="0000000000007b5fca059bb33b5f"

--0000000000007b5fca059bb33b5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jan 2020 at 02:43, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.or=
g> wrote:

> -DEPENDS_append =3D " meson-native ninja-native"
> +DEPENDS_append =3D " meson-native ninja-native python3"
>

Apologies, but I cannot accept this. Not all meson-based components even
ask for python, and this adds a non-trivial (built time wise) target
dependency to them all. There is also the potential to create circular
dependencies some time in the future if something required by target python
switches over to meson.

I suggest you rather patch meson itself, so that the python probe
implemented there does not import a target module.

Alex

--0000000000007b5fca059bb33b5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 02:43, An=C3=ADbal =
Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@lina=
ro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">-DEPENDS_append =3D &quot; meson-native ni=
nja-native&quot;<br>
+DEPENDS_append =3D &quot; meson-native ninja-native python3&quot;<br></blo=
ckquote><div><br></div><div>Apologies, but I cannot accept this. Not all me=
son-based components even ask for python, and this adds a non-trivial (buil=
t time wise) target dependency to them all. There is also the potential to =
create circular dependencies some time in the future if something required =
by target python switches over to meson.</div><div><br></div><div>I suggest=
 you rather patch meson itself, so that the python probe implemented there =
does not import a target module.</div><div><br></div><div>Alex<br></div></d=
iv></div>

--0000000000007b5fca059bb33b5f--
