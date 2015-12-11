Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 771E36FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 17:33:22 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so68334562pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=lMAWY9h6tPIshTmXimrR4XADC9LAvgk146H7btLYN2Q=;
	b=seHKogbqyjR3D+i+syP/OIf+C8lubkk3AIPinWbIdHqQ2MTkXleVZBu5zfdhQc53Pz
	FrRdvMnJA/oEuuQBt9x43rpMmuhr2hogaDsEWAbmcL616MMFPokaP2xFgeYJ/WsmBA3Q
	tdfpJcnsgZGP42IW6FrNBhxvBTRhwDKT+iDZM1UeEwpFqIXDLyvjI28dxQt6n9Urf91P
	ezPbnRWBRxBDNM3b0/fyoez8vCbVQ6eMjphILO9Fqsr8bt3AY1o19DVvIjG9VvvU5A39
	8HVh7rO/2jIRBWtCL42egDlA5BdMej36yLyy316imkh2/5c5WLUSmrpAd97goVEeKv9j
	aDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=lMAWY9h6tPIshTmXimrR4XADC9LAvgk146H7btLYN2Q=;
	b=dV9SLa/DJ7n4mGjnKuy4Fcy/vE/lUIrw4CHEkkbKj3rNJ9DRq9LEJ3NdsmCuGvjy3p
	2SDsTptiz+mc9tikwpjqFINari5YYcRWGDNERSxk0V9PzEISIlwSCw5OdOGAGy92/cXl
	yvHy9KroVTZq7G3Eo/P3q2xrskAfCYOzfKRyL9t+TF+OcHU7e7mzPN2efUQfPUCS1MKf
	p2pTMi7ToEmMdqcZ0E0TTmIYMcikivluiFBQjqD4q+pJRsS8xYZlLAX/l5ORf9Z1DtIw
	vxmT7JIFpBtLaLlcsF2ofquPy0dSdqCO+C+43wVw4wQVZyAQCm4EPSLxwwLUXFp1mt5p
	ELgw==
X-Gm-Message-State: ALoCoQkv7BsyNjQ9XGXPZ8uZbHUozCMc+y4h7ffO0bGV/tRC1porVKplAxtv3kB0ViUnnP4ORdi9Ppc6L414ItYERAoIA0KuAg==
X-Received: by 10.66.162.9 with SMTP id xw9mr6701319pab.46.1449855202615;
	Fri, 11 Dec 2015 09:33:22 -0800 (PST)
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	r5sm26395682pfi.73.2015.12.11.09.33.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 09:33:19 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pfnn128 with SMTP id n128so69176714pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:33:19 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.72 with SMTP id x69mr16861968pfa.88.1449855199488;
	Fri, 11 Dec 2015 09:33:19 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 11 Dec 2015 09:33:19 -0800 (PST)
In-Reply-To: <CAJTo0LafRigufU1PjrRuE=DU1y=MrKS1pNUHM-t8jRwg-5wLRw@mail.gmail.com>
References: <cover.1449850996.git.ross.burton@intel.com>
	<CAP9ODKrkXa9xfTYafiPNXGa4UKGqsyVWpfywge85vgY=xnuOog@mail.gmail.com>
	<CAJTo0LafRigufU1PjrRuE=DU1y=MrKS1pNUHM-t8jRwg-5wLRw@mail.gmail.com>
Date: Fri, 11 Dec 2015 15:33:19 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpmxO=_ro3CPxM0hdpMRqY_vjksT7aVbHyzmKXD0wt2DQ@mail.gmail.com>
Message-ID: <CAP9ODKpmxO=_ro3CPxM0hdpMRqY_vjksT7aVbHyzmKXD0wt2DQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/57] Consolidated pull for master
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
X-List-Received-Date: Fri, 11 Dec 2015 17:33:22 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 11, 2015 at 2:53 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 December 2015 at 16:31, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> > Armin Kuster (1):
>> >       linux-firmware: update to latest
>>
>> Nack! please adjust the commit log to include the revision.
>>
>> ...
>> > Otavio Salvador (1):
>> >       lttng-tools: Revert wrong enforcement of Python 3.0 use
>> ...
>>
>> The runtime test utilities, found on lttng-tools, require python 3.0
>> so the commit log needs adjustment. Should I send a new patch
>> revision?
>
>
> Ah, yes please.

I just sent a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

