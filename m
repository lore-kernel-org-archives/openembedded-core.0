Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A920F65CA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 20:14:51 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so6198260pad.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4aLxMFMOWRokjv8tN2bABXguZIu5pbn2IyDNo/jVRuU=;
	b=BKAd/FbNFWFUUKUdIdBL7caakqmwK2Xa88B+QoHekswYnwp2dQLUkyYN0R5Nbt9wBu
	EZcpYEMLwaUPViiSy3m2bOyXqok1h5+0cXc0Bg99VBqKKchcHcaRwalefkMcLhwZZMj4
	VQlJ6n5KSThCwXP5yb123zLeyhaOY7mPtXDO/WcQAw6w1BC8BlRvadkfJtL8ybGnRtaS
	4EGKPs56vEvZeMoRQDaF1YBkOjCU0Dzh/x3B5MYTxw4dEGQ2WQxPff50g8F8hT3yZ9B2
	Ya0Un/4P4y/kPN1cr+c3MQERtWs9c+iBv3i1DAbR5yHPOhEZ6pk9BPy8X6M/ToGhlBgn
	Wgaw==
X-Gm-Message-State: ALoCoQlF+UleSxR+X1SmBP/fRu7Oscymt0tMVSqxgxWgtIyn0aPMTvl5EL7NbtNlYXeQjBVE0B/L
X-Received: by 10.66.218.168 with SMTP id ph8mr19734051pac.51.1414700091979;
	Thu, 30 Oct 2014 13:14:51 -0700 (PDT)
Received: from [10.7.100.251] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id ug6sm7891997pbc.72.2014.10.30.13.14.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 13:14:51 -0700 (PDT)
Message-ID: <54529C3A.6060007@mvista.com>
Date: Thu, 30 Oct 2014 13:14:50 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, 
	Yocto Project Discussion <yocto@yoctoproject.org>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
References: <545281C5.2020004@linux.intel.com>
In-Reply-To: <545281C5.2020004@linux.intel.com>
Subject: Re: Package Upgrading for 1.8
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
X-List-Received-Date: Thu, 30 Oct 2014 20:14:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 10/30/2014 11:21 AM, Saul Wold wrote:
>
> Folks,
>
> Just a reminder now that master is open again for patches, now is a
> great time to consider doing package Updates.  Based on some rough
> estimates from 1.7 we did around 300 updates from 34 contributors, that
> got us about 73% packages upgrades.
>
> We currently have about 180 packages due to be updated based on the
> Package Reporting from this last week, about 65 of those where not
> updated in 1.7 so should be given some priority (see attached file),
> there are also 10 that need maintainers, let me know if you are
> interested in any of them.

I will take pinentry.

- Armin
>
> Here are the stats from 1.7 on who has upgraded packages (I guess I
> don't have enough to do!).  Thanks to everyone who contributed package
> updates.
>
>       61 Saul Wold
>       43 Cristian Iorga
>       25 Ross Burton
>       23 Bruce Ashfield
>       15 Armin Kuster
>       14 Richard Purdie
>       12 Laurentiu Palcu
>       11 Paul Eggleton
>        9 Hongxu Jia
>        9 Cristiana Voicu
>        9 Chen Qi
>        8 Valentin Popa
>        7 Chong Lu
>        7 Carlos Rafael Giani
>        6 Khem Raj
>        5 Tim Orling
>        4 Roxana Ciobanu
>        4 Robert Yang
>        4 Marko Lindqvist
>        4 Mark Hatle
>        3 Paul Barker
>        3 Maxin B. John
>        2 Yasir-Khan
>        2 Nicolas Dechesne
>        2 Fathi Boudra
>        1 Ricardo Neri
>        1 Peter Seebach
>        1 Peter Kjellerstedt
>        1 Martin Jansa
>        1 Jackie Huang
>        1 Darren Hart
>        1 Ciobanu Roxana
>        1 Chunrong Guo
>        1 Andreas Müller
>
>
>
>

