Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5617665F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:02:27 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id cy9so99640765pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=Y/Ht9kKAEk42Zf0K/+QWXVbP3nxeS+ebAK6UN5BqERk=;
	b=ovjoJlCxe+q+GSJuRTwwphJZXieNUXwfY/Cxw9wDPqyqZgZKEOvMpJ4EDhGSzfmmEO
	VB/PM4DraqYmYHAPEb8Rbec2uTXZgwa3/06C1LBGCG8eqWNG+Hdu/SmaigpN1iGDUmfS
	KMgecigRXVGlzyJU6nLKt0fFyFDJVF04CDqQuMkw+oIPVdMvU1edSTF5MnG3l1BNbUHG
	IWOIyiybft3FDNNnD6bTrKjFdNwaJiCtTepZsJp1T6eKftCejpt+a+Hw9eb9pE4uTmcw
	7IpIMqU9lflrLUfRQsx01Lw1uPw7LVeLmbbrnPI1Iz0TU7J9F4k22rDC6i8xnGR6+jbB
	0KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Y/Ht9kKAEk42Zf0K/+QWXVbP3nxeS+ebAK6UN5BqERk=;
	b=jF2zIKc7nFCLjK5TSV4a251erlOFZa0APixkk6D+pqiK3rnBdiQ7af/X5HndF5mimI
	DhQnBwRs8aQz2++8d4KuOoydF3lbvvQv+VYmO1cuBvE5cWdI/x+s2BpihxM2YzU28H0c
	Z6Wai/BsGvOpi1M5zdRtn6yZc1gCdiwrPhlTUGa9UyxphLEZdlEUWweOAfwY6fR+ftL3
	iQFu96CR8YT3XmxZ6s4kjfVLUPM2wrRisWXNfB2UcyiSdW7DsVMOZsaQ2JOswuLpUB0i
	n5qCURzzzfW7TABeLpSdnPIazJPxiXTSWo9HW0yAWvg0Ch6S6baH2ODYfgj8tsn4ZsPG
	R/ow==
X-Gm-Message-State: AG10YOQO0bDh9OCjgQChZ/mD5CbJ5p/O7jV4zoZQ89Y1m6bReHLhoPbF2ys8LRsfC26vDA==
X-Received: by 10.67.6.1 with SMTP id cq1mr34570583pad.78.1453824148804;
	Tue, 26 Jan 2016 08:02:28 -0800 (PST)
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com.
	[209.85.192.172]) by smtp.gmail.com with ESMTPSA id
	qj8sm2723738pac.40.2016.01.26.08.02.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jan 2016 08:02:27 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f172.google.com with SMTP id q63so103608888pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:02:27 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.42.213 with SMTP id q204mr34875613pfq.141.1453824146977; 
	Tue, 26 Jan 2016 08:02:26 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 26 Jan 2016 08:02:26 -0800 (PST)
In-Reply-To: <20160126142023.GE1652@denix.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<CAJTo0LbSM2W2ZW_T69tSBWVR3Kg_TQXu7W6TqoG6=DivrU4C4A@mail.gmail.com>
	<20160126142023.GE1652@denix.org>
Date: Tue, 26 Jan 2016 14:02:26 -0200
X-Gmail-Original-Message-ID: <CAP9ODKos_BfpAQtmccMcFFrZ6jUvBU_knzwNuzTymFCQvHregg@mail.gmail.com>
Message-ID: <CAP9ODKos_BfpAQtmccMcFFrZ6jUvBU_knzwNuzTymFCQvHregg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 16:02:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 26, 2016 at 12:20 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Jan 26, 2016 at 11:24:43AM +0000, Burton, Ross wrote:
>> On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> > A clean room re-implementation and extension of the original stress tool.
>> >
>>
>> What's the rationale for adding this to oe-core over another layer?
>
> None, besides the original stress is in oe-core. What other layer would you
> suggest?

I think meta-oe is better; in fact the 'stress' package could go there as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

