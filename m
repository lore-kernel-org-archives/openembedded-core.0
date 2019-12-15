Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9B17D3AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 16:45:16 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id f8so2647881vsq.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aIblp5mCrqqZ0E0NsSR34hnYQ/k4n0KWO2vYYBldTig=;
	b=sUflgayJthiuvjxDNEOTNiHtapxF9yTq/cLq64BkNEB0G/ionwAoPFsH4Gop8Q/9X6
	o1MujQb84GzBzi9GgUg+nDR9rq3IxZm5T6fNo6fG2jHcSxPNHuF1sN/nni7tlyEOzGoV
	rmfuEW2NEos5URl1VsuHh4KLld21BCYE4Duo5hYkLCFm8A8bmTfTydGz0xvoa7NBvzWl
	X+2WQdRhLOBVl7YkbgJsjOmfXblHl70YI2x+Hd6rKiRmo66uSL7g/Krk5QXo+4VgZS7m
	OAJgZWfxzMIVixGbDPAnB51Nj0aGt7NwTeTJ7+OkBpl+4z0104IrUl+7KGntA+sDxV2A
	h5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aIblp5mCrqqZ0E0NsSR34hnYQ/k4n0KWO2vYYBldTig=;
	b=nXqfs6qSxGWc/n9zW6vNWi33mVSvCW2lKqP+ryXQNzfp9Gs7vQnFu8RrbgKMaj8O90
	GYuRD7nu/K4WJfhsWc5qE7vFJd9ESRz72h3qSrxuThA2Eznc8hvnweJ/KVzA2+lZr8Ox
	5XNMbOgRk2Zkz5H5O2pVwNRWi7lddIi3IuS+cr+t5qK7PMLtjscfKESs9TZ8U25N+Bjg
	Fh6I76xalKoTbU+sEfmR0z7nL1OlmzZpWC4LZHXVxcCXg9ws/2C1zf3ufV5c6akUOXz0
	zzw4bHzE6LDIVG0qezShHLQm6qKe28WHjauI5H1I5p0N7MZBMnEXV2eO9JqqDs0k+I13
	uzOQ==
X-Gm-Message-State: APjAAAV2mTx3g9dU8ySln/jZjEjWXmSXPA30KW33wJIrfCpiPA0kpQMb
	G3nz42Q7P/pF5u35V/WaWpOeojI4NhUTc9ztzRg=
X-Google-Smtp-Source: APXvYqwvDXN46fMkeJCvChWCKsS+1ySMkn1j8PXUXNOFASl5APDfVoJTG+pJv1sFB9sj8wCO0Mt89v/x+1LAQCPOLdc=
X-Received: by 2002:a05:6102:d1:: with SMTP id
	u17mr17923539vsp.23.1576428317351; 
	Sun, 15 Dec 2019 08:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-20-alex.kanavin@gmail.com>
	<e4288403d08c96589c285bcb3fb5ccda219809a1.camel@linuxfoundation.org>
	<CANNYZj_Fj1KZoTDxsVzyJ_4Ya9KHOys9LsY1OQgm4UogC_xd-A@mail.gmail.com>
	<CADkTA4MyfWZfd-a9jqhTOHtFyM0RW2Mo5aDa48zy817=1g0WXQ@mail.gmail.com>
In-Reply-To: <CADkTA4MyfWZfd-a9jqhTOHtFyM0RW2Mo5aDa48zy817=1g0WXQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 17:45:05 +0100
Message-ID: <CANNYZj8x+iQmMAhHkv4yNu8dWfv7VgoE4jW2D-8HnjVeOwYPgQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/30] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Dec 2019 16:45:16 -0000
Content-Type: multipart/alternative; boundary="000000000000dea4d10599c0d154"

--000000000000dea4d10599c0d154
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Dec 2019 at 17:28, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> > Another problem is that devtool isn't able to upgrade the main variant
> properly with this included. I'd rather split it it into a different
> recipe, if someone confirms the need.
>
> It is definitely needed.
>

Right, then I'll rework this patch to split the dev version into a separate
recipe with a shared .inc.

Alex

--000000000000dea4d10599c0d154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Dec 2019 at 17:28, Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">&gt; Another problem is that devtool isn&#39;t =
able to upgrade the main variant properly with this included. I&#39;d rathe=
r split it it into a different recipe, if someone confirms the need.<br>
<br>
It is definitely needed.<br></blockquote><div><br></div><div>Right, then I&=
#39;ll rework this patch to split the dev version into a separate recipe wi=
th a shared .inc.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000dea4d10599c0d154--
