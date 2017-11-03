Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 012647830E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 22:26:04 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id t188so3161424pfd.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 15:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=hSOGdlp2B3rrEhvejB5KvhV1mGtRCVxblHvaWYs1ww0=;
	b=VXXmqa1kPIgqpkZ7JGIGPUxuV3B/MuvAWa/1qoJPGLN4Q0dep9YBe3JhhpHM2Zm0x8
	2uuNx0gcg7x5G5sZ2V/+EaLFsiOjGLBLuxxtT1bdG/7pN3iNx3x/1qD4bnOBhqbB+JQS
	VBNGT0S+vRadKjb+8l43D6xPCGdFi7SQyvfYIvNWNtI277475zSAMYpihYofuy7wMU2+
	L/sAwf8C8HDZ9Z8+Rp/yaiXXByloCWM4U7gHbJbud2gq140vzvKE3LmRRTeBhyoIyNj+
	PkxiLA3b8GtKn5XEOCt0nHDaG14AKPtDbr1Phbq8lxaj9Xdlmlx9m5Cfw4Lp/FjN2Iec
	9nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=hSOGdlp2B3rrEhvejB5KvhV1mGtRCVxblHvaWYs1ww0=;
	b=myRpJ7ciCR+ZtR78wLslWVoB7ZUe3t/eINObPQzXLTDQKU9WH0Jgjf2xffS40p3AKi
	JjenknJ0sMU2esC+ZSrcLI3tieKOrO83uuyvdX9QJ6HSfiqn2tHLeY+ZzHY/FwSBu+sX
	XlZmKzEvsCU+0ugEr7EQgOTgVnZ9hMMvc+VrhuXjAnpud439wlzwGcvZoCmYl4vdC7em
	EEMX18FXXfm+29t5P3pn+h6DT+3/1FVa6iGoUiWmsu7+M0Qe9QyQVCSNCm6ajb15v6Yx
	wWx49TRGm/ey6m1FltUAZLQl5RtOIOLwA4nlPy7EbeE9oYI5CUzAVtJaB+LrDbaKjINY
	08pA==
X-Gm-Message-State: AMCzsaUOT1jiEVgWwbPLxHNHrs5FXwqMKq65Mx0hn1+fLfas8BGSwIyQ
	rBSh1dhKTsbFXAig7PPvNO3d8w==
X-Google-Smtp-Source: ABhQp+ToopPuOZ2xSc4AcyQ9oCtOjnaTJJI8h35SJCLHYiuhdbv6U9z0aMFTXt+x/JosCzgtULyJ2g==
X-Received: by 10.98.131.68 with SMTP id h65mr9122059pfe.148.1509747966177;
	Fri, 03 Nov 2017 15:26:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:78e5:dcc3:4839:af44?
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id u6sm10874340pgo.9.2017.11.03.15.26.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 15:26:05 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>, akuster@mvista.com,
	openembedded-core@lists.openembedded.org
References: <cover.1509205113.git.akuster808@gmail.com>
	<1509441974.11219.1.camel@andred.net>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fbf3c353-463e-8551-8236-43000fe84415@gmail.com>
Date: Fri, 3 Nov 2017 15:26:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509441974.11219.1.camel@andred.net>
Subject: Re: [PATCH 00/36] Pyro-next pull request
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
X-List-Received-Date: Fri, 03 Nov 2017 22:26:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/31/2017 02:26 AM, André Draszik wrote:
> Hi Armin,
>
> On Sat, 2017-10-28 at 08:42 -0700, Armin Kuster wrote:
>> Thomas PERROT (1):
>>   Avoid a circular dependency between do_concat_dtb and
>>     do_assemble_fitimage
> This is not in master, and I still think this is wrong.
ah, ok. patch removed from staging.

thanks,
Armin
>
>
> Cheers,
> Andre'
>


