Return-Path: <sadlife1990@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id AB23777AB5;
	Fri, 21 Apr 2017 12:35:46 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id j127so10446068vkh.0;
	Fri, 21 Apr 2017 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TQ7U/WJH3/37Q3kBaQWZtN6ROKkLyXTkpOTpWMeItis=;
	b=QRSAG+jmJw8AciUqIBhGrLajYo+NeQMudNQV1DPsVHzop3B/jbG+6n3aIKtIp0E0R/
	8q96cDfV9F37sNFlyykNMqBXgu2wSN1Vp9/GpmUSZw3An8zEb871f/VsvbZ75lKxb6II
	7O8OuFChyevTCYpifdU5CVH9OQ3+seHnJZ+0fOSR9u+2XWUDAumD1rNOltAuGfJynz6W
	SpzjROjbNd6+AY/PQ5iKIdZFpAQDBD6y06GKYaGhcnWRR4KkhDIrVuwBqk5WHzDbwzhw
	8HyY/He+BVaIYTd+zTi3+gv/yZlNdGZN/cQ/ODADWCrJtm+Wj4NvazIQnvuyC7GlLzUk
	oQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TQ7U/WJH3/37Q3kBaQWZtN6ROKkLyXTkpOTpWMeItis=;
	b=VaeHzobMwEbYtOXSJRbPzyx2Wwl6t5OfsHmagfp51exB2YJDY0tx+/Mx1j0fg+m9rn
	BNbHmrkJP/VXDHSmaO7qFOAiCKhgRTlgmQh9oN/IDSq6IdEKRgyhLM64mWRr+Ed10LHy
	jeu0oBsCfNJ+3HsArJcebEZ58mKjW1CnMjqojno4NrSZgcTBSXRWIK9rdAcGyXzsUvep
	R7wnE8dwp2HqtG8N+pJVtiuUohqfQqx9JpLtSzDGp7VGlwSZsX+wSWlA9N2sj4Nm2Cil
	9WIf99qWnJtHA+8N2x7LttSYUb0aFbUhJhH20jnBx/XPN8r/ffOR7MSinrtmUz2O406U
	84hw==
X-Gm-Message-State: AN3rC/7+jf1YZwPPu5qZev8/VWWZnofWYqNHJsdIWMK2zCiBXo+P4wu4
	4yGdOoJeWGonYGz/FErAnXykXUIDb+XB
X-Received: by 10.31.8.144 with SMTP id 138mr4794045vki.144.1492778147897;
	Fri, 21 Apr 2017 05:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.32.105 with HTTP; Fri, 21 Apr 2017 05:35:47 -0700 (PDT)
In-Reply-To: <61C0517EAD808B429A1DE2DD9164D40030F88502@IRSMSX103.ger.corp.intel.com>
References: <CAAHuHfyWegZ3OYy97i_+r1DXQ0v_YsozhV7VLeqwepiUWnZ1kg@mail.gmail.com>
	<61C0517EAD808B429A1DE2DD9164D40030F88502@IRSMSX103.ger.corp.intel.com>
From: Weng Josn <sadlife1990@gmail.com>
Date: Fri, 21 Apr 2017 13:35:47 +0100
Message-ID: <CAAHuHfyMfe0UG6s4PW5udhz4zG05+e9FoJKn685wpsYKY+csjQ@mail.gmail.com>
To: "John, Maxin" <maxin.john@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto cups serial port support
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
X-List-Received-Date: Fri, 21 Apr 2017 12:35:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you.

Best Regards.

2017-04-19 10:18 GMT+01:00 John, Maxin <maxin.john@intel.com>:
> Hi,
>
>
>
> Generally, cups serial backend is supported by =E2=80=9Ccups-filter=E2=80=
=9D package. You
> can find that package in the =E2=80=9Cmeta-printing=E2=80=9D layer:
>
> https://github.com/rossburton/meta-printing
>
>
>
> Hope this helps,
>
> Maxin
>
>
>
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of We=
ng
> Josn
> Sent: Tuesday, April 18, 2017 3:25 PM
> To: yocto@yoctoproject.org; openembedded-devel@lists.openembedded.org;
> Patches and discussions about the oe-core layer
> <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] Yocto cups serial port support
>
>
>
> Hello,
>
>
>
>
>
> I checked /usr/lib/cups/backend not inclued "serial" backend.
>
> How can enable cups serial port ?
>
>
>
>
>
>
>
> Thanks.

