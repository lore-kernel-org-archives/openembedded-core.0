Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 121287E06F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 17:52:00 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q17so7573362pfq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WREmUE5dY8iVmYUaQyku8ZFA6gAcX9tDjxgbb+tc5SU=;
	b=EDWUnfz6z3DW0y8AWhcecRM3YRhvPEaVhYSYGGdAcca633ol6Z2T8diP8fP6uXaOSN
	FOhYuiaC0s6c4ZEwp5x0PhOdG9UvQRd70i9qVURik+7suvdUZ3BJwp98eT8Kg2Qhk25S
	y5orUMYuAf+a0sV4u10K574rO5nYbQjU2o/lbi19imDc0YRQVz2O1WqrIqlNXWz0zzIK
	jI6l1OcugtV+15moQ0W2vLdhb9Z8shHqOO3/zKXpfahiGH7zt3nRX4WGqS8Rr/Eb8DE8
	Rpv6cNeaLM5tljXfEDpnR371/wHAshJBlzsFGXGKuBERjVPakYHFBVqyrsZKKAuaB/uN
	hDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WREmUE5dY8iVmYUaQyku8ZFA6gAcX9tDjxgbb+tc5SU=;
	b=IsBCJKgOSReJd/D0U1w9NJZNTl9CedZSgxy8aSVQ9lQIFzMMIewz84iEerCWFq8DCT
	PIPUXvDhvmy9J/50rPSlj8XGEQ9L+y6WU1jO+IpTUcZJLxP7DiNqrZy/8W/Ys4zpdGTt
	lbHJOBnChkiT5QdZAXMDCq2GxVNZZayU39kzjtFNdCTo+jrq5iggCRKLabgVqM9UtrKK
	xJfCnQGCNf6+wIVv8O7GxU5TpoANu/+2oTjgLJ3wzvwOevHGhkVtjqWQVitw4qhSC7s8
	wAiRooIRh8xcrTr//m3prAys5XHXMRe12AQGesrWPVxhYL2n4dJzXgxL4lODN1df4Qc4
	k8rw==
X-Gm-Message-State: APjAAAWqamI4DBiUXP0vj9lyoXFJZMzOsjdULakfThnnb4WQOdCA0/Sr
	N/9DChcmhzTnF3nwqG7cVyBUKouh01U=
X-Google-Smtp-Source: APXvYqxw+gATwJJ9o07VL/Zl37F7WroFNSWP8fzq+arwmd8QH0fM6Io5xC9lYOinkHTJGzScWVM3uQ==
X-Received: by 2002:a62:aa15:: with SMTP id e21mr82533470pff.140.1558374721746;
	Mon, 20 May 2019 10:52:01 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	j8sm3605049pfi.148.2019.05.20.10.52.00
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:52:01 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-7-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3f1540ed-2372-ddfc-fe82-6035233e107b@gmail.com>
Date: Mon, 20 May 2019 10:52:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190520141125.10805-7-alex.kanavin@gmail.com>
Subject: Re: [PATCH 07/42] piglit: upgrade to latest revision
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
X-List-Received-Date: Mon, 20 May 2019 17:52:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/20/19 7:10 AM, Alexander Kanavin wrote:
>   # From 2018-10-26
> -SRCREV = "b9066c7717af1d169a616c9e61706b99ff8515b5"
> +SRCREV = "ac955893c92591c4542439665cae2c3fb79de9dd"
>   # (when PV goes above 1.0 remove the trailing r)
>   PV = "1.0+gitr${SRCPV}"

the date in comments might not be correctly corresponding to SRCREV now 
it might be better to just delete it.

