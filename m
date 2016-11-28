Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id DB3B96078E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 11:00:25 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id c13so93046445lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 03:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=fAQyQORFQMm7TiQRiuR/4pNxf6UICQWFDRs0oq7iu2U=;
	b=w5/59YIfv6ufpcbQXPWtsNcYdU6hpy3d8/Qi4USpX947uk2I7ehyZEjD1BMbR6vPlf
	Sdekw1ro8sX9xwt7j0CyZYPeoBrjvhUlse0+OuyO0+97EhRQ3OIS1YnFp0jEwd8g7VGS
	u2+oIPcPRd5KcwXVnQrqE5I3w6XjWfNMuAXyBFiKyuJh9Dt39Jewetfr7khBIKJKRaKm
	rdg9OOoaxt43nBgcEJ2jtxu0UowI7/OY79eINWmWgYUWMVYabz5B3M+EVEvWkkNVDJ9s
	bJFl+vE6JzFq+ldX0jWSImHnJsNmr3zgGOOyP1XhDmXnc764j728v7hqZ8UyKCVEIdBZ
	LNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fAQyQORFQMm7TiQRiuR/4pNxf6UICQWFDRs0oq7iu2U=;
	b=MS1Gs6hz3/7XdlhANVgkjWWCRcMw44ihCEnVeEqk6+eClwOTcCULd95dtxiQ52Slti
	2C9jg6maxfsDVqnLd5qxKUgHZEA6kyVQ3MprQ+EiXare7sPpc6GzG81LAo0mttgVtzDS
	hFe7tC9+zApo5dr99rJLyMdSMsYsQTyvQatsdO2reYgKvChDXoaBnS+B/MNPgaMymi9Z
	uiUf5z4N3QH0KebFyZ9O15zeoogKfQaRIq8cLuxy8liw8ENLc41dvYPjsI9QmwOTUCgP
	r5kWC6lZPaetOexSgYVcf58hDc0AJjsb8cGpxreaD1eI0K2tmGPfO9bgqyuvWUGiRrEG
	fycw==
X-Gm-Message-State: AKaTC007Uu2gPEh+magQLv/wjOKcYDzqVoPQv8+V8FutquM3zuuHBOcZWMrvNteRkR4e7Q==
X-Received: by 10.25.99.12 with SMTP id x12mr6400643lfb.174.1480330826319;
	Mon, 28 Nov 2016 03:00:26 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	a63sm12615718ljb.46.2016.11.28.03.00.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 03:00:25 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<CAD4b0_KP1V77ny5yP+WVJMSVMojVKFQPa-Gq0-4-cne2e19dDQ@mail.gmail.com>
	<2d3560fa-adce-8c5d-10c1-289d65b28da1@mender.io>
	<20161125163332.GB4830@linux.intel.com>
	<c74d1583-9f57-65d7-1631-36b29fb17165@mender.io>
	<20161128104624.GA15660@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <e7017333-5406-488e-04a1-ce90e2a99048@mender.io>
Date: Mon, 28 Nov 2016 12:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161128104624.GA15660@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Mon, 28 Nov 2016 11:00:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 28/11/16 11:46, Ed Bartosh wrote:
> On Mon, Nov 28, 2016 at 08:07:05AM +0100, Kristian Amlie wrote:
>> On 25/11/16 17:33, Ed Bartosh wrote:
>>> On Fri, Nov 25, 2016 at 01:35:53PM +0100, Kristian Amlie wrote:
>>>> On 25/11/16 13:28, Maciej Borzęcki wrote:
>>>>> On Fri, Nov 25, 2016 at 11:15 AM, Kristian Amlie
>>>>>> +                # Disallow '..', because doing so could be quite disastrous
>>>>>> +                # (we will delete the directory).
>>>>>> +                remaining = path
>>>>>> +                while True:
>>>>>> +                    (head, tail) = os.path.split(remaining)
>>>>>> +                    if tail == '..':
>>>>>> +                        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
>>>>>> +                    elif head == "":
>>>>>> +                        break
>>>>>> +                    remaining = head
>>>>>
>>>>> Why not do this instead?
>>>>>
>>>>>     if '..' in path:
>>>>>         msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
>>>>>
>>> would "'/..' in path" or something similar work?
>>
>> '/..my-file' is a valid file name, so no, it wouldn't work. I realize
>> that this would be uncommon, and it makes the check more complex, so I'm
>> ok with making it simpler if you want me to, but we have to trade
>> simplicity for correctness in that case.
>>
> OK, makes sense.
> 
> Would something like this work for you?
> 
>> mkdir -p /tmp/rootfs/bla/bla/bla/bla
>> python -c "import os;print os.path.realpath('/tmp/rootfs/bla/../bla/../bla/../bla/../').startswith('/tmp/rootfs/')"
> False
>> python -c "import os;print os.path.realpath('/tmp/rootfs/bla/../bla/../bla/bla/../').startswith('/tmp/rootfs/')"
> True

Ah, that's a good idea, makes it much simpler, and is still correct. I
will change to that.

-- 
Kristian

