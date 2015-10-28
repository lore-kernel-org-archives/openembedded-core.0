Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD2076E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 14:54:37 +0000 (UTC)
Received: by qkcl124 with SMTP id l124so877196qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ysj+m7OKWim5VaZuMMLwnAEmtSR2w1o71RTHxfuORik=;
	b=rLEwNTDN53Rnh5OQrLwr7S60gsHYwctgIQKx9/YmdbAkI2/poZpuVv9JEd/Clh9r1w
	ooRbm7UJ4a6In5e3mj/Rof0sEjTmlwS7wGT5cSfLmuZSg9cJB/c6jYoou6gYn+n274Yb
	P7reZQB9L2+1L6adFPjv6Yv7O1rRw9SfYs00CnR/3U/CQB6W3R61+LwzFQnw8XRdb/vo
	yYzuxWeWnfTMMtj35E1Cpig5ypXDHQTx+xk3ZppSSqe8TmMHkcg0WU91uUCTcuK5ZBQJ
	5/RW9OXmGloTh56S3WCNWmPTOhXEJFy85rLhBP5ZMKwB1p3CUJOkYydrx7+kFjzn50Hv
	wroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ysj+m7OKWim5VaZuMMLwnAEmtSR2w1o71RTHxfuORik=;
	b=eiLMlIeCI/LjFjUlmtuUXbIOW3i7XB7blIKtbTUFokipBLyXg8Mb2ofArBXIEH7GxX
	LIDtzM00heZiGh7Yx/P2E4fq++DEHinozZrQzH3Nr3Aq1nhEVXWXLbY6uLOa+ky1oG3B
	6A0qOsssqDkuF5WHtGRpHBiecaS4rPeiZKrUhqu2ET8K7iO48J2yBDoewlXipsOe6BeG
	vlGizM/ckjvVh+RmC66tBoauXU4I9y0X7ghIkKnTbx05Qs067Myng6/AJAQKLw6IDN31
	JFJQspp1MP6ZzI4tfgcG4SD38uPPYCo1Xi83+48R24OLDcpYSeznKShOFr1HRi82xupD
	JQ+g==
X-Gm-Message-State: ALoCoQnS1DO0TdgHjpmcD05UUEVyMjJCJ6rrmGFB4teg805gMINvTwCeZq8FYHl54cyzqVEhH1AY
X-Received: by 10.55.72.70 with SMTP id v67mr20562534qka.83.1446044077675;
	Wed, 28 Oct 2015 07:54:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 28 Oct 2015 07:54:18 -0700 (PDT)
In-Reply-To: <1446043703-2497-1-git-send-email-george.l.musat@intel.com>
References: <1446043703-2497-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Oct 2015 14:54:18 +0000
Message-ID: <CAJTo0LYxEoO90mzG1VaNxbENwWq+aAfm0g6=gYpEHw0odp=gig@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Removed obsolete testcase dmesg.
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
X-List-Received-Date: Wed, 28 Oct 2015 14:54:38 -0000
Content-Type: multipart/alternative; boundary=001a114a97f694722905232b5f3b

--001a114a97f694722905232b5f3b
Content-Type: text/plain; charset=UTF-8

On 28 October 2015 at 14:48, Lucian Musat <george.l.musat@intel.com> wrote:

> The dmesg parser test was made obsolete by the parselogs testcase,
> that searches in all the logs, including dmesg.
> ---
>  meta/lib/oeqa/runtime/dmesg.py | 12 ------------
>  1 file changed, 12 deletions(-)
>

The dmesg test is still referenced in a few places.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/qa&id=df9087c48c1eb9553c2e8ed0e821bfaf69ca0a29
is a bit more complete and funnily enough I was going to resubmit it today.

Ross

--001a114a97f694722905232b5f3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 October 2015 at 14:48, Lucian Musat <span dir=3D"ltr=
">&lt;<a href=3D"mailto:george.l.musat@intel.com" target=3D"_blank">george.=
l.musat@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex">The dmesg parser test was made obsol=
ete by the parselogs testcase,<br>
that searches in all the logs, including dmesg.<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/dmesg.py | 12 ------------<br>
=C2=A01 file changed, 12 deletions(-)<br></blockquote><div><br></div><div>T=
he dmesg test is still referenced in a few places. =C2=A0<a href=3D"http://=
git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/qa&amp;id=
=3Ddf9087c48c1eb9553c2e8ed0e821bfaf69ca0a29" target=3D"_blank">http://git.y=
octoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/qa&amp;id=3Ddf9=
087c48c1eb9553c2e8ed0e821bfaf69ca0a29</a> is a bit more complete and funnil=
y enough I was going to resubmit it today.</div><div><br></div><div>Ross</d=
iv></div></div></div>

--001a114a97f694722905232b5f3b--
