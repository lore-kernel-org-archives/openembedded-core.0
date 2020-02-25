Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
	[209.85.222.46])
	by mail.openembedded.org (Postfix) with ESMTP id D2E39617E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 21:01:49 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id l6so155253uap.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lH5BZGUhLogO230ZXNGtpBiMQ6Izw1RqGCec18vS4+0=;
	b=rF+xbLmfzHKLTpQLW8bMFkP/fuTt3bbp9in9ojo2HuA15cVx7pmPiEOkN2HrLE11zW
	PRevRIgKPcAOfgIbnmeNN22TVhG2VAia1oS05+HMddRLG9RYNq0fWfN5FN/552TJtHxh
	HIJUXYUaMJltEwVqny0OEtdC4hMCLvqVb1OYFfold2EexpFtCoKY7IDEDBdM+AanB5ph
	aYbi5KpjJ9beaITt6H2Q88qrDViWWqYwlBg5rEvkQbvGo6qz3vfE8F8S6yoPrfsdPbn3
	thpukPUCwfYaCCwAJwkuQh7zUKBjBu75kfmuf+0hqlnt2OUr5t9I9ErzAJ5iSNwYwEzl
	gh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lH5BZGUhLogO230ZXNGtpBiMQ6Izw1RqGCec18vS4+0=;
	b=UM95q02ufQ85EFadhWCHrbtPRcYXV0tq4bk+lgMZ872qduZIGfcQUzB4ipGeTTPyWQ
	by6OEcaug+BhcOtCozaVEQgo58e28RRaP/6C0sRnc3mF6kk1cuIVKfOntK2svmee3lIP
	Rf39WPKFUMvhXoj4KKlcx6OEmw4i9eVzTjCtwcOyKTMkr+CyYGQKVa3BSZOU8T6Rifqo
	/C76dtfQdhQQyN2pGMH4SyW5TYCHp6YLZl6LaatCWf/hKCKftDuW6+HkRd92FugKyJbL
	JGA0rvjeqgROy9yUKRwyyGBjnq45vqcsB484Bi++P6qcoNLBJYHWdTziO6i1T/lJtpdL
	9KKQ==
X-Gm-Message-State: APjAAAWHPN90jZG/7+q//StyD3xH4RNqqz1OsP4272awMogwbOz5Sb6+
	3Iww805mNXG2ow9rncAO1ku+aGZLUeddK38q82E=
X-Google-Smtp-Source: APXvYqzdFEtQ5DIxQ7BqMWIp6FyjvOAyQPQ5Tu2i2Gy/fnkGBFF+lzUas1KbzhBeQJImKZPhYdjn9/vagjV2lhJYw+A=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr1059678uae.89.1582664510619; 
	Tue, 25 Feb 2020 13:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
	<CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
	<CANNYZj9XLm-OyAzMHCDauggbpUVBfnCLq1VXFZjw1eaWM0YyQg@mail.gmail.com>
	<CAJ86T=W1n2GoOa7wSdKzZ1rPOr1RkMgAH7b+CKZypXBi66HQag@mail.gmail.com>
	<CANNYZj94dRzpG+VcHEOwtgsYjm-wKj67eVmEvDNEUDL+j8gxAw@mail.gmail.com>
	<CAJ86T=WFwAXuH9Q8aK34pFcK_FV5ZCoyh3N8CPpojY3emkADvQ@mail.gmail.com>
In-Reply-To: <CAJ86T=WFwAXuH9Q8aK34pFcK_FV5ZCoyh3N8CPpojY3emkADvQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2020 22:01:39 +0100
Message-ID: <CANNYZj9Wh9nwqquYq2y1F3e29CsOszkaWhn0ZEabeeN3jU23RA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 25 Feb 2020 21:01:51 -0000
Content-Type: multipart/alternative; boundary="000000000000f44421059f6ccb40"

--000000000000f44421059f6ccb40
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2020 at 21:57, Andre McCurdy <armccurdy@gmail.com> wrote:

> >> Thanks. The maintainers sometimes forgetting to reset the author was
> >> the part I was missing. Maybe the patch checker could be updated to
> >> check for that?
> >
> > The patch checker already does this too :)
>
> So how did this commit get through?
>

Patch checker sends suggestions to the mailing list and doesn't block
commits from getting into master-next, and then master.

Alex

--000000000000f44421059f6ccb40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 25 Feb 2020 at 21:57, Andre McCur=
dy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt;&gt; Thanks. The maintainers sometimes forgetting to r=
eset the author was<br>
&gt;&gt; the part I was missing. Maybe the patch checker could be updated t=
o<br>
&gt;&gt; check for that?<br>
&gt;<br>
&gt; The patch checker already does this too :)<br>
<br>
So how did this commit get through?<br></blockquote><div><br></div><div>Pat=
ch checker sends suggestions to the mailing list and doesn&#39;t block comm=
its from getting into master-next, and then master. <br></div><div><br></di=
v><div>Alex<br></div></div></div>

--000000000000f44421059f6ccb40--
