Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8929671CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 10:18:44 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id p22so26239680qka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 02:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0++LqsaTYTcq+ChCuf7KtDW86Hh+cGBbBdLHYggMdWk=;
	b=EDlWvy0sxFQyz79ihzm85UGJInXHuT1U2kduXiUDZDg6ANa+OHa9jWOQMA85mB0GKl
	GCmBbdaG4o5Xdx41C4a2fhFvnT0ASl1my8arOPrA7gUU/7w4cLcodEO30+PAzV6CnZv4
	8Rq/xLTZJ0OfOjMqV55oOIbqDGwAzLMdoxn2Lw4OOjwM0tS4xYPzSO5l5EcE8AQQ7fc6
	EyIb9nsSt2vZ9r/nC+kNJW3V8ZKRhQ4YL/9dMwjsxxYfCam0ZjoJgGHMWoUs3w9CBxkw
	Tygcum9yp5hg64x5tO3V4fuEBB2g3bh4Wus1s4kiCQYSvqnjO7+5sDuQjK1WSpMLpQkU
	DoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0++LqsaTYTcq+ChCuf7KtDW86Hh+cGBbBdLHYggMdWk=;
	b=dTZOVdS6RSQyLo1ZlFKc/Ug/wnZw4Pxzr9XH0+prg8tMdEFb3YbPW8m+HMlFCzvkwA
	zOVB/uEZZ6QgZ8A31MYjty3awmQ0u5uyM4aqeZ5KZX/cgCP4Z4WXydA96x0QLwtehjg4
	orASGZwjJ5PN+O55dqYdIYcn5szRpY/QZquMpSEBWgpQnZVb7YWqXAYOOikByRQVcovA
	XSHHSS/cBMGejSSIBZixPkv/6uEFzmZbi6QE7CPPa1tt2IIJxBYg+d1s5+AKYC26Plbh
	T0Ts7gypBC2fCCQrrN6aVSWVodISErL0HWEBESVGZKtHvsVh2vVz4dj4lwRM0MjfuDuq
	jQQQ==
X-Gm-Message-State: AMke39lvpic4/zWsivG0VOIp7hCvIluoAvMv1eZkDScOwu3EBphpVztGTcOea7HG+UqgQnfoAuPS5PLgfTjd1XWq
X-Received: by 10.55.1.134 with SMTP id u6mr30425718qkg.36.1487067524499; Tue,
	14 Feb 2017 02:18:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 14 Feb 2017 02:18:24 -0800 (PST)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48AC3217DA@SESTOEX04.enea.se>
References: <1486468127-16643-1-git-send-email-alexandru.moise@windriver.com>
	<3230301C09DEF9499B442BBE162C5E48AC3217DA@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Feb 2017 10:18:24 +0000
Message-ID: <CAJTo0Land8JVfpTpoV1DE+3QkEeosWQAvgiwAFW7Zvf5uJQqTw@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5][morty] openssl: CVE: CVE-2017-3731
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
X-List-Received-Date: Tue, 14 Feb 2017 10:18:45 -0000
Content-Type: multipart/alternative; boundary=001a114046c48e218605487ae343

--001a114046c48e218605487ae343
Content-Type: text/plain; charset=UTF-8

On 14 February 2017 at 09:40, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> I am just curious if this is ok, or should we always put the CVE: tag
> inside the patch?
>

The tag should always be in the patch file.

Ross

--001a114046c48e218605487ae343
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 February 2017 at 09:40, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2pf" class=
=3D"a3s aXjCH m15a3bff6f0f79227">I am just curious if this is ok, or should=
 we always put the CVE: tag inside the patch?<br></div></blockquote></div><=
br>The tag should always be in the patch file.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114046c48e218605487ae343--
