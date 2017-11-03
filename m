Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id C33646059E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 15:10:57 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id v78so2714711pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=RSXPii5YDXr0+Zd9Lck1Kt4AuSRlWD9m/ZgjT9VP9g0=;
	b=Pfda2kLH4C9bjaNXTHt4O/p3E5q/f+JWiTrrepfWDvP3m4pZUC2ShYIcc7okCsaCH/
	kO1qQY+q33nQPk4puDgG6R3yxIFGaEAK4uGm5Rx7KQ4gxQc38XRm6V7177tatR/Miiff
	eaUF6BM8ocTW63YPfHKV/1SQ9mVRPnuotV3y0gUQyU91p7E9xpHWnk7SZNitllofErYM
	rdgIB97zi7I7X3hdGW8PQfrgd4FKU8vyMNAh7f7I/SYpnYuEUK4dDhld3AUGJe6Qv3aQ
	A9bTtFvFCPCVBJeFt4WIYH7twm0Kipwjyt8CfEq2JaylqgTlHXtv+i/Om8kAOe3VSt+7
	ON+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RSXPii5YDXr0+Zd9Lck1Kt4AuSRlWD9m/ZgjT9VP9g0=;
	b=nUHYvM+cSWST23kNj/wOabIrZ0YopG6QJS9hghjmjHeL9bft6DsKZVYIpESqjHXRIR
	Etci/Qy+h9kOnlnyC9KnDSmU8v2NChkZArjPsM8LLlxZD92ZdD4bhbQJDkRocDSmBDIY
	G7+FRey3BAwWvJvBfLh3hzzUimfPUBV9owXNjRXhWhl25pw04yFEEFoOGinVYPUQNT9+
	4crU0LMVnyasdCVEB9E5+x9iCVUhSIx4eHsPJRqROw/JSGskaH6nZy9agMPUVmWaa15/
	C+UXlixdP06hSNgeWo4FnXUCSEuzyEnItba2ERe7Fegkd4BvB9aJK6D6RYn5HO41nfZn
	F0gA==
X-Gm-Message-State: AMCzsaUrT9QQpZqMZoDvpy0YgH5OKWWGpKKK5R6oudo53sTtpo0hE/+C
	Ij1Xr8lFeJ32h3WGS4p8nufrhQ==
X-Google-Smtp-Source: ABhQp+ROa+ndmh0qPpVC80Qw8zeJM1YbZTpq2MmdACSeCv4tKFBOu6Ct5IhFalJPZwLbbY+fwJOa/Q==
X-Received: by 10.99.2.214 with SMTP id 205mr7370417pgc.375.1509721859294;
	Fri, 03 Nov 2017 08:10:59 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:78e5:dcc3:4839:af44?
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	125sm10990793pff.14.2017.11.03.08.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 08:10:58 -0700 (PDT)
To: Andrea Adami <andrea.adami@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
References: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d47497dc-619f-1f66-814a-bf93cc1d0227@gmail.com>
Date: Fri, 3 Nov 2017 08:10:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
Subject: Re: Backport gcc7 fixes for armv5e [ARM] PR 82445
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
X-List-Received-Date: Fri, 03 Nov 2017 15:10:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Andrea,


On 11/02/2017 01:46 AM, Andrea Adami wrote:
> Hello,
>
> the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].
> Bug was fixed recently, apparently in revision 253892 [2]
If you have  a test case ie qemu settings, I can open a bug and handle
it that way too

thanks for finding upstream patches.

- Armin
>
> Khem, please take care of this, thanks.
>
> Cheers
> Andrea
>
> [1] https://www.spinics.net/lists/arm-kernel/msg594654.html
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445


