Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id A56157198F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 14:10:10 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id 12so45044394qtm.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PAEGoAISXVl3wlmpDlOG/h4Hzrfjub21YAeJnJQ3gPw=;
	b=TlxVq+1LMVrYL9w3IiFrlZ9IfgNJRig2zoF+ZgTSLidWakQMicvCOORnhoDS48503s
	m+Ts+yMOG1UdVsBOJOi6Qnb4LF/m5fwfmBnjCykUFb6ZvAoLU5FT+lVKfIZARo+4xcOC
	U3z6KZtWDvatjntuLwwp0bhem82ckEWv/obBRlVjBFMIhamrhbI2JPiQ8GaHjlFPhz8K
	rXrPow8MEO1APQ1I8VsLkM6hFKMru+nmIGl+4vc3ShJXe16wn8Sv044WbVMx9A0KYwbL
	Lby06kkGE7bg5xvlCfUJkjSKAx9UfVwhPDpZH/mzcCaatmR/fhrHBiflpZu7//XwK35K
	F+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PAEGoAISXVl3wlmpDlOG/h4Hzrfjub21YAeJnJQ3gPw=;
	b=XcF11IAubsQuCYPjeAUeT/UhG5e9v5B8Wgtms2y7t46p1YEtBouPwLmI/m1UTx8fg+
	j+AfypKV8bZVZp5tzTizssp7LoYNx2ry919fddr/3FjcOfIzWR+Xat+AvVoXXzU/QAyi
	ij182jy/gvuar/gv8UsktgwWEJL6s9AInU679WKB83XZggSq2DnInRmhc6wQsdPKy4mi
	AAl7U25MB6Cj7Q5F+eExlJZE9n95I1Rc5h5krgYvpij5r5AjyrqpxJ1xtyWnjm6xXu+B
	N5QV9VxeysE2HsRITE695P4aShMMxvvoLR4V8aLKVTH9drz2PuuFfTFj1e3wN9tg6mau
	dVAg==
X-Gm-Message-State: ABUngvd1wSktOJT4k5Xo2j88DVTqvr2uL8cM+Qk8krCb+9z6Emr7+MGFIYRcqrKsHaXttbuMG6LqBiJiFKxxgLeD
X-Received: by 10.237.61.210 with SMTP id j18mr8247328qtf.137.1477663811590;
	Fri, 28 Oct 2016 07:10:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 28 Oct 2016 07:09:51 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610280356230.30798@localhost.localdomain>
References: <alpine.LFD.2.20.1610280356230.30798@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Oct 2016 15:09:51 +0100
Message-ID: <CAJTo0LZxbiHqL4HeS28aLfmp-rgf_go0XNX-YQGSFmoNjooqHw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can i arbitrarily mix "meta-debian" recipes into my build?
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
X-List-Received-Date: Fri, 28 Oct 2016 14:10:10 -0000
Content-Type: multipart/alternative; boundary=001a114010949673a9053fed6a65

--001a114010949673a9053fed6a65
Content-Type: text/plain; charset=UTF-8

On 28 October 2016 at 09:00, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   more silly questions ... just noticed that some of the recipes i'm
> looking for exist under meta-debian; is there any issue with "mixing"
> those recipes into my normal, poky-based, bleeding-edge image builds?
>

meta-debian does a *lot* of stuff, some of which is very invasive, so I
wouldn't recommend it.  If there's a recipe you want that is in meta-debian
I'd use their recipe as a starting point and write a standalone recipe.

Ross

--001a114010949673a9053fed6a65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 October 2016 at 09:00, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2he" cla=
ss=3D"a3s aXjCH m1580a5f760232e35">=C2=A0 more silly questions ... just not=
iced that some of the recipes i&#39;m<br>
looking for exist under meta-debian; is there any issue with &quot;mixing&q=
uot;<br>
those recipes into my normal, poky-based, bleeding-edge image builds?<br></=
div></blockquote></div><br>meta-debian does a *lot* of stuff, some of which=
 is very invasive, so I wouldn&#39;t recommend it.=C2=A0 If there&#39;s a r=
ecipe you want that is in meta-debian I&#39;d use their recipe as a startin=
g point and write a standalone recipe.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a114010949673a9053fed6a65--
