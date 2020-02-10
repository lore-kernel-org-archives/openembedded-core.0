Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id D3F2A60CA1
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 11:21:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r11so3902051wrq.10
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 03:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=EV7Nj4ZlYV4k/kZIQxYMJWBPL580sD/DWf//OLlh8+s=;
	b=XOjBzJmptyAY94s/yLuaF+7sVTlhAlpFHngLctCeP03Y8yXMUA/TRePLCtBuNeN0Ws
	eMMOoobaUhp6/ACUp7MT1Pz1Zy4TdL2//97aaquLRfVz4x3Mg+eHHnzXO0MuqYtB57FX
	fbsg5tXN7gB34QDQILC+EZEbFHL65QMg+ixQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EV7Nj4ZlYV4k/kZIQxYMJWBPL580sD/DWf//OLlh8+s=;
	b=LACGgveNr/oCZ9771jpS0tPGAm7s5THAWn7vEnA/Hz7qvrqXCrzm/p9oNskccpL8EQ
	/7gfyfu5Kne+9w4X3Lmp1cTYS8IDK7A++bmvE4Ph+PT+ynkOt+4oIXUf71xWoN75EL1A
	8TU7uQrldl/+XLNia/I9ufLrOoKoSB1INQqdAIfvAwubjBXxwDZ7UipgNc7rr789Cjd3
	RD0WGvSCE66ay125lfdJT6iHnfvr/7kdtbGyk0OxSOlBe2ir0W/Vbm6/QG1S2JiCdwzq
	U9dR//Um1xhEFUtJFI3eyZ5rqXA25pRSVQRAcXzQDcqYoGDoMVxmLpD5Pskhwb6fetFs
	pbAg==
X-Gm-Message-State: APjAAAVamOEyGOfhZ+CQGBlgOKje36xZ0QI2MYBRpspOVHwtws6pM/Uf
	yN27D95nPLfO1fsV3fHc1QtGHQ==
X-Google-Smtp-Source: APXvYqzBm5CX2+eAi8FH9iQChXKY+OmpEfj9aU8iCJA6BtGY5CVcxIupz+hs7Zr0aDye8B3JVOv11A==
X-Received: by 2002:adf:f012:: with SMTP id j18mr1485768wro.314.1581333709285; 
	Mon, 10 Feb 2020 03:21:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i204sm142259wma.44.2020.02.10.03.21.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 03:21:48 -0800 (PST)
Message-ID: <7acbab1fb3fb8eb0cfa69beb54b1214345e5ba30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Schrempf Frieder
	<frieder.schrempf@kontron.de>, Armin Kuster <akuster808@gmail.com>, Anuj
	Mittal <anuj.mittal@intel.com>
Date: Mon, 10 Feb 2020 11:21:45 +0000
In-Reply-To: <2cd46664933442f788e7d5ef62b184eb@XBOX03.axis.com>
References: <cover.1581264380.git.akuster808@gmail.com>
	<e84c869d-1f1c-fdcf-4994-02277ab9d266@kontron.de>
	<2cd46664933442f788e7d5ef62b184eb@XBOX03.axis.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: [zeus 00/29] Patch review
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
X-List-Received-Date: Mon, 10 Feb 2020 11:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-10 at 09:55 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-core-
> > bounces@lists.openembedded.org> On Behalf Of Schrempf Frieder
> > Sent: den 10 februari 2020 09:07
> > To: Armin Kuster <akuster808@gmail.com>; openembedded-
> > core@openembedded.org
> > Subject: Re: [OE-core] [zeus 00/29] Patch review
> > 
> > Hi Armin,
> > 
> > On 09.02.20 17:09, Armin Kuster wrote:
> > > These are the additional changes to help address reproducibility
> > > issues
> > > and additional fixes we would like to be included in 3.0.2
> > > 
> > > Please have comments back by Tuesday
> > 
> > I have two questions/comments:
> > 
> > 1. When I look at the zeus-next branch, why do I see only patches 7
> > to
> > 29 from this series applied and what about patches 1 to 6? Am I
> > missing
> > something?
> 
> That is a really good question, and one I too would like an answer
> to.

I tried to help Armin by staging a few patches related to
reproducibility and it was easiest for me to do that via the -next
branch. It seems I mainly caused confusion, sorry :(

Cheers,

Richard




