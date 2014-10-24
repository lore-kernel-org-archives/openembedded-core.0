Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id A79CF60671
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 10:30:12 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id cs9so694285qab.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 03:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pvib6DnunuXJB8fY9hH70nFlwWTon7UJ9PSZA4EfsfE=;
	b=JAGTXqLQh2msCxrqeAd0dwGBGMoM+ZOHGI/GwujymydeAgLOFrYOooEq04QPGnDg34
	M3tr4FPDueSydis9ZGyRyWCG+dJF90nb0n63cdx1PbAu0oJJbvJkQmIgYnIg6k4Y0/9+
	uZnv8P2EAhlh944jBSj/AGT0e619Axe9z4emYTuCz6H5cKt5ruK54uN+gBYfQZ6Jl9Lm
	3mA4bfv3gQ5hPhs4Ke+6EelymRxrN6lRXx+GuudLyhebalVgF8d3FeTAYzWZ1d99D61Z
	6NNwT2EiI3DN6lvqG7IMkLyLC8c4hxMhdNG3B2szS3T+WIGSTECD3r8uuqneCx/AHKz+
	iIYQ==
X-Gm-Message-State: ALoCoQmDgsx6AHZy5jsalxlGHXEKNlGMwvP1Dz5dFqZD2AjnwWzj30PQ5eQJWxZ6SnvpZYGfd73X
X-Received: by 10.170.134.196 with SMTP id a187mr5499013ykc.53.1414146613004; 
	Fri, 24 Oct 2014 03:30:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Fri, 24 Oct 2014 03:29:52 -0700 (PDT)
In-Reply-To: <20141024090416.GB2430@jama>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
	<20141004023040.GO25706@jama> <20141024090416.GB2430@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Oct 2014 11:29:52 +0100
Message-ID: <CAJTo0LauN8+Qc14WNkuOmQmhrF=2nXzfrM_O560E0gfqMgfLtQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Fri, 24 Oct 2014 10:30:16 -0000
Content-Type: multipart/alternative; boundary=001a113990da876072050628aac4

--001a113990da876072050628aac4
Content-Type: text/plain; charset=UTF-8

On 24 October 2014 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> Should I resend without WIP tag now when ChenQi confirmed that moving
> libgudev isn't needed?
>

No need, I've merged it into my staging branch already.

Thanks,
Ross

--001a113990da876072050628aac4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 October 2014 10:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":zf" class=3D"=
a3s" style=3D"overflow:hidden">Should I resend without WIP tag now when Che=
nQi confirmed that moving<br>
libgudev isn&#39;t needed?</div></blockquote></div><br>No need, I&#39;ve me=
rged it into my staging branch already.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113990da876072050628aac4--
