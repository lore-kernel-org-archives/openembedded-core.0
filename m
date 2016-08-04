Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 89C60731C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 18:20:21 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id l69so187556613lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0KSjCoV124WbugNVQ13IiEJn+ZRG1zHoIr4xlJO5q4M=;
	b=MPYfuWLqdMakFnJLKURgBF9IX7iBKBQkbEoES10GKj0ueUpXEjTgolaor2nRmb3kxB
	afX5TFejaNl1BVpNEdsz32XxY6wqriVm26ewabXpErhE2tAvo4MP/gReiS/6gb+zM9xh
	I9doqIi9lLHl23d1b/B2lZ35sCFJwPHdvtk/WDEF4416ODWR41Jsm9jm8V82enRI5Hvm
	MthMFyZUw+HKD3aRzvgbYKw3tWapuD43wjgLJXM/QVg8YLmSmeAmVt7WognjtduJTfea
	wMVSgb/6RXKqLRcw7/KCECkfyxEAP8ORIyKERaeN29RBm0dqe57srLxt7p5S82IBXNXk
	hfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0KSjCoV124WbugNVQ13IiEJn+ZRG1zHoIr4xlJO5q4M=;
	b=kFZFF6mV6jlWajXP2g8sWgLg/s89cd3ko40Yv4o0/oBxvgLC4Ir3mGm10ar7OoURgj
	JUMF8MThlQ2wYs0G5kBhv8Hob0IuYzD2CMK+vmwe/lbEwyWmXgEu0OgIPFzGiXNVfhn6
	UOurG89cJybPF58EIBmm2hMrwD6/yOr30IpQMop3/KvtvvokQQIM4oVH/Z8LWhyeGiHa
	VkVFX4PUqMUcb/lR8DiKde0j1wijUdcMaY9R2LjbnfLVhkPpiV6k+5qSxm1Xest5ocG1
	afqN+N0xeSjjaYE4gUaaF2syTpBDH2YvyFX5KmzAp4iPsag4DwtFEAMyDy/P1JWUVGs6
	I0fQ==
X-Gm-Message-State: AEkoousaMnqrKxlBFZwco7vqH9kFt3y9yuACjQ8FWEZi4GBsisKJLNN0alazYdFGLlE/kYYtluLfrmuwTKQw8A==
X-Received: by 10.25.228.79 with SMTP id b76mr115101lfh.10.1470334822046; Thu,
	04 Aug 2016 11:20:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 4 Aug 2016 11:20:21 -0700 (PDT)
In-Reply-To: <20160804150032.ml77q3vedosk6cqt@jama>
References: <20160801104924.10815.18743@opal.openembedded.org>
	<20160801104927.C930350170@opal.openembedded.org>
	<20160804143423.a6fyiopqmt6abcq7@jama>
	<CAJTo0LbC0CObxR+5WVOAHqZf0Hd4jztBUcdNZP_tOjX9zctpHQ@mail.gmail.com>
	<20160804150032.ml77q3vedosk6cqt@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Aug 2016 20:20:21 +0200
Message-ID: <CA+chaQc2W_HNsyOr5fC5mCmQ4c8jqXNdXmVdGMwfGiL7uX+4vg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 11/43: libtasn1: upgrade to 4.9
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
X-List-Received-Date: Thu, 04 Aug 2016 18:20:23 -0000
Content-Type: multipart/alternative; boundary=94eb2c0ed3b8c4e1180539430001

--94eb2c0ed3b8c4e1180539430001
Content-Type: text/plain; charset=UTF-8

I can confirm now that it's failing only with -Os, removing -Os helps, but
older version was building fine with -Os.

On Thu, Aug 4, 2016 at 5:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Aug 04, 2016 at 03:39:28PM +0100, Burton, Ross wrote:
> > On 4 August 2016 at 15:34, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > > | In file included from ../../libtasn1-4.9/lib/structure.c:32:0:
> > > | ../../libtasn1-4.9/lib/parser_aux.h:97:1: error: inlining failed in
> > > call to '_asn1_set_down': call is unlikely and code size would grow
> > > [-Werror=inline]
> > > |  _asn1_set_down (asn1_node node, asn1_node down)
> > > |  ^~~~~~~~~~~~~~
> > >
> >
> > Works for me and the AB.  What sort of compiler flags do you have?
>
> Might be caused by -Os.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--94eb2c0ed3b8c4e1180539430001
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can confirm now that it&#39;s failing only with -Os, rem=
oving -Os helps, but older version was building fine with -Os.</div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 4, 2016 at 5=
:00 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@g=
mail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Aug 04, 2016 at 03=
:39:28PM +0100, Burton, Ross wrote:<br>
&gt; On 4 August 2016 at 15:34, Martin Jansa &lt;<a href=3D"mailto:martin.j=
ansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; | In file included from ../../libtasn1-4.9/lib/<wbr>structure.c:3=
2:0:<br>
&gt; &gt; | ../../libtasn1-4.9/lib/parser_<wbr>aux.h:97:1: error: inlining =
failed in<br>
&gt; &gt; call to &#39;_asn1_set_down&#39;: call is unlikely and code size =
would grow<br>
&gt; &gt; [-Werror=3Dinline]<br>
&gt; &gt; |=C2=A0 _asn1_set_down (asn1_node node, asn1_node down)<br>
&gt; &gt; |=C2=A0 ^~~~~~~~~~~~~~<br>
&gt; &gt;<br>
&gt;<br>
&gt; Works for me and the AB.=C2=A0 What sort of compiler flags do you have=
?<br>
<br>
</span>Might be caused by -Os.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0ed3b8c4e1180539430001--
