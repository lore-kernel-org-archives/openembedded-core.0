Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id B69957D6C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:32:56 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id v78so1305124vke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GlUhmvLUGsE0ZcoKnWcRuorRXPgqWubTtQlmWUCFmnQ=;
	b=HXIuXd8lxIMev1pHXiG2d/lfnI1jFTTV4cDF3FZVvffMVmmopCTsH9edJYe7AEvhdu
	UaqHvE/ZazEj1AxPHXmN6BGpY2vIfP0AZWX+B/xMnAVniW+9Lnkfq9PUKxQFzapbZMlB
	x0BLjnSOeH6F/d+1Ca/QSu2G7LhCeHcTowyvlT5U/AXuFPEYEDswFThtcUYWUUyh12OJ
	TM4DIFZg4QKO3fQiLVZdpfF+88NcyIVskoUNv1E2p7cnkUPr2BluAyVQsAHacrhBWA9g
	BrHdicJyuHu459fbO4BpOd2UNXkMvRdMjAXoDZzOKEjS/G45Y93ydGFuGg+fUquIo/iG
	XshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GlUhmvLUGsE0ZcoKnWcRuorRXPgqWubTtQlmWUCFmnQ=;
	b=ououhuLophCr4u+4GWqwDs6XMAE34XsgPJEA7ib211EMFjplFF6ivDmqaScm6S8lZ9
	Vk55qT/nAGwHm510MrouFQQSzAJnHiWib1+HklE0q0ySYXCyhOX5a2bD4ZLrQHFdrBKA
	0lRUJCI11fnXSuRolgxqEZCScYi5B+ddgF4pzuAUFfurdntT8QVv7TMfWytSDE1DKOEg
	r5ERmc34V+PXYaf3cUvLvhqXAaXEdbFn/rBdIfAzi88gSeFeBFBflSp4Z6NgSIIL3bms
	IwMJWZ2wtvlGo1RwcM2Y/zsw98rmMN/4D773JRFN1jSL4MyAV74KhZRFn4v3/kP6eq3U
	iEmw==
X-Gm-Message-State: APjAAAVmQrdmgOd5j5US4VbAMp/8hJFMcMZAHYyBGAYTKgW2AVpjbY0X
	q7HfaPoz/IWsl3aaeRGhN14MsNR6C73QxGh4vkU=
X-Google-Smtp-Source: APXvYqxwxVfZB1HeQpxYTfUTqZzp7vmE0tooDhHUuc0m/nARs75/4DEsU6KWbMMU8+259J4DhTscPGOzmTdVIj3uH7A=
X-Received: by 2002:ac5:c3c3:: with SMTP id t3mr4876812vkk.59.1569598377516;
	Fri, 27 Sep 2019 08:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190927135443.15407-2-git@andred.net>
	<20190927141006.31440-1-git@andred.net>
	<CANNYZj8SJTA37zSRbFQ4jpJFH__ViDBQSKCC9EdH49Zk_E9Pjg@mail.gmail.com>
	<d5d7c18c1c5fdbb7cae13f47ef2c53c3c3a9518d.camel@andred.net>
In-Reply-To: <d5d7c18c1c5fdbb7cae13f47ef2c53c3c3a9518d.camel@andred.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Sep 2019 17:32:46 +0200
Message-ID: <CANNYZj_-m=u=OfTWnwWBi=VxeZWkVzyU1qXLBM_eZ7LAoPRdYQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ruby: fix non-IPv6 support
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
X-List-Received-Date: Fri, 27 Sep 2019 15:32:56 -0000
Content-Type: multipart/alternative; boundary="000000000000bb650105938a99e0"

--000000000000bb650105938a99e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Sep 2019 at 17:24, Andr=C3=A9 Draszik <git@andred.net> wrote:

> Can't the auto-updater do it? (Without the repackaging?)
>

I think it fails at the rebasing patches step - merge conflicts can only be
resolved by a human.

Alex

--000000000000bb650105938a99e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 27 Sep 2019 at 17:24, Andr=C3=A9 =
Draszik &lt;<a href=3D"mailto:git@andred.net">git@andred.net</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Can&#39;t the auto-updater do it? (Without the repackaging?)<br=
></blockquote><div><br></div><div>I think it fails at the rebasing patches =
step - merge conflicts can only be resolved by a human. <br></div><div><br>=
</div><div>Alex<br></div></div></div>

--000000000000bb650105938a99e0--
