Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T89Zt-0003z3-NC
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 14:47:01 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 02 Sep 2012 05:34:41 -0700
Received: by obblz20 with SMTP id lz20so8068499obb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 05:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TvypiJvbcuiW27v3BvZvHnqpeGNGV5PV06OvbeZJqhA=;
	b=WG2YEQv3oWquZjuhcQew65jf6OKUa+y3VtiaIaz+JxCzxB4bon496IfaYSggFzJjTq
	VmMamXi/1WyfyCfmZU2nfWRD0v0rRAuHFQkR0qMzVYy6iwtEq4c2+C7jJN4l5JEA7Z8V
	2wIPNPFhWE9vZTvBVLfr7Dra69QHM4d5ZEKvDk+Ymar00CvKNrwd0laNkJVODF1GDq50
	nLcAs9cwEoESGZbqOo6XPvW4p/pHZPV7El/lW3SYji5CC2hk361KDnw8hhbDn3P+fivi
	DkYKSfp2odtr2Bt0GvwlUbDaA2wk+0og8eZhjhkSLrLkwd+mDhzPExNsI4BjxTMxI0Ye
	SU8A==
Received: by 10.182.44.7 with SMTP id a7mr12093692obm.80.1346589280342; Sun,
	02 Sep 2012 05:34:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Sun, 2 Sep 2012 05:34:20 -0700 (PDT)
In-Reply-To: <50433775.2030101@gmail.com>
References: <CAJTo0LYYFvwD75PsXu2WtC+CvQ2ep0i5bDKZFcNKFyQXwDDGTQ@mail.gmail.com>
	<50433775.2030101@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 2 Sep 2012 13:34:20 +0100
Message-ID: <CAJTo0LZ55DqzWqeHsREJc5XxAAKats6i0u2cW-9WL5WLpMAUXw@mail.gmail.com>
To: Zoltan Gaal <z.p.gaal@gmail.com>
X-Gm-Message-State: ALoCoQmZpqiRzPbXziHjA29hsK3FHuc7hW+R9EmnjzSAxpTpKCDEBYiDsg5EOXJm/6v682xcXQwt
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
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
X-List-Received-Date: Sun, 02 Sep 2012 12:47:01 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2012 11:39, Zoltan Gaal <z.p.gaal@gmail.com> wrote:
> I've tried it, but mesa-dri is required for xserver and it won't compile
> without it. libgles-omap3 cannot replace the mesa dependency, though I'm not
> sure  if it is a simple config issue or some interface is missing (libgl).
> And as libgles-omap3 also provides virtual/egl, the bitbake process detects,
> there exists multiple projects with the same provided feature:

So you end up with a system which has hardware accelerated EGL and
GLES (though libgles-omap3) and software-only GL (through the software
renderer in mesa)?   Doesn't sound optimal.

It's probably worth looking at making the GL dependency in X optional,
so you can build X with just GLES support.

Ross


