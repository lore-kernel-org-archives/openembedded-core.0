Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 063026BBF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 16:03:53 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w25so2089571otm.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=HmazlZRMaM0N5kC0+0wt6QaEft0uQ0dEBgTU4jruCI4=;
	b=neVMPbKSxCQu/47Vs1JtDWcrE4kuSzvKj0E/SmjxRmpOfEyymAzM+9Lko2M0j0L3Qm
	+/sLWTPG+1SAoWNPOx83zCtZAIjKm4q4KMHVqpYEuB4llmqjbTesWdwEPGdFg2iDHCrc
	3+txH00LKPNcFHjzrDlKluWS/YYkm++ii6gMU8KaHI5zV5wH8EPk/1JW7skv5exJhvb9
	Pt2Uj0JhtXdW3r6Q3iAudMQ2day6DxLoSWJttdQEnYBu2OH6EBeCjx4KubbxwG0vBptp
	7aXQ1L/MkSM4MY6xfRTJ4KO8KNoKmNlN60RLEZMyKzjx/+jzk021FNJBRx5GLbGMCke/
	7hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=HmazlZRMaM0N5kC0+0wt6QaEft0uQ0dEBgTU4jruCI4=;
	b=iMzr/2aY21ezKafh5b0lzoe2N963IfyKMywmj5b/lqZiVgNgF46gzdQOzMYkzTFlBH
	PryhxNbvBpzyS/58aouToTeY7tdZwhEPZlwf7pHdFxU4CeLgPZSm6nWW9YzE4bBCe6lH
	5tvpn04iVDnwDAb0eZJkyEDgS8XVJXxGA0ruMHAxUMgBktsOEzHkSATjGr5iTTMlAxy/
	BErttYivVmhex5d4vh84U7rmEOjiI9JkbWKOmz6qgxv0uuecJYwCt3+Qjg3Y3ltj8yoq
	atsSMD68KFuUjQQpBfzzFJbGhRb34lNuyMgx17VBQEW2xlKhUiKTyb9OlsFb01+wcFas
	cZkA==
X-Gm-Message-State: AA+aEWaxNFNYkLLCF1PEIwU2rpJWJs8iX9sVgjnL2yaG5MxCO664LmA3
	uLLmiZ/0Qd06X8STVttMznWWmOFeKvcwbzMt
X-Google-Smtp-Source: AFSGD/UR76WIavcaxWZzRMMSgk48PPnvh4Pn57BdoitgWFfhCudaDJt6tMDzMIOlUr7yppaCBoDf7Q==
X-Received: by 2002:a9d:2cd3:: with SMTP id e19mr1377392otd.363.1542729833398; 
	Tue, 20 Nov 2018 08:03:53 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
	[209.85.210.43]) by smtp.gmail.com with ESMTPSA id
	v126sm5793183oie.16.2018.11.20.08.03.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 08:03:51 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f43.google.com with SMTP id i20so2148686otl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 08:03:51 -0800 (PST)
X-Received: by 2002:a9d:5325:: with SMTP id g37mr1574936oth.253.1542729830671; 
	Tue, 20 Nov 2018 08:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
	<153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
	<CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
	<CAJTo0Laecf+PnBPcg9qgHABvGwBEr+n7Sze3-OPp3OvbYBvJmw@mail.gmail.com>
	<CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
	<4881796E12491D4BB15146FE0209CE6468197CB6@DE02WEMBXB.internal.synopsys.com>
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468197CB6@DE02WEMBXB.internal.synopsys.com>
Date: Tue, 20 Nov 2018 14:03:39 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo3Mgc2DHSaNtCp-rJmhUasan4siJzzxf=wReWJSV0_Rw@mail.gmail.com>
Message-ID: <CAP9ODKo3Mgc2DHSaNtCp-rJmhUasan4siJzzxf=wReWJSV0_Rw@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 16:03:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 20, 2018 at 1:52 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
> > -----Original Message-----
> > From: Otavio Salvador [mailto:otavio.salvador@ossystems.com.br]
> > Sent: Tuesday, November 20, 2018 6:49 PM
> > To: Burton, Ross <ross.burton@intel.com>
> > Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Marek Vasut <marex@denx.de>; Tom Rini <trini@konsulko.com>; Otavio
> > Salvador <otavio@ossystems.com.br>; Alexey Brodkin <alexey.brodkin@synopsys.com>; Patches and discussions about the oe-core
> > layer <openembedded-core@lists.openembedded.org>; linux-snps-arc@lists.infradead.org
> > Subject: Re: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
> >
> > On Tue, Nov 20, 2018 at 1:40 PM Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > (hit sent too early)
> > >
> > > Of course how big are these tools, and is it really useful splitting
> > > them up?  If we're talking a 10k binary, is putting them in separate
> > > packages worth the complication?
> >
> > I think it makes sense to split; we are building an embedded system
> > build system and granular installation is a must have. Using PN to
> > install all tools is a win win combination.
>
> Please note we're discussing _host_ tools here!
> So do we really care if there's one more utility installed on development host?
>
> And if someone installs those U-Boot host utilities on the target then most probably
> this target is not super embedded any longer.

The tools are commonly used on host but this is not a limitation and
there are use cases where we may want to include it on target. Also,
it can be installed on SDK (nativesdk packages) and being able to
install what will be used is a must for me.

I am not concerned about the space used by it but for the choice of me
pick the right pieces I need, and not putting it all together.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

