Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id C3E6271353
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 17:00:34 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id q107so11122740qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 09:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wYsjGbqJyDbei5BX8R7NWxEWWr2ctBEeMxYv5N+WwiQ=;
	b=K8iaOZ2Iutny2t/A09QZOkgYffWuEPW02bjwZ6HjyvRF7EKWHiEwJoY8svD5fAOmtY
	dhdy13/cxS8Bi37m6WxWBze3+wCmZb47dAM4yvbO3M9LDctHvFpfaXC4MxN82G6QyW9T
	QxobcYYcRaOyVBqFhBzo1LIB/lRsnY/+JZcoVOl3A3AKwhiPVA8Vwf7NMtX/9416qv2d
	7eiqK0FEdR+5RVej0m4gqs3vyr4bMO65BNEV/G2eDYX/eT8tIBnWfPRpN4H/9wAhg+x3
	JSDI6re5aZQY4aWBJ5nvrQ4cuJIiA5gArQty0nf3j+D9WYp/67uGqpdJaApDH4S9Rr9J
	dPvg==
X-Gm-Message-State: ALoCoQl/Xzj8zny6KsOgohTNVL7ewrpeCxpLYEqr5R5OG9+edF7qW7L1n48PEhiyRD6BnT9PQe3r
X-Received: by 10.224.20.133 with SMTP id f5mr2119489qab.17.1421773230275;
	Tue, 20 Jan 2015 09:00:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 09:00:10 -0800 (PST)
In-Reply-To: <CADkTA4MRQ+GaDCxQNiS91=qRT4QVAk0cvupzf8TBRaHnwwXgvg@mail.gmail.com>
References: <cover.1421651378.git.liezhi.yang@windriver.com>
	<bc679bdfe35b8c0740f66a5e5f03d8ac69c59309.1421651378.git.liezhi.yang@windriver.com>
	<CADkTA4MRQ+GaDCxQNiS91=qRT4QVAk0cvupzf8TBRaHnwwXgvg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 17:00:10 +0000
Message-ID: <CAJTo0LazYTzaTiszo9++cgNmJca9S0G0jO7-omsqKqrS_4x4+g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] perf: fix for rebuilding
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
X-List-Received-Date: Tue, 20 Jan 2015 17:00:43 -0000
Content-Type: multipart/alternative; boundary=001a11c2b82e57c1c9050d1860c9

--001a11c2b82e57c1c9050d1860c9
Content-Type: text/plain; charset=UTF-8

On 20 January 2015 at 16:01, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> The kernel source is no longer in this location .. so at a minimum the
> header
> needs to be updated to log the work-shared directory .. and better, make
> sure
> that this is still happening with the latest master changes.
>

As I understand it the bug is stale .d files being used to add
dependencies, which refer to stale paths instead of being re-generated.
This is why we encourage S!=B with deletion of B when starting builds.

Ross

--001a11c2b82e57c1c9050d1860c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2015 at 16:01, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3w=
q" class=3D"a3s" style=3D"overflow:hidden">The kernel source is no longer i=
n this location .. so at a minimum the header<br>
needs to be updated to log the work-shared directory .. and better, make su=
re<br>
that this is still happening with the latest master changes.</div></blockqu=
ote><div><br></div><div>As I understand it the bug is stale .d files being =
used to add dependencies, which refer to stale paths instead of being re-ge=
nerated.=C2=A0 This is why we encourage S!=3DB with deletion of B when star=
ting builds.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c2b82e57c1c9050d1860c9--
