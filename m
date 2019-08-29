Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id 33E3F7F308
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 08:28:55 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id q16so1874559vsm.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xnLTOlTIgTPD1SCJGTRpwk0IYb+jritZp7S9Ssh69l8=;
	b=pI31IgI21WhI2L73SWYXprxqHOHw8lktmYh08U6fd0sw1VtoEejzBJnUkGiBNDmVXx
	7AdduL/vtZJCY89B1Vz73M5hxdiv7FKZQtEhRItOotsUfTjp9/soOwlzYFDQKGKiaGiK
	SmP16rR+Ni7cGoZ0EZlLmePArDxJNHJf8rU8PXtzZxyVW1IMXRnB/tnGmu6YwIu2ZwC8
	tok2VX8LiDR37J2YRGex4ytKu2rJ2rp5alT4IHrfacyMv25gq9vDNZds/KXa4k9nMdQk
	TCpvJ1XcaONr0z74R5YiQJ7w4kmqsfdIhdaAwA9TF251snGl4fHRy/1bMc5IR77ks7UW
	TWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xnLTOlTIgTPD1SCJGTRpwk0IYb+jritZp7S9Ssh69l8=;
	b=Z2XHVxMLCDXqNSOSEL7gQ1bATYpCH+KJHBuLNt5VIe4mfW/477ypHeyZYnoYX6gLjE
	A4q53maqLKoUUJ2w2VCrEMEKKss4YuYzTFpEJe95e7LbKbjP0yWmLttFwSDx8rV8K1If
	Ds8zzy8li2RJPTiq5pp3V9Ch8pjHHLTob0FY52GsHbMEDu09y4oV4qrzdAWX9qrY/xJO
	1pLzdKB9MEiSIqtHT2I52wwnOheNSapdM/wyQFFlOhgigDPilX6zW9tZtK7GjS5z9RmS
	+qSfl4Nzs/wthRTPsHjungVDC9hP671BqF1dAfibWs6kQrhPMXXMHXV07PbG9OhSnv/e
	WtuA==
X-Gm-Message-State: APjAAAXGQ2itjUDUZm+hZBq4ltElhXf+tvJAIbRyHnLwvHH3GKN0epIl
	2qTbnqRR5MryfknW+RAqBiX91i+n6AERB9bkvMc=
X-Google-Smtp-Source: APXvYqy1ZJoyx417YgtDeOeP+Ej9nUfPLtkujJs3sAe4qbGy7uGb/4hNGpsureUw5jF+ckaWyapkg6nHk895ceiut/A=
X-Received: by 2002:a67:e45a:: with SMTP id n26mr4687198vsm.94.1567067336272; 
	Thu, 29 Aug 2019 01:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190828205016.2551-1-alex.kanavin@gmail.com>
	<421232e8-39e7-7256-59c5-4a49b5307795@windriver.com>
In-Reply-To: <421232e8-39e7-7256-59c5-4a49b5307795@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Aug 2019 10:28:45 +0200
Message-ID: <CANNYZj-Vs5dX3ePGHawGWR=O8=QpfVeKnx3LDnogf0QgB=3sCA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: move from python 2.x to python 3.x
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
X-List-Received-Date: Thu, 29 Aug 2019 08:28:56 -0000
Content-Type: multipart/alternative; boundary="000000000000eaee3c05913d4b47"

--000000000000eaee3c05913d4b47
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2019 at 10:09, Yi Zhao <yi.zhao@windriver.com> wrote:

>
> I had sent a similar patch to upstream and it had been merged. You could
> backport it.
>

Thanks, I think we can simply remove my patch when ltp is updated.

Alex

--000000000000eaee3c05913d4b47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 29 Aug 2019 at 10:09, Yi Zhao &lt=
;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
I had sent a similar patch to upstream and it had been merged. You could <b=
r>
backport it.<br></blockquote><div><br></div><div>Thanks, I think we can sim=
ply remove my patch when ltp is updated.</div><div><br></div><div>Alex<br><=
/div></div></div>

--000000000000eaee3c05913d4b47--
