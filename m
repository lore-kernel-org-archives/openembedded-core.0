Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8A26F78449
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:41:44 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g73so8472975ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 03:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n2aSh6ybSEfSlBh3Uy8dUCtHaGvMEOHMgKnzwcd0+NU=;
	b=HQjBSt5OFk/878VDiQW6d0sh7iYX/4kyvwHdMPPLpdtoy43XXELPFR2xfmkr+neqUH
	tNvspmcwu5tCiS30zBwQdjY9B94W9alwsQQ5CEdpglW0n15RGURzkLKnQD0gFALWy6/x
	gy1nr0rN0eQXMbkt9aCvkIRisDMqTXDGXF3gjfBhfrhfco5KOZsJMYWtKSyQJQG2M/Pf
	PbFbsTvq9mfJlLgz+EWPGvKrLiPYTu8B8UkrpBG7IBJ9XJO3Bl8z16p6undaZyPQ/IbW
	rzt7GweYdFGIFGF4DWbmges9j78sQKvqSQSaC+EEVNoaZQrR41IJE/S0wno53mBvepeV
	ilfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n2aSh6ybSEfSlBh3Uy8dUCtHaGvMEOHMgKnzwcd0+NU=;
	b=uIcKEBACJYm/Ev8995vioeAIm48ci7nItNlyTuQKu2wf7TlkiaBvbL5Uhx8sEe1hBv
	7A+7WHTdCTlapcbm2v7kcWvp/IoQkGhSkolFuY3P1h1EZsV4YTyatmc6d3Mz2vnXU2nH
	7/1u+k6uPM2+JPfurKnZI6P4DJM54I0mRJn6f7armGCsRo/fKES2HWJ5P303yBxjNAOo
	77vyt/HoUgNkSkBZjGlw1dA1fHTKL7GF1ySU+/t551YQNEqZmhFEZ6cP5+ub2TDTG3nl
	f7RuWA8XyyiS8Rz6OihMptQ18JOfvakZx3JRgtm0uFsmka3gewq2k2/Ro6Xpax3HkcI0
	abOw==
X-Gm-Message-State: AJaThX5Uk/Qa06hZMl9+BiFEG73fDbvPbNZwK474Qzy+djq/Rv1L2dlD
	/ZM1X4PLewELpD8s51KturfAzjS6gAOtGtzjVwhg6w==
X-Google-Smtp-Source: AGs4zMY8iAGiwnWFsh3bBhPZ/ywvoX2ZRmiD/s9thmc2nSSkf+/ydQH6bRyz50gLqbGX0TsGCuse/ze5/zjqevGTFJ0=
X-Received: by 10.107.178.145 with SMTP id b139mr7698344iof.52.1510659706122; 
	Tue, 14 Nov 2017 03:41:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Tue, 14 Nov 2017 03:41:25 -0800 (PST)
In-Reply-To: <CAJTo0LZFWFV-ZThaf0aNxC6r8+guutmNU68759hHND7zESmc6A@mail.gmail.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
	<1510654568.4049.64.camel@andred.net>
	<CAJTo0LZFWFV-ZThaf0aNxC6r8+guutmNU68759hHND7zESmc6A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 11:41:25 +0000
Message-ID: <CAJTo0LbnJtZG2LTe_NsOgH5-q1y7JectDHDM0h9nJMbi5txb9w@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Tue, 14 Nov 2017 11:41:45 -0000
Content-Type: multipart/alternative; boundary="001a114ca162292546055defdfb4"

--001a114ca162292546055defdfb4
Content-Type: text/plain; charset="UTF-8"

On 14 November 2017 at 11:34, Burton, Ross <ross.burton@intel.com> wrote:

> But don't we remove the old version from the feeds, or does that only
> happen if the arch matches?
>

Well the feed pruning is working correctly:

With master from deploy/:

$ find . -name autoconf-archive*
./rpm/corei7_64/autoconf-archive-dev-2016.09.16-r0.corei7_64.rpm
./rpm/corei7_64/autoconf-archive-2016.09.16-r0.corei7_64.rpm
./rpm/corei7_64/autoconf-archive-doc-2016.09.16-r0.corei7_64.rpm
./rpm/corei7_64/autoconf-archive-dbg-2016.09.16-r0.corei7_64.rpm

With this patch applied:

$ find . -name autoconf-archive*rpm
./rpm/noarch/autoconf-archive-2016.09.16-r0.noarch.rpm
./rpm/noarch/autoconf-archive-doc-2016.09.16-r0.noarch.rpm

So, is the allarch < tune < machine logic rootfs time only, or is it used
on target too?  Forgive my ignorance, I haven't actually used a feed for a
while.

Ross

--001a114ca162292546055defdfb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 November 2017 at 11:34, Burton, Ross <span dir=3D"lt=
r">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burt=
on@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">But don&#39;t we remove =
the old version from the feeds, or does that only happen if the arch matche=
s?</div></blockquote><div><br></div><div>Well the feed pruning is working c=
orrectly:</div><div><br></div><div>With master from deploy/:</div><div><br>=
</div><div>$ find . -name autoconf-archive*</div><div>./rpm/corei7_64/autoc=
onf-archive-dev-2016.09.16-r0.corei7_64.rpm</div><div>./rpm/corei7_64/autoc=
onf-archive-2016.09.16-r0.corei7_64.rpm</div><div>./rpm/corei7_64/autoconf-=
archive-doc-2016.09.16-r0.corei7_64.rpm</div><div>./rpm/corei7_64/autoconf-=
archive-dbg-2016.09.16-r0.corei7_64.rpm</div><div><br></div><div>With this =
patch applied:</div><div><br></div><div>$ find . -name autoconf-archive*rpm=
<br></div><div>./rpm/noarch/autoconf-archive-2016.09.16-r0.noarch.rpm</div>=
<div>./rpm/noarch/autoconf-archive-doc-2016.09.16-r0.noarch.rpm</div><div><=
br></div><div>So, is the allarch &lt; tune &lt; machine logic rootfs time o=
nly, or is it used on target too?=C2=A0 Forgive my ignorance, I haven&#39;t=
 actually used a feed for a while.</div><div><br></div><div>Ross</div></div=
></div></div>

--001a114ca162292546055defdfb4--
