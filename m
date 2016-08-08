Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9830A7716C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 10:26:08 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id x130so70281390ite.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 03:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k23leixPaPSxFOx8fMSSI4g5aZc3gusaLOado4Kj9Ws=;
	b=pNqc0aS5FVnpQqwCCoL0TxI8tlr/Om2NJpsHIlHAocxtQgOQG1bJQ4xeC3WI2sW6Dl
	TlnzOppb4jXvcgSorQxJv+0wHUE34VombCXZXSlvEIe5+oVQvxdaEEBRAC+f+RxmYVjJ
	UxfDqSDVXMU7k4iv9yT7bEGBT8gzk/8CZQWSRIYHfPS6lqoO7ZDVej30XjWUmr/+6VED
	5DTVJWCtR4JXPcLZYbG7u+XlINShU+YsbXC0m2eI2pm8DQLRlaoP7OaZ/RiTqB63erhB
	PvQygSRoCIWbUqU+D7+mN3yuVBhq+lkgCHH+5tPUuJN1X+gUPeKIaYvPAPi4x3SQNqs9
	fByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k23leixPaPSxFOx8fMSSI4g5aZc3gusaLOado4Kj9Ws=;
	b=iezJkBxVTTtUqPatrV3PqYLvqtDQOj9hmf6fl059XTZ6ph33rUs7GH0rRhaBqsu4SW
	4R3Rn7bpmMa75+RsugNfvHnm8CwWZhFf+/IgJQddL46+EU9Jaj9piLu2U4JtQbDYp59m
	FPantXGzcCqmRc8Zb1PeBrCqHApgWhwyEJErCFVgu/cvz6RgxLA+ATKxVyW5ZtDrZTKw
	5BpYNdZlTxBWTTTuDl7BU1W3HHKqWlgTcNHFGGWz6WLkZIzS8dFtgo1+XypS4bqkMHth
	R91bqTBtlxSC99xm/sZu5gC9rtRyi7+a58bF4LbuvvMZpOdnpyLSiTO3Beu3ill+zGTU
	Uo0A==
X-Gm-Message-State: AEkoout6IadXkFaCAixzA6Q1elwX3okwWN9aRB2gqtBN0wD5+1QNRqbfoVeky0wlT26IQKC6bBB1Pf/q6qLbbH2T
X-Received: by 10.36.87.140 with SMTP id u134mr17742273ita.38.1470651968957;
	Mon, 08 Aug 2016 03:26:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 03:25:48 -0700 (PDT)
In-Reply-To: <CABMQnVLd=-S__w==bheAeTwg_hkdy47F8=b+w0h0ZB7L65qNZw@mail.gmail.com>
References: <1470581318-33390-1-git-send-email-iwamatsu@debian.org>
	<1470604793.8166.21.camel@linuxfoundation.org>
	<CABMQnVLd=-S__w==bheAeTwg_hkdy47F8=b+w0h0ZB7L65qNZw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 11:25:48 +0100
Message-ID: <CAJTo0LbugaY9L8YZ8ZOooZMYiPy_51fxAe7DTc6j+=1YVtEKjQ@mail.gmail.com>
To: Nobuhiro Iwamatsu <iwamatsu@debian.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mmc-utils: update to latest git revision
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
X-List-Received-Date: Mon, 08 Aug 2016 10:26:11 -0000
Content-Type: multipart/alternative; boundary=001a1135018c32f86505398cd878

--001a1135018c32f86505398cd878
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 11:09, Nobuhiro Iwamatsu <iwamatsu@debian.org> wrote:

> mmc-utils will change the revision of Git in version 0.1. We are using
> the now of any revision in PV,
> we do not know from version of package.
> Because I want to be seen that this revision from the package, I has
> been added SRCPV to PV.
>

The question was why should we build an arbitrary git snapshot instead of a
tested release?

Ross

--001a1135018c32f86505398cd878
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 11:09, Nobuhiro Iwamatsu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:iwamatsu@debian.org" target=3D"_blank">iwamatsu@debian.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1pr" class=
=3D"a3s aXjCH m15669a2b8bdbc072">mmc-utils will change the revision of Git =
in version 0.1. We are using<br>
the now of any revision in PV,<br>
we do not know from version of package.<br>
Because I want to be seen that this revision from the package, I has<br>
been added SRCPV to PV.</div></blockquote></div><br>The question was why sh=
ould we build an arbitrary git snapshot instead of a tested release?</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a1135018c32f86505398cd878--
