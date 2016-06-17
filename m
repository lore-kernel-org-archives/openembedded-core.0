Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 98EFF75D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:52:19 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id c73so94041065qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 11:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/fa107WVoD0POrC4RK9N78jcB5CAIvWIWAh6KouDkeU=;
	b=P4/+g+69F0OHOloczC+NV2HhC02b7uhgF1LbHihrbBvyF2a9rEneFgNVQIZoyocvsP
	pqGtF0Atlu5W7IpWcWC2X0FIOJzwfVlDJtEArdFzAwnhuaQVqyIJII7y+Zh56l8o18i8
	6cCEMG3upWKbLk6ZL8fIqvLu5MFoqUcuA+Ih9vcrfnTFudbgLUo/2g3iV7lJvJxHtsIH
	hHTlGP1FslSiuuynjYL2Mm7niZp78TNEmPXY2bWHxlFaV7kbeHyAVgU24D169BerNVua
	b/9L8bQwQt97qVACM24/AIQxpOu9g8R+oxv81s0NACBpf+BGbLfXEE2UUf4R0migTF8h
	KQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/fa107WVoD0POrC4RK9N78jcB5CAIvWIWAh6KouDkeU=;
	b=QyBF5w4ftpiXVzp6/gPe3AVLLAmfpaXZMiwBEbXJoTTvBlpL6ZiQAsjvYRZMtVLfVF
	iTCZOyH68eEnJbV9CXlwPmuiAFu1GelVEARIyeW893BGiDHzE1XlEEFsxgKFBEMEFVmV
	n9ou4qr1kHSNVr8YOQZAZeyJVyf5ttY2nC/CKTT3XhSAmt44wIbXX2Oe8olvtOE2upMd
	WPm/NzWlhv842Y6i2XPsr9iUgp8WsR/WKjzsEjrXNgPHzgftDX7eTz/omzIy+w4KVXvf
	1rjElie/xmJB4X+KfAq/eHy7Uov2N6h13OKsISYM1sMcww8VTtltRjG2jMGQ+5bfxV5v
	IPlg==
X-Gm-Message-State: ALyK8tIL3LkSEoVEBZUJW7fFttqQZ6SlC4DVY3AtlgbKbHvzziBd5IeREbo66NUcV9i6BOXQCl/9ReuM4DpUig==
X-Received: by 10.200.51.76 with SMTP id u12mr4305646qta.55.1466189536017;
	Fri, 17 Jun 2016 11:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 17 Jun 2016 11:51:46 -0700 (PDT)
In-Reply-To: <5c3ceaf8-f58e-3e21-653f-72623b8a19f4@linux.intel.com>
References: <20160617042358.24237-1-raj.khem@gmail.com>
	<20160617042358.24237-2-raj.khem@gmail.com>
	<5c3ceaf8-f58e-3e21-653f-72623b8a19f4@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Jun 2016 11:51:46 -0700
Message-ID: <CAMKF1spCi5k8e=M1BioYHhT6ZjEhdtVEfqUUNEXzEF-adcQssw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gstreamer1.0-plugins-ugly: Add mpg123 PACKAGECONFIG
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
X-List-Received-Date: Fri, 17 Jun 2016 18:52:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 17, 2016 at 11:24 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/17/2016 07:23 AM, Khem Raj wrote:
>>
>> mpg123 plugin moved from bad collection to ugly in 1.8
>> since mpg123 has commercial licence implications its best
>> to keep it with a knob.
>> +
>> +PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
>>
>
> This patch is not necessary as gstreamer1.0-plugins-ugly.inc already has
> this line.

Thats right. I had a older snapshot of master where this was done.

>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

