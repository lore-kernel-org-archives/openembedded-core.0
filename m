Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id AE80B7017B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:22:16 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id cf3so19410382pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=1gWOdEu9fmP0nt3EvfOffqoOL0Ah88zn5DdwFvI5USg=;
	b=oD6rapJfelL+zpU/RLC6vPSohsxmJeJ3uudMdwfxgGOPZ9vcMhkqSMWSYYp1B2cVWd
	WWPQloicNk/g4pf6xW5+YtfTuH2xmVd+3ARnIiLEMy+pcZWJBebivEFBEH8/d/0xitrW
	anJ3fHEAYCrgIVrczf6LYpJgUSt2jnkwoYk6qObrqk4MUzcZjgK1McT2s0y90yxqT1/0
	i9qYrwg8gO3Y5FsKvQHfFq2zz66a9oy+CPQlnESvACLIWy0TAnfvi2flnilc1N7kst6d
	Sbrvwwq1eJVTheyZ/88zY1Yuk6rj8vjoA98G4QWR2wDzFDXKqmuPRBkXc5qibBwwCGhR
	zI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=1gWOdEu9fmP0nt3EvfOffqoOL0Ah88zn5DdwFvI5USg=;
	b=GMOTXy9Bzhx7NMQ4W5KEJicgALziybw9fBls+h8njwgAcxl+52tX45l0sUdtbS5bx8
	V8jvX3W926AbKxbplnwR8Ox9uRJLk1VXvRTncKvIcrnGPbYapJZVHs7Yq8JgpeCSuEYl
	Acpya3/8sQ2t+4MqsFA6gptpYksnDfE+7RDKrCenpzCslM1xHFOqoVGZfJUMQS/B4oQx
	vRc+tphlKBXdGVqp/sQfJOrHga1NIAvdcaFbAfqShMMqgVW7J7e9gvIkR5SgThXCSSFN
	v0OHSkto9dQsj0wx0fQyYYAfeU0q8rBhQphv+LHLLT+65TtHsYQAaZc6qxVHU4vUYygT
	iQUw==
X-Gm-Message-State: AEkooutZVBGB0lbcULFbah2lTAcLXFQ8YsQOALYFncQlhEmUgTHv0cr4dIBHQnwaKtjBCw==
X-Received: by 10.66.20.166 with SMTP id o6mr135099296pae.96.1470410536925;
	Fri, 05 Aug 2016 08:22:16 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:41d7:99c1:5cc6:c627])
	by smtp.gmail.com with ESMTPSA id
	e72sm28881970pfb.49.2016.08.05.08.22.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 08:22:15 -0700 (PDT)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1608051112190.18419@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <7beea6c4-ad50-25ae-a21a-41f113634d92@gmail.com>
Date: Fri, 5 Aug 2016 08:22:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608051112190.18419@localhost.localdomain>
Subject: Re: where is the safest place to put a single-shot "run and reboot" script?
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
X-List-Received-Date: Fri, 05 Aug 2016 15:22:16 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 8/5/16 8:14 AM, Robert P. J. Day wrote:
> 
>   i have a systemd-based image that, after coming up normally, i want
> to fire off a one-time script which, after completion, reboots. i've
> been told that using systemd's run-postinsts is discouraged and, for
> now, i just want the simplest and quickest solution.
> 
>   suggestions?

https://github.com/systemd/systemd/blob/master/units/systemd-firstboot.service.in

> 
> rday
> 

