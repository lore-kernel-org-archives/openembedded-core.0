Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id D7B516FA36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:59:09 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id ks9so215544vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qWjPH0CDwnDX9NSnTyi7PN1NGRiIv5Htl0O9EiTKyOI=;
	b=TRIfIdZiFep2QcJfXSJs2pSXsv2KK+NFPl6h4HXMKtYxqe8wkK1EwAjKiNiT+VKCTO
	8X2X37vKR9GJK6FP1A/bfguyvwNg1qnn3zd/oFjPWTc2xQg0NibIj+bEjgA6ewIqCOYG
	nHgudak0hUB6RSjiCt0ID7QD6SiyAj6nP/Jghpgl+0UmmwF4mYw2hokDAQNQDoKpIjpc
	DlNnQ/mQj6mxRXMr1oEBTBRIowyyflW0NBVy3bZ/IPrPPs5wsyizoIerlD5DQUTnBuUk
	9HuRcyHoaWPFEoF95E3sofRJ4GbGG1ab5M5/SLVOj81y0G02zxuTuIJgiXqibUbSCcCg
	HuYA==
X-Received: by 10.52.249.105 with SMTP id yt9mr378218vdc.34.1396443550205;
	Wed, 02 Apr 2014 05:59:10 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Wed, 2 Apr 2014 05:58:30 -0700 (PDT)
In-Reply-To: <1396443289-17504-1-git-send-email-paul@paulbarker.me.uk>
References: <1396443289-17504-1-git-send-email-paul@paulbarker.me.uk>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 2 Apr 2014 13:58:30 +0100
X-Google-Sender-Auth: Ne1vIcdtKdsL6v_A0DaPk5-mt8g
Message-ID: <CANyK_8emZJeKWeXkPvi-_svWGtqEi_kfd8UijSdMLsvGNnXuqw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libarchive: Add PACKAGECONFIG for lzo
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
X-List-Received-Date: Wed, 02 Apr 2014 12:59:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 April 2014 13:54, Paul Barker <paul@paulbarker.me.uk> wrote:
> This ensures that the dependency on lzo is deterministic rather than floating.
>
> The configure option to libarchive refers to this library as 'lzo2' but it is
> just called 'lzo' in OpenEmbedded.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>

This has been tested locally both with and without lzo in
PACKAGECONFIG_pn-libarchive and PACKAGECONFIG_pn-libarchive-native and
it builds correctly in each case.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

