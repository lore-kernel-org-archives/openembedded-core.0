Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id F2AF077054
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:40:43 +0000 (UTC)
Received: by qkfm62 with SMTP id m62so69011141qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ef4Jds4ohyRpsuo/B2+2ZRYoL9jfa6+RdEuYMlrqKoY=;
	b=CTuN4FjiSWkuZW2TlPyAVRLhtE3ySq4Dx5BsMQcVQHbw5EDEueobhcjZHVftQzQTeF
	5DPB9YirbKE9+aKJ/H7xMKh6kHOZIjqv24p8mbQRIx/BVxkkZLE0xM4vYST4qZN9Rv20
	Sg2A1GDns96zijnQ+gs8Pci4WxXYu1Pu9xfcJi5b1Wm1THWVAtnwN7OBYRQ0tfI/3yJS
	lNpqLUCMi299EH6b7c5ccOTiKi38pdsXvNNEIxOvxo3S3fwjv9NxXvduLRu2lQHakOc+
	ndcjldBOA6yVGFKbkxXxSvxV3KANTzZfajlZNLAWEOq+S7y4ZcWYJB7hFgCs9RvP7fmJ
	+spQ==
X-Gm-Message-State: ALoCoQnZXkaXoaQ3Sr3ZK53IGANsvIUu2Iw9hNmccR/4taM4wc94OMuK0ZsIn7ThQajeRCIGI46l
X-Received: by 10.55.43.129 with SMTP id r1mr24445839qkr.104.1445596843543;
	Fri, 23 Oct 2015 03:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Fri, 23 Oct 2015 03:40:24 -0700 (PDT)
In-Reply-To: <1445506427-15720-1-git-send-email-wenzong.fan@windriver.com>
References: <1445506427-15720-1-git-send-email-wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Oct 2015 11:40:24 +0100
Message-ID: <CAJTo0LY=QaJ-a9U=59_RgJAxR+LJUciXQiBv=jujHHVDR6SDpA@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: set development_version as no
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
X-List-Received-Date: Fri, 23 Oct 2015 10:40:44 -0000
Content-Type: multipart/alternative; boundary=001a1147ba9e59292c0522c33e59

--001a1147ba9e59292c0522c33e59
Content-Type: text/plain; charset=UTF-8

On 22 October 2015 at 10:33, <wenzong.fan@windriver.com> wrote:

> +-development_version=mym4_isbeta
> ++development_version=no
>

I'd say that a neater fix would be to change the logic in autogen,sh to set
beta=no in the find-version logic.  There's a chance you can use the
argument that taking an upstream tarball and re-running autoconf shouldn't
be considered a development release to get it upstreamed then.

Ross

--001a1147ba9e59292c0522c33e59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 October 2015 at 10:33,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzo=
ng.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":314" class=3D"a3=
s" style=3D"overflow:hidden">+-development_version=3Dmym4_isbeta<br>
++development_version=3Dno<br></div></blockquote></div><br>I&#39;d say that=
 a neater fix would be to change the logic in autogen,sh to set beta=3Dno i=
n the find-version logic.=C2=A0 There&#39;s a chance you can use the argume=
nt that taking an upstream tarball and re-running autoconf shouldn&#39;t be=
 considered a development release to get it upstreamed then.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147ba9e59292c0522c33e59--
