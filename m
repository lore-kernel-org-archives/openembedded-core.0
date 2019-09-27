Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7117F261
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 00:35:18 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id n7so5178075qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 17:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oWac4DpLMLiQNZSQ60BFQCjJVumCVO7wlnGK2EbmRTQ=;
	b=ipI1LwwEqUz1Yfi6Kmy3Gsr6wB/JFitYqQgeoOJQPd0oC6P5u5/9mHYh9V7ZtPDtxa
	meAr2AFFrE/yodxybwkFCbEwJKLnCBomdjLES0pDPBWQZ8KwXqha0GnA86DNAVE3UYOA
	6Kxs4Sv8NE5LkJ8DCu8Dfg9ooatPBW5Peg0kEH4YvidSb/2Sw63ZxYsIKNDLTeXxP4VT
	wT32mHSgANe2MkeFpt7ga4J+IUKM33odjcimfbkjnD5vv7N5YXNujmdDwkd43BqXXpTw
	9X0MH4y2vcV5zaQPGK8O3q/NUV5SpN3mUnTI7MPRf5O8wDHcXtnRp8RmMEgJnMYUyBHk
	rDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oWac4DpLMLiQNZSQ60BFQCjJVumCVO7wlnGK2EbmRTQ=;
	b=TvvBdJEyt3DU32ZwFDBv2nDwwX+17dHkQo8Wnk5LuR8b9CILY1DoQf4+dIxeGgIqB9
	ODEBJeD8J8zeh6lg47xysab1SeokeJhm2j11a1H90bZTjZUnrf//sRbfxmYlZAXDYx6H
	ZqLnAfrNw4dlYF+ijqLMTtVv4KrdKbpey6ysphOY0uYtUhH4OVt451r80AzWqEZCSFqe
	O1TRFkWme0hK87NKsfngZwJvd6qEQrtUreFKBXgO9MIifEtMEYGgG5ZdS8hD8bHEHC5E
	gF9A/+bAlrwlOSypRYUptdSvoquCADr9n5ksTUJpOJUbOGxmFoTkewACphrICf+pwbIW
	dD4w==
X-Gm-Message-State: APjAAAVStDzsmda24r4RNo/q4IJ2neQuVAcOWyGTnb+K+Zz8/3w2EeiG
	eYzg2teUCYnM1okDJcJ7SAW2zlY7UQHLISdZT0G7glq6
X-Google-Smtp-Source: APXvYqx26qZbMDOhy7IJGNTQlukmI6x4nDlg5VYsuEhFs+SD0+8C9ObtNUiwY/jKkMkkJvo2UKAPlbO8ITH3Z+Sc3b0=
X-Received: by 2002:aed:3c52:: with SMTP id u18mr7219769qte.194.1569544519430; 
	Thu, 26 Sep 2019 17:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <007BD92917A2324FA403BCF9A464CF84FA8C058C@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA8C058C@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2019 17:34:50 -0700
Message-ID: <CAMKF1spQRDy4BpNXjA1mndXb7+Vp+LmxQhKv1GEC0a70d=Y5Ow@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: bash-completion
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
X-List-Received-Date: Fri, 27 Sep 2019 00:35:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 4:17 PM Slater, Joseph <joe.slater@windriver.com> w=
rote:
>
> I see a bbclass for this, but no IMAGE_FEATURE to get the resultant packa=
ges into an image.  Is there, or should there, be one?  I also see referenc=
e to various similar packages, like *-dbg in an sdk bbclass, but have not f=
ound how any of this stuff actually gets put into a target image.  Any poin=
ters would be appreciated.

I guess an IMAGE_FEATURE wont hurt.

>
>
>
> Joe
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

