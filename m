Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id AB2216011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 16:26:03 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so54230915igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 08:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+cV+DH52vOxxnAopY93BgNQIp5NGjyNS4jt7hvcr/tc=;
	b=VNAzT0wG3gMgfVZDiHovs9vAa4yLzp35Im62Kffns2uWkQ1hccv3vszBPdeO3tSXcT
	CdE2Jt0U0naJhsQUuKhJfuPPzyNhqZ9gN9yrMQyuK1D8bcP8uBgVKkIho/vWJCaQmtdQ
	TGc88pWQOTFhwF+nUEFd6M9OJ2F/7VDgZfYdYSmXe7ty56++R7ppL53caS12ydlqbOUM
	R9hsn/i+GL56yjrW77hKDkRUU8oRpwt38CTKktMk/BLO97G6FSmOBTqLJ7g7FFM8BvMC
	diIRGp9PRt9cxgK+lSJuIbQQJY5kUPmZMKLe8LqG0aN+VcidP8qjp/WW1vzSnCRDTGIu
	0AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+cV+DH52vOxxnAopY93BgNQIp5NGjyNS4jt7hvcr/tc=;
	b=AHSEkYJwjDfba0O1E3vvkexLbta9MlyHo6opjr1cUU3kW8ZZRW5hhEnjcej6q+E7Oc
	rZrNjwTgaLZxBTxMWD9Go/RAb/ilt83iY/XjXcfCACknAvzzI9MwmHzWNjmCWn5lWLYp
	0Qm67vIjvjYI/suL6Yise4g2p30pSQkBCSExQXe9fz7eUCMox4e+l5x8OeqjiQfGvxWx
	cSHcFOkfHJ67m3XsTP+k5OFn0ClbqT0WGzfsNzMJ7jlyxY33HLFWPtFqTx42lBwAx5eH
	toGTz/bKFY6+sxWsKAWhjO0aMAIZ9pY3svZtKRYoFj2JscezVPVdpOKOZbSfxfaJ3Yqs
	stNg==
X-Gm-Message-State: ALoCoQmhi5cpcK4l4hXZ0S/QbQ5svfEArsrHVr4T2A/JhRH6a/YrGkloQx31QPj/LsSOp8QnkKBc
X-Received: by 10.50.64.147 with SMTP id o19mr16920938igs.52.1448382364572;
	Tue, 24 Nov 2015 08:26:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 24 Nov 2015 08:25:45 -0800 (PST)
In-Reply-To: <1448246287-28001-1-git-send-email-biannm@cn.fujitsu.com>
References: <1448246287-28001-1-git-send-email-biannm@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Nov 2015 16:25:45 +0000
Message-ID: <CAJTo0LbSHzTATHF0V_wdb7F6nnaiG4ohp0Z-AhGzcMVhbC9Q7w@mail.gmail.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] LOCKED_KEEP is undefined, so the following error will be caught.
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
X-List-Received-Date: Tue, 24 Nov 2015 16:26:05 -0000
Content-Type: multipart/alternative; boundary=047d7bea2f9856f9a505254bcce3

--047d7bea2f9856f9a505254bcce3
Content-Type: text/plain; charset=UTF-8

On 23 November 2015 at 02:38, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

>  /usr/lib/python2.7/site-packages/smart/transaction.py", line 1230, in run
>      locked[pkg] = (LOCKED_KEEP, None)
>
>  NameError: global name 'LOCKED_KEEP' is not defined
>
> Upstream-Status: Submitted [Smart@lists.labix.org]
>

The Upstream-Status tag should be in smart-define-LOCKED-KEEP.patch
alongside the Signed-off-by, not the commit message.  The intention is that
the patch contains who wrote it and whether it's a backport, not suitable
for upstream, and so on.

Also the commit message should be in the traditional git shortlog/longlog
form where the first line contains the recipe name and a brief summary,
something like "python-smartpm: fix runtime errors by defining LOCKED_KEEP".

Ross

--047d7bea2f9856f9a505254bcce3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 November 2015 at 02:38, Bian Naimeng <span dir=3D"ltr">&lt;<a href=3D=
"mailto:biannm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ew" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0/usr/lib/python2.7/site-packages/s=
mart/transaction.py&quot;, line 1230, in run<br>
=C2=A0 =C2=A0 =C2=A0locked[pkg] =3D (LOCKED_KEEP, None)<br>
<br>
=C2=A0NameError: global name &#39;LOCKED_KEEP&#39; is not defined<br>
<br>
Upstream-Status: Submitted [<a href=3D"mailto:Smart@lists.labix.org">Smart@=
lists.labix.org</a>]<br></div></blockquote></div><br>The Upstream-Status ta=
g should be in smart-define-LOCKED-KEEP.patch alongside the Signed-off-by, =
not the commit message.=C2=A0 The intention is that the patch contains who =
wrote it and whether it&#39;s a backport, not suitable for upstream, and so=
 on.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">A=
lso the commit message should be in the traditional git shortlog/longlog fo=
rm where the first line contains the recipe name and a brief summary, somet=
hing like &quot;python-smartpm: fix runtime errors by defining LOCKED_KEEP&=
quot;.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--047d7bea2f9856f9a505254bcce3--
