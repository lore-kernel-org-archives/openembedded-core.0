Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A91F661758
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 19:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PLg42jmlz40;
	Fri, 21 Feb 2020 20:12:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582312320;
	bh=5CDZ0XWofjI8/675VX0TLqSUpb1cBgTsqQztHXcBh4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2oYK3gk0weF+6lOq7pKHQaqYuEIHtgePfIqjdW7C7ndmiw/TxC4hywfZP8i2Cy9y
	AdKNqLWBeL+k0IdB6YvQCCR/Qdm55dAOTvOmjO7+V+YrMW0IJgSuwJ78tSteGUbROQ
	RoY8wCBsGfC0opxxDbkIQAFONPnPQu/S/a5TyPC7vNqOgSqVVrUQyWzwK5cZ+G5VTk
	87u53FpC+cXRyFjACGuigML3lBXeH62F2Yx3evAl6I+Hj+6roon9vUslElzDXWqgWN
	bPceb3Hkoz591HHmY1aDd8RxVseqRrx+vt0jBzJNOt8Ft8/qAy+MEm62nv1Ts2OQtc
	Wb8pFaY82u5zJoG23c6ZNo9/cZVLpRpW0BA0Q+e+u8iJqZbQgy+747cIaTR5QBOJZ1
	lI+j5K9qcugfb5u8UkOqg0fUZgkxNgHMcTGkbyjdeVOiNUsAM2JrhzUiXxXLvdtYcN
	jOoapnJs6Kc0rVaL32eqPHRVzK66bBTm1CmEHdaoQksLzk5K8CjuqS3sAY9luc8J5f
	dig41aoISc9m4G1WcG3qvdBp/cvtfFfzrKjklUlClj3UMNEGV7W9kxPRtyVYa8lUqG
	MuwB7xssEb+m/3Gor40SbZjfhNbDCB9cNRnYKQMCnigbdQpFiGmfJjTDXzaxycGoAe
	uvXHyEkPLFfZ95901kD8T/bk=
Date: Fri, 21 Feb 2020 21:11:58 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200221191158.GA20464@localhost>
References: <20200221163420.2383120-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200221163420.2383120-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] musl: Update to final 1.2.0 release
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
X-List-Received-Date: Fri, 21 Feb 2020 19:12:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Feb 21, 2020 at 08:34:20AM -0800, Khem Raj wrote:
>...
> -BASEVER = "1.1.24"
> +BASEVER = "1.2.0"
>  
>  PV = "${BASEVER}+git${SRCPV}"
>...

The +git should be removed from PV.

cu
Adrian

