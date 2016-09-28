Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3366B6FF84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 15:00:22 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id n202so3150658oig.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=8fWyru/WWcjcPenmyTDDRpKt6m24jxr2mPGzbzSr/RM=;
	b=vT4ECQMSgzGa2Ca20BNP6B7Ky9n2hGpwvkKH191t7y7bPpm1eAE1IQ4jd2GkuYv6BV
	fWDsVbkvbHLRGd9C5I9PHY7Flehj5ZNkTo2OdfuLOUhCjVVWl27BPvQ4Qqze2++OeIqU
	N8xF8SZ6BjodK0+fyyVztCoRJO+IPupYzrQoD7QneOQTj75v6a/ACc8PYZ8V779wogHS
	/5XDkMIGlnZYBHZ4/+H6c6rNbU9LLeEHEhli4uK5UEf/iIFYIgQNveoovwDuYGmUiFo3
	NfRZGYcfGJACev/6yqksTVWQDm1xkg3Hv+OIqLkxjGGvnbu7GBnJFEwsvLGlLFDQJOTn
	awMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=8fWyru/WWcjcPenmyTDDRpKt6m24jxr2mPGzbzSr/RM=;
	b=Cp7tvCzpQw4ydrMAFA7FshsN3id7sfRW6aTsZTlPOKP53tJfdscpk0u1KFBQY7b2pF
	70BL08Jq5zynosAOYj9aG2pmXeiWSC3303c7ch4sOau/1SvldkZ5fglwRKQGob8Xwg5i
	t+J/bNMqhm6Oa66IPZy+jSTCuBGhojcgE/rbzCasj9q7wVfQ9poV1IWIEasRYkC9V4ig
	uK3TEy9KePQP0H+Reb09jD0yk1jhNz9LzpJVCOHM1Pd/Ynd1jbsNb5vOh97KHVFpXQud
	D50KrR+hXfdKYLP/QTxcstL4vUu5i1W3xPNe6qgdzWTViljmKgyeBcfo3HNKEd9NQPy1
	al+A==
X-Gm-Message-State: AA6/9RmtWty74X2x6KlbhFqdyX+nyFJrYRRXSEJ0gIGYDDfZo1iJ83WyP3VZeOwpCLWZlN05BjiRCNvqy9NdzA==
X-Received: by 10.157.6.170 with SMTP id 39mr80117otx.60.1475074824070; Wed,
	28 Sep 2016 08:00:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Wed, 28 Sep 2016 08:00:03 -0700 (PDT)
In-Reply-To: <1475056530-31095-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1475056530-31095-1-git-send-email-ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 28 Sep 2016 08:00:03 -0700
X-Google-Sender-Auth: tpZAbyBcua_s1_cMBb-uIIu9hsU
Message-ID: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts: add new script
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
X-List-Received-Date: Wed, 28 Sep 2016 15:00:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c043d16e7eafa053d929e51

--94eb2c043d16e7eafa053d929e51
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2016 at 2:55 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Added 'native' convenience shell script to run native tools.
> Example of usage:
>   > bitbake bmap-tools-native
>   > native bmaptool --version
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>

=E2=80=98add new script=E2=80=99 is not a useful commit message summary. Yo=
u don=E2=80=99t even
mention what script you add until the message body.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c043d16e7eafa053d929e51
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 28, 2016 at 2:55 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1mx" class=3D"a3s aXjCH m1577042e1fd6da4d">Added &#39;native&#39; conv=
enience shell script to run native tools.<br>
Example of usage:<br>
=C2=A0 &gt; bitbake bmap-tools-native<br>
=C2=A0 &gt; native bmaptool --version<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;</div></blockquote></div><br>=E2=80=98ad=
d new script=E2=80=99 is not a useful commit message summary. You don=E2=80=
=99t even mention what script you add until the message body.<br>-- <br><di=
v class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher =
Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics=
</div>
</div></div>

--94eb2c043d16e7eafa053d929e51--
