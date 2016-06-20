Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id D8C7265CBB
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 21:54:03 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id f30so555814ioj.2
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/IFTlk7wDi8kllM/RJmCYuNxX6bqoSnCLksyXLVqEmI=;
	b=JMURJONJs6hDUPBrt/U4Fxd3J6b7dQmVUZqv3cjiubvNDTPlvvsUXjauC+pfJTDRKO
	UDZjoVN51siSYp1jE1+Dfkjcl6UzGRC9c/yeBFffZemnK799biWGHcZwBcXGaXyk4Tuo
	yFM4QZgYnEay2gycf9GmjDGSq+DYij05avCPrJgsuYlgDOxRklvECfevt9f5K1zwkdGq
	IBnMml3UbMo8ro9Pt9DWHDcEgTpoHmQNULkWOHQF1QSZvAM3ZanDS/pnkdQ5A8jQRUUX
	I8UORSVYcHizrN9s4/4ZdVKEM8Bfvv+pBSHifbFcmucSStgOVfCyp56HUeyeC1XINJQt
	gI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/IFTlk7wDi8kllM/RJmCYuNxX6bqoSnCLksyXLVqEmI=;
	b=XqnGZpQjtVGV5f4xhxEyQl82WjEb+5zh5uaOfT0ZkYBexuApIayo1+uzOAh3kvuxrc
	nOjhC2FixtPIG5FgRLo6pUE7Oynn2Pqqv87blztjC+ttDK8tiz8rk9cKE5KKLcGJeMhj
	axQ9yWtdNLdyBCNlJywNFpBLN3o5Rf8+hs9HUt7WXijL79s+Or4fumKO5gsfqEyvsQiM
	QTLn9csZPs4YFO8tjyRQXQvRPYgJCO4qjOPoAuKT6UwcXE7Kv7QZT4bI9aFSi6njItDK
	iqLMZvlqxBmLdLFjncS9r5CqNb/AXH7GgYjg4iFlyjwsraTwTpyttVNNknVaITrxJg+r
	IoMQ==
X-Gm-Message-State: ALyK8tJ6JHZJDtStVNyrob0S0L+CsvjoLubOtoGV76tjNpx7i8V4icR0Is5pIGIh48Tzp7uTcsgH7CrIwshY/i/l
X-Received: by 10.107.154.210 with SMTP id c201mr25210516ioe.99.1466459644626; 
	Mon, 20 Jun 2016 14:54:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 20 Jun 2016 14:53:45 -0700 (PDT)
In-Reply-To: <13986bd3-af12-4768-0a4c-78447c33c8b6@linuxfoundation.org>
References: <13986bd3-af12-4768-0a4c-78447c33c8b6@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jun 2016 22:53:45 +0100
Message-ID: <CAJTo0LbdLtJRBZLetB9TL_wpU=42NkMxQY1t46q3cKaNQjQAkA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "Perez Carranza, Jose" <jose.perez.carranza@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <Openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	bitbake-devel <bitbake-devel@lists.openembedded.org>
Subject: Re: [oe] Patchwork users: Help test new version
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
X-List-Received-Date: Mon, 20 Jun 2016 21:54:05 -0000
Content-Type: multipart/alternative; boundary=001a1140fab6322ff10535bcbe38

--001a1140fab6322ff10535bcbe38
Content-Type: text/plain; charset=UTF-8

On 20 June 2016 at 18:47, Michael Halstead <mhalstead@linuxfoundation.org>
wrote:

> OpenEmbedded is nearly ready to upgrade to a new version of Patchwork.
> The new version offers several new features that will allow OpenEmbedded
> to improve developer workflow and automated checks on incoming patches.
>

Woohoo!

Thanks Michael (and everyone else who helped on this over the months).

Ross

--001a1140fab6322ff10535bcbe38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 June 2016 at 18:47, Michael Halstead <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mhalstead@linuxfoundation.org" target=3D"_blank">mhalstead@linuxfou=
ndation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":19z" class=3D"a3s aXjCH m1556eed05b0636a7">OpenEmbedded is nearly read=
y to upgrade to a new version of Patchwork.<br>
The new version offers several new features that will allow OpenEmbedded<br=
>
to improve developer workflow and automated checks on incoming patches.</di=
v></blockquote></div><br>Woohoo!</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Thanks Michael (and everyone else who helped on =
this over the months).</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1140fab6322ff10535bcbe38--
