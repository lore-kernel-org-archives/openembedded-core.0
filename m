Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id ADD97760AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:41:27 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id k15so133642008qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ujCdcW2rkq/q9KISkw9N5J20laOG6oN0nhpP5MObbEY=;
	b=yRqdWvz40w69opYmibETxtJ1wEZnmUQ3r9b2yXfW+gw6xieilOxsz0FnHKrwNqV38+
	wWLOV3kNaZ0VXJtHDoo9lsZE71h969gthfJzUcKddMufjoj0o8gHHjNEYEif0E+RHKkq
	8a84d8HzfkckIWewt4I4mGKD/sWZF/6UBxiw+r9OWns4CIEgXMsZKlcvscaPZQv9RUmw
	aKtLrPWh4L3qt2lLyENsymEAPE1HhZVCNoCoam+vyt+5Wv6opeoxr1scbeCuZp0p9F2W
	/JUJFLJHg3FHxNqEWB6cuj7lt8EIS0S640v+BiQ9eH75rjY4BoRXtNdB4gZRbrwfiyvx
	Lq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ujCdcW2rkq/q9KISkw9N5J20laOG6oN0nhpP5MObbEY=;
	b=BPsEkyyR/2CXqhFH4ZCoMAtOz4izVNZ4xVptGsGLECgPP0zyXXKqgwLPSJowvDqna8
	kzEujpabrLe1k5zfGzAIPOh1SHvKMiPK8PFebv+2tj/4DRH1OjeIhRXF3QF9wpB6xnDT
	fgkbPC8CIEJye6ihFIdeEzNYnYgdCsgUpwJ5KdKq1omAIbtNdXYuQFf+3mbjyDe7sCcE
	nQ991ryAIse0h7TWZBQNOhennPyoRK8nBxPeHnsc2D2b/QYDW+cmY/stcwwdEjOxQpAV
	iX/wv6CF8ZrCTDq5fqIUm1dNOpDIX6r9gENAwe8g8nZKIGajy+d6rTXB3Xm3b6Ab7kzf
	id1g==
X-Gm-Message-State: AIkVDXJsynGFbDxC/pOCP9sRabant+RcUnT3wzikvG7NEi3eIMUx96th18B38ITwGDuIQ/NNFLxNhdDu42gko6Kt
X-Received: by 10.237.62.232 with SMTP id o37mr23828490qtf.188.1485189687775; 
	Mon, 23 Jan 2017 08:41:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 23 Jan 2017 08:41:07 -0800 (PST)
In-Reply-To: <db53afb0-1592-a5fe-6f0e-6b15c9a10664@linux.intel.com>
References: <1485188445-19983-1-git-send-email-ross.burton@intel.com>
	<db53afb0-1592-a5fe-6f0e-6b15c9a10664@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jan 2017 16:41:07 +0000
Message-ID: <CAJTo0LbbgFhQmMaLp4Lm3YqFyCSqyiVZUAeqOR7nfg=QB1=p+Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ed: use yoctoproject mirror for SRC_URI
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
X-List-Received-Date: Mon, 23 Jan 2017 16:41:28 -0000
Content-Type: multipart/alternative; boundary=001a11406f0ec3abfa0546c5ab2e

--001a11406f0ec3abfa0546c5ab2e
Content-Type: text/plain; charset=UTF-8

On 23 January 2017 at 16:38, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Add UPSTREAM_CHECK_URI please (or file a bug), as I'll surely forget about
> the update if the RRS is going to report 'Up-to-date' for this.
>

Yes, was literally just filing a bug for this now.

(#10955)

Ross

--001a11406f0ec3abfa0546c5ab2e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2017 at 16:38, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":1ag" class=3D"a3s aXjCH m159cc320ac002f31">Add UPSTREAM_CH=
ECK_URI please (or file a bug), as I&#39;ll surely forget about the update =
if the RRS is going to report &#39;Up-to-date&#39; for this.<br></div></blo=
ckquote></div><br>Yes, was literally just filing a bug for this now.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(#10955)</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11406f0ec3abfa0546c5ab2e--
