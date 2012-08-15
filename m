Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T1V9k-00041F-7J
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 06:24:32 +0200
Received: by lagv3 with SMTP id v3so578756lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 21:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=6FKDpNtfbmhXbj/DdNtHaf4Ljsnl3ZeOJZH6OIzselE=;
	b=DQ7iqW9jdqdn2UevZsINk0F0TrvxH1SpjBORZMyBnP3335hSannurb9Vo1E5ms4JZ4
	VkfuOmm7Rva8ZCZeTn/s/f4P2BxjU4qmtqpJWZf5B7FnKL50j/rn/tqVeYEsT/jQsyxb
	RwHyTAjVXcQd4RJ15mYdKFFIEHv2wxA5Bid+eWIB4XDxg/3z14XGwCNkEgYacA9JYDm2
	5BqUA3RoJoQPkBrUV0INQwX7zDSym3vRai7Y6A3WtbfMzs4yP7WX7fddi59Bngozd+vW
	Gzf9U5Fx7+VLm4aTr1EwHJpJXBr429QmnQV93+vy+csynXvXM5grtgqgrvZ6WL/aNTsA
	xsPg==
Received: by 10.112.51.195 with SMTP id m3mr8722077lbo.17.1345003956654; Tue,
	14 Aug 2012 21:12:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.5.104 with HTTP; Tue, 14 Aug 2012 21:12:16 -0700 (PDT)
In-Reply-To: <CAEsOVNdyF6DSM0aU6NgEJ6s11g5TTD+GJdXPyTXZv4HrY-VZ9A@mail.gmail.com>
References: <1345000125-3865-1-git-send-email-b19537@freescale.com>
	<CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
	<CAEsOVNdyF6DSM0aU6NgEJ6s11g5TTD+GJdXPyTXZv4HrY-VZ9A@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 14 Aug 2012 21:12:16 -0700
X-Google-Sender-Auth: 9dSsqvPLfzslanSMI9JUpK09TeU
Message-ID: <CABcZANmHkcwmgSPAXD6NwrOfjtgD+7Hvo8X4O81WWZbhPBiMbw@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: udev: update rcS to auto-detect hostname
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 04:24:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 14, 2012 at 9:06 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Aug 14, 2012 at 10:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Aug 14, 2012 at 8:08 PM,  <b19537@freescale.com> wrote:
>>> echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"`
>>
>> $ echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"`
>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>>
>> is that what we want ?
>
> I think we need an option to turn it on or off and or make it
> configurable from a BSP layer. We are looking for a way to make a rfs
> for all e500v2 or e500mc, etc and say the right machine type on the
> prompt.

This sounds like something that really does belong in your own
supplementary layer, rather than oe-core.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


