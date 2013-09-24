Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id C004D6C994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:34:40 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id oy12so3796387veb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mdrTUifR/Nb5b4x+EhFLexvX1++6AXyQ3xLOgLP8vTw=;
	b=WGXFsECK564KOZPOOXvAB96AH/cxHtiMfJ5fxAFZX2QCtK5VDmRA/UcGifRSABZRqr
	r4g+k2I3cHFNUw8ZyTte5wfNA6f8NZncykAe+VQFchTkkznIZnfQyZvrxFzkVqtPIdaM
	fzJPbO+JLlNpe+rE38SGsDKf1lLC9ejxn8VLyNQZdYdBzTZGp/gS6sijaEJcdQIbfRtQ
	BvEuJj9PDgRl1r18ynbSt8orezbU2ojKWT71n4VbPoBp6+rAaR+dEKjcjLwoDasI3Sii
	zE9ImuM57sOPIpOQu6tbo4H3DXNncfVUzV/T51Apn+91IOnnigCld4D2M29K8AXZTsII
	OXog==
X-Gm-Message-State: ALoCoQmbUfp7iAmLF4Pqvd3MNb6lg31kllT1cjom+vukQsmKguWtSAvDZPNDGSwgoWyTiW9cHVQq
X-Received: by 10.52.118.73 with SMTP id kk9mr23692837vdb.13.1380040482457;
	Tue, 24 Sep 2013 09:34:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 24 Sep 2013 09:34:22 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF843C5198BB@ALA-MBB.corp.ad.wrs.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com> <5237E49C.7090608@windriver.com>
	<CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
	<20130917103029.GA7313@jama>
	<CAJTo0LY0yOaFyn0+DiTgag2bJ4qJ5XM0-=Vz7EMN8ajXsseiiw@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF843C5198BB@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Sep 2013 17:34:22 +0100
Message-ID: <CAJTo0Lb-kjzX_=zRLc5q67xG3tWM4hn5dztj2XDd1w2md_smJg@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Tue, 24 Sep 2013 16:34:41 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2013 22:51, Slater, Joseph <joe.slater@windriver.com> wrote:
>> Anyone else want to add a data point?
>
> I am the only user on the machine below.  I compiled twice, each way --

[snip]

Unless I'm reading that wrong, it looks like again its actually a
small win to use -no-keep-memory.  Sounds like we should just add it.

Ross

