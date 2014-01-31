Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 84EAF6E9C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 21:05:01 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id w7so3779364lbi.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 13:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Q/UvNYjFF5EC3LzM2eJGr/CeYJDODUQ4S18Sw7u5bx4=;
	b=IIltgLTwHr+XxBYiCwST92eMuGAmk6PTd3kHvwcagXtsJMO5egGXFnLFRh0kCxI/Ra
	871hMthh6h4i1RCGPbFIJNkAuKNjlq3DF+sRA2GfmO6GZFJIIocxVovjLOJfDtja8IDr
	A6X13u0uD6mTSi0gW6oWMOFLI30be4qgKbDicdrmGn1uMLc25vfX76qFHZwbCXT/JG3Y
	ixL/nYkNP5hQH5ntGMDO7LvAsNE/a1Amvwu7/vF5rYUivXIFmJ1FGSnUttLPCZ80re4u
	BnJv7SZHCrrCv3v4tKiKkNzwVSKamfG7KuVNBlk9J7QLMcS68MsVujUp5zYuXwYcyoHS
	nR4A==
MIME-Version: 1.0
X-Received: by 10.152.37.9 with SMTP id u9mr23017laj.80.1391202301513; Fri, 31
	Jan 2014 13:05:01 -0800 (PST)
Sender: kergoth@gmail.com
Received: by 10.112.55.135 with HTTP; Fri, 31 Jan 2014 13:05:01 -0800 (PST)
In-Reply-To: <CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
Date: Fri, 31 Jan 2014 14:05:01 -0700
X-Google-Sender-Auth: jtzx1VPzzh-BochitZkPZKhOypM
Message-ID: <CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Fri, 31 Jan 2014 21:05:02 -0000
Content-Type: multipart/alternative; boundary=089e01538410fe14f604f14a861e

--089e01538410fe14f604f14a861e
Content-Type: text/plain; charset=UTF-8

On Friday, January 31, 2014, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> On Fri, Jan 31, 2014 at 8:01 PM, Iorga, Cristian
> <cristian.iorga@intel.com <javascript:;>> wrote:
> > On my Ubuntu 13.10 dev machine, wireless-tools and iw are both installed
> by
> > default (I might be wrong here, maybe I installed them some time ago by
> > hand).
>
> you are right, they are both on the default install, see
>
> http://releases.ubuntu.com/13.10/ubuntu-13.10-desktop-amd64.manifest


For what its worth, I personally would love to see wireless-tools go away
in favor of iw, much as ifconfig has gone to the wayside in favor of
iputils.

-Chris


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01538410fe14f604f14a861e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, January 31, 2014, Nicolas Dechesne &lt;<a href=3D"mailto=
:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&gt; wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
On Fri, Jan 31, 2014 at 8:01 PM, Iorga, Cristian<br>
&lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;cris=
tian.iorga@intel.com&#39;)">cristian.iorga@intel.com</a>&gt; wrote:<br>
&gt; On my Ubuntu 13.10 dev machine, wireless-tools and iw are both install=
ed by<br>
&gt; default (I might be wrong here, maybe I installed them some time ago b=
y<br>
&gt; hand).<br>
<br>
you are right, they are both on the default install, see<br>
<br>
<a href=3D"http://releases.ubuntu.com/13.10/ubuntu-13.10-desktop-amd64.mani=
fest" target=3D"_blank">http://releases.ubuntu.com/13.10/ubuntu-13.10-deskt=
op-amd64.manifest</a></blockquote><div><br></div><div>For what its worth, I=
 personally would love to see wireless-tools go away in favor of iw, much a=
s ifconfig has gone to the wayside in favor of iputils.</div>
<div><br></div><div>-Chris</div><br><br>-- <br>Christopher Larson<br>clarso=
n at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Main=
tainer - Tslib<br>Senior Software Engineer, Mentor Graphics<br>

--089e01538410fe14f604f14a861e--
