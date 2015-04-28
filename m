Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0BE72277
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:13:37 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so96948048igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pjwYnP/Suf21TDEsALbz91zahJ13TKuThRSAHIFdzOo=;
	b=TkoRCQQA7jYL+iuw/hIf5/B8sKkFtjFZN24cpQCTMZc9skNQ/qkZuDOUJhyPZGtKnx
	OmazwBPrD3s1Y9pGJV/xrJmScITfPwcaMh/bo7+em/RhYYmfwv6ETMlAexphXX7ZKEME
	sxLbmMI0dZkZ3HQU96vueQ9IKfORHqHWk0UjE2QbmkCCiorGHLOVgf2PCgsLj6EdZv0j
	np5SYKS08at1n/wbMK3Rr/SvoC0QotRQHowrHhbXKpJzUt2k8qyoF84aRUDvy2GT+1ef
	p2+l5+HpxDm4WjiJSNqjm65rfBesKDt5W1kFWhSIa9VwQ5lixbEtOhTYHb0STST/8C7+
	0gUw==
MIME-Version: 1.0
X-Received: by 10.107.169.160 with SMTP id f32mr23380191ioj.83.1430259218396; 
	Tue, 28 Apr 2015 15:13:38 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 15:13:38 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 15:13:38 -0700 (PDT)
In-Reply-To: <1430257333.13022.247.camel@linuxfoundation.org>
References: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
	<20150428213007.GC2322@jama>
	<1430257073.5364.1.camel@bottazzini-ThinkPad-T430>
	<1430257333.13022.247.camel@linuxfoundation.org>
Date: Tue, 28 Apr 2015 15:13:38 -0700
Message-ID: <CAMKF1srJC56ZTmBEsUx9SnfM8v2T82BOdAQ_RfiMbvdU2dgNng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: bring back the patch to customise root's $HOME
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
X-List-Received-Date: Tue, 28 Apr 2015 22:13:42 -0000
Content-Type: multipart/alternative; boundary=001a1142646ca63afb0514d02cae

--001a1142646ca63afb0514d02cae
Content-Type: text/plain; charset=UTF-8

On Apr 28, 2015 2:42 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2015-04-28 at 18:37 -0300, Bottazzini, Bruno wrote:
> > Thanks Ross!
> >
> > This slipped trough my fingers when I have remade the first version to
> > use the stable branch.
> >
> > Martin,
> >
> > The patch removed will be applied automatically because they are
> > upstreamed on the stable branch.
>
> We have a load of unused orphan patch files left in the tree though?
> These need to be removed.

I was wondering if there was a script or may be bitbake option to warn
about this case whole Metadata wide

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1142646ca63afb0514d02cae
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Apr 28, 2015 2:42 PM, &quot;Richard Purdie&quot; &lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2015-04-28 at 18:37 -0300, Bottazzini, Bruno wrote:<br>
&gt; &gt; Thanks Ross!<br>
&gt; &gt;<br>
&gt; &gt; This slipped trough my fingers when I have remade the first version to<br>
&gt; &gt; use the stable branch.<br>
&gt; &gt;<br>
&gt; &gt; Martin,<br>
&gt; &gt;<br>
&gt; &gt; The patch removed will be applied automatically because they are<br>
&gt; &gt; upstreamed on the stable branch.<br>
&gt;<br>
&gt; We have a load of unused orphan patch files left in the tree though?<br>
&gt; These need to be removed.</p>
<p dir="ltr">I was wondering if there was a script or may be bitbake option to warn about this case whole Metadata wide</p>
<p dir="ltr">&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</p>

--001a1142646ca63afb0514d02cae--
