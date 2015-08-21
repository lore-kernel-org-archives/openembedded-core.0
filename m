Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8A860557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 13:02:32 +0000 (UTC)
Received: by qkep139 with SMTP id p139so31256734qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cp4Md+8Ho2mKM8vqoOk6+k9ZQpHclQIXBuvstAq2foc=;
	b=OtNkGe/sBS1FEQAo1i3vpd61DQek/65QbpE5vp3wCiLnoEtCbEqHZZnWHfXtTqYmDQ
	QWzW5es1Vy+N7VnXZ3sAGCgP71UkphfJscLBkNzGAoL7i5JbGAYCYpMKBRYe6i6QIrl+
	0Hf5dpmC9uWB0yvWrQeyIuNAlaNbzjEAZVqsqCt6S8M7cZLsR2dK8ZcEQxMvHoDpVZSC
	qZxtycDbI5xCIOxYroZHxMCkE+cstEYKKGdNy3+NUY/giM2n27cc4PC/4TuCnrtM6Lrm
	mDfw67RZBS281H46xT5XOVD65eChyyB8Cpnzn5PHsGouNLG2LBKy5heNCsD+/i0seJY6
	UF2A==
X-Gm-Message-State: ALoCoQmPWj9WarMkyi8CZqlfprcTLvx2WGMsiu/qYI/E3kFX8ShPokuJuZCGIFPQ4Veb+fUvWL2r
X-Received: by 10.55.53.193 with SMTP id c184mr16922666qka.62.1440162152926;
	Fri, 21 Aug 2015 06:02:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 21 Aug 2015 06:02:13 -0700 (PDT)
In-Reply-To: <CAHiDW_E2xi68qwAikPy18aQw-r-Ue5qU8v8pApUFiPX37gLMTA@mail.gmail.com>
References: <cover.1440070230.git.jussi.kukkonen@intel.com>
	<53a7964df547908768b1554486603bb4f0d9830e.1440070230.git.jussi.kukkonen@intel.com>
	<CAJTo0LZgiz9jVRwkyZpAVxv50EwEo=BDBUb0U7M4fBxZexkU-g@mail.gmail.com>
	<CAHiDW_E2xi68qwAikPy18aQw-r-Ue5qU8v8pApUFiPX37gLMTA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 14:02:13 +0100
Message-ID: <CAJTo0LZFKgf-GzRBd4YdEH-Ho5XH9RUMx+3-hxSz3us1YYCDjQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Fri, 21 Aug 2015 13:02:34 -0000
Content-Type: multipart/alternative; boundary=001a11476f148b5dd9051dd1e1d4

--001a11476f148b5dd9051dd1e1d4
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 08:08, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> It does some fairly simple header autogeneration during build (see
> src/libical/Makefile.am and scripts/). As far as I can tell it does
> not require modules other than core -- but I don't know much about
> perl (especially in OE build) so let me know if there's gotchas I
> should look out for.
>

In that case we can just the host perl, and don't need perlnative.

Ross

--001a11476f148b5dd9051dd1e1d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 August 2015 at 08:08, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3u3" =
class=3D"a3s" style=3D"overflow:hidden">It does some fairly simple header a=
utogeneration during build (see<br>
src/libical/Makefile.am and scripts/). As far as I can tell it does<br>
not require modules other than core -- but I don&#39;t know much about<br>
perl (especially in OE build) so let me know if there&#39;s gotchas I<br>
should look out for.</div></blockquote></div><br>In that case we can just t=
he host perl, and don&#39;t need perlnative.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11476f148b5dd9051dd1e1d4--
