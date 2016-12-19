Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7E1719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:19:31 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id q68so11431899qki.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RZWXfSiBHm/oosrlhim2kBgIjC9eGaDAvI5YfdViZ9k=;
	b=sEwp1mpqVE00AUomIuoVW2I882RaASvwklq730LBv0qpesx4SbsiLjJ3qjDx8oLK60
	SNYtN1t8oqHekFd0dRa5I0bm5YSf/Ls9FDGuxFndlJW3IjUV5SpjF4LGOewGghUANAnJ
	m/K6Rez5qbRTgUEhv0a61gfYErCE4kYdyXpRIBeoun2ctm8gM4AFRrDzQfs83eRHNjQc
	73aYRCFqHWGSXofsaa5CEHVakU8jfMwPC1xQEasc/6trmGYkQfcYV30CpK+W8J6gL9XM
	1zZ5YehcFEpCP2aYk9K7cuY9KGCYJBkciGddkXgR/E5y9tEHeX+9a2C7DhlTpzybuVVz
	ocmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RZWXfSiBHm/oosrlhim2kBgIjC9eGaDAvI5YfdViZ9k=;
	b=s+8Ko4Fs2lnLCcvF7P2Anf+AHIbz6mHJkKYBEpnSiK5A5x4vYSiD1fvlywW/Zu1A7G
	d61Ot6BiPsBLmy8rPDS7oOdQZzlBuIraiPd/qY7t/DtZH5kKN+NhfjQ3tdAJkDeEm5HS
	Tk05zFBFDHv/wao1OmDl6z2FnaCwnKAgV4rTs0tR0I5PL7PifRVghUFSBzdiBNA7ml8c
	wVfATZV1+4RSrwAGPYMzNSCqpcOIiI15a/dpaYy1q+YPzRHLKbkWDxQMw+UixS3q/C6h
	RlVYIVcmduhzJQTJOfwVrf9GyOZPyiplpJfruBpiCxP3rGwec/iT8qhf2Xot2tB4v4Ct
	ImWQ==
X-Gm-Message-State: AIkVDXL7GCfQicC9922n0/bksKt1DyAS0VL8dJ040ydo9RA+cewqzsR2OHB6IYz4er6sHucRJKJrXsVnDjr3MDio
X-Received: by 10.55.8.20 with SMTP id 20mr1447642qki.3.1482146373245; Mon, 19
	Dec 2016 03:19:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 03:19:12 -0800 (PST)
In-Reply-To: <CALbNGRThWRoOfZjN1BaQpT2hAGzuRCfHUnfG89gxQcDE=6cgUw@mail.gmail.com>
References: <CALbNGRThWRoOfZjN1BaQpT2hAGzuRCfHUnfG89gxQcDE=6cgUw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 11:19:12 +0000
Message-ID: <CAJTo0LZbgGV9kd0bw8jGgfg0kLbJn0ANgETon7_gJxG5fWML7g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: 'From OE-Core rev: <commit-id>' in recent master commits
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
X-List-Received-Date: Mon, 19 Dec 2016 11:19:33 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60152402054401186c

--001a114c9d60152402054401186c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 December 2016 at 11:14, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> just updated to latest HEAD and checked commits. Found a lot of commits
> with
>
> (From OE-Core rev: <commit ID>)
>

Can you point to any SHAs in particular that have this?

Ross

--001a114c9d60152402054401186c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 11:14, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":1wb" class=3D"a3s aXjCH m15916cb293d3e022">just updated to latest=
 HEAD and checked commits. Found a lot of commits with<br>
<br>
(From OE-Core rev: &lt;commit ID&gt;)<br></div></blockquote></div><br>Can y=
ou point to any SHAs in particular that have this?</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d60152402054401186c--
