Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id AA91C6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 12:51:40 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so11212947igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 04:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=A+tqystfyy3eFWoS+ZH2roxXr/N0Slmi9wQCh6lRClo=;
	b=YLlcqyiiKA73xdmGH7OcKkbbf1+yZtAY/hXkdRrb5/Dn58X4II0BHwWet2WSG3Sakh
	7ZcwZ0OTUsBVO/s+D0k8zgsWFXDCM6pHH8hPfNPVo4PdrJ5Ao0eOCVOehIcWGYrNh2Nk
	TQ6WrMO4STtpZZ3T2zlRr/iIn/jgTl4gVCeABs9gOorbWs7bYYXI24qIRaSk+sgrzbEd
	jGeC7mcKZiPotDHaB2OfYXbLF+fJjmoqzjoab9U+EO4H5VNifFgvsdzIpaFSc7YyZFFg
	+B2ooOvqrcsVMXRrfmBiMC8bGUYlBfUJ8QkzXiivNqn7o9z87q7jQp4wDsy1hYmDxXlx
	4Tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=A+tqystfyy3eFWoS+ZH2roxXr/N0Slmi9wQCh6lRClo=;
	b=RoPnZ4aLAAZ0HIRhrkeALYEUcCOFlcCTy8EMkQ1WM7JqG0kOVdAEFAiJ8Jag3B5DFf
	7GG4q4xjbN6IbeUtsKfZwZy8SVoHo7Of+E/USyzyc3ucjSjSYrLeRw4WBT3YQTnEdZfh
	Ip/bPk8JWyiti8mVBOkGX+g/aGIvLQTlgngx3Euzgy6ckhZzwg7nAbOyoRalf0b944WA
	q3qGKonrKrA/kUMRZ7e3r6ReO24Wp/07o3Ru3NtaiHu8khStWEPJsNSByWmygL0SnuPE
	mcBlk/8gNrKJeaU7mB1v0AHS2jSrSU0coLD4H46rcchji6FgtYZHGn0T9wdU8NsZejn5
	GU3g==
X-Gm-Message-State: ALoCoQlgPndNJ0Elil3hilG4PtVv8wev2yfYFweTw6nUpm3GUjmtiYQ3iajxIDZ4KAwZGCjXam3Y
X-Received: by 10.50.155.33 with SMTP id vt1mr8493827igb.64.1449147101531;
	Thu, 03 Dec 2015 04:51:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 3 Dec 2015 04:51:22 -0800 (PST)
In-Reply-To: <D285DA30.6C15E%belen.barros.pena@intel.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
	<20151202180440.GC2248@jama>
	<CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
	<D285DA30.6C15E%belen.barros.pena@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Dec 2015 12:51:22 +0000
Message-ID: <CAJTo0LYGSR=TZeH--jFsc+DnE09K0zF4Xw2KhRfA_aazaDV0Dw@mail.gmail.com>
To: "Barros Pena, Belen" <belen.barros.pena@intel.com>
Cc: "Lespiau, Damien" <damien.lespiau@intel.com>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Patchwork & patch handling improvements
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
X-List-Received-Date: Thu, 03 Dec 2015 12:51:41 -0000
Content-Type: multipart/alternative; boundary=001a11343daa36eb170525fdda10

--001a11343daa36eb170525fdda10
Content-Type: text/plain; charset=UTF-8

On 3 December 2015 at 11:43, Barros Pena, Belen <belen.barros.pena@intel.com
> wrote:

> >and more status values.
>
> You can add status values (to the db directly or via the Django admin
> interface), but they will apply to all projects in the Patchwork instance.
> Ideally you should be able to set a list of status values per project I
> guess.
>

Well it depends on what the extra values are.  Martin, what values do you
use?  A "merged in staging" value would be useful for everyone.

Ross

--001a11343daa36eb170525fdda10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 3 December 2015 at 11:43, Ba=
rros Pena, Belen <span dir=3D"ltr">&lt;<a href=3D"mailto:belen.barros.pena@=
intel.com" target=3D"_blank">belen.barros.pena@intel.com</a>&gt;</span> wro=
te:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":8c0" class=3D"a3s" style=3D"overflow:hidden">&gt;and more status value=
s.<br>
<br>
You can add status values (to the db directly or via the Django admin<br>
interface), but they will apply to all projects in the Patchwork instance.<=
br>
Ideally you should be able to set a list of status values per project I<br>
guess.</div></blockquote></div><br>Well it depends on what the extra values=
 are.=C2=A0 Martin, what values do you use?=C2=A0 A &quot;merged in staging=
&quot; value would be useful for everyone.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11343daa36eb170525fdda10--
