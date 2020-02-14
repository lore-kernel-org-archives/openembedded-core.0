Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7C08E601DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 01:33:35 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id p2so3578403qvo.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 17:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JJ5+Wworv2DPAxZLU88ESo9QRtf+A9HMHcvYx3jYajg=;
	b=G8i9nU66mEvCdOVlGUN7ldzDIJ1ep46ApeFXgEhK7sah+R8v2D6vz/afFOEx1BOGH0
	QTALsNo+RFBOySJNU/Ci/mLM/ZTEROf2z4B6KREtfgtfKPvvpRud09V+7VA1mHCucE/c
	O03sqrVXFFjkKd5bBWRwG84MnCepCXwUDb0P0qErQugsuC3DSVDbz04rDRCbRSm+Md9S
	q/q+meM7tisr2AKlGrmIULAj9uIWArBaDBBegr4u0ek3teQBoQE91RDkt8ZnBgJ8IqQO
	TbwIsyLo8Od28FepvAVCTsNmS35WnGt9Op640q57RV7GRCA3nzz6kQMdRWOEAW2yMOjE
	9h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JJ5+Wworv2DPAxZLU88ESo9QRtf+A9HMHcvYx3jYajg=;
	b=NAL1uoUzahM51Hiy+NSyM+3hjbBmSHdC1BrMv4jMLaT+mU2Q7luLrTh+NQpOcFBdfT
	DdcGeGMqboOtFvorSG1A8AS30JgZj6Ty6+FLtkNi+2rmcM9vAU0UAGF53h6TSK3nvopa
	39Tc22HuJKXcQenbCLkvTEo7UDazwSwRH5FLUg48W4STfmdxPh7CL5R4CxtrNFsxES0K
	VM6bQOaXWztibENfZfqjt/5ZII8jWhng0LqXMS91BVN7jPNZz9WlsCNdXZU0x54vz9Hu
	Viume/pVLVB3dZ4sWK1AxpR5T0YoB6bZxvVpMZLRVWxnPQCWufGUkw4mfi4FrYVE8xBb
	5UmQ==
X-Gm-Message-State: APjAAAX1NPybQTrVIfjhU1DC5Sh9s5M4tIY/g0BvxIQYV82PtM9bJgTM
	itsa9U3rgZbqycDAu9eKIQHGO202BeOVN40i7aw=
X-Google-Smtp-Source: APXvYqxiaybEF567Y6SZp2W+iLfU7ve6fq68mRRETdyKq/Gw501zxZ0TXhoT6L/MxcOf77K0FghwnA+RB9US50FpTpE=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr261496qva.109.1581644015873;
	Thu, 13 Feb 2020 17:33:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<650b515ce0c79adcbba39cdf47bc23f764ca1465.1581575578.git.raj.khem@gmail.com>
	<ff9fd754f0151c81ef5938f904415ef0a212b8b8.camel@linuxfoundation.org>
In-Reply-To: <ff9fd754f0151c81ef5938f904415ef0a212b8b8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 17:33:09 -0800
Message-ID: <CAMKF1sqhqh8WHasMKbs4vsx_dfpvGqmNXQhfjOA1DJ6V6=QAyg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] gdb: Upgrade to 9.1 release
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
X-List-Received-Date: Fri, 14 Feb 2020 01:33:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 3:38 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-02-12 at 22:38 -0800, Khem Raj wrote:
> > Drop security patches which are now in 9.1 already
> > Forward port rest of patches to 9.1
> > Detailed changes [1]
> >
> > [1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00008.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Something odd is going on as another patch failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1551
>

perhaps pick from pull branch
https://git.yoctoproject.org/clean/cgit.cgi/poky-contrib/log/?h=kraj/pu

> Cheers,
>
> Richard
>

