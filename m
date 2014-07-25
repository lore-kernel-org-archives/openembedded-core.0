Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 97DF27025E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:58:07 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id v1so2602935yhn.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pK+qZRxXEMbS9MkxyflSl/HtRD6AMMXpSflErRGXNmI=;
	b=LcRoIVx0R7BNn/hDowotTkLSwMbA5r61vh6Tvl1MupTbqQoPeXys2CX+YoaRYi23VH
	CpxIPvzDx9OQH2GCvuMCWFRcjJVGuoejB35DAWyiV6z8OYkqv5OkjXJ4s6GvJu4WMG7H
	qJH2oxQP96Bj5jyqN+ehBBlnWSuWhZHAqsUjy5WzB/7VgbvZ3VrQrViWBxCjeQTdAGO0
	Vo8t84N1MXui/TKlDdva5XcBzQ2kYIc2C/6bZ2aNg/DKnuHlOZNa8UkuCy/iRo0L6340
	gfZs6YErJFP8QrEcKSbSZyV7Rn3o2qv09V+KaDadbvKS/efTRUuR4m2P5dUDHqMjg3mn
	S7jw==
MIME-Version: 1.0
X-Received: by 10.236.179.69 with SMTP id g45mr18643508yhm.81.1406260688559;
	Thu, 24 Jul 2014 20:58:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 24 Jul 2014 20:58:08 -0700 (PDT)
In-Reply-To: <CAJTo0LasH324O-sO-AvaY=wRWX0h+FOV4cPtiYK3cKzx3gqcmA@mail.gmail.com>
References: <1406011764-4955-1-git-send-email-b50113@freescale.com>
	<1406011764-4955-4-git-send-email-b50113@freescale.com>
	<CAJTo0LasH324O-sO-AvaY=wRWX0h+FOV4cPtiYK3cKzx3gqcmA@mail.gmail.com>
Date: Fri, 25 Jul 2014 00:58:08 -0300
X-Google-Sender-Auth: 3PZgqLq7iYNIdwvkME97Za-vi3o
Message-ID: <CAP9ODKoNGMAw4_HM3=T=z98NzEdj+7jMAn=rUxrgHvgRgRegMg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: pass rate of input segment to output segment in gstbaseparse.
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
X-List-Received-Date: Fri, 25 Jul 2014 03:58:10 -0000
Content-Type: text/plain; charset=UTF-8

Hello Ross,
Hello Zidan,

On Tue, Jul 22, 2014 at 7:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 22 July 2014 07:49, Wang Zidan <b50113@freescale.com> wrote:
>> +Upstream Status: Backported
>
> Presumably this made it into 1.4.0 so should we instead simply upgrade?

I fully agree.

Zidan, could you work on this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

