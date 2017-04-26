Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0FC779C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 10:02:37 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id u75so70180916qka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kp+I7NYxGQgEFlwk7XE+pBHAXqrPtZx40Bnal8+LMt4=;
	b=QG8wAfWsMBOuMpICguUv+vOBPZQl+h6a9W0InT98LWxnf7/tBFThcDCWhEBp10pSfs
	Nhhor3/EDs4rKKk/G6IUno4bVbZq6nn32rIzZL4xAgKipr+p3X0xJ5hpcZlxexF1QD4b
	wy5hfrMul8+XpKtRX0O2BVguCM33uCGmbUGGpc/ODcwrFC/f1Nn1bBif6PIz0tvJFSfF
	SIyIvaVHDrkFIglCT9ze3HseqcQKBGnLXMdqKHqiHrb58XZAuTTLsIGq4HDFxFfV5pKD
	MDrz+7AeQnXgZUqJ0y5HYOF7oHL+jsoiRyPM03OUsgFQV4KJHLPyotGkpOORAR4czvAN
	EDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kp+I7NYxGQgEFlwk7XE+pBHAXqrPtZx40Bnal8+LMt4=;
	b=b7PTCiCzZDgUGfbPjhFGWAKxnqfpSR6I8D8h8TsrY1JL179yjTAncWKkRN7McVoygh
	7m+ITgyfmppypZDuVt1NzsmRUeJyLYQxKgckl9nfK0sbqOAV5TDuWsU5N9PfFpKdQ1lx
	XIWvkqlbRMreEoAM4wjigRnwMtRKbYh4koTjuz3BS4AroUvVLmyj9ZK5f3YViwHcozhF
	tVCnJNOgQyzavHDSKKJbLn+PfHF5ziv+l25f+DtdwNkaJgJ1Zn+TWVgqEjGG4LXMCHk1
	bnrn+XbkNoDrWvpNv69kpCi4bBJqtxxHsyVDTDS1hhGkPjmCFWU40hVO+bCCqJB9tEum
	kpvA==
X-Gm-Message-State: AN3rC/4wsnzatEJHmq6z0j47wXTBojOcMvO63tsGjREQxuNSdZQeoSFd
	h95A533z0Ba7PwA3zLja6kl27ODKqeBz
X-Received: by 10.55.214.208 with SMTP id p77mr37430625qkl.121.1493200959276; 
	Wed, 26 Apr 2017 03:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 26 Apr 2017 03:02:18 -0700 (PDT)
In-Reply-To: <CAJ86T=WFN3wnnpjhw4qdvqT_hn6A1Jaq_U0uk5bVUXR9omy93Q@mail.gmail.com>
References: <20170421210948.2656-1-raj.khem@gmail.com>
	<CAJTo0LYL1QxkdLi6y=DKe7mMoHF8U34ZDzNbUKY1+or1xxrWyw@mail.gmail.com>
	<CAMKF1srYE2zaO3WGxqRExpx10zkyC8Gb+OnQ76TD8zt0Uam7yw@mail.gmail.com>
	<CAJ86T=WFN3wnnpjhw4qdvqT_hn6A1Jaq_U0uk5bVUXR9omy93Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Apr 2017 11:02:18 +0100
Message-ID: <CAJTo0LZ0De7zWQzgxEap1bAqK1htAjuMDqRWN9JbP30RTqfg2A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub: Fix build with gcc7
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
X-List-Received-Date: Wed, 26 Apr 2017 10:02:38 -0000
Content-Type: multipart/alternative; boundary=001a1149d4f8c1a9a5054e0ef001

--001a1149d4f8c1a9a5054e0ef001
Content-Type: text/plain; charset=UTF-8

On 25 April 2017 at 23:17, Andre McCurdy <armccurdy@gmail.com> wrote:

> The 2.02 release seems to be almost ready:
>
>   http://git.savannah.gnu.org/cgit/grub.git/commit/?id=
> e54c99aaff5e5f6f5d3b06028506c57e66d8ef77


Awesome.  Would there be an objection to consolidating the recipes down to
a single 2.02 in master?

Ross

--001a1149d4f8c1a9a5054e0ef001
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 25 April 2017 at 23:17, Andre McCurdy <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gma=
il.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5"><span style=3D"color:rgb(34,34,34)">The 2.02 release seems to be al=
most ready:</span><br></div></div>
<br>
=C2=A0 <a href=3D"http://git.savannah.gnu.org/cgit/grub.git/commit/?id=3De5=
4c99aaff5e5f6f5d3b06028506c57e66d8ef77" rel=3D"noreferrer" target=3D"_blank=
">http://git.savannah.gnu.org/<wbr>cgit/grub.git/commit/?id=3D<wbr>e54c99aa=
ff5e5f6f5d3b06028506c5<wbr>7e66d8ef77</a></blockquote><div><br></div><div>A=
wesome.=C2=A0 Would there be an objection to consolidating the recipes down=
 to a single 2.02 in master?</div><div><br></div><div>Ross=C2=A0</div></div=
></div></div>

--001a1149d4f8c1a9a5054e0ef001--
