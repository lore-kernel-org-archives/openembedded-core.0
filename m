Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF6A65CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:55:35 +0000 (UTC)
Received: by iods203 with SMTP id s203so40060787iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 02:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=eKla/ebNZ+QG3crP5x9vMxJZ4KFVnn+4Ha4Ng6wxJ7Y=;
	b=hdjuSiFodLSPuO5bxq9rJSRhTzMG2zN+XaqZ22/ezBbv7imd96yWiiDqj2qDmtJTKB
	VgQv/nwHJbh41/57DS0/UatPkmT7/CQQaG8RCHZKN4CZqfo47Mpbiy0PagPzCkGamFxm
	Z+EFdET2HttyWINLdB874OjoyYZ5UjVvKI9L+2vq8t3V6xbeqM6CrpryFQiWyJB/bbCO
	CEkZBeFipuNN9ysFe5y9H/to91T09ekFCV5od1+FH9XcKBYAGNCYJSpxzECMQJWj4df9
	5a8q3EY+BNraQuuYgTzLI3D8OKD2Hd8tFPY0uEfibLqhT6y2qvKqPC/bMsrxUXHd1EyW
	dsrA==
X-Gm-Message-State: ALoCoQlKhRQhzlENwGwJtKFWWjdqls8XYEpTG2lY6p1R76zxVuVTZHP3KcQY0d2ajfxkhuwDd7OB
X-Received: by 10.107.136.34 with SMTP id k34mr1799220iod.6.1440064535543;
	Thu, 20 Aug 2015 02:55:35 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181]) by smtp.gmail.com with ESMTPSA id
	i123sm2999167ioi.13.2015.08.20.02.55.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 02:55:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igui7 with SMTP id i7so26583771igu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 02:55:33 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.64.212 with SMTP id q20mr6904124igs.5.1440064533861; Thu,
	20 Aug 2015 02:55:33 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 20 Aug 2015 02:55:33 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 20 Aug 2015 02:55:33 -0700 (PDT)
In-Reply-To: <55D5A12F.3060007@pseudoterminal.org>
References: <55D5A12F.3060007@pseudoterminal.org>
Date: Thu, 20 Aug 2015 06:55:33 -0300
Message-ID: <CAP9ODKps_5p-Oqenu55CP8yf1e1wcJ6mDSofKqbZ=byAtcv8yQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Suggestion: sanity check for git branch value
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
X-List-Received-Date: Thu, 20 Aug 2015 09:55:36 -0000
Content-Type: multipart/alternative; boundary=047d7bd75fcefe9ed7051dbb267a

--047d7bd75fcefe9ed7051dbb267a
Content-Type: text/plain; charset=UTF-8

Em 20/08/2015 10:43, "Carlos Rafael Giani" <dv@pseudoterminal.org> escreveu:
> several recipes have SRC_URI lines like: "git://
server.name/repository;branch=${SRCBRANCH}". If for some reason SRCBRANCH
is empty, this essentially evaluates to "branch=". I think a simple sanity
check that outputs an error if the branch value is empty would be useful,
since otherwise, this leads to a very confusing error later (git fetcher
tries to use a command line like: --set-upstream origin/  , which causes
git to complain that "origin/" is not valid).
>
> thoughts?

I fully agree. It seems to need to be done in bitbake code.

--047d7bd75fcefe9ed7051dbb267a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
Em 20/08/2015 10:43, &quot;Carlos Rafael Giani&quot; &lt;<a href=3D"mailto:=
dv@pseudoterminal.org">dv@pseudoterminal.org</a>&gt; escreveu:<br>
&gt; several recipes have SRC_URI lines like: &quot;git://<a href=3D"http:/=
/server.name/repository;branch=3D${SRCBRANCH}">server.name/repository;branc=
h=3D${SRCBRANCH}</a>&quot;. If for some reason SRCBRANCH is empty, this ess=
entially evaluates to &quot;branch=3D&quot;. I think a simple sanity check =
that outputs an error if the branch value is empty would be useful, since o=
therwise, this leads to a very confusing error later (git fetcher tries to =
use a command line like: --set-upstream origin/=C2=A0 , which causes git to=
 complain that &quot;origin/&quot; is not valid).<br>
&gt;<br>
&gt; thoughts?</p>
<p dir=3D"ltr">I fully agree. It seems to need to be done in bitbake code.<=
/p>

--047d7bd75fcefe9ed7051dbb267a--
