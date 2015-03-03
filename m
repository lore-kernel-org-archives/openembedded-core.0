Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id BB1A96013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 17:28:41 +0000 (UTC)
Received: by qcvp6 with SMTP id p6so31633693qcv.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 09:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HP4gw8UCaJQTpDmF6S83TNpatudcU/39KWydROndDs0=;
	b=HfxRnAJKgB46aZutWB0cXTDb4vR43GgCSfW9uTUJW5wXuQT8mmGf7p8nDvzFZQaAR3
	D16iS51XVqYgK0b+uPKo22AncU36ELOZbZ6IntUpRdlOF0xQ5L/sJU9+1SYAqxNY+Fgk
	axvGdX5DtviZuUTiCgpqC+aPeq0aybh8esWMawXIoEdSDvsvvz6w1dhazjxXWHWx59mM
	fFF1CpwEbPaw4MH8xWREXEBSXJBt3cZZN+NaZKWK56U9YLtVMPkitCHkL7mRIGVdcjxD
	+a737CdfFymjuVzX71OK2JOWY7knnWwIvXimNH+3tkoKviJiaqNyTRYyPiJ2itVbfhPY
	3VbA==
X-Gm-Message-State: ALoCoQnf9QTJNId4JN2TM9+ZZ5rUWKDSrsIEBFXDkLm6M++dt/pL/3jhqpss4EBslck1xbfw5sgG
X-Received: by 10.229.184.66 with SMTP id cj2mr65794qcb.6.1425403722898; Tue,
	03 Mar 2015 09:28:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 3 Mar 2015 09:28:22 -0800 (PST)
In-Reply-To: <20150303165648.GA11515@mcrowe.com>
References: <20150205174208.GA7735@mcrowe.com>
	<1423158623-26927-1-git-send-email-mac@mcrowe.com>
	<20150303165648.GA11515@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Mar 2015 17:28:22 +0000
Message-ID: <CAJTo0LZi=s1N3kOEsmO_W0H-kDAjrecNn1+7G2ZZ1m29bEp=pg@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] sed: Cope with ${bindir} and ${base_bindir} being the same
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
X-List-Received-Date: Tue, 03 Mar 2015 17:28:49 -0000
Content-Type: multipart/alternative; boundary=001a113383bc90e6b6051065aad3

--001a113383bc90e6b6051065aad3
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 16:56, Mike Crowe <mac@mcrowe.com> wrote:

> It doesn't look like this patch has been merged. Is there something wrong
> with it than I need to attend to?
>

My fault - I didn't pull it into MUT as I had a local branch with an
identical commit in, but then I failed to merge that branch.  I'll sort
that now.

Ross

--001a113383bc90e6b6051065aad3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2015 at 16:56, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D":8q9" class=3D"a3s" style=3D"ove=
rflow:hidden">It doesn&#39;t look like this patch has been merged. Is there=
 something wrong<br>
with it than I need to attend to?<br></div></blockquote></div><br>My fault =
- I didn&#39;t pull it into MUT as I had a local branch with an identical c=
ommit in, but then I failed to merge that branch.=C2=A0 I&#39;ll sort that =
now.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113383bc90e6b6051065aad3--
