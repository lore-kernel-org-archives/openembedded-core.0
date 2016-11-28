Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8927B65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:07:06 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id o141so88960952lff.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2016 23:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HdbcSrS279yG3pn97xhVzUps1jFEp3pef7N/iPvo2lY=;
	b=sfOlzrm6dEq0ZQix8K+SZa/Nd0WRtl7iDLjSMXbJR7iY6yevb3jhXu7GayeXZEaBBi
	aB5dsP0vfuF7WDnl8Q1/sKPnhQFQFIfZQln04QIZhMVuaibCdTuXINpAJwcg2mDWb+xz
	E7g7Kkw0c89tU85HUJAuzO3KCgior7LfwdUouKe1mbcl7qA5wqXBKOUikoiU/16tiByL
	70ej2OmUC38DQ1OWRQHXx7zYvSuTarDY5MW0csU4jzqSC4BpsJrk//y1EizC2LxO+wAM
	9Zi8UQOb6CEukbfEffMj7UkDx5NEVo6z4jfFMpubUwvHZ0eqlQfuePQ2Vy7d5aOWWbi4
	I44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HdbcSrS279yG3pn97xhVzUps1jFEp3pef7N/iPvo2lY=;
	b=PcBLrTvOZSrnO+Si0/QVspp5t0p8D5o1lewEPhZ/hZHkcDrRphXD1ED2IMLMrXOcOk
	iupKsGU4MqncDZnUdxaRSkHsbPYT8qpfOD4Dq6DMG5L9HfW38Ulh7dBCg6vM8eU70Pfr
	+c60sSNW4iNuqqcF4NTKT9dX7d/Ejt2scvhMUTG4Y6T50GtsMcVVSo+sM8YXMII1xyeK
	Zk2uVSeN7ToGrFp1/C25K9+DB1V9CkDtKVdHEeCwaNsYtvsCOh6K6JSJXHD0CLx5qp67
	3miVk4004UbYun9TvPE67gHFtlFQpvL9ye/FYO8njgq7jKJtWACqLKktJrxroS8ecbKd
	g75g==
X-Gm-Message-State: AKaTC01ri22MO3g6wfSLxGFAlzApTMos1/HY4YrjqYmrvih7l6/I1Mhjh0qn5f6OuXzwdw==
X-Received: by 10.46.33.101 with SMTP id h98mr10074201ljh.53.1480316827187;
	Sun, 27 Nov 2016 23:07:07 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	64sm12546838ljf.17.2016.11.27.23.07.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Nov 2016 23:07:06 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<CAD4b0_KP1V77ny5yP+WVJMSVMojVKFQPa-Gq0-4-cne2e19dDQ@mail.gmail.com>
	<2d3560fa-adce-8c5d-10c1-289d65b28da1@mender.io>
	<20161125163332.GB4830@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <c74d1583-9f57-65d7-1631-36b29fb17165@mender.io>
Date: Mon, 28 Nov 2016 08:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161125163332.GB4830@linux.intel.com>
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
X-List-Received-Date: Mon, 28 Nov 2016 07:07:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 25/11/16 17:33, Ed Bartosh wrote:
> On Fri, Nov 25, 2016 at 01:35:53PM +0100, Kristian Amlie wrote:
>> On 25/11/16 13:28, Maciej Borzęcki wrote:
>>> On Fri, Nov 25, 2016 at 11:15 AM, Kristian Amlie
>>>> +                # Disallow '..', because doing so could be quite disastrous
>>>> +                # (we will delete the directory).
>>>> +                remaining = path
>>>> +                while True:
>>>> +                    (head, tail) = os.path.split(remaining)
>>>> +                    if tail == '..':
>>>> +                        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
>>>> +                    elif head == "":
>>>> +                        break
>>>> +                    remaining = head
>>>
>>> Why not do this instead?
>>>
>>>     if '..' in path:
>>>         msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
>>>
> would "'/..' in path" or something similar work?

'/..my-file' is a valid file name, so no, it wouldn't work. I realize
that this would be uncommon, and it makes the check more complex, so I'm
ok with making it simpler if you want me to, but we have to trade
simplicity for correctness in that case.

-- 
Kristian

