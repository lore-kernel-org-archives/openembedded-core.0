Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3356B06C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 21:47:04 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j13so4377189ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=gQOplkbgtUWF9L8FnTVggsCdqnanhX8vj/rBBLSzxf4=;
	b=aCHBCjJfk1/mbC48up8+PzG4K8EGSbgzpRaBpnjS0KAGcDqUe+OZKqTNT76dacNdPe
	ZUdy2+vJcdDfKBIqZAqKyBA/cJoEveebM0VpvdQiN82z0EMofkos2/LSsTgoYasB9fEg
	3csDhGb5mNqJAB0zjlmIKoZIoNmsw7Ji09kPfjP5IWRlVbfVDzFEKj02IMXcywePBo+k
	rhv/gp5/OmRWuirBHtdmkTpKK2GJJd8OCVpZKmLzACrpWV6PmMoAuj1uSyFFi+ZMcd5i
	9uyM03wDbC9X8uFJf5iCQaXzAXLJMEn5Y31xSHm+nvC6UsW/t1bpEGHNGvlHBu4XxtAh
	iqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gQOplkbgtUWF9L8FnTVggsCdqnanhX8vj/rBBLSzxf4=;
	b=lAkOJkJKvsSBun/+P1BP3KudsM5vXFEamCxyHcGzNlTJVbNjLFijjKAcFUCVwW1J9t
	9uwVVHSRwb4KUK60kWR101vZkQ5w/Wq/qu0kyP+QbUaUSaJAUxip+AdV6HnuL+tHsor6
	zFy3GC0Whop2meVOTkZiQUfeq92DrOyWwEpgEELh/d4xHLZp1bX9Y9B5Y3+kLYCSy0au
	6DhXI3OvxRUNUUDDsIkM+dgF8JnrFZJaDQytNQ8iMf30oZMFoWoBloI6cuTMqGNT1har
	rlI04vjxEkdOaxa4hoTKH0iskhrfaztGIrNsZ6pEjTZY/7Yv1uvY06SdQAVx/F56Ddk0
	QyKA==
X-Gm-Message-State: APjAAAVMjuakMDSVedB4oKGVzXawB4e4g14JtnvLnkrb0YshoSc5HA98
	NQEOr+E0bbOJm31QJu690YPUtpreZWU=
X-Google-Smtp-Source: APXvYqyTpbE8VtmpP83OsPwCEU2WQJh6L15Yp5hOud2+CxrWGLlyzj7r7U4v/eg06pHYXYFnLno9Ow==
X-Received: by 2002:a5d:8711:: with SMTP id u17mr1704942iom.59.1573681624859; 
	Wed, 13 Nov 2019 13:47:04 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v130sm327221iod.32.2019.11.13.13.47.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 13 Nov 2019 13:47:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20191113212400.898834-1-JPEWhacker@gmail.com>
	<699f5503-7bf3-fdf4-10ed-7c31a55897a9@intel.com>
Message-ID: <ed0b6116-d50f-fd04-3285-ebd3efa51662@gmail.com>
Date: Wed, 13 Nov 2019 15:47:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <699f5503-7bf3-fdf4-10ed-7c31a55897a9@intel.com>
Subject: Re: [PATCH] icecc-create-env: Use OE patchelf in SDK
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
X-List-Received-Date: Wed, 13 Nov 2019 21:47:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/13/19 3:44 PM, Ross Burton wrote:
> On 13/11/2019 21:24, Joshua Watt wrote:
>> +RDEPENDS_${PN}_class-nativesdk = "patchelf"
>
> Should that be nativesdk-patchelf?  Should we just have it in RDEPENDS 
> for all classes?

I don't think it can be in -native due because that will create circular 
dependencies. The script explicitly looks for the patchelf-uninative to 
break the dependency for that case. I suppose it could also be for 
class-target... but I not sure how you would expect this script to work 
in that context :)


>
> Ross

