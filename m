Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3B98D60232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 19:33:57 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so124444335qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 11:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QJmOf/E0WFfMCFO9ybOG9A5HSlWnAJSeBImLx7hKLJw=;
	b=ydn+U3q3rj8Cw6NB8XgC+2YUgZJYY3XWnwbpQcPq3OTCXQNI0lUx/eOOGLfzLqaLG8
	YxjMLTT+mCFP48ZTDjNx7hUbMiyIotBBecWfWvmlt+NGBJ13jg+QxaMooMU/jJ+NLKDK
	ndB+KAslAGg2A4HCKCqbBtYxYoXGNDpgYuFIDUSjzFl8ARkdyUGgw7vh5PYQnO4kSHb1
	LMExlW2QfNGaPJBmsIYLxTDgSQn1ViOvJEvJEpxiakp6iczTXhcvSj2Ydxp6g8VttT1w
	xSB2pUSZo+5lA1AGvy2LmbZm+TEwx4A7gjUhahv1/+WuxDSedyrTQJNHoPMIWionlZLu
	GVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QJmOf/E0WFfMCFO9ybOG9A5HSlWnAJSeBImLx7hKLJw=;
	b=a3bRbz4OC1at710BfkKXPbYiV/ZzbVnuNEjRLT+zu3Bd+SCbgZpSRpodFMeU+FUXNO
	ScoYqk8lvQ5xG+YYjoXga3ioenTaDJhqbnv8sQ8Y3+22o2izRPrj6i0W87Sq0EuAFojx
	nHA9ExmY2ZeaBgX1h1SJEZ8XzckDZQiVuJVNO03V/AbUXKE3KYsiYF88dJ0F8Y972i4o
	ALPy9vspWrS7EVAgczxozm4pc9QiLdUgop7P5B24XlD9Tkps2qKLV/GqfMybDcwn4Cp8
	KZBavIPY9mkewTisjklUh6A9B1FqHXt4lim6O4hssXii5cMCpvqWI8kb6kiv+vSqgRqM
	e1VQ==
X-Gm-Message-State: ALoCoQnwbhudQKZ7+kFzvzNWtS7U/c8h4p1wk3zIJ6SiAKlrKiWuxAmNsR5MBbJKQHb6GQDFwPlV
X-Received: by 10.141.28.76 with SMTP id f73mr33508465qhe.17.1446492837286;
	Mon, 02 Nov 2015 11:33:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 2 Nov 2015 11:33:37 -0800 (PST)
In-Reply-To: <CAJ86T=V7GwD_T-O0RYnVXSzmwB=jB7wxrXCecMS9XcC7bvPtpg@mail.gmail.com>
References: <cover.1444976827.git.kai.kang@windriver.com>
	<5631E434.7010006@windriver.com>
	<CAJTo0Lb3YOuRWMNMnTOq=4gUuzX4Kr4egur7mxVE7widHBty2g@mail.gmail.com>
	<CAJ86T=V7GwD_T-O0RYnVXSzmwB=jB7wxrXCecMS9XcC7bvPtpg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Nov 2015 19:33:37 +0000
Message-ID: <CAJTo0LZgEe2D9Xnucoc1OU42Zehaciwrmdfpo4qbq4J5=oWVcw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Upgrade sqlite to 3.9.0
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
X-List-Received-Date: Mon, 02 Nov 2015 19:34:02 -0000
Content-Type: multipart/alternative; boundary=001a11423d0cbce0d6052393dbcc

--001a11423d0cbce0d6052393dbcc
Content-Type: text/plain; charset=UTF-8

On 2 November 2015 at 18:52, Andre McCurdy <armccurdy@gmail.com> wrote:

> Is there a ross/mut branch of oe-core somewhere? Or only poky?
>

Sorry, it's branched from poky for testing purposes and convenience on the
autobuilder.

Ross

--001a11423d0cbce0d6052393dbcc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2015 at 18:52, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2cs" class=3D"a=
3s" style=3D"overflow:hidden">Is there a ross/mut branch of oe-core somewhe=
re? Or only poky?<br></div></blockquote></div><br>Sorry, it&#39;s branched =
from poky for testing purposes and convenience on the autobuilder.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11423d0cbce0d6052393dbcc--
