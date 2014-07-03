Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 488776AC78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 10:40:05 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id im17so4858vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jul 2014 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/9IKVqKkno3JZSuYC3tEBl9PIAbKe11cDw9JtETKRYc=;
	b=ofA5VoZ//d9tfr6JMMemDiX4FenaTBu4gSRG8QryIAMa+cOmBhctFH7BQTYaBSC7ke
	1zaoa3GARbJtv2/G/jAfbs0wlbHt/l4BiJfxdWTcV/0VgyCJ0LjRGPrBXcpgYfZB7C5R
	3mi7mysxVPAI8+1l9US0U1BTVth92kRGdZ0wN8gwb2r5obL2paP3XTTZAgcF86mvqh+f
	vX18qa/7F+XEaJgqwY6YgXTAcexaiPsAl5GPQj0QAqR0khV9fK/4/J23Sd2cFLcq9hN7
	xFW3gf5aekcEJP2H1UL8Nj/WT0SmvlUnUSojIDjGEqk/vpQaHasENZMBBcvkjfS08wrS
	aZ+A==
MIME-Version: 1.0
X-Received: by 10.52.0.177 with SMTP id 17mr2543660vdf.12.1404383604204; Thu,
	03 Jul 2014 03:33:24 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Thu, 3 Jul 2014 03:33:24 -0700 (PDT)
In-Reply-To: <20140701200126.GP1580@denix.org>
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>
	<53B0DD86.4030402@windriver.com>
	<20140630081507.GA5083@ad.chargestorm.se>
	<20140701200126.GP1580@denix.org>
Date: Thu, 3 Jul 2014 13:33:24 +0300
Message-ID: <CAAHuHfyQeLKExSO7VTXYOSqSVzKz5c0CC89vLtUH80gx4Dyd+A@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cape Manager
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
X-List-Received-Date: Thu, 03 Jul 2014 10:40:08 -0000
Content-Type: multipart/alternative; boundary=047d7b86e4f2db690b04fd47894b

--047d7b86e4f2db690b04fd47894b
Content-Type: text/plain; charset=UTF-8

is it possible  lcd cape support without capemgr ?


2014-07-01 23:01 GMT+03:00 Denys Dmytriyenko <denis@denix.org>:

> On Mon, Jun 30, 2014 at 10:15:07AM +0200, Anders Darander wrote:
> > * Robert Yang <liezhi.yang@windriver.com> [140630 05:47]:
> >
> >
> > > On 06/30/2014 12:24 AM, Life Life wrote:
> > > > Hello,
> >
> > > > I'm trying build yocto based linux, My hardware is beaglebone black I
> > > > successfull build system image. But I can't see capemanager. Beacuse
> my lcd is
> > > > not work.
> >
> > > Hello,
> >
> > > The cape manager is in meta-ti layer:
> >
> > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/
> >
> > > Seems that we'd better add it to meta-yoco-bsp ?
> >
> > Unless something has changed since I last looked at this, I don't think
> > so.
> >
> > If I remember correctly, capemgr basically consists of a number of
> > patches not in the mainline kernel (and also not in TI's staging
> > kernel). I haven't checked it, by I doubt that we have them in the
> > linux-yocto kernel. (Especially as the last time I checked it, you had
> > to revert to a 3.8 (if I rember correctly, it might have been an even
> > earlier kernel) kernel to get full capemgr support.
> >
> > If this has changed, then it'd be interesting to know!
>
> That is correct - capemgr was a patchset against 3.8. It is not yet
> available
> in mainline. It was developed and being adopted for the mainline by
> Pantelis
> Antoniou and the community, but since it's rather a complicated subsystem,
> it
> went through numerous revisions and changes, still not merged upstream
> though.
>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b86e4f2db690b04fd47894b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">is it possible=C2=A0 lcd cape support without capemgr ?<br=
></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2014-0=
7-01 23:01 GMT+03:00 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Mon, Jun 30, 2014 at 10:1=
5:07AM +0200, Anders Darander wrote:<br>
&gt; * Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.=
yang@windriver.com</a>&gt; [140630 05:47]:<br>
&gt;<br>
&gt;<br>
&gt; &gt; On 06/30/2014 12:24 AM, Life Life wrote:<br>
&gt; &gt; &gt; Hello,<br>
&gt;<br>
&gt; &gt; &gt; I&#39;m trying build yocto based linux, My hardware is beagl=
ebone black I<br>
&gt; &gt; &gt; successfull build system image. But I can&#39;t see capemana=
ger. Beacuse my lcd is<br>
&gt; &gt; &gt; not work.<br>
&gt;<br>
&gt; &gt; Hello,<br>
&gt;<br>
&gt; &gt; The cape manager is in meta-ti layer:<br>
&gt;<br>
&gt; &gt; <a href=3D"http://layers.openembedded.org/layerindex/branch/maste=
r/layer/meta-ti/" target=3D"_blank">http://layers.openembedded.org/layerind=
ex/branch/master/layer/meta-ti/</a><br>
&gt;<br>
&gt; &gt; Seems that we&#39;d better add it to meta-yoco-bsp ?<br>
&gt;<br>
&gt; Unless something has changed since I last looked at this, I don&#39;t =
think<br>
&gt; so.<br>
&gt;<br>
&gt; If I remember correctly, capemgr basically consists of a number of<br>
&gt; patches not in the mainline kernel (and also not in TI&#39;s staging<b=
r>
&gt; kernel). I haven&#39;t checked it, by I doubt that we have them in the=
<br>
&gt; linux-yocto kernel. (Especially as the last time I checked it, you had=
<br>
&gt; to revert to a 3.8 (if I rember correctly, it might have been an even<=
br>
&gt; earlier kernel) kernel to get full capemgr support.<br>
&gt;<br>
&gt; If this has changed, then it&#39;d be interesting to know!<br>
<br>
</div>That is correct - capemgr was a patchset against 3.8. It is not yet a=
vailable<br>
in mainline. It was developed and being adopted for the mainline by Panteli=
s<br>
Antoniou and the community, but since it&#39;s rather a complicated subsyst=
em, it<br>
went through numerous revisions and changes, still not merged upstream thou=
gh.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--047d7b86e4f2db690b04fd47894b--
