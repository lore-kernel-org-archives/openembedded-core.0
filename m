Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF9DB77AC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 09:55:14 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id m91so5959454qte.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oGiWzvNKO50NLPPjwhfaUSNfGKzjytINhLcOMfVzO5Y=;
	b=m+75TG6uKxgAIve3pb+geAP4VI4j098qjOLqewQM9yHI+nIe+zSmfTnnwU+cS/XyVx
	aM4ishHPMOljuzIeNdlQzF/GjaYWBMm6bObR0T5WBr7WKPMlxvjvUD5/N+V+/StlITwq
	yjEXvVaur6SRKZJzU1bB1qUiTRIRE+hRBtrtMnY9Cd1k+mFZYysAe26ZvwYDSVrw+4Sr
	ceSkTsTC1Tz89JG5tNcKXxDPQu4KwRdReqAWMFo3ZEMbO62JuibzcAPn4DRB+TwM4la7
	brFAkCVezmVudJjmk7pp/Hafm1NCA/lfLNIxKrc3/rUTWagBLBT5+9dO293hqp99f6T1
	zLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oGiWzvNKO50NLPPjwhfaUSNfGKzjytINhLcOMfVzO5Y=;
	b=GAky4hb+Rj+vdgwdpTUQhhCSxIaRoR07kuiIS+2GC564ASxnaPEVfMy6uvZL2EUqTm
	x+e/1inchxuK2JocpoFxVqq/ghkiyNPyVAAWrXC87g+Q+TCj3oRu5HRb2THChRb/thV2
	j7iVIJc5UbltmfNubW10yqaVm3mAGyIYCuolGE4Z/VZ+8xOWIR7WwDzLVoNIqmWoXLz4
	GBMTFHzZ44812f29k13TExOzgEV9PUulbhDDXPlLmd//28dJ01UoTySx/pdopf7oRRAK
	PgZ50b8UEYssVYKHQCmH1kfIMtz7uagFF9NEooR2oQm0jfjxh44Im3LJXtisGald0Mu1
	2VLw==
X-Gm-Message-State: AN3rC/72ZUVWiXDizVyzqlR5PrrFG4bFTZX0MA0fULCfSukcVfivwP77
	uL/QfjskiwlxoJ2lA2++cmcBe+n3otMP
X-Received: by 10.200.42.238 with SMTP id c43mr36725575qta.144.1493891715742; 
	Thu, 04 May 2017 02:55:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Thu, 4 May 2017 02:54:55 -0700 (PDT)
In-Reply-To: <cf767fe3-3c98-f32b-d27c-3f63b924ab7f@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-3-alexander.kanavin@linux.intel.com>
	<1493836892.2405.4.camel@gmail.com>
	<CAJTo0LZ3O5au502TRqVUZY_gCT4r_9X-2Jtk+_-3o=u5j2UASg@mail.gmail.com>
	<cf767fe3-3c98-f32b-d27c-3f63b924ab7f@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 May 2017 10:54:55 +0100
Message-ID: <CAJTo0LYDLu5zPf1EKrJKS-Hw-C=MumF8QXej_+i958AyWqy4CA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Thu, 04 May 2017 09:55:14 -0000
Content-Type: multipart/alternative; boundary=001a113f40e40cd17f054eafc50a

--001a113f40e40cd17f054eafc50a
Content-Type: text/plain; charset=UTF-8

On 4 May 2017 at 10:18, Alexander Kanavin <alexander.kanavin@linux.intel.com
> wrote:

> Then meta-oe can continue to host libpng12.
>>
>
> I actually think allowing those recipes to fail and blacklisting them is
> better. Moving libpng12 to meta-oe is the lazy way out; the proper way to
> deal with such regressions is to look at the actual recipes, what they do,
> why they need such an old version of libpng, and whether they should be
> updated or removed from meta-oe altogether. The only way to get people to
> do this real maintenance work is to break the build for them, sadly. I
> cannot take on maintaining things in meta-oe in this way, I have to draw
> the line somewhere, and this is it.
>

For what it's worth, glmark2 was fixed in 2014:

https://github.com/glmark2/glmark2/commit/499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc

glcompbench appears to be a fork of glmark, so the same fix should be
trivial to apply.

Ross

--001a113f40e40cd17f054eafc50a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 May 2017 at 10:18, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"=
mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanav=
in@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D=
"gmail-"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex">Then meta-oe can continue to host libpng12.<br>
</blockquote>
<br></span>
I actually think allowing those recipes to fail and blacklisting them is be=
tter. Moving libpng12 to meta-oe is the lazy way out; the proper way to dea=
l with such regressions is to look at the actual recipes, what they do, why=
 they need such an old version of libpng, and whether they should be update=
d or removed from meta-oe altogether. The only way to get people to do this=
 real maintenance work is to break the build for them, sadly. I cannot take=
 on maintaining things in meta-oe in this way, I have to draw the line some=
where, and this is it.<br></blockquote></div><br>For what it&#39;s worth, g=
lmark2 was fixed in 2014:</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra"><a href=3D"https://github.com/glmark2/glmark2/commit/49=
9aa81a68fb4c8aac1c80f0d6a4cce05941c4cc">https://github.com/glmark2/glmark2/=
commit/499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc</a></div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">glcompbench appears to be a f=
ork of glmark, so the same fix should be trivial to apply.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f40e40cd17f054eafc50a--
