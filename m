Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.8552.1589298552971168576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=hmdpcdkm;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M2Kg1Yndz4y
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 17:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589298551;
	bh=OMJuFH/sothy7l+FwS3X/9TjN0YcJttbbR/Fp0PIGeA=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:
	 References:In-Reply-To:From;
	b=hmdpcdkmlHQ4UJ6Nha3NdkTNuXpNtb/m0TEEbnG/aDFcIv6PZqREWjivepHEdm4WB
	 CwBDG53fb9cjKhJn0uQ7KBwzror4z1wbwyo+XMOgUcZODisDD2csWU0PjswlFnxjiT
	 Kfp0cWsx7m6+XCQjInuApU8H/bZ8fqovrm5alyi+GNRtYAUxf5ckkTWd559NPvVUcX
	 U9+2twBYKVyE2igVNVw/y5BrJ3SAn1Hf7uEizkh+m8tw1N3EziIx29/KfA+OGPSF1i
	 Jd8JwqQfDqp6TC/kPCLdq6qC2a0WSRqnOxoL4OOIkaBt47ul4NLdOqiIk7/wbsVmJ4
	 HelF2S9JQKgyhoLOZ4QLw9MTgFSmoGF5LmJq9mPTINdaXgQSgMxP+dqYTIPmuUcXC3
	 SEI+u6Alt0HZOqJzQ4CTud/Xfp+8yULQGiKxIF6vuupMZi+DRgKcDhMW7oeA2vg+WZ
	 YRqEycN8B0Lsk6+jsyZ9C15/FVlxDcobYZVCB61C3frL0EEBn1opbYrhWj44LrD0Oa
	 nvNO9tOIih1z5d8Ln74z8Gcjy+cByY3ISpZctMBJxFxzL3SsL5EVya6R9MkJUiKeRe
	 mba/eazeqItw1MW2I6uJPZjfBxvW8ByRBV/cSzCQnBWTnDDBy5bwlOOv56UIPGOQSy
	 xr3jRKF79oHF/JxGdAZU4U3E=
Resent-From: Adrian Bunk <bunk@stusta.de>
Resent-Date: Tue, 12 May 2020 18:49:09 +0300
Resent-Message-ID: <20200512154909.GE11943@localhost>
Resent-To: openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2020 18:33:08 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] llvm: Remove -fcommon
Message-ID: <20200512153308.GC11943@localhost>
References: <20200512141416.5327-8-bunk@stusta.de>
 <68c654c4-9a33-d06c-eba0-13e507d25606@gmail.com>
MIME-Version: 1.0
In-Reply-To: <68c654c4-9a33-d06c-eba0-13e507d25606@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 12, 2020 at 08:17:15AM -0700, Khem Raj wrote:
> On 5/12/20 7:14 AM, Adrian Bunk wrote:
> > I cannot reproduce the problem.
> 
> have you built the target recipe with gcc10 with -fno-common default ?

Yes.

For menu-cache and matchbox-wm I got failures without the patches,
but not for llvm.

cu
Adrian
