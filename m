Received: from mail-ia0-f181.google.com ([209.85.210.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyXtw-0006Yg-F0
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 02:16:16 +0100
Received: by mail-ia0-f181.google.com with SMTP id k25so5738477iah.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 17:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7hgW2FChagbDHlkFw7vgOEsDk5LecN29ENxyvtkp1f4=;
	b=I3TJIXeR3cWnXd9cw8duO6UvXxaxnjr3JztluM6aAQFHO+8D2A6BBMWat9cdxWzbuO
	J+z6STm7i1WrYBoJwbCT5FYUKPRWO4AKaRXIA5oH9NRfz8rALt91u4qOdAH5dbTJ739x
	AaGGipa6wlZAZ7k9yWj94MUmHMqhiKbNJDwkSLQN4aXgb6ygJvnnPkgPU0hOVgQOHleg
	ifWPdA2lVFZkBLBrzLwxHKL5704qiNNawmDLwpY4IuIw7y9a9t+Lql1vP0CKWM69G022
	2mcd9NJMSKCzM2dlNtUSIp5j5FLzTTMxfgt/Y0/3Z7Adt7T0c4w9opa9eLrWsmAfu9yr
	ql+w==
X-Received: by 10.50.163.104 with SMTP id yh8mr2936913igb.112.1359075642456;
	Thu, 24 Jan 2013 17:00:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Thu, 24 Jan 2013 17:00:12 -0800 (PST)
In-Reply-To: <1359067749.3616.23.camel@ted>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
	<1359064215.3616.20.camel@ted>
	<CAMKF1spCF8ZQ86skFu_V0PHy7_r4n=h3d_6cNF5t3-x36dkoRA@mail.gmail.com>
	<CABcZANmaExGvf_4Vm-+00nkk905an8atzPPR946KOsOWGpwYvw@mail.gmail.com>
	<1359067749.3616.23.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2013 17:00:12 -0800
Message-ID: <CAMKF1sp5f_XG8PyG=et_4WSdrBaOk_sk0ORn-NaJgo7i+_2XrQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] libpcap: Add missing libusb dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 01:16:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 24, 2013 at 2:49 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-01-24 at 15:42 -0700, Chris Larson wrote:
>>
>> On Thu, Jan 24, 2013 at 3:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>         On Thu, Jan 24, 2013 at 1:50 PM, Richard Purdie
>>         <richard.purdie@linuxfoundation.org> wrote:
>>         > Do we need libusb support in libpcap? What does this
>>         dependency buy us
>>         > and couldn't we force it off instead?
>>
>>
>>         its needed to support canusb in libpcap, I would say yes we
>>         should
>>         support it but disabling it would be ok too although all my
>>         builds
>>         were silently using libusb so I think unknowingly may be but
>>         we are
>>         already shipping with canusb support.
>>
>> I'd personally prefer it disabled, but I'd think at the very least it
>> should be a PACKAGECONFIG entry, whether its included in the default
>> value of PACKAGECONFIG itself or not.
>>
> Agreed, PACKAGECONFIG, default off is the way to go with this IMO too.

yes seems good. idea, I will try to go that route. very least I will disable it


