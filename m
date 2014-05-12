Return-Path: <drew@moseleynet.net>
Received: from mail-pa0-f41.google.com (unknown [209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 100CC606E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 15:28:50 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so8921290pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=moseleynet.net; s=google;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=0jKwMJK4xhwp8nuVVUuFtzvMrcxWeemzEO5SA6bUw7c=;
	b=FsETjjTPVOMiMapFNrkKMqve7RDlNUoqIruLXN1fS45BQi2vjMOA7MrvoVmxbvmUEF
	6ImujMdKRvi/TRWrNOAZ7a1boidXAXRPoPzQqEF+xq2B7Yw54puzQc7bZPakmgfaOEsu
	MatYKn68ecSX69Z1e4olrt8xwxX2EHllZvY/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=0jKwMJK4xhwp8nuVVUuFtzvMrcxWeemzEO5SA6bUw7c=;
	b=KMB3rOA2Fdhsly3pPOS+NFyq3GF1jF3lxXWUcJme7FYvEblDUsFQ7AuANP/e4Fstq6
	8MhsyhfUluVe9LWHRskQgfHaBZ7SovrWcTgrWktJVvfsrpL4KW7OX6dSCoC0YJwzi3QS
	6vGsY2O4+yGPsXPhZAtec9wCU+2pY51jGhRP/4hEcB4yD1sLbwfg8xzBfLHnHDFvPGCj
	Xz957soV3cL15E2qzWCURNghk5Q7VYpjaywkYYziNfuW80jUSGZw0cINLlQ3fhq0lVjE
	P08CW/c1Wk/jsuLse6TJ8WBHSionpdLGSz5hBOMyn9D7NpLoeHrAlilpjuCRmuxRwdjM
	LKOA==
X-Gm-Message-State: ALoCoQmoSYlp/cBKaCLMxwO/1Df2onNZm9ynnoC5meMgNgy6T6N6CxPsntgmPDf9CaJFbVW0Uhoq
X-Received: by 10.66.159.4 with SMTP id wy4mr56899958pab.139.1399908530536;
	Mon, 12 May 2014 08:28:50 -0700 (PDT)
Received: from [192.168.1.33] (cpe-174-096-222-251.carolina.res.rr.com.
	[174.96.222.251]) by mx.google.com with ESMTPSA id
	pr4sm23417197pbb.53.2014.05.12.08.28.49 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 08:28:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Drew Moseley <drew@moseleynet.net>
In-Reply-To: <CAJTo0LaAGmOjHVkB-ywEzasD0WOttBmWpRwhzy=cSux3T5ZLEQ@mail.gmail.com>
Date: Mon, 12 May 2014 11:28:46 -0400
Message-Id: <73AB6935-6AA6-4FB3-BDE1-48C527E2D65C@moseleynet.net>
References: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
	<CAMKF1srGS73dbGsRC3hw6Aewn7aHp0JokEFisy=vRy4WBmmSCQ@mail.gmail.com>
	<F9CF7C25-EA6B-4177-B269-C20B1E9CB608@moseleynet.net>
	<CAJTo0LaAGmOjHVkB-ywEzasD0WOttBmWpRwhzy=cSux3T5ZLEQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: Specify the lib dir to locate glut libraries
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
X-List-Received-Date: Mon, 12 May 2014 15:28:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On May 12, 2014, at 11:06 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
> On 12 May 2014 15:40, Drew Moseley <drew@moseleynet.net> wrote:
>>> should this be libdir instead ?
>>=20
>> I don't believe so.  This is used at compile time to locate the =
libraries and header files.  However forcing it here to be the libdir is =
clearly not correct even though it doesn't seem to break the build.
>>=20
>> I'll continue investigating and see if I can find a better solution.
>=20
> For configure-time detection of libraries STAGING_LIBDIR is correct.
>=20
> Ross

It's actually a bit different than just standard configure-time =
detection.  With the current code, all that is specified on the =
configure command line is "--with-glut" which results in the following =
compile issue:

| ../../x86_64-mel-linux-libtool: line 6012: cd: yes/lib: No such file =
or directory
| x86_64-mel-linux-libtool: link: cannot determine absolute directory =
name of `yes/lib'
| make[2]: *** [libutil.la] Error 1

Interestingly since we use the '--sysroot=3D' command line option then =
the actual value specified to '--with-glut' is actually redundant.  =
STAGING_LIBDIR is not the right value here though since it's used to =
located both header files and libs.  I'm testing an updated version now.

Drew=

