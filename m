Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F40176C0E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 14:07:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w13so19574312wru.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cGnNSE31SGFEtkKLB1xzcDJKACSbJ+MDOkzLpCKX9+o=;
	b=Zff0bmqOfhmRlXG+jnDyAl2jmW8VMK9ze9SKPOWYfzR2y9CwX7YzwclfYotyX2743H
	MMNO10iGfYn+5w2qkSNDV/aJFln/E97jPaguyLOxgFoK6ZPVOZOduNxiSF6a04cPwQqs
	pApdmr+0fi5VbrA/VkyM2ysA1tosqcJLgYjSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cGnNSE31SGFEtkKLB1xzcDJKACSbJ+MDOkzLpCKX9+o=;
	b=C5jcmPO/lAnoQ2j9y2EOJy92YjrnZGt5ysT9214Uex4O8Slxhz3FU/jMQKz7jugWNy
	1G4beFXlPhw0ZjCNmE38WuxX3g7V5LzTCr0IKvVHiOuTV3jByRmvgbTW1fb4I2BCESm5
	RgsNEFyZGD/sE/LCrl4nhWQGUkuN/gJluEYs/FjjhFsJv8Oh4IGjsgBtPvW4Cb9vz64c
	S5zerNlgpARh2l0ocuy6YBGXlVlyL2Q50R8LKph9rX1UMFhVEzBbrF6BkLOX903DCT4T
	KXsCFcguU5c41mDeGw08E1//ZtX1gUox59p0BCW8wMfOItTm0guWqR5ZfD+3le51dHBc
	+NXA==
X-Gm-Message-State: APjAAAVuXIgxTpOLCEtp198goDY6zPq6rIbRZ7hy+IfjQPt3wTFp3QZ/
	tB4J2gx7vYJOjiJnxAMUXoI4pw==
X-Google-Smtp-Source: APXvYqw6OaVhZr0FCZglsfoEEzNF9RZDSC5zyuidzFdGmRGPT7dmn+Ro49F1Johq5XoO17e0ab+fKA==
X-Received: by 2002:adf:df91:: with SMTP id z17mr18139167wrl.336.1559743640698;
	Wed, 05 Jun 2019 07:07:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v67sm5226936wme.24.2019.06.05.07.07.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 07:07:20 -0700 (PDT)
Message-ID: <475d4dd14074b72d371b62dec836eab666e7c807.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Jun 2019 15:07:19 +0100
In-Reply-To: <20190605140130.14968-1-pkj@axis.com>
References: <20190605140130.14968-1-pkj@axis.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] package.bbclass: Clean up writing of runtime pkgdata files
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
X-List-Received-Date: Wed, 05 Jun 2019 14:07:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-05 at 16:01 +0200, Peter Kjellerstedt wrote:
> This introduces a variable, PKGDATA_VARS, that contains the names of
> the variables that are to be output in the runtime pkgdata files.

Its a good cleanup, I just know how people are going to use this
variable to write out all kind of other data into pkgdata :(

Cheers,

Richard


