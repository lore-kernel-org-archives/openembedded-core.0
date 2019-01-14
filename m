Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0FED4745D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 23:09:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z5so816077wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=CGuddOnULtcbUs9dQULrtgSF0vXQD4gOriRrCdRdOBQ=;
	b=B9cCsDqqLiPVSUsCFNTxhjXYGiAsGa9j1VNq1SHqfVWbDr5HFNtuXP0Zubz5mmYZl3
	DiOllFcuRhZiDXXm3tWjXEvumNSmDiHwsDaWCcKTIZv2yZBAB/RAZz0wqEm2ihkbjfO/
	eurZXpDCUJ26Xdu+jD16n9xXsgALcICuMWHDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CGuddOnULtcbUs9dQULrtgSF0vXQD4gOriRrCdRdOBQ=;
	b=aU7MCcQdE5Jp/Va41hEqbQ3R1Nox79O6BnPPj7iuUsr01eMftiYUVxrrM7of2AjqNJ
	5VFPQhSmotkLynsdt8Thdaea1N3Q2oumXvIzebS6JHTb/cXS8oY5F2YcpWBkU2Ebfhbp
	KsX+3ZaQfjGAIttRk8dCe5MbGFbOuQuAuyEaIxRm5PF2SGT/CrFMOZsFKB0hvuOBNLQc
	wpz+VziBO/SQv7yeaHeP6rSx4mv3vZdCAjf29ddw1ZzdYIrxrFr673OqLE5Dc4K1H63f
	ZCoGwSGrKjjhBF/TATnfgPgnH9cgTV2bD1RwR4TFiMZAgmiw9Ui5bwKpjm2rTkOgwHLp
	8nuw==
X-Gm-Message-State: AJcUukf8hReY4MBin26Tkc5vOz700P+UY4dJ1/mOE5tj5cU3iquyzBbg
	2PjoRrMhDl8JH+2Lin+m2C99kw==
X-Google-Smtp-Source: ALg8bN7XRPXwt4QQZivmB0Vz/piVDCQBv+vdH7/D6dQuG6dLmka97bj4PDH0FMgwlLwre8j0NGdcyQ==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr603225wru.45.1547507365738;
	Mon, 14 Jan 2019 15:09:25 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r12sm86010377wrq.3.2019.01.14.15.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 14 Jan 2019 15:09:24 -0800 (PST)
Message-ID: <185b40016ffcc580b889b2d7ef94779e2b62417e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2019 23:09:23 +0000
In-Reply-To: <CAJTo0LYr5NaV1RR=99kJfdNWG7=jx1Z1nJ+sET1Kd4UAnco6ig@mail.gmail.com>
References: <20190114230432.22116-1-richard.purdie@linuxfoundation.org>
	<20190114230432.22116-2-richard.purdie@linuxfoundation.org>
	<CAJTo0LYr5NaV1RR=99kJfdNWG7=jx1Z1nJ+sET1Kd4UAnco6ig@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] meta: Fix python code quoting issues
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
X-List-Received-Date: Mon, 14 Jan 2019 23:09:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-14 at 23:06 +0000, Burton, Ross wrote:
> On Mon, 14 Jan 2019 at 23:04, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > -    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then
> > echo 'Command failed.'; printf 'Press any key to continue... ';
> > read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> > +    oe_terminal("${SHELL} -c \"make %s; if [ \\$? -ne 0 ]; then
> > echo 'Command failed.'; printf 'Press any key to continue... ';
> > read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> 
> Would it be neater to use r"" here?

Yes, but it doesn't show what the problem is as clearly. We should
probably clean it up as a follow up.

Cheers,

Richard


