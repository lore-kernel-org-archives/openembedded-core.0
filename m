Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id CFF2F78217
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:06:42 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id r103so71231702wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 05:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VA6vbTSuRhcwtF21QMSeebHHifsAFAhrZJng7pR9u5o=;
	b=A4Cudyk7D6YpORcCRTbbsEhNalyln4k8F1ZHl+Rw7Q0xJ3FnfN+LF9v61PiiElSkHt
	Tv3dENaKiuBivRXYTw6WiJ2Cx4FG1UpFb9H2Uibc1oFLXsxa/1BzwFqpsOlc8MmMYjer
	Ua0Q3C32tw0ZyMvi/qRreoWI5Vh92BnjfPj0OP2VSXkix6SDKRG0sK7mcLvJg6AcyGn4
	B/C2istzF5ULS03kqPvZ3OMdwPdIxvP4NvtjZj12r1L97xHmE2u8p/PzTyeBMIf4Bybj
	LgfkXI5gmh0pSjKC4lzKrGL+XTp8gmrRjy/LaZbfauPSj6erJuVUtP1Xs0lW6v6oYWfk
	4OVQ==
X-Gm-Message-State: AKS2vOy256N7817HUFnZYIZyO0dK/PGQj5mpgN10u67+sdzn9/qViUzz
	36vG4qvqVr3pLq59E5M=
X-Received: by 10.28.6.208 with SMTP id 199mr15027008wmg.45.1497874003292;
	Mon, 19 Jun 2017 05:06:43 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id u4sm8525989wmf.7.2017.06.19.05.06.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Jun 2017 05:06:42 -0700 (PDT)
Message-ID: <1497874001.25895.5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 13:06:41 +0100
In-Reply-To: <20170619140225.5cfdc2a6@t460p>
References: <20170619103238.2626-1-git@andred.net>
	<20170619140225.5cfdc2a6@t460p>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] connman: fix nftables dependency
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
X-List-Received-Date: Mon, 19 Jun 2017 12:06:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-06-19 at 14:02 +0200, Andreas Oberritter wrote:
> Hi André,
> 
> On Mon, 19 Jun 2017 11:32:38 +0100
> André Draszik <git@andred.net> wrote:
> 
> > From: André Draszik <adraszik@tycoint.com>
> > 
> > When building with nftables support, connman doesn't ever
> > depend on the nftables command line tool.
> > 
> > connman will depend on libmnl and libnftnl at build and
> > run time. In addition, the nftables rules it creates
> > depend on various kernel modules being present.
> > 
> > Update the PACKAGECONFIG to reflect this.
> > 
> 
> packageconfig creates runtime dependencies for the modules you added. This
> will cause problems if the modules are built into the kernel binary. You
> should add runtime recommendations instead.

But they should all be fulfilled because of PACKAGES_DYNAMIC in
kernel.bbclass, no?

Cheers,
Andre'


