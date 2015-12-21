Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE4B6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 11:27:34 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id wq6so98509808pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 03:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=PHHAUl9zmu3gFKwYURA1yrQVPgKAJjj0daFbEDoYB/E=;
	b=jN+uBJ+47fBBOWvd8X86ykuBLU269EhCPBpML9JrrpQ3HkqpZp9H5r5f3rg67Xco9F
	3YwoGIdIRSRWAHr6BP42zul7qGnJzBl4vMHsbacs+EIT6S70wTSGW/7+zBx75oYkexAK
	jRNarETwdtpeRyjNWT0+uJJL5F/zDKP68lzRaCk5eP/tZ/m4ihPwkhABvZU7ghZS8kzw
	4XKBY1b5zQrFcPkRZjKENajX2sSyQFcyNS8GiF4u3IYLh4OKhuq+QgkLpJ5wQKYuhY30
	D64bHSFwk0AFvdhDkn5pc/6vxnre/8C2hfDqPKuOudrZVtzTtMLgNhlfKXiCyEm/7bkY
	MzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=PHHAUl9zmu3gFKwYURA1yrQVPgKAJjj0daFbEDoYB/E=;
	b=D7YUDDYPhiDNkTWgr2rTjPD4yHRU9mN5v89sr/7+QnIhoNlcEjGLwOH0ppDtPXDY4K
	eckyM++ED5WvZ6RSZVbwa4JcirANPtdoHXDKcoxyy+524QmJQhJphnzECLG7mzzj6E4O
	M8YwZNv8ftAQ6Cf7b7ggnhqfVCa7nsHkL8730+sLtQvcI3QlhaJ8EW2BcWxSa1ZRM1Wt
	mEldu7vhzBQnzs5xcKkpkE7DdqKiUGIfzDj6GY0yPeHTChQjlURYmNdLES5a/xABw0DP
	impIiKBTIjjPfysx+S2+u6VwB+yi7OYggynTENCqXd0DwoQWhGcfHF0WuN9y3e87vFzM
	2J2A==
X-Gm-Message-State: ALoCoQmMfY7B/vm/VH726hp8ZrZXOADfO0I1xH1LvGbLBr/FHnHA8ncom5iYI6lHx+iuaicVyr0G1BzFeT2c4ppZzZo2reRmPQ==
X-Received: by 10.66.124.225 with SMTP id ml1mr25955333pab.81.1450697255462;
	Mon, 21 Dec 2015 03:27:35 -0800 (PST)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	ux2sm38615315pac.46.2015.12.21.03.27.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2015 03:27:34 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id n128so70812738pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 03:27:34 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.72.216 with SMTP id q85mr26330315pfi.95.1450697253952;
	Mon, 21 Dec 2015 03:27:33 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 21 Dec 2015 03:27:33 -0800 (PST)
In-Reply-To: <CADkTA4OLTmiDHTwHec+Pnyhs_p-kLZp=yD2k4GOpc-LB-7sEUA@mail.gmail.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
	<0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
	<CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
	<CADkTA4OLTmiDHTwHec+Pnyhs_p-kLZp=yD2k4GOpc-LB-7sEUA@mail.gmail.com>
Date: Mon, 21 Dec 2015 09:27:33 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoENbVi-ALn-2PWdW9pv1BfGbyejBQrf7md3bH3FnJFCQ@mail.gmail.com>
Message-ID: <CAP9ODKoENbVi-ALn-2PWdW9pv1BfGbyejBQrf7md3bH3FnJFCQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] lttng-modules: fix build issue against kernel 4.4
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
X-List-Received-Date: Mon, 21 Dec 2015 11:27:36 -0000
Content-Type: text/plain; charset=UTF-8

Hello Bruce,

On Sat, Dec 19, 2015 at 3:44 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sat, Dec 19, 2015 at 5:05 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Fri, Dec 18, 2015 at 6:44 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>> > f4b27072
>>
>>
>> Use this revision on commit log; latest is not accurate as it moves during
>> time.
>>
>
> We'll disagree on that. The patch has the commit hash, repeating it in the
> commit message is not necessary. It's like patches saying "this patch", or
> explaining what is obvious from the patch. Both are not necessary.
>
> If Ross wants to change the commit during merge, I won't complain, but
> I'm happy with it, as is.

Commit logs are suppose to have the information useful to understand
the reason of the change. Latest hides all behind it and does not
communicate anything. I don't think expect people to read the code to
know you bumped (and to which) revision is right.

I am not the OE-Core maintainer but for any layer I am, I require this
to be recorded.

From me, this is a NACK!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

