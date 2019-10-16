Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 099457F353
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:20:56 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id k32so21010682otc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=8yQ61G0DwjOj73swXEtKVZb4XDmagZmdYvU+3TGUejk=;
	b=nv/K+g9BjkQWljQqndUgmfe1UA9h1zNOglohrIoRWAbY5ZdcnvW2eTOBMy2RJmEzxv
	JHKeNjXsYlqEVpB7OQuwE1BUIm3XUoMll1CSML9pEt1axI/1s+eSbeaJuplMr2sqklOh
	SOyx457OVh3I1SfPAJvbw/D/okNV1J5sFes8j/d6SDJf6RQlzVwNTwKQ7yFgte1WBDJa
	OH5YL/rb4ohgFOORdRv3jgEW/4+WIKa5ucvScthOEr0Jra+OOpL1Fbm+Ny1VQHMZO07M
	21X6Ms7tHeVZYNepDYCEY3Z7B8ycTlPUXfWFix1bXh0K2BGQ7BjDB3ci50ip3z3HH2tN
	yzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=8yQ61G0DwjOj73swXEtKVZb4XDmagZmdYvU+3TGUejk=;
	b=hlBw2IJufAGU9u3TnZ2AcKFODKrxnva6Y2cLktsVTcq0Ivr++AFPUrEAAW4wrtXSxf
	LVK2SzUBSlPje9Xs97DzT52OSoRRtwar0hE7HI6rVyHCZ1oOuDGX3So7ApUC6nTk8Xcm
	1qMV3y9spF+QWutIKhcugdyyir3Bmggzb1npWE0U7uQXNWVRQylj/C3P3QxqPW+QZqGx
	chjJN1VxWG0XDmh9x4tFBe/Vo/9xN3rQQMcVpOW2P/by+6PnvzCrLThXHpwZxcnrI/wt
	1oNSTTF5j6zWRYNA5UMMsgos8jAMuTTBo0MxLTHGQnLWPOTtBe8GG5tb+8PtMZ/lq+ku
	/UBA==
X-Gm-Message-State: APjAAAV8H6O9RRl9ibYWkPxNj9DvWQPw7YCCy8jsLpxYyv3tUndjcXWN
	A1zSbWkzuaVLHIFBjzYyXW6Jk4iYL9oFMw==
X-Google-Smtp-Source: APXvYqw7BvYS0O4GUDXmPYDy5zO7Fc7D+EWmvDYQmWsrHrrXztaObkvPbJv9cqTNv8Lr/sOuwYDsCQ==
X-Received: by 2002:a9d:4aa:: with SMTP id 39mr7422020otm.311.1571250057511;
	Wed, 16 Oct 2019 11:20:57 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
	[209.85.167.178])
	by smtp.gmail.com with ESMTPSA id i4sm7473781oto.43.2019.10.16.11.20.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 16 Oct 2019 11:20:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f178.google.com with SMTP id i16so20904859oie.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:56 -0700 (PDT)
X-Received: by 2002:a05:6808:8d9:: with SMTP id
	k25mr3538961oij.153.1571250056015; 
	Wed, 16 Oct 2019 11:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191012165433.24511-1-alistair@alistair23.me>
In-Reply-To: <20191012165433.24511-1-alistair@alistair23.me>
Date: Wed, 16 Oct 2019 15:20:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpmB_kkXtd0LZEK-KWaK2VFM_T7yGjdwkyABR0d-Lgsew@mail.gmail.com>
Message-ID: <CAP9ODKpmB_kkXtd0LZEK-KWaK2VFM_T7yGjdwkyABR0d-Lgsew@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Wed, 16 Oct 2019 18:20:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 12, 2019 at 2:01 PM Alistair Francis <alistair@alistair23.me> wrote:
> The glx-tls option was removed as it isn't included in the meson.build
> file.

Why drop it? Update the patch, please.



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

