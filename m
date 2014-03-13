Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 123A26DCFF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 18:12:05 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so982554lbi.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kWyNOXmdfIGCZcdrC+M6iJZfXeI0vC5d6cwsoDUq7co=;
	b=iMilg4j3dYevR8E9hSHlFXMJrsB4yuo5J7jKePMS7R7r2XjCIzk+WskZDx9+MFDhBm
	cG4RZUNArxS1qRmkKtPZT2utIUzYX4peOw85NRvGNFLLseV7W4ZHfBoXDGfGUmKiVw7W
	Z8/JwlgYvXhB+XcnCVhRIqfRcCU04wOFSGpFTgTsIFb34KvhLFP6MCcaqRhrDsZTbX4Y
	yOjj4qWYNg2BKrZjaHGWLCMCszMUUwsTeCLLKMBnBrldgIKS81p6Rv6R8l52MdwpTSHH
	xoJuDj5gGoj337JZ3fIiaK54IV1NK053wgYgSm6pgbZHVBJtGA4pF+ujT+bRbICWKvnk
	rVuw==
X-Received: by 10.112.35.130 with SMTP id h2mr2124902lbj.15.1394734325380;
	Thu, 13 Mar 2014 11:12:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.35.200 with HTTP; Thu, 13 Mar 2014 11:11:45 -0700 (PDT)
In-Reply-To: <CAJTo0LZXYBmSy4bme8Y3MaYCZ=X2VRabbXOeSNVX7TEubVOKPg@mail.gmail.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<5a1dbe79b2581b458e5c43a262c9b9c8a809d081.1394555880.git.liezhi.yang@windriver.com>
	<CAJTo0LbpZ=aSRwcu8TAZsqXKb+jmtCqgj07YAm7kdrLUawQkRg@mail.gmail.com>
	<CAJTo0LZXYBmSy4bme8Y3MaYCZ=X2VRabbXOeSNVX7TEubVOKPg@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 13 Mar 2014 11:11:45 -0700
Message-ID: <CABcZANnVyoUPY6o_UDNEPhUL=O6GH7+heYR1w-YBpEOeEXB6UQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] patch.bbclass: do_patch: unset TMPDIR from environment
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
X-List-Received-Date: Thu, 13 Mar 2014 18:12:06 -0000
Content-Type: multipart/alternative; boundary=001a11c3735a053a1c04f480e49a

--001a11c3735a053a1c04f480e49a
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 13, 2014 at 9:54 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 13 March 2014 16:46, Burton, Ross <ross.burton@intel.com> wrote:
> > On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
> >> We need unset it after we use it, otherwise it would affect the env
> >> after we run "bb.build.exec_func('do_patch', d)", and will cause
> >> unexpected errors.
> >
> > This assignment has been there since October 2012, so what are the
> > problems that this causes?
>
> So what bothers me about this (and the original patch) is that TMPDIR
> has special meaning to bitbake and the conflict with patch's temporary
> directory is unfortunate.  Maybe a better solution is to change
> meta/lib/oe/patch.py to set TMPDIR when invoking patch so the changed
> TMPDIR is constrained to the patch process and nothing else.


That sounds like a clean approach to me.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3735a053a1c04f480e49a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 13, 2014 at 9:54 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On 13 March 2014 16:46, Burton, Ross &lt;<a href=3D"mailto:ross.burton@inte=
l.com">ross.burton@intel.com</a>&gt; wrote:<br>


&gt; On 11 March 2014 17:08, Robert Yang &lt;<a href=3D"mailto:liezhi.yang@=
windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br>
&gt;&gt; We need unset it after we use it, otherwise it would affect the en=
v<br>
&gt;&gt; after we run &quot;bb.build.exec_func(&#39;do_patch&#39;, d)&quot;=
, and will cause<br>
&gt;&gt; unexpected errors.<br>
&gt;<br>
&gt; This assignment has been there since October 2012, so what are the<br>
&gt; problems that this causes?<br>
<br>
</div></div>So what bothers me about this (and the original patch) is that =
TMPDIR<br>
has special meaning to bitbake and the conflict with patch&#39;s temporary<=
br>
directory is unfortunate. =C2=A0Maybe a better solution is to change<br>
meta/lib/oe/patch.py to set TMPDIR when invoking patch so the changed<br>
TMPDIR is constrained to the patch process and nothing else.</blockquote></=
div><br></div><div class=3D"gmail_extra">That sounds like a clean approach =
to me.<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founde=
r - BitBake, OpenEmbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11c3735a053a1c04f480e49a--
