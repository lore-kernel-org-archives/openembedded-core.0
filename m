Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wmat@alphatroop.com>) id 1UdMtV-00012I-Tf
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 17:48:42 +0200
Received: by mail-vc0-f182.google.com with SMTP id ia10so3801068vcb.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 08:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=0IkLrn7r2gXgWnVlERlCqvF2yVXYqgs96349/AM+b8A=;
	b=hD0nK56MtqTlw6smhFeWWo1nBoseRcyZUkh+MUfw7pa9MC6DWpk8CoqjrtddH9N4yr
	AefZF4ipgWRmaGV3okf1vh7tP3Qa/t0VbhxDXld/IX6oXuwrKt35oSnp4jYl9QgxJRBR
	KbasJ9/idWKexxixbTr/GLXQDINOLl51Tdy3Ici5hsn5TwlNsebGe0CRawrfskWdN3Wd
	xsZK2s9uy5NM9lR1DSxr8CxMZtkZ8a3QESlx4W+AAkct2mi4HhIowEkwjsl0aEBO9ySN
	Q7G1t2SYEy7LwQhLDLG5E/+nhLIUVBf16GoYFzn3ruHeEaqT4DzKP8HCsLzCAjUyFzBI
	gYfA==
X-Received: by 10.52.93.10 with SMTP id cq10mr25729513vdb.36.1368804617619;
	Fri, 17 May 2013 08:30:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.2.7 with HTTP; Fri, 17 May 2013 08:29:57 -0700 (PDT)
X-Originating-IP: [24.246.30.132]
In-Reply-To: <51954B2C.4060900@mlbassoc.com>
References: <51954B2C.4060900@mlbassoc.com>
From: "William M.A. Traynor" <wmat@alphatroop.com>
Date: Fri, 17 May 2013 11:29:57 -0400
Message-ID: <CAGfZjq7xwYGgxx2nyAbuutzNe4kPNUhJ5cbKBfG1PF2cBHU7gw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Gm-Message-State: ALoCoQle8zg2N27UfQuPB+TnM23aCy4HseKCmpDBlcZ4ji7RzugUl82/nLRatuaFYq1ENDnIePWe
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why doesn't my package rebuild
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
X-List-Received-Date: Fri, 17 May 2013 15:48:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 16, 2013 at 5:10 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Sort of as a follow up to my problem of yesterday, I've run into
> a problem - I have a simple recipe which only unpacks a source tarball
> and then installs it - no other steps are listed or required.  The recipe
> also does not have an explicit PR value and I'm not running a PR server.
>
> If I have the package built, then change the tarball and the checksums
> in the recipe itself, it does not get rebuilt :-(  I have to force it
> using cleansstate.
>
> This setup seems to work fine for my other recipes.  I just tried it
> with two nearly identical recipes.  I made similar changes in both
> recipes/files - one was rebuilt, the other not.
>
> How can I diagnose this?  It's a private recipe (no use to anyone but me)
> so I'm not going to send it to the list but I can gladly share it with
> anyone who might be able to help.

Hi Gary,

You can increase the Debug level for your build with bitbake -D.  You
can specify this more than once for additional output, example: -DDD.
This may help you to diagnose what's going on.

>
> Thanks
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


