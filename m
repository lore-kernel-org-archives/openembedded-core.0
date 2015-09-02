Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 50EB07702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 19:23:08 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so32318337ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 12:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ai6bouPn+CuNphsH/zPDC2mfLK0YV/hC1rdlkRpg8LU=;
	b=ZjH6lzlzaum6zkQVv6p9TJMRrNlEeC4CxCzmzqhxaK2ieH/6Y+AovJ3SOlS1f29Jew
	NWRdL6sdpVazi63WrwGCivZcIzxmBRdeeU6Lc6vyDotk8CRM4ddO9n4qC3OFnlUHMMvi
	G79PC5X5PWWn5ieBx6nP7ElLwoO95ki66mJSDD0n94wjNSkxseCNG3NrS7RXiz6EVg1U
	WzKbzM3v+LUkR9DqoDdncqEoCAPnfgrhMFXNaDiVX8fksznl/KkBpj3zP78IyMKLvclF
	GCZsbaqUHmi9kQwnPO9GUE6Df31VxXRh03bbHIw+oGaQ3TgX82bAtCKv1dIVrOMfmRCc
	Fzzw==
X-Gm-Message-State: ALoCoQm/c92dP3fxpncZt3iBYyIuMXQzwTRmapR2FwPgu66w+0KwhSr8OrEBDYTP6HLBtKzFqhfp
X-Received: by 10.107.34.85 with SMTP id i82mr36664770ioi.129.1441221789007;
	Wed, 02 Sep 2015 12:23:09 -0700 (PDT)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	12sm19856932ioe.40.2015.09.02.12.23.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 12:23:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so32535649iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 12:23:07 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.225 with SMTP id g94mr5978035ioi.28.1441221787178;
	Wed, 02 Sep 2015 12:23:07 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 12:23:07 -0700 (PDT)
In-Reply-To: <55E74986.1030703@windriver.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
Date: Wed, 2 Sep 2015 16:23:07 -0300
Message-ID: <CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Joe Slater <jslater@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Wed, 02 Sep 2015 19:23:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 4:09 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2015-09-02 11:55 AM, Otavio Salvador wrote:
>>
>> On Tue, Sep 1, 2015 at 6:34 PM, Joe Slater <jslater@windriver.com> wrote:
>>>
>>> Implements ifup and ifdown.
>>>
>>> Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
>>> as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.
>>>
>>> Signed-off-by: Joe Slater <jslater@windriver.com>
>>
>>
>> I think this belongs to meta-networking. Also, what this one provides
>> which is not provided by the busybox one?
>
> We're trying to make busybox optional for larger systems
> that want to only use the full-featured/bloated packages.
> It's not a large tax to carry busybox in a 50+ MB image but
> it would be nice to not require it.

I see; I still think this belongs to meta-networking as it will allow
this to be done however won't add new recipes in core.

If many people start to use this, we can move this to core.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

