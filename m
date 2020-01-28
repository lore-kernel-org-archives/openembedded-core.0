Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 44ABC7FED8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 16:18:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so16741339wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LRr1pAZd/GwVSUM+W+delzvOB22C7/KBNO9OZQt32j4=;
	b=Po72AKTYJuB9u0rBiFy1m1veNct0IpGqoIiUY5r5ecKeYv2X5dx/295XI03mfkeF1X
	kW5cQj7mjeCsv087Hosr+2OGFos6iz5zGLPw08KH9WP8aZ8WJDmmmsEn8CJSLtVlMp9n
	9mCFbNjdy1th1LlypBVBaHqYiUkuMtYrq05Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LRr1pAZd/GwVSUM+W+delzvOB22C7/KBNO9OZQt32j4=;
	b=Zt95LNPLM0O/4XQDmlgbxSggT8jleVKI92L2JjjhJnrNzI6OzszjjAhsPhrtoTDzAJ
	C5jlSYCoh/YGaumnGK79B4fNVg09MinpZoRuDxXBSWQ8t2eDP0ozF2Wqn33RzWlFZW8W
	iGUBvn9+CCPANuSEIDxHm9NFFWQ0RjOCYJkNDV7W80sHCrApywBM3c9nreoykfeTANJ7
	zFCfmw87sL7toiJD5KNYiaVc+9fLyoJXnwtjHGCmxmS8C7qNXLq+6fwHmzFFqf4cU0tl
	wludV+2nw6LBf/PSu21PxgI54Ajl7v2TsAkFaQCfK5miqAtcYQ7I5YBRhTJ9bjmqW1LP
	GZiA==
X-Gm-Message-State: APjAAAWSNDyt6T/ioLmSzHAHJT3WD029PrLvS73r54CsJOF/DHCPDNdc
	BMPk1R9+mq9lZe+G4N/1VVkDDw==
X-Google-Smtp-Source: APXvYqzvVgQpr+v5XJM7NIqoMPKAdj7W8x9xH5/PfMGR/IJS+ePOrL4H6DwhAgAWwIE7qlVz9r6Wjw==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr28571996wrw.31.1580228324896; 
	Tue, 28 Jan 2020 08:18:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o7sm3596563wmh.11.2020.01.28.08.18.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 08:18:44 -0800 (PST)
Message-ID: <24e752c17c6babc23b3b04cb74e8792084dc617e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 16:18:42 +0000
In-Reply-To: <a26570fa-a8ff-ed65-80a8-02b8f3067aaf@gmail.com>
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
	<a26570fa-a8ff-ed65-80a8-02b8f3067aaf@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] bc: Use texinfo class
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
X-List-Received-Date: Tue, 28 Jan 2020 16:18:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-28 at 16:58 +0100, Jacob Kroon wrote:
> On 1/28/20 4:16 PM, Richard Purdie wrote:
> > This recipe uses makeinfo so inherit the class which can provide
> > it.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-
> > extended/bc/bc_1.07.1.bb
> > index 4a51302492d..61fc6486538 100644
> > --- a/meta/recipes-extended/bc/bc_1.07.1.bb
> > +++ b/meta/recipes-extended/bc/bc_1.07.1.bb
> > @@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
> >   SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
> >   SRC_URI[sha256sum] =
> > "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
> >   
> > -inherit autotools texinfo update-alternatives
> > +inherit autotools texinfo update-alternatives texinfo
> > 
> 
> Looks like it already inherits texinfo ^^^

Er, yes! :)

The class wasn't working originally so we can just ignore this patch.

Cheers,

Richard


