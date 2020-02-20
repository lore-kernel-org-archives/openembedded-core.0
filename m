Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id D68C9611E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 20:35:25 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id a2so3574952vso.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g8PfvvZKSOZeCKmAGr7XGWuQcxUz0tH3TC0709d3twg=;
	b=pLXYkTzV7x9VhtcslNx/OUMYdiKlcnU3cWwsnEzO3mJlKhtK2O2juFMRU/J2pWPMYi
	UKGlXymtsXwR43XpmrkCMPRY/TcGV9tkwxybdM5dQdCcvM+O3FZuDOJ3Jqmct/4Q6azb
	hZ7H9oeMrweVowfSpzPXcOQQ/HYOm4ihhWL914BhSWdx4u+UBHMttARH3Fczef1glGkJ
	R10T/K5AEP5BIx0F4pcyqM91fN20FxVKkymHidYi/ED6zCxW9cLe9sEDAjFGYj8ySh/r
	zq89Yw+Be6I2ejgsfXPjD1kb3KvNd5Qn2RDPmaLp0h4umyyVTZL4aFyQJKWzO3Kd6QQs
	BMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g8PfvvZKSOZeCKmAGr7XGWuQcxUz0tH3TC0709d3twg=;
	b=GhnAmXhUzzmpOyh/Tp+QCRw9TL3pWi9Nmf6YPMlM/j5WJ8spoLfPpYReo7YhbbnycO
	qTj/6SAfPE0PRqLIjGS/JpRXfijtxEegy/NU7K2egAHMrzgSoZG0T4G2gpIzGEelu00f
	mONiH9XIfvyiHUGTVOoBIq8FlTItI7eypP3dz0uz7hzhC/M6r4dnIg4NJjbtrxcsw04v
	bIJEtMe1pF2lUsOUvI1HUQZmJ5uoRoENFqnus5W8zht417sSGeFEoav7SY/avujTa4mg
	2fYaD+LMhwrOIfa7SkQDOLy7N+j5e8ZLB4xQTlXvdoRp/Oq1XXaQ+l1Sa/ADFAmSDM7N
	JqOg==
X-Gm-Message-State: APjAAAWJHu0Kr4idPJJ6q5Rnc+4YQo6MfdkThQB1C+F+PR0imh0aHRoe
	iwGJNun6r7mhbXIa1hfgc8xjPcCU8J1O+EtZQD0=
X-Google-Smtp-Source: APXvYqzdNOWci5ahEFEcrYG30onXrTqzXKxvBToIGYrQZCIE2RG+Qt2KU6FeB77axF/uWrxizB6XGysyS/tEK9J2wGY=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr18452709vsa.25.1582230926581; 
	Thu, 20 Feb 2020 12:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20200220172518.315182-1-raj.khem@gmail.com>
In-Reply-To: <20200220172518.315182-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2020 21:35:15 +0100
Message-ID: <CANNYZj_or0Y1M9iE8peDbHe_-whbqAy2zvmoOTVF2aUi2ha=nQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 20 Feb 2020 20:35:26 -0000
Content-Type: multipart/alternative; boundary="00000000000054e4d4059f07d817"

--00000000000054e4d4059f07d817
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2020 at 18:25, Khem Raj <raj.khem@gmail.com> wrote:

> +PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
>

I meant that this string is extended:
"does not build correctly without package_rpm in PACKAGE_CLASSES due to
disabled rpm support in libsolv"

Otherwise it's vague and doesn't provide the real reason.

Alex

--00000000000054e4d4059f07d817
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 20 Feb 2020 at 18:25, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+PNBLACKLIST[dnf] ?=3D &quot;${@bb.utils.c=
ontains(&#39;PACKAGE_CLASSES&#39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;=
does not build correctly without package_rpm in PACKAGE_CLASSES&#39;, d)}&q=
uot;<br></blockquote><div><br></div><div>I meant that this string is extend=
ed:</div><div> &quot;does not build correctly without package_rpm in PACKAG=
E_CLASSES due to disabled rpm support in libsolv&quot;</div><div><br></div>=
<div>Otherwise it&#39;s vague and doesn&#39;t provide the real reason.</div=
><div><br></div><div>Alex<br></div></div></div>

--00000000000054e4d4059f07d817--
