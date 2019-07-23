Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 841BF7ECBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 19:44:33 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h6so84378742iom.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qCRfI3aNVKIiFI6evibEBOETJu9ktJLhFoKVo9VeCOE=;
	b=Iu8sCit5BMiHIFUDZQxbvQtSzyBlyZrMubd7u9DATQyKLyZmfobC33yVPC4xyZIlrB
	2zymrMZ3lzRNf3d/OQSvhoTZF5+DGzs8xHzZOAwX34u/4JxPVGioj6jSCFaHhbbPkF8p
	CV6yXh8B9IWamTBOChhWpuHvY7LDJULejWTcga4JuuRpwIFOU/MZQYZBn7M2grwZyGyL
	Iywfzozedo4CvK4LeD6wyZnlfSb26Ur8Q8d6gjGj7FC40HNQgg0KBiJM5tKD0o7vNMp6
	mPIidol2aAQ4CPxA/34hpwtU3/T1qaCWRPvag17GUjcbyoitkj48PN/bfelQM0Elxdvq
	AwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qCRfI3aNVKIiFI6evibEBOETJu9ktJLhFoKVo9VeCOE=;
	b=WGr+1yGo9kBJPYfJomUGt1Yja+xzR023gdYLfMNgR8j5M7fKexOoUO05nJqrfyHkUj
	Tl6WzRifM7AexYY9ynqz1fiGHwEKsb9+HHB4a4JrF3iPoY7C9+6W4eOaITkClzBGeqzg
	TUvUP1vms1ntcu8TfR/0lWUAtu6h7Jj7MHEHvV6I0e1UHZoO61nDohW0Ma2PBpfTiCq1
	gCvbWNZheO0FZMl0Gw7diRtevcUkzg9W9LhuSKI7F8SOI0u4d9ToGmsa2YthFxLg4b0y
	knt0MQ9/SFh4plajyqYBx8VR9yvc3HgBHtZxvC+fi+ztvFR+aIq5rimx9dZUAP3CZ3Q7
	C7gA==
X-Gm-Message-State: APjAAAXb3P/PyaHqNXZNMFcTJqzf/H+gcjavtVV1BbO4oWFAvyEom8Zk
	WTCxS7aRIf29gkoWc8D8xu+X2OSEcJun2jKRebLiRg==
X-Google-Smtp-Source: APXvYqzKfrRzQ1hTCCzL68ah5aKneCQ18kXA30RCTrKgP84Y7nu4eK1z98hnZ7G9GEg+D+V7K3j5wXMNgSjxkAfNnmE=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr5760281iod.25.1563911074393;
	Tue, 23 Jul 2019 12:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190723044052.29756-1-anuj.mittal@intel.com>
	<f35a7ecf-7f25-aaf2-cf5b-ce4d89ed14f4@windriver.com>
In-Reply-To: <f35a7ecf-7f25-aaf2-cf5b-ce4d89ed14f4@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2019 20:44:22 +0100
Message-ID: <CAJTo0LY4V1pfmCTTh+6wf-nyc74zfnWSB18dL8M+Ln65tiXzDQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: CVE fixes
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
X-List-Received-Date: Tue, 23 Jul 2019 19:44:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2019 at 20:33, Randy MacLeod <randy.macleod@windriver.com> wrote:
> Can you remind tell me why we need to keep libsdl_1.2.15?
> It was deprecated 7 years ago:
>     https://en.wikipedia.org/wiki/Simple_DirectMedia_Layer
>
>
> $ cd .../oe-core.git
> $ rgrep sdl * | grep -v sdl2 | \
>     grep -v recipes-graphics/libsdl/libsdl[-_]1.2.15
>
> ...nothing that looks like a dependency on this version...
>
> There are some dependencies in other layers so maybe we should
> move this to meta-oe if those dependencies can't be changed to
> libsdl2.

I think mpg123/321 was the last user, and I changed that a while ago.  So, yes!

Anuj, can you send the recipe with the CVE fixes to meta-oe?

Ross

