Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 34A916612D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 08:09:53 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id v13-v6so13048900iob.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n13GM4jAgMjKkDZ9x5/PQWAzO/cyIdBVgIwCwwMzVQM=;
	b=YJk6qNGspkIKNNAoUPSKpiqqij75OaUw3pMsUSKMg/HaQnfZ8skvAoauGqG/ZI6+Tn
	0Hr2ZIjZyLQtFtY/rjrhyaHLQClEiquB1EwKXnhsHiic1ihLVZpG9opBeEZuRwcZu+nT
	+Mh/6vtFWiGgiRPF1iY+Q80Lbftljl49lfnGLdaytABeYY8KAjKaW246perknppq76BV
	xl/ap91hvyaTLgu2gqZZWoSkrdEcgGoadf4gO/vfI5PNdDtuUbdQsTxtqdVo23jLl/Mo
	eE6Sku3PBUn4JecENz+s6qofC7z/WaSupSbE5pkU5hO8vN9sirQSXgg8ei8lcdjau6bE
	KKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n13GM4jAgMjKkDZ9x5/PQWAzO/cyIdBVgIwCwwMzVQM=;
	b=XPPJU4hrm8F2o8NOLvtxXshF0uBCQEhT93F0qN3sB/xwrmyH/5mJJ/E7LxY00hgXzG
	dgUGf3nN5hHfiAfDoGruWkwSNNqXRCyDe1AYDHXVDKGyz2Ynn/UlNLpxO9fCjHIs4EP1
	pxp9oUprBYfNecfXm21QPKz9Mks8nfbbplFww9L9Lap+AS7W2Gwcd2pjFnl4Lnqt1H6y
	wb3PazWNfBv2ZM9mO+ZTc6EskGhLY+2y4bOZgu3Ly9n9YHmYXd849kMOQjnKNhNDte44
	BIHKxTBubqdy5m0aQ4oCamdpZwbxU9E5FvwWMCzhb73mW7Pr/sexRkrEgdP042CwAOjU
	2rRQ==
X-Gm-Message-State: ALQs6tClXyxJxs8AuWFpoN+P+upfUqQqc7aFSORwqdN+tsv5/Dy44jGO
	J/XnJUw83ag7nEQuZ/QmhiyFEyY4leVSx6UNhEmziw==
X-Google-Smtp-Source: AIpwx48Z3R/6BJGd74KqGabPGO1vn1/PQ7NwkGpDoHjj7LV/v/AUustusWh/WOlmDTBxvMy6vA90HBgydbQauhQvfbE=
X-Received: by 2002:a6b:5507:: with SMTP id j7-v6mr135582iob.23.1524298194849; 
	Sat, 21 Apr 2018 01:09:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Sat, 21 Apr 2018 01:09:34 -0700 (PDT)
In-Reply-To: <CAJTo0LbD2vOaKQW7_afZXzRtY5a665mUxThgO+LPjHEAyowbBg@mail.gmail.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
	<CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
	<CAJTo0LbD2vOaKQW7_afZXzRtY5a665mUxThgO+LPjHEAyowbBg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 Apr 2018 09:09:34 +0100
Message-ID: <CAJTo0La18XQEUw2AMnNXxmQCSZacGvsaKv5pK08T387JM5A78g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Sat, 21 Apr 2018 08:09:54 -0000
Content-Type: text/plain; charset="UTF-8"

Okay, fired at https://autobuilder.yocto.io/builders/nightly-x86-64-lsb/builds/969.
That won't be catching people using CC_FOR_BUILD in target recipes to
build pieces using the host compiler, but it will be interesting to
see if it catches anything.

Ross

On 21 April 2018 at 09:08, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 April 2018 at 23:09, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Fri, Apr 20, 2018 at 2:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> Hi,
>>>
>>> We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
>>> today to see where we stand. As is typical we got two new failures on
>>> the autobuilder...  My test build included the pseudo bump which
>>> caused an almost complete rebuild, which is a great way to shake out
>>> intermittent failures.
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
>>> Go appears to be using the target CFLAGS when using the host compiler,
>>> with predictable failures when the host is old and doesn't support new
>>> flags.
>>
>> Maybe worth resurrecting something like:
>>
>>   http://lists.openembedded.org/pipermail/openembedded-core/2016-February/118212.html
>>
>> to flush out similar issues?
>
> Thank you for finding that, I remembered there was a patch but
> couldn't find it. :)
>
> Ross

