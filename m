Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 740037886E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 16:08:21 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id u3so10497375pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 08:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7YfhAl6Q3bHS3yb1QEL/AGxwvZHBIjQYk798CenzzL4=;
	b=BV1kJUuL5lNjZoR1l6SYY9wLE8xGNGWMyYC8+UeEFKQYzXdCn1Z28szbvo7MxWA2kL
	JHZ4zgRKWFaAkU9/jA8TLyG2NnzM/wRBdTfyIHQJCHu0hQg8TNSQ+spvPbUkNGws0K5V
	gBztbXAxMIOEMeYbT/y2zj5JXg2O22PUkL9v5oZKPZ6UmuzCblGGPt4tUo7LMWHXiypj
	0kpa7cZI599aupD3p9KM2mXYL55hYaeWh7th8nNnO/1rwHP0LLgpK7qwrCjRCEOT5IMn
	8i2W695fIoLHoBu9xL+N0R9tuDV8PICpH4rYQPWGbevR2sYPJrfR9a/WAHmmvYc8LLTi
	RL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7YfhAl6Q3bHS3yb1QEL/AGxwvZHBIjQYk798CenzzL4=;
	b=BWaxK9KoaWq1SKZjLRsu0tAiRcdJMhWKuv5OvIms0jWpW7Q7+ze2wFcikyz/HHRJ5F
	f1PIu7bmty02krmDq5T6eT/Ax/csleBLxxONN2DG/tpff3IUYK9oM+aKS5y4poD9I3hk
	y3NyOEELSMUWllv6yYALxx8OKGPMGr0bKGP4J1MNjjPTA2Lidwe1OFm6DPTJLxwEBh89
	4kxGLZ5DK07vbCfPuSt/HNsFkzLjywY6TkcufKgIp+P8HlSAneXTdKZnStelpezzjmbO
	uZwK6PpLmw2+ze7gbaWLbWcBJ0Thejo97yaFedUmHd4ieDrBn9iLru53k0yN/s0Mtyrw
	Sk8Q==
X-Gm-Message-State: AJaThX5RhQGVejubSjtH70mqeB6Ju1ZU1BMW5cBx6YVXOyGtNN6C0ZPh
	KYQylAVBqlIN+/QFEBh4u/BCKA==
X-Google-Smtp-Source: AGs4zMYTBqGLE8822pCRanH8XxXeWIxWqUhWQUKRA84qaKdlbiH+LCaQVq+0WRcoJMNdE7owK0s/ng==
X-Received: by 10.98.247.4 with SMTP id h4mr15695888pfi.16.1511280502628;
	Tue, 21 Nov 2017 08:08:22 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:b90e:aa41:7e0b:9c90?
	([2601:202:4001:9ea0:b90e:aa41:7e0b:9c90])
	by smtp.gmail.com with ESMTPSA id z5sm12944877pgb.6.2017.11.21.08.08.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 08:08:21 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster808@gmail.com>
References: <cover.1511222485.git.akuster@mvista.com>
	<fb0a858be004dd7f7be4be564d85ebc088fdf104.1511222485.git.akuster@mvista.com>
	<CAJTo0LZOr7EXUkH7J+_QSZzoKFOpobrExieEcAsNTQXNz0aXEA@mail.gmail.com>
	<58bea898-a1b0-3459-34b4-5e41490bdfd8@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <55a1db60-9c55-d551-b49a-223d38161c7a@gmail.com>
Date: Tue, 21 Nov 2017 08:08:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <58bea898-a1b0-3459-34b4-5e41490bdfd8@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libassuan: update to 2.4.4
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
X-List-Received-Date: Tue, 21 Nov 2017 16:08:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/21/2017 07:56 AM, Alexander Kanavin wrote:
> On 11/21/2017 04:41 PM, Burton, Ross wrote:
>> License checksum changes but no explanation.
>
> Should we introduce a standard tag for the explanation, similar to cve
> tags?
>
> License-checksum-change: copyright years updated
seems reasonable.
>
> and then have the robot do the check, while we can spend time on more
> interesting things.
>
>
> Alex


