Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id C7C4D6B446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 19:34:21 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id u16so7936954iet.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 11:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IUKkFpGeYbv9nqU23f2jqDmPhkg2S3wDrbmkNtf3iJI=;
	b=EGdDLTMX3W/YT36YjPCgNv8++pyeckC6wiJrlwsBYqhccAaxur8/HD/imNXHgvAcLk
	F73tin6TAvsjiwrD9n5REJ9Ei0Pmr29mXQUFjrQp8wVk6vSIt+WvoUFxVI9Vv1eDypF9
	q5CkVuAC10WN2jzpDrOOZyQXciqcuutdY1OrKKMRlYaLmRG5egu3UbeBdi1tlJxFDCv7
	sNXkgd0i/sbQm1wqiUzLfurOEPhFt1jRNUf+Stm697L/47qv7QSK2M3LwS27bvOwNHDc
	iIcxD5J1aofzj41UQphiPFzJ8jklpVYu1YVveyRHHL5GMH23DgvzK+Y73s4ExgWP0h3r
	Bwkg==
X-Gm-Message-State: ALoCoQmi905izrUAux0cVrQKbrCyZxx4ROw3mGFdsuNcRYzNyI43GClnDM1c3QDWWXoheIDSEJdM
X-Received: by 10.50.30.166 with SMTP id t6mr20778729igh.7.1389641662666;
	Mon, 13 Jan 2014 11:34:22 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id ft2sm19874228igb.5.2014.01.13.11.34.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 11:34:21 -0800 (PST)
Message-ID: <52D43FBC.3010705@linaro.org>
Date: Mon, 13 Jan 2014 14:34:20 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>	
	<52D42D89.4050106@linaro.org>
	<1389637527.19023.4.camel@phil-desktop.brightsign>
In-Reply-To: <1389637527.19023.4.camel@phil-desktop.brightsign>
Subject: Re: [PATCH 0/2] Cortex M3 tune fixes
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
X-List-Received-Date: Mon, 13 Jan 2014 19:34:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/13/14 13:25, Phil Blundell wrote:
> On Mon, 2014-01-13 at 13:16 -0500, Trevor Woerner wrote:
>> Since OE is generally used to build Linux distributions, I'm rather
>> curious to know why OE would include tunes for CortexM3?
> Well, Cortex-M can run uClinux.

Is there an OE layer that adds support for building u-boot and uClinux
for Cortex-M3/4 [1]? I've been searching, and seem to be coming up empty.

If there isn't, then I'm back to my original question :-)



[1] https://github.com/EmcraftSystems

