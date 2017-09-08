Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4B65277ACB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:12:53 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id q80so7330706ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=s+jNz2/zwGzStIg0Jt421G5MxcjvAp1ZbPBd/TzjmpE=;
	b=wwvHiXHQpG9yX64uEF7dSBYskdqd3sAN6+rBtkyjCRPtJ5zz8YwMv30PZEPYtz1KAr
	DyFBYzJqlqqaz0lBCjUtwRMPwz5s5W+c4pwPCG1u3IYd51Hy/yzDm0aJ9yS95Pc62+SW
	eUEz9tuGG4mpoXJPZcf+EWSTaE7uZumwz5vL+0SoeUEvD64O3wwYJQzGjEPvCU9Hpi+h
	OXEAV5e0aAyvMxq+uZmDDgFhLx3b8Bo9BdmzhdKtcbB3Cz3lvGSQza4HRum5/98DttGu
	dI87OL4Xk8XUFqVATkoFJRFxHzPLXhQDBlmIyB1kA1EDq2ymUYg46ymWPTFQPj0OZZ0K
	is4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=s+jNz2/zwGzStIg0Jt421G5MxcjvAp1ZbPBd/TzjmpE=;
	b=Cb8eKv7+/L1QNxeasafocOFITn5DQJY+l2xJx49tbi35bZ0a7RK0PYkB+Ego07M7t9
	sjS4RAJNZ32GcsqAhf0wHe5faAIcuDj+txm0GtVmucAzsduM1vEtIuW6nGoECOn8Yz5o
	JqqB9FTwgZ0mq5AnF6h+yRzA2F0GgRij5eS8OpUWKsnQSKobzj7XxCHukcvw7o1JSq4s
	KbdzxPION82/0B8FrfVOMEXkDWbw41n85XZELikQWRU7wxZWoLk9pEgd3jNpowi4aaDF
	B2uGg2+sAx8ukfQQDBWl8RjAq56e4gxtuw0Jc6Vy/IQWq/3U9l0R69VCPTLu5DbgFcft
	1GtQ==
X-Gm-Message-State: AHPjjUiL1GIA1iCdl1WR0+k/Ze1HZPvbBANgTn/CCoaURyj99Z1wmbHS
	Cje5NRhReTjwzgFAOrU=
X-Received: by 10.37.187.7 with SMTP id z7mr2262746ybg.81.1504876374645;
	Fri, 08 Sep 2017 06:12:54 -0700 (PDT)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53])
	by smtp.gmail.com with ESMTPSA id m76sm670556ywd.10.2017.09.08.06.12.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 06:12:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id z73so11203467oia.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:12:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBrLUE2pBFJtKeipRDwLi4n1cEARVk7TePgrrJAfRe9oVgx2Bw+yZPpr/PmnH6H6TdChL+aC68fEsGaLbhgjbI=
X-Received: by 10.202.56.194 with SMTP id f185mr2548992oia.249.1504876372865; 
	Fri, 08 Sep 2017 06:12:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Fri, 8 Sep 2017 06:12:52 -0700 (PDT)
In-Reply-To: <CAJTo0LY7LOj73k2eu10sw-6NySPDyencXYXTKDBLh_mrFwLaYg@mail.gmail.com>
References: <20170905015722.16993-1-otavio@ossystems.com.br>
	<CAJTo0LY7LOj73k2eu10sw-6NySPDyencXYXTKDBLh_mrFwLaYg@mail.gmail.com>
Date: Fri, 8 Sep 2017 10:12:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo+r0joo6h2OHsBO_4mugvOxsNvDPEmG54p3RGB=cy_Pw@mail.gmail.com>
Message-ID: <CAP9ODKo+r0joo6h2OHsBO_4mugvOxsNvDPEmG54p3RGB=cy_Pw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Fri, 08 Sep 2017 13:12:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 7, 2017 at 1:21 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Would this be the cause of this failure on the autobuilder when doing
> testimage?

Yes, it is.

I did reproduce the error here and I am sending a new revision fixing it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

