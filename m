Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StEmp-0005Yb-O0
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 11:18:43 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 02:07:15 -0700
Received: by yhpp61 with SMTP id p61so4745481yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 02:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=sOohv8qRbHIbqf69nVZg60Kk2dVacG6JCeOIMcXElFs=;
	b=ohpjRtW+jeaj7zwuNQ0APemPcKQY5oJFOmqUaoZyxffAvXr6achK6mAh6gD47WPphH
	tGQpiQnZseczOtxmK1E0GbSMrdiF21EHBd+i9Be5t6N32HsA6mE7ZYetl3R+QhNpvTE+
	NNphJO+VoELIKDJFSe2ZwnP+fRD4+EcaZrf7Z+X/oXq5bjUTGX5433au8fB5hPvYMaJI
	1KZd9wwQSx9xXncYj4PcdMaCDb9XKSqVB7sawOkPShFc4ftV3GCnIw+c0DufrWIQa6i1
	AV1wr6ddea/azNZ1MwpIXLEPCAo6stSgJFMShPRoTb2jfCNuTxT4Sp+xLINdIyBTNZyB
	4eeQ==
Received: by 10.50.208.34 with SMTP id mb2mr13942070igc.5.1343034434181; Mon,
	23 Jul 2012 02:07:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Mon, 23 Jul 2012 02:06:54 -0700 (PDT)
In-Reply-To: <20120723081543.GA3271@jama.jama.net>
References: <20120722104320.C057610218@opal>
	<20120723081543.GA3271@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2012 10:06:54 +0100
Message-ID: <CAJTo0LYK43FiO-iJ3wQf3Dsid14ckSkW9cAGhKtBUV8sDACd2Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlZcHte1GKu0C2bs/MkpaxoAVByDVsKh9xpYXT4AYV4siTtHvNNedn75TUDcgK5TSSioYih
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Add gtk-doc-stub
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 09:18:44 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2012 09:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> This has couple of unpackaged files:
>
> NOTE: package gtk-doc-stub-0.0+git1+3dfd0a09de696ec8c544762747f8a0f77153622e-r0: task do_package: Started
> WARNING: QA Issue: gtk-doc-stub: Files/directories were installed but not shipped
>   /usr/share/gtk-doc-devel
>   /usr/share/gobject-introspection-1.0
>   /usr/share/gtk-doc-devel/gtk-doc.make
>   /usr/share/gobject-introspection-1.0/Makefile.introspection
> NOTE: package gtk-doc-stub-0.0+git1+3dfd0a09de696ec8c544762747f8a0f77153622e-r0: task do_package: Succeeded

Good point, I never tested the non-native package because it's
generally going to be used in a native context.

Ross


