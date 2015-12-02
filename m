Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C03D36FFD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 18:43:49 +0000 (UTC)
Received: by ioir85 with SMTP id r85so55552081ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 10:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=y+JaPqf6CXPevANKzZO+2SSo13tPODwdxl681ZnMhgg=;
	b=DAfi7KRwF8MGNRiPVUrKDkscNKHPFig/CE2ChhWq/U7cArHNcIIT7GCo2OGycz/V6l
	o1z/12DHSH8mzpzWBriUXXHzq4crXph4QESaQjdYxuH5fMvr//DrZ3l3sal3NxzjQVt7
	o865uAoadrMW18wAUh0mSzyJlCYwPqF42GEOraHybo60ehpOrN1jmhTb+XMxe7niqBbo
	tyXkt4EJ+ZagF6CVgFBm82T5bLBItbNZ9vmGtuFVvUanLfmNjKbAMcn/+ZnUGjcy2Yjn
	l0yzPB3qjGE4tIci8fkdq5WkcTsgM21DgVMrBuVoGtZuHjisvA9g0utFHakymud0KZjq
	OOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y+JaPqf6CXPevANKzZO+2SSo13tPODwdxl681ZnMhgg=;
	b=asymUhmwmsmHw3J9AL30mktjJumFzeWKfNDf0+nXCEqQAaBF5JxLCMxfmCTYk60YA+
	lr/1o3pcmbDdGHEUvJHXeo3ozM6rNAE/nXdNqnopOn0ASS6K8FLl5IhEeYUxB8/9kG1J
	7e/eXR9ulf9FGy0zWPOEu63MezeopdTvvsCq0YRSW6dfIao+dGJeslbgauB/VYtYLUBd
	FcYN41uKCDsJrnq9kQhQUgviFQc96JLD17cHZq8aEnnWPOK+Be2HL0hyyE4XcvSKLGsP
	p99d4xpndh7FNN18c2SACf6gS4yGSeAMKNW/KWkgeCPEYdaCnrtA+i7gYVOl7Nwlr6bP
	WPBA==
X-Gm-Message-State: ALoCoQkm5dsEOKHOk49KaMVmQtL/05kzkdesVW6TNMqbse0saQW9uZbp8K9BHAdZ2D8zE7wtAxP9
X-Received: by 10.107.135.30 with SMTP id j30mr4553887iod.148.1449081829817;
	Wed, 02 Dec 2015 10:43:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 10:43:30 -0800 (PST)
In-Reply-To: <20151202180440.GC2248@jama>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
	<20151202180440.GC2248@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 18:43:30 +0000
Message-ID: <CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Lespiau,
	Damien" <damien.lespiau@intel.com>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Patchwork & patch handling improvements
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
X-List-Received-Date: Wed, 02 Dec 2015 18:43:50 -0000
Content-Type: multipart/alternative; boundary=001a113ec64ab81d1e0525eea7a0

--001a113ec64ab81d1e0525eea7a0
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 18:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> I'm depending on bundles heavily, to "mark" the patches for layers with
> dedicated maintainer and also for extra "status" like merged in
> "master-next" branch for jenkins build, because standard status values
> aren't fine-grained enough.
>

Sounds like instead of bundles the new patchworks needs the ability for a
single list to represent multiple projects (so there'd be a meta-oe,
meta-python, etc), and more status values.

Ross

--001a113ec64ab81d1e0525eea7a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 18:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6y4" class=
=3D"a3s" style=3D"overflow:hidden">I&#39;m depending on bundles heavily, to=
 &quot;mark&quot; the patches for layers with<br>
dedicated maintainer and also for extra &quot;status&quot; like merged in<b=
r>
&quot;master-next&quot; branch for jenkins build, because standard status v=
alues<br>
aren&#39;t fine-grained enough.</div></blockquote></div><br>Sounds like ins=
tead of bundles the new patchworks needs the ability for a single list to r=
epresent multiple projects (so there&#39;d be a meta-oe, meta-python, etc),=
 and more status values.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a113ec64ab81d1e0525eea7a0--
