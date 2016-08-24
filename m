Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3353B6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 21:56:36 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so59123348ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EGy84UF/fq6N47vYxA8tXk8WPKRH9HS8wegYZf3ZHMI=;
	b=RMe0jaovC9M5pOTKlH/DgmcIJCeqUquSGpSV3FtwgDrCnux5gBTGwQuIYrPG1BFjpl
	0oQQPv0asEui71EocR8VOgI8jbxnvQxuZDw6Y/Uey3n16dKQBBknbL6rMfjqEscW2lFi
	fam3i7A+4IBcjYRF8aNIT7d7RGi2KIjAdfxKse4+0c7Gi1LyTwgVRWM6lT3dhjDKLJx8
	9yAX/oUPmP4kffNgpo1kAXwGzsnnjdocqcrU10DsNLZko9Xu8+Ab5+fsUdxktrCAsGRj
	Ta1IE25J9ZgfTwRRDtAddwZMMomME3jwTuZLT2aguq3RBlVaPt7a1NLe+lpNN6u0IrPs
	9fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EGy84UF/fq6N47vYxA8tXk8WPKRH9HS8wegYZf3ZHMI=;
	b=GjsruYGd+TL6byzLy5cVD8qtawA6t7qmGqvsol3c9nit0lPGdeSIwOQZNX1QEFMkG6
	cVwHmsWPxIbn4FMy0+5Da28l2MqKA3P/RMGcK4txen/eBdTywDB4A9wS/VMTHBj8XPYI
	Dc4i6EMU57gNMgEFN9wySjvbRB4v0IUMHB/1XDUY8ZM6aH+3WL0WcFf2LfUhC6u0CTw5
	Dt08cyfU98PQLrmJ5SZo/06wRcrbJnt2CAFUANqXH4Rz4312fjIA9u6I5C3gS2SVGC+q
	AIe16XkxlI5+mQRrYUitQStCaM3f/gpLY1AptdOIMPWw811AzMLotGNPNviTq+IJiOIa
	jOzg==
X-Gm-Message-State: AE9vXwPBtkN8QEZS6dLBJilUKFG2nrQRvliakxZznyGSdC4sJcew5EyVzWjB3D3A0k8bTopmKP7mvozpD04bUZ3y
X-Received: by 10.107.135.142 with SMTP id r14mr7123232ioi.133.1472075797478; 
	Wed, 24 Aug 2016 14:56:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 14:56:17 -0700 (PDT)
In-Reply-To: <1471411501-3523-1-git-send-email-california.l.sullivan@intel.com>
References: <1471411501-3523-1-git-send-email-california.l.sullivan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 22:56:17 +0100
Message-ID: <CAJTo0LZPhnJq+VO5X2R-_FE7-qzSCrQh5XWWpp-vRze5NOnqpA@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Wed, 24 Aug 2016 21:56:37 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcfdd15a053ad85a06

--001a113eccbcfdd15a053ad85a06
Content-Type: text/plain; charset=UTF-8

Bruce, can you have a look at this?

Ross

On 17 August 2016 at 06:25, California Sullivan <
california.l.sullivan@intel.com> wrote:

> The kernel being built should match what the recipe claims it is
> building. This function ensures that happens for anyone using
> LINUX_VERSION as they should. As it will likely break outside kernels
> not using LINUX_VERSION, only enable the function for linux-yocto for
> now.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
> I'm not absolutely sure this is the correct path to solve the issue.
> This patch relies on LINUX_VERSION being set which isn't a guarantee.
> There is probably a more general solution that I'm not thinking of.
>

--001a113eccbcfdd15a053ad85a06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Bruce, can you have a look at t=
his?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17 Au=
gust 2016 at 06:25, California Sullivan <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:california.l.sullivan@intel.com" target=3D"_blank">california.l.sulliv=
an@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":wn" class=3D"a3s aXjCH m1569d1c8aa453ec3">The kernel being built shou=
ld match what the recipe claims it is<br>
building. This function ensures that happens for anyone using<br>
LINUX_VERSION as they should. As it will likely break outside kernels<br>
not using LINUX_VERSION, only enable the function for linux-yocto for<br>
now.<br>
<br>
Signed-off-by: California Sullivan &lt;<a href=3D"mailto:california.l.sulli=
van@intel.com">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
---<br>
I&#39;m not absolutely sure this is the correct path to solve the issue.<br=
>
This patch relies on LINUX_VERSION being set which isn&#39;t a guarantee.<b=
r>
There is probably a more general solution that I&#39;m not thinking of.</di=
v></blockquote></div><br><br></div></div>

--001a113eccbcfdd15a053ad85a06--
