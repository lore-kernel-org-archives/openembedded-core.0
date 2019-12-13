Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 47FEA7F971
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 11:50:10 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id f9so671925ual.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 03:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KGwFLt7Mw6MdE5I1h206Fn9TL6a7jdoVmAYz186dsco=;
	b=eZ6egMmBt3/VqUR7AaOq3+BupSWeHkHm2rDDxQgHVlXL3cSyJp3BQWiNQ+CMjXTPQZ
	J+8iaD65CvHbVK5tzd0z6I8FbYCq2RwBLvPkNsjpedOvNiob5xf/4SgQ95kJwTjeVjt0
	BVAqgXWM18msaObBYgehJ3Ey3Q9xxnVWQOWoL6szPPqubhpxwJF6xfLfTJIUV9uEU60p
	g8kTWVOMaWdWgj6arwKp4pCzYtyjhCYcZk97Lr22FMNnhAGY3y1EngndZuGtBmQELzbM
	K2cRkxcLzxZxrV31s7QfHNg4heJCnikkn0bcVMSR6/XVfaNc1gmigrgOHR9L/LluLr49
	0w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KGwFLt7Mw6MdE5I1h206Fn9TL6a7jdoVmAYz186dsco=;
	b=kYdYJsRdZryQxtMzkj/gAkvQVKhSFrPofF6a+vA1jR/2IJC5oUdVOJLHafzUC15hcq
	5ae4j3EsXm5y4RtxEh6uD+SX6Ds5AT2YYB+VYFd0nUV0prBdH5yuIFygm8RskTP/bpMl
	jIqX0iwbykz4HKH4pW3ojbzkIJpy1GeRiqc2dStuv4J7zUjENHLKfID4WoQhhBNxlV1S
	zeeCSGxpwGL+r2Ss3BombarxKJMOGyePXZO9xY/9K0f7d6WsYOGIt1cyHtjhfKhdjqVh
	32KoyjQlFswc+7f1fcaoZbBO9E+aOcK2TNBE9Hfxv5KOaImyGKAxTmkOf8WFPvQFkaA8
	TpKg==
X-Gm-Message-State: APjAAAVTum1h/KlS8vhTQB+ZnCiXd9svqAAPDbrdfpZCs7WEpJPYq7Yt
	3SWYOIsUF0/vYv2+gEtlvtPkJpobkZdM7y9VA1YnwL50
X-Google-Smtp-Source: APXvYqz4lINYVS7Dwuq7Y7ozQCJYHp7wzNRGaKE/mAx1OAT0JSnBeJTpZCl1sbJLRu4y8Bf9KTHBzRLpu4QnEbtPIzU=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr12355330uak.22.1576237811094; 
	Fri, 13 Dec 2019 03:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-23-alex.kanavin@gmail.com>
	<82565f3f2785e354cd8ac183a57448732a84f9ff.camel@intel.com>
In-Reply-To: <82565f3f2785e354cd8ac183a57448732a84f9ff.camel@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Dec 2019 12:50:00 +0100
Message-ID: <CANNYZj8xjf8rh2G1gQ0B3RYsE1atMjy-BmFsMy_k3hmc+R3eVQ@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 23/30] cups: update to 2.3.0
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
X-List-Received-Date: Fri, 13 Dec 2019 11:50:10 -0000
Content-Type: multipart/alternative; boundary="000000000000cfd9de05999476aa"

--000000000000cfd9de05999476aa
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2019 at 03:55, Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
> > diff --git a/meta/recipes-extended/cups/cups/0001-cups-Update-to-
> > 1.6.1.patch b/meta/recipes-extended/cups/cups/0001-cups-Update-to-
> > 1.6.1.patch
> > new file mode 100644
> > index 00000000000..1cd02e8b324
> > --- /dev/null
> > +++ b/meta/recipes-extended/cups/cups/0001-cups-Update-to-1.6.1.patch
> > @@ -0,0 +1,27 @@
> > +From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00
> > 2001
> > +From: Saul Wold <sgw@linux.intel.com>
> > +Date: Thu, 13 Dec 2012 19:03:52 -0800
> > +Subject: [PATCH 1/4] cups: Update to 1.6.1
>
> Looks like devtool changed the subject of original patch which was
> use_echo_only_in_init.patch. Perhaps we should change it back so we
> know why was the patch needed.
>

Thanks, I have fixed this.

Alex

--000000000000cfd9de05999476aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 13 Dec 2019 at 03:55, Mittal, Anu=
j &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wr=
ote:<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/0001-cups-Update-to-<br>
&gt; 1.6.1.patch b/meta/recipes-extended/cups/cups/0001-cups-Update-to-<br>
&gt; 1.6.1.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..1cd02e8b324<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/cups/cups/0001-cups-Update-to-1.6.1.patch<=
br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"=
_blank">sgw@linux.intel.com</a>&gt;<br>
&gt; +Date: Thu, 13 Dec 2012 19:03:52 -0800<br>
&gt; +Subject: [PATCH 1/4] cups: Update to 1.6.1<br>
<br>
Looks like devtool changed the subject of original patch which was<br>
use_echo_only_in_init.patch. Perhaps we should change it back so we<br>
know why was the patch needed.<br></blockquote><div><br></div><div>Thanks, =
I have fixed this.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000cfd9de05999476aa--
