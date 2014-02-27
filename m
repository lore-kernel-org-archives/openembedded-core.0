Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id A31A66BD75
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 19:59:18 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id p9so2018618lbv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 11:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=VH5nY9bZlLQCSBM2BT0CM/vbI11/2dtX5osjyUi2Wa0=;
	b=IxEjNjazQT3hrl8i5pcO4tIlGBaaly5hfV/d+CWU97NPoskEHS+vh17F9eojCtWc5G
	L3srk91WmH79FBRzqpOmpfNXKguVXmHHamzLzcHmDyiskxFpTgcc3k2nM+xV16nyloki
	4U6pX8rDau/8DZh1FZ1WbHzi+fFDuxsLf84kc3V5N4j9wz07TxifzTeO9CdSfmLt4Ks9
	jD3eku14avj9RB19vV6Q/yP62OsM4iEjxmpCDfLWvxFwRlMiGlmt4OsZlf2/PZlYKEyN
	W5W7tNzG2MDkXTue38DMR8X6oduAB45IKULfHusNa6AVuYBBCsjiDcyPUHWa+HGviQ4w
	4Inw==
X-Received: by 10.113.5.167 with SMTP id cn7mr7385544lbd.1.1393531158821;
	Thu, 27 Feb 2014 11:59:18 -0800 (PST)
Received: from [192.168.43.169] (c-5eeaaa2a-74736162.cust.telenor.se.
	[94.234.170.42])
	by mx.google.com with ESMTPSA id rt7sm722180lbb.0.2014.02.27.11.59.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 11:59:17 -0800 (PST)
Message-ID: <530F9913.4080704@gmail.com>
Date: Thu, 27 Feb 2014 20:59:15 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>, =?ISO-8859-1?Q?David_N?=
	=?ISO-8859-1?Q?ystr=F6m?= <david.nystrom@enea.com>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>	<20140227142404.GB3534@lpalcu-linux>
	<530F4D46.1060401@enea.com> <20140227151815.GC3534@lpalcu-linux>
In-Reply-To: <20140227151815.GC3534@lpalcu-linux>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Thu, 27 Feb 2014 19:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


On 2014-02-27 16:18, Laurentiu Palcu wrote:
> On Thu, Feb 27, 2014 at 03:35:50PM +0100, David Nyström wrote:
>> On 2014-02-27 15:24, Laurentiu Palcu wrote:
>>> Hi David,
>>>
>>> My comments/questions below.
>> Thank you for your detailed comments on the RFC.
>> I will return with V2, where your comments are addressed when the
>> general approach is Acked.
>>
>> What do you think about the general approach ?
> I think the approach is ok. I don't know a simpler way than this to add
> package feeds into the image.

OK, there seems to be no screaming objections from other parties either.

I'll resend v2

Br,
David

