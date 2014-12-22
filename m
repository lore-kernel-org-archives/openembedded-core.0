Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 74EAB72801
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 14:24:57 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id bm13so3310570qab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 06:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SeK/PN6j3PXFj27mWEm8mzkx2AsMKbWpNMRIZWsYrOs=;
	b=hZUBLOi9ElgvY30WdivtNFySufQtGjATeEzjm9Y4iBUbsb9XgO5T689FI5haWVCy78
	7s4wzUpP4tM9xzSmmvWedBat3PUS4WVArwqmIPKgBqhn5bcQZrZL9aRe+92sWDqyIkoX
	jOiD+mLjARwgrS7ApbYfm2IOo7jdSWOYmhaHyT9gH7UGHeG+YrepFen6b4K+VyW/VeIe
	MKRoLMDfZ4YSkYZpnlGfex0aWYC+mY4jgmlp1Bv0HSlH60IbbOHSi9sIslPWbDTLLbZ9
	tDC3KXMlXAKdT0bsJYxULXvDVownlOFQSO33N8j18E8SLGM2NZCtBYpRRSb0vEJ6CXgD
	kdLA==
X-Gm-Message-State: ALoCoQk980XPqj+yDH5AHsfXHdXft+y03MzJohzNSOs8VyBAzaGGrRZKM67Ojtw/hVJY3zgfA3C5
X-Received: by 10.140.40.209 with SMTP id x75mr34568757qgx.80.1419258297836;
	Mon, 22 Dec 2014 06:24:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 22 Dec 2014 06:24:37 -0800 (PST)
In-Reply-To: <20141222141019.GD2465@jama>
References: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
	<20141222141019.GD2465@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Dec 2014 14:24:37 +0000
Message-ID: <CAJTo0LZ0MgsJn2PyVyLQGNQ6A9vyYBGnJmb8nMOcED+PabbZOQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-* use gitsm style SRC_URI for git recipes
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
X-List-Received-Date: Mon, 22 Dec 2014 14:25:01 -0000
Content-Type: multipart/alternative; boundary=001a11c12836affda0050aced2a2

--001a11c12836affda0050aced2a2
Content-Type: text/plain; charset=UTF-8

On 22 December 2014 at 14:10, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> If this is work-around for "common" submodule being fetched from
> do_configure, then it would be much safer (and more efficient) to
> add common as 2nd git repo in SRC_URI and use normal git fetcher.
>

Yes it is, and agreed.

Ross

--001a11c12836affda0050aced2a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 December 2014 at 14:10, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":59c" class=3D=
"a3s" style=3D"overflow:hidden">If this is work-around for &quot;common&quo=
t; submodule being fetched from<br>
do_configure, then it would be much safer (and more efficient) to<br>
add common as 2nd git repo in SRC_URI and use normal git fetcher.<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Yes it is, and agr=
eed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a11c12836affda0050aced2a2--
