Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7F73373CD5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:34:54 +0000 (UTC)
Received: by qcay5 with SMTP id y5so25819386qca.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 14:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ptKCV0UKNLrfIrEwywO/Yecppq3NhYh0hf7rrvRaq8s=;
	b=VwwgbAFnrel/skOgWkm+gsL7BN8+4kjl32ox/naINgJIefI12o272o+1pXSjjB1pUH
	4WVjJV+c7rhPyEbPa3CGvggePRHMYJa3+WTbpljLjRWZlAbyXT6t2jmjnyy/qE5g6+Xt
	LJMTEJr4ArauCmS5SLJ95H8ODzpcynFifx89wjFTRqJ4QQP/p3vIdtK60rgAaKRfy2Fd
	LlZXVuER1l4mHMe4QHkhTlfDUh/WRSSLFDqQ/xsSriJPME5/I9Yca9mVmhm3uX5nnBxv
	pvN3LjgzsTRJX4QBUwYkeDUcGN3hmgR/01AeVJwXG+RbVYsolsjEElRHgxFsz9RrXI5r
	CD4w==
X-Gm-Message-State: ALoCoQnmzos9Iob14bCRRzW9fl/XoXzTjgQUCtowzbmXYBYNgzzbPRflfY7QTZqvGIwiIXRaZ+/Q
X-Received: by 10.140.195.7 with SMTP id q7mr39753952qha.35.1427837696148;
	Tue, 31 Mar 2015 14:34:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 14:34:35 -0700 (PDT)
In-Reply-To: <874mp0ettl.fsf@weregild.amer.corp.natinst.com>
References: <1418864567-9676-1-git-send-email-rich.tollerton@ni.com>
	<CAJTo0LYWAET6K0zr8ALGByjryEe8zV_kmTkkdVjXV-aTwxajFA@mail.gmail.com>
	<87ego6e4ou.fsf@weregild.amer.corp.natinst.com>
	<CAJTo0LZ6hgVt0gsgNfd_rvtn_gn2syUPugx+f00eVPN2x0-uzw@mail.gmail.com>
	<874mp0ettl.fsf@weregild.amer.corp.natinst.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 22:34:35 +0100
Message-ID: <CAJTo0LYKmKp6MhjitdVeLHzo-HV+cxYYkaMqeqaVOS+Fpzt-wQ@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal: Disable shopt errexit
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
X-List-Received-Date: Tue, 31 Mar 2015 21:34:55 -0000
Content-Type: multipart/alternative; boundary=001a11433288ad1c6b05129c5e27

--001a11433288ad1c6b05129c5e27
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 22:32, Richard Tollerton <rich.tollerton@ni.com> wrote:

> What broke is devshell. If there's a bug in run.do_terminal that would
> cause a nonzero exit code during non-interactive execution -- e.g.,
>
> http://cgit.openembedded.org/bitbake/commit/?id=18cd0ce6a55c9065c3f1bf223b47d817b5efcd8f
> -- then instead of a warning appearing in the devshell, the entire
> terminal quits a few milliseconds after it loads.
>

Right, understand.  Thanks.

Ross

--001a11433288ad1c6b05129c5e27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2015 at 22:32, Richard Tollerton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":197" cla=
ss=3D"a3s" style=3D"overflow:hidden">What broke is devshell. If there&#39;s=
 a bug in run.do_terminal that would<br>
cause a nonzero exit code during non-interactive execution -- e.g.,<br>
<a href=3D"http://cgit.openembedded.org/bitbake/commit/?id=3D18cd0ce6a55c90=
65c3f1bf223b47d817b5efcd8f" target=3D"_blank">http://cgit.openembedded.org/=
bitbake/commit/?id=3D18cd0ce6a55c9065c3f1bf223b47d817b5efcd8f</a><br>
-- then instead of a warning appearing in the devshell, the entire<br>
terminal quits a few milliseconds after it loads.</div></blockquote></div><=
br>Right, understand.=C2=A0 Thanks.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a11433288ad1c6b05129c5e27--
