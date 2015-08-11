Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id B87227690C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:15:51 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so11877909igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 17:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=377xQKiSBHZsok86NekxqYE9FU2n6n3Fpjt5tW2U1ns=;
	b=G2pFz2HbQkdskMWZdvBYS3MO390zZhJzB+7a6wj4THnid1OiG+M26fk6hobAMrt8d+
	MRooq+BeIMlvioFgCek9XAcOIrknLHr+7tKk62lxI9QP38/Bo4OJARm+Hs+A8y93sCp8
	2Ao2PFIGhjZTP17Ad4KTv9fRt/6KosAMovFyguPlu+gUvioJx45SLuHDn1v2XHd6ZtSj
	6os7k7he8r6k+JRL+q0bFx4l0fR0c++1QzSMwC+Ne3kdoPHQaGecSOntY1vxo1LMFS4c
	VF189xQNc/ZOUmg+vIKF7v1ncRa9MdUtTWyih5qnHVeN6KYO6jZO7feY4Da1Jxe2gLXZ
	xVuQ==
X-Received: by 10.50.17.66 with SMTP id m2mr15368438igd.77.1439252151330; Mon,
	10 Aug 2015 17:15:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Mon, 10 Aug 2015 17:15:21 -0700 (PDT)
In-Reply-To: <1437989436.821.221.camel@linuxfoundation.org>
References: <1437989436.821.221.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Aug 2015 17:15:21 -0700
Message-ID: <CAMKF1srLYg1b8r-_rOO6QrHS5qt_sD-htWCWjWL5o-utjvoNJQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc 5.2 failures
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
X-List-Received-Date: Tue, 11 Aug 2015 00:15:51 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 2:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I've run a gcc 5.2 test build on the autobuilder:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=3628c3c06fa4195003ac655bcc791acfac775173&limit=50
>
> 41 errors (with a few more pending).
>

errors like http://errors.yoctoproject.org/Errors/Details/13821/
should be fixed with glibc 2.22 now there was symbol visibility fix
which went into gcc5
binutils 2.25+ and glibc 2.22+, I did not backport the glibc piece to
2.21, as I knew 2.22 was releasing.

