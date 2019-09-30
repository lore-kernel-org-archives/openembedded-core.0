Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 312FE6BC19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 08:17:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r3so10131742wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 01:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=T+nI6Wq+errHVhOgUVV/S1m7wYX1YKoKVbvnO2uCt3M=;
	b=qUxVhvgcG1hCs8xHLHE0/6bG8A2VVfTmZo1Kqw59mMhSau1mlR5Pw2iBTBWGRejyJ9
	LY+kHM/BjRhDthauK1pJtkwWqF3QD1p0quaDqklqmmdnnOGykSd/rPNNRyOuUZc5hdpf
	7AXZoOF2/Ag1oNAYQOrQZANWjQu1i06IU8wxYKSDDHtMt6lxO+lLWYGAy1dKN4YxR+VI
	cJxgUkVwOrA+r3wzdYNBT8HGeR7SAj7DNzNgKQ/8jZF6vdTg9+K8jVGI4N0MmMI8QBnt
	YCrhtbSOzOCi8PSKRUGwEweEhUu8G6LoN86O4IYraLGkSzqu8puqAGXkhc72Dp0wdAOp
	hHFw==
X-Gm-Message-State: APjAAAXOQ0eg8xzDoKqNuPogtRiNYEuw9slw6tkwCEWkvqgTv0y4t+Fh
	on1Rxvf9B5tdxCcFjjnf+vY=
X-Google-Smtp-Source: APXvYqwa6Xs4m8a3h1qyGUEfHVNxf5DOF82Jin7GnDfOSdZWntNhgUKea03F3f+c8XUwiV/kGaqXqw==
X-Received: by 2002:adf:f5ca:: with SMTP id k10mr12112666wrp.236.1569831474997;
	Mon, 30 Sep 2019 01:17:54 -0700 (PDT)
Received: from 1aq-andre ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	w18sm13282992wmc.9.2019.09.30.01.17.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 01:17:54 -0700 (PDT)
Message-ID: <3ddde333484a7b8168cc2f35901ad34805431b31.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Sep 2019 09:17:54 +0100
In-Reply-To: <CANNYZj_-m=u=OfTWnwWBi=VxeZWkVzyU1qXLBM_eZ7LAoPRdYQ@mail.gmail.com>
References: <20190927135443.15407-2-git@andred.net>
	<20190927141006.31440-1-git@andred.net>
	<CANNYZj8SJTA37zSRbFQ4jpJFH__ViDBQSKCC9EdH49Zk_E9Pjg@mail.gmail.com>
	<d5d7c18c1c5fdbb7cae13f47ef2c53c3c3a9518d.camel@andred.net>
	<CANNYZj_-m=u=OfTWnwWBi=VxeZWkVzyU1qXLBM_eZ7LAoPRdYQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ruby: fix non-IPv6 support
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
X-List-Received-Date: Mon, 30 Sep 2019 08:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-09-27 at 17:32 +0200, Alexander Kanavin wrote:
> On Fri, 27 Sep 2019 at 17:24, André Draszik <git@andred.net> wrote:
> > Can't the auto-updater do it? (Without the repackaging?)
> 
> I think it fails at the rebasing patches step - merge conflicts can only be resolved by a human. 

OK, I'll try to have a look anyway...

A.



