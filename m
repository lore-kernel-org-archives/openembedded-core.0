Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 06A1377028;
	Fri, 18 Sep 2015 11:01:41 +0000 (UTC)
Received: by ioii196 with SMTP id i196so52350990ioi.3;
	Fri, 18 Sep 2015 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xeA69o/308J+5KN1WMkfmYW7KgERrwHBnk7EDmuv40k=;
	b=g0sgHwHnSxHjPNWIFho5cyD4I8NdbOtuH7BwuYuZtcwlNQvGvN3XxW7Usgm+3yfmJF
	EkON+6G1XuRh14AA2A7zxLtbkFgSlsgtWmIKneLXZ10V06PURtq3Sc2XmZfZVSXW1yau
	MgSDdr5rTwe1bVzoCWXPuWzTloMP74e2oBbuNVwhDSxLhiQ7lIOw6kaBo/OlMT3k8EKU
	5d85sAM43ZxlpwDHr6bBkrW/H1LFNMzEoISRuwDjHV8b+p1m1cfWC+NOImKCLkxG/ICU
	Q/PONsOwIoJg+VtFvVHpN/yMi1S0ZsoXqn8F/sw9r6HMFs46HNKayb7b9zpjB5qSYWR1
	jKIQ==
MIME-Version: 1.0
X-Received: by 10.107.10.79 with SMTP id u76mr12475963ioi.99.1442574101534;
	Fri, 18 Sep 2015 04:01:41 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Fri, 18 Sep 2015 04:01:41 -0700 (PDT)
In-Reply-To: <1795284996.34316.1442572421706.JavaMail.zimbra@neratec.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
	<e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
	<80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
	<CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
	<CAMKF1so4a85NDgwLOL1RYHyXQTQcAdHJ9FM7yhaJbrnpTzdx0g@mail.gmail.com>
	<2142960116.32810.1442562398390.JavaMail.zimbra@neratec.com>
	<CA+chaQfdK4irH2DvnX-c=4pPHv2VXg3Y81mm6RuP845aJy_8yw@mail.gmail.com>
	<1795284996.34316.1442572421706.JavaMail.zimbra@neratec.com>
Date: Fri, 18 Sep 2015 13:01:41 +0200
Message-ID: <CALbNGRTE-utmwM4nGF8YBrLPCtXLS1tKE=V=2EGB_e7vR3sO1Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Adrian Freihofer <adrian.freihofer@neratec.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/3] systemd: Upgrade 219 -> 225
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
X-List-Received-Date: Fri, 18 Sep 2015 11:01:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 12:33 PM, Adrian Freihofer
<adrian.freihofer@neratec.com> wrote:
> Hi Martin, hi Andreas
>
> You are right, my patches are almost obsolete. Just some details might be
> worth to be noticed:
>
> libgudev might be improved by adding:
> RCONFLICTS_${PN} = "systemd (<= 220)"
>
> NetworkManager and ModemManager depend on udev instead of libgudev as well.
>
Hi Adrian,

Checked the configure.ac of NetworkManager and ModemManager: You are
right - guess I missed the rdepends warnings due to bloated log. For
RCONFLICTS I have no strong opinion. I think it is correct but am not
sure if it is really necessary. On the other hands no harm is expected
- so why not? other opinions?

Can you please send patches with improvements based on master-next?

Andreas

