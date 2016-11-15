Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 836877199F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 14:23:27 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id w33so72201159qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 06:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WRQk0TVN3S/a1K08s1josqWbiDZg8aqnMVNrC+tswVs=;
	b=Q+3idrm+k89XXGxDWFIrpmlqi4wqjapd58QWKBpNCZik2V4KpbIQLiUSXucotxOX/0
	5nHvvRAeuheCKY6hHFWojoEWrAUXIqC5anawuxY9rzQ9z36/b+5d5LqYs7Sz+ZZAxC9F
	R6ioCNjskcwYURSSNpzbunCDTO8gKOWu4+PkIeAv1tL5I8R1Coe30frB4S1ZMGEBnsCy
	g2fxnh2QqhXN6tN3TUxso3QssNoDLTxDAOiHZXIsBlvmNXKJ3nZiomb+yETHzYJG/weN
	B1LqWmI1Qtx8fy0rx//F1coKozEsWOs9FrdOg9QxUVe5jIQHi0uyh3U9wy9dZvjewlf/
	htKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WRQk0TVN3S/a1K08s1josqWbiDZg8aqnMVNrC+tswVs=;
	b=cr+fRsqJbVQ5B7CkaNbYnasU1/dgojtGfjIU9M0B8/eh71AwtwbV6aKlTtLcJXnQjj
	ON3kLaVnyy5B97tHKuJhX1bJ4cX8Rylfaq2++SIlGYmjfi1FqP/vxs4bMDtdwdNZMu6D
	1cmEv7oM+7fRM/UfemR6Ln1n0xpOFEZebn0kT0UuN3Q2hZwAtS/CPgSf48qghonwRpzS
	7g76YObNMPksoSlfiMrbzI9mfmRINDpmtTnN5g/a66jmPv/Bfi/aLj9qYi/gXKq+yVJ8
	CEaMmcDZdzGIbmP47hQu9ENWEw9WH8pTkhMMk6ESC+qPWhEGgTIZQCYo2eR32TM4yFGL
	yZOw==
X-Gm-Message-State: ABUngvezKLVV21tMnIfMAiB1KG2OxN9cV8oPZ5CNHbfOjk9GF4k0nnxEMCnUH4do0MvhccShBKtJ6Z7CqOTkU8Ok
X-Received: by 10.237.34.46 with SMTP id n43mr15103211qtc.105.1479219808743;
	Tue, 15 Nov 2016 06:23:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 06:23:08 -0800 (PST)
In-Reply-To: <20161115134607.13337-1-thilo.cestonaro@ts.fujitsu.com>
References: <20161115134607.13337-1-thilo.cestonaro@ts.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 14:23:08 +0000
Message-ID: <CAJTo0LY0_hUiFhYJKA3B+qouLoBhXd4W_ab=3T-gYDMPFUj7tw@mail.gmail.com>
To: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] added recipe for libdbus-c++
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
X-List-Received-Date: Tue, 15 Nov 2016 14:23:28 -0000
Content-Type: multipart/alternative; boundary=001a11377e183ec818054157b3f0

--001a11377e183ec818054157b3f0
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 13:46, Thilo Cestonaro <
thilo.cestonaro@ts.fujitsu.com> wrote:

> Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
>

As Alex said, please submit this to meta-oe as there's no strong rationale
to keep it in oe-core, especially considering it's abandoned.

The remove_CXX_FOR_BUILD-stuff patch can be trimmed to just modify
configure.ac and tools/Makefile.am, the other files will be regenerated at
do_configure and patching them can cause conflicts if upstream ever makes a
new release.

Also please explain clearly why that has to be removed in the patch header
because usually we need to patch *in* the _FOR_BUILD macros: I was curious
and ended up looking at the build to understand why. AFAICT it's because
upstream if cross-compiling it refuses to build target tools and will only
build host tools so the test suite can run, but disabling the tests and
patching out CXX_FOR_BUILD we can build target tools.  The downside is that
we have no test suite, which is useful (see the ptest class).

Thank you for being the first person in a long time to actually submit the
recipe to the community!

Ross

--001a11377e183ec818054157b3f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 13:46, Thilo Cestonaro <span dir=3D"ltr">&lt;<a href=
=3D"mailto:thilo.cestonaro@ts.fujitsu.com" target=3D"_blank">thilo.cestonar=
o@ts.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":1oe" class=3D"a3s aXjCH m158684b8ce332c41">Signed-off-by: Thilo C=
estonaro &lt;<a href=3D"mailto:thilo.cestonaro@ts.fujitsu.com">thilo.ceston=
aro@ts.fujitsu.<wbr>com</a>&gt;<br></div></blockquote></div><br>As Alex sai=
d, please submit this to meta-oe as there&#39;s no strong rationale to keep=
 it in oe-core, especially considering it&#39;s abandoned.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The remove_CXX_FOR_BU=
ILD-stuff patch can be trimmed to just modify <a href=3D"http://configure.a=
c">configure.ac</a> and tools/Makefile.am, the other files will be regenera=
ted at do_configure and patching them can cause conflicts if upstream ever =
makes a new release.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Also please explain clearly why that has to be removed in =
the patch header because usually we need to patch *in* the _FOR_BUILD macro=
s: I was curious and ended up looking at the build to understand why. AFAIC=
T it&#39;s because upstream if cross-compiling it refuses to build target t=
ools and will only build host tools so the test suite can run, but disablin=
g the tests and patching out CXX_FOR_BUILD we can build target tools.=C2=A0=
 The downside is that we have no test suite, which is useful (see the ptest=
 class).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Thank you for being the first person in a long time to actually submit t=
he recipe to the community!</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11377e183ec818054157b3f0--
