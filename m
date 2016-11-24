Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8F946011C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 01:17:04 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id f201so2074183oib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 17:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=TDH2ipnSFDKZBr5MGNCCpzARGWqBKePiEpbAGSqVV5g=;
	b=FHGT55QLmzSPLxBrc+wp69fZiStiuyr+7ZwVcA9uClP6kguPrw+wemyCpHUE80mh6p
	a3r6SsVXK5+3usxOfMa/KOk6Ac+a7VmOI4Cs6pKTLNsvrEaawJv4nFaB6llmfVE3JnEq
	YM/gbNIQ+qLinqUPoE0KyNh6AW8pn0Vsavzh3yRO0HdOGC269BdaXkZndIZGxKDNVFiT
	4tGXhu3/YRqWmjdmMxwaNBxQYmUUyTOqrOTY482YL3m9C6nEnS5IerIrL8m1PHiATriB
	vWyObjFTyGMZNs/HS3LEq+sdDs3J6KlQcEE2rcsHJ4ro8gUyg3kgTiQTFBZFhbDDctyc
	FL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=TDH2ipnSFDKZBr5MGNCCpzARGWqBKePiEpbAGSqVV5g=;
	b=fvcOEQmnuc2P/ZJgq/t/B5VjDbgP8q2wO3yISRy5yHx9OVVnmiXg52YleVnJpdhTPv
	hogMWl9PjVzXnyOWhcsri13Ef3CK2/nmvcNda9K+e/9GFxlQRcXi51xKgiaMekCkkYIy
	r1PxWplecaRKJLxt3Ezs0K9MhKHm+koIir/0WDFASSeLdENTfm+CmYU6l2xOVIJjoGgH
	Ur4v+7yjioQF0taN5aISoYpLshesuo3Mp+drqiu2ktZFaJYWC0NisXbamleRlbBZBJBh
	M8UTj9pWFDrgy6F7flDDt3t6HWwNKj7mAM8LQ5ZbyQ8+qiNElmzBIhXvGp2011fwx74B
	NNkg==
X-Gm-Message-State: AKaTC00+Ga4Df0hwnujj2Jc2H1P59enUv03jH7KAVFcJ3YiIjbr1qDLvmgAQGg3oleqxuqSswbg737bVKGTY0g==
X-Received: by 10.157.17.174 with SMTP id v43mr3274601otf.251.1479950226014;
	Wed, 23 Nov 2016 17:17:06 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Wed, 23 Nov 2016 17:16:45 -0800 (PST)
In-Reply-To: <f2e7d5d6-7094-10b6-16bc-9398c8bb828e@windriver.com>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
	<20161123181039.GF3265@jama>
	<c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
	<20161123185617.GH3265@jama>
	<f2e7d5d6-7094-10b6-16bc-9398c8bb828e@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Nov 2016 18:16:45 -0700
X-Google-Sender-Auth: z5HGSpIkPizo0LU-YrvV3Yxd6aU
Message-ID: <CABcZANkiNi_+p3p67YLJr_pcxQLrTWzoFfVDNgrFneUHPvyeBg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Thu, 24 Nov 2016 01:17:09 -0000
Content-Type: multipart/alternative; boundary=94eb2c18fcd481cc44054201c373

--94eb2c18fcd481cc44054201c373
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 12:42 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 11/23/16 12:56 PM, Martin Jansa wrote:
> > On Wed, Nov 23, 2016 at 12:38:42PM -0600, Mark Hatle wrote:
> >> On 11/23/16 12:10 PM, Martin Jansa wrote:
> >>> On Wed, Nov 23, 2016 at 11:42:09AM -0600, Mark Hatle wrote:
> >>>> This is a Wind River specific patch and not generally applicable.
> >>>
> >>> Then why is it sent to oe-core ML?
> >>
> >> As noted in the cover letter, I'm required to by Yocto Project
> compliance
> >> requirements.
> >>
> >> As indicated LAST time I got scolded, I was told to indicate this in
> the patch
> >> summary email -- which I did.
> >
> > Sorry I've noticed the cover letter only after the response.
> >
> > So it's only because of this requirement from Yocto Project compliance?
>
> yes.
>
> > "Have all patches applied to BitBake and OpenEmbedded-Core (if present)
> > been submitted to the open source community?"
> >
> > Shouldn't the wording be change to something like "all applicable
> > patches" or "all generally useful patches"?
> >
> > It seems strange to send project specific patches together with cover
> > saying that they aren't generally applicable and shouldn't be merged,
> > just because of this requirement.
>
> It was done this way to prevent people from cheating and claiming
> something was
> (effectively) not useful/applicable/etc when it some special secret sauce.
>
> Even these patches while not generally applicable could give someone else
> the
> idea to duplicate (or improve) on our approach at providing layer specific
> download layers.
>

More of an implementation question, but presumably you could have your
setup scripts add the LAYERRECOMMENDS to bblayers.conf, rather than having
it in your oe-core fork/branch, as an alternative.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c18fcd481cc44054201c373
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Nov 23, 2016 at 12:42 PM, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 11/23/16 12:56 PM, Martin Jansa wrote:<br>
&gt; On Wed, Nov 23, 2016 at 12:38:42PM -0600, Mark Hatle wrote:<br>
&gt;&gt; On 11/23/16 12:10 PM, Martin Jansa wrote:<br>
&gt;&gt;&gt; On Wed, Nov 23, 2016 at 11:42:09AM -0600, Mark Hatle wrote:<br=
>
&gt;&gt;&gt;&gt; This is a Wind River specific patch and not generally appl=
icable.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Then why is it sent to oe-core ML?<br>
&gt;&gt;<br>
&gt;&gt; As noted in the cover letter, I&#39;m required to by Yocto Project=
 compliance<br>
&gt;&gt; requirements.<br>
&gt;&gt;<br>
&gt;&gt; As indicated LAST time I got scolded, I was told to indicate this =
in the patch<br>
&gt;&gt; summary email -- which I did.<br>
&gt;<br>
&gt; Sorry I&#39;ve noticed the cover letter only after the response.<br>
&gt;<br>
&gt; So it&#39;s only because of this requirement from Yocto Project compli=
ance?<br>
<br>
</span>yes.<br>
<span class=3D""><br>
&gt; &quot;Have all patches applied to BitBake and OpenEmbedded-Core (if pr=
esent)<br>
&gt; been submitted to the open source community?&quot;<br>
&gt;<br>
&gt; Shouldn&#39;t the wording be change to something like &quot;all applic=
able<br>
&gt; patches&quot; or &quot;all generally useful patches&quot;?<br>
&gt;<br>
&gt; It seems strange to send project specific patches together with cover<=
br>
&gt; saying that they aren&#39;t generally applicable and shouldn&#39;t be =
merged,<br>
&gt; just because of this requirement.<br>
<br>
</span>It was done this way to prevent people from cheating and claiming so=
mething was<br>
(effectively) not useful/applicable/etc when it some special secret sauce.<=
br>
<br>
Even these patches while not generally applicable could give someone else t=
he<br>
idea to duplicate (or improve) on our approach at providing layer specific<=
br>
download layers.<br></blockquote><div><br></div><div>More of an implementat=
ion question, but presumably you could have your setup scripts add the LAYE=
RRECOMMENDS to bblayers.conf, rather than having it in your oe-core fork/br=
anch, as an alternative.</div></div>-- <br><div class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsli=
b<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c18fcd481cc44054201c373--
