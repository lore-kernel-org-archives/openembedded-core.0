Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQb9i-0002ou-OP
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 12:24:36 +0200
Received: by mail-ve0-f182.google.com with SMTP id m1so2263054ves.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=2zh+G03qfG5SEbUKecKlRRwGd0l1jeRQIMVEwFzrFOs=;
	b=B153DuUZQ5yj5D4vZJazq1amBSl07jqyvvHJZWwRdK3hi4Ro09sChIOpfNK8KaFBeY
	8sTuQ6CbIgXVGoe4oWgpD+UQiuitfG9poag4yin222SoBNCwHkoKZvfQ7BO8JbyIBR+c
	4c5y68EmB4el5fqcpncAOaaxulQfDB01U1RVwkvdM9HrdvKdCFxlsnAt/Wk/vxQKZDTU
	lpXSvYc/+9c7hdMRQap7LEDjyGj5nPEr4H1czxTQQmCJOtnObrDBQxSwRgNnRSUy75xl
	WR5LfSLwmoNvIcinGNVgZpG1+z2boe23yCFYnTE8QEX8v7eSZ0W87he11qDTmEao2aSU
	lEaQ==
X-Received: by 10.58.143.116 with SMTP id sd20mr7877856veb.39.1365761226188;
	Fri, 12 Apr 2013 03:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 12 Apr 2013 03:06:45 -0700 (PDT)
In-Reply-To: <CALbNGRSqEdebP4WsrH9xrW30k+MuxfaXousVfNfjdufS4yCfSw@mail.gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
	<1364824441.24754.20.camel@localhost>
	<CALbNGRSqEdebP4WsrH9xrW30k+MuxfaXousVfNfjdufS4yCfSw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Apr 2013 11:06:45 +0100
Message-ID: <CAJTo0LZGADsne_bKyDDTX2Vt4QX=pfv+Vr27Xi93B8C_S3WJkg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQl0ltBM01alHAiiyO6eGwa/uI5RXKoC9KXZwPqWAJ3RtkxH8co3qH3TB2IJhYLKHr6mJSFx
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 10:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 12 April 2013 00:11, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> Had no make-native so did manually build it and now systemd compiles fine=
 now.
>
> Is there a reason why we don't build make-native - If remember correct
> there were fixes also for webkit-gtk parallel-make issues (ok - these
> are wiped away for me by retry loop).

We don't build make-native because any real distribution doesn't ship
an un-patched make 3.82 as it can't actually be used to compile pretty
large chunks of a distro.  Most distributions have either kept with
3.81 or use 3.82 with patches, and thanks to Colin we have the patches
in our own make-native now.

My hunch is that you're using Debian with make from experimental. The
maintainers appear to be waiting for upstream to release 3.83 instead
of pulling in patches, so my advise is not to use it - 3.82 is
genuinely broken.

Ross


