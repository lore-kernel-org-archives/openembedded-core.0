Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGyS2-0003vN-8m
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 22:43:22 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 13:30:30 -0700
Received: by oagh1 with SMTP id h1so517551oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 13:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Cy0UznF8PaV/Gak9bbWOIvxVM15ev4jvhsE5JvHa77I=;
	b=jlpFzGT+8vc6TPSV3C7vWmeoKHR+ZyZmou7hLygH07gUkaRn2a/HSUC/xaMU1FU16e
	+gMkhs2FVSFHjhCn4wQiyzKldOjzpdvD1v9Hij/qE2mxZ3FKQRTQ1TDQvni+tN4FJlkG
	qWafbTAr8Xbe4lzEBbNdWwzgoRJEn9ILiz+LhIYXIHq2l1JL9JHJX8sDyu7JteEf6BwK
	8R0yrTF/PWEj2T1vn2nMLhFvhHnTWZrlge1u19JkWJBuycyXFSayagATWdKPsZCpt/UE
	gnAlANQzw4ZRA4KOLXEd/l8U1zyz1tUKv/Oq2g3+GHK2Vxzq5eKJ/48TQImyWZNrSVmr
	MvAA==
Received: by 10.60.28.162 with SMTP id c2mr1471923oeh.3.1348691429437; Wed, 26
	Sep 2012 13:30:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 26 Sep 2012 13:30:08 -0700 (PDT)
In-Reply-To: <CA+chaQdYkLRac9-yaH7TThO-ALgHaUOB7=3WdrG9CL+U4SfkRA@mail.gmail.com>
References: <20120921112144.GE10268@jama.jama.net>
	<1348333994-18026-1-git-send-email-Martin.Jansa@gmail.com>
	<1348333994-18026-2-git-send-email-Martin.Jansa@gmail.com>
	<1348482003.4654.12.camel@ted>
	<CA+chaQd0psd_sPVnixVH_e6RAO_5jqrj-5=S5cnd4rG+2rhwCA@mail.gmail.com>
	<1348483380.8662.2.camel@ted>
	<CA+chaQdYkLRac9-yaH7TThO-ALgHaUOB7=3WdrG9CL+U4SfkRA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2012 21:30:08 +0100
Message-ID: <CAJTo0LZu0GAaB39EkcprS95ZN30gxB=2xKmjbBFez3ZFBzf2fQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQl37+dxSiy6IPn+Gl03CotcGmLNVfpyUqV4YaEjUUM6L/svXrZDhsIP7bC4oag9YtqXoHhA
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Wed, 26 Sep 2012 20:43:22 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2012 11:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why not RCONFLICT with every older version then current?
>
> It's true that e.g. 1.11.2-r8 does not really conflict with 1.11.2-r7
> (but r4 in most cases), but that should work.

As much as I don't like this solution as it's overenthusiastic about
the conflicts, it isn't demonstrably broken (whereas a bbappend with
PRINC breaks my proposal).

So, ignore my patch, I ack this one instead.

Ross


