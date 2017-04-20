Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id B998E71DB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 21:30:20 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id y33so56543162qta.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 14:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EO8NKztausimkEtVf5S/Pm96Y570d/1G4v8SyCLLoRk=;
	b=WCyTVsCu1WtKDo/I1fIb82YR8iHrmfL4cGcS0UI2zXyt8T2LLZWk+CvQj33U6iwJR8
	DoNOIg+T93pBUG9Y20edegssmhgWJtp177C7bg+HRhXRIKuxO3qvNJIZl7syl18d7BsF
	gYLuqguQQGtaDNaLOZ/eK8s3fMQ92Oyv3M5NTL0JecI530Av9n9RFKO+YBO4N5jcsf1r
	mjg+1/YXL1g1rI2vc6K8eBSwvWkzt5W+QTlwN0GJzV540hCUjZ9Nehwb31IMVbClUZS0
	ehTcV+A7Y2sEJWXqUTodWemUitKtVbxuaGJf8upjmQp7vEKG0eDsVJXJx6/2z08IXoDt
	t6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EO8NKztausimkEtVf5S/Pm96Y570d/1G4v8SyCLLoRk=;
	b=Pf4gjeWGYTo26nTMLlGwdP6OuWhUdVFhpLK/4DdpDp4jyVy7GutQ9zxkJnNwyd9zD3
	WRrXxcgkVmKY2swO63r1K/r6giA6AY3to3o+W95ZTPUjW5siyM0n/QF25ZSsFXraf5K5
	QAkMAAeThD3SSd8mBB5D+SeJXrN3P5N8lT7scY6RGkljEcb0tqY9l148gom3EgcToRqJ
	T/Yg6lrVHOgw/ew2lQkRH9gV545TAb4f1LyYrtm+wrTEZ4a+i1wEnZUQau8ujjOmcL6b
	aeHSimt8HLuhVaGJ6gGZN2V668WJzrhvCDKYoD+Jvz1BWjM/53tq0nyC5UPycxyuRVw1
	wbXA==
X-Gm-Message-State: AN3rC/4Bionhc4aM8eH2ujQBPX5E9GNlPs38UWSS8ZLYNmDsW8DQcIxi
	69mnzFzbdH4kUAEG/Bneoi54QqIKqMqy
X-Received: by 10.200.34.242 with SMTP id g47mr10059389qta.109.1492723821702; 
	Thu, 20 Apr 2017 14:30:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 20 Apr 2017 14:30:01 -0700 (PDT)
In-Reply-To: <20170420182028.31964-3-raj.khem@gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
	<20170420182028.31964-3-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Apr 2017 22:30:01 +0100
Message-ID: <CAJTo0Lb+0MeDwtN7OmeXAOOgdXvLRwoi6otefAcBWEjAaO-RRg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] bitbake.conf: Add pr to list of hosttools
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
X-List-Received-Date: Thu, 20 Apr 2017 21:30:21 -0000
Content-Type: multipart/alternative; boundary=001a114037d4240486054d9fd912

--001a114037d4240486054d9fd912
Content-Type: text/plain; charset=UTF-8

On 20 April 2017 at 19:20, Khem Raj <raj.khem@gmail.com> wrote:

> pr is used by gstreamer1.0-libav during configure
>

So how does this work at the moment, or what's the problem with it failing?

Ross

--001a114037d4240486054d9fd912
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 April 2017 at 19:20, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":21d" class=3D"a3s aXjCH =
m15b8c9987a37e9b1">pr is used by gstreamer1.0-libav during configure<br></d=
iv></blockquote></div><br>So how does this work at the moment, or what&#39;=
s the problem with it failing?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a114037d4240486054d9fd912--
