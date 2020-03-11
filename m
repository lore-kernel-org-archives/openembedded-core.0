Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 65B2961B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 18:41:33 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t24so1663025pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ek0s7vVgFGJ70Jp78CN2cRQIx1hVc/Ph8bCwM0HQUCs=;
	b=iQOGZcyqt4LMIMkfGpQqZ8Ew9/lmneLPIRktAi9wDfuLx0j3VXyVE4L8QEafw/Acik
	dZdwtSHvWVbGfas7xo0/aM09bTQzQwT1StyE9ULOXkgSj0xHAwm4DPpRnkxAVDCQnSY3
	QAodtblg5g3BMnXmFhB7SmdiBmzXdNThbIPBed1Z74LhqpXoINe2FY/IQt428wdhE0iM
	5t6eXT+iDd6vXL9JkY01gYX81exXCNRTDttM7HMAHH/awcyC20Al9CcrV6Wb3Pp220tK
	2K3xlJo3JEMRl3+u40vnAi/GApa3gLNn5HMqJDHbXFoTZvqkEE65IdEgLvEzm2faZSoR
	yI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ek0s7vVgFGJ70Jp78CN2cRQIx1hVc/Ph8bCwM0HQUCs=;
	b=lYA4nT5+wONRUTCc4zGV1VuOtRvFuDe/DS1Ako7RU/FBvlP6O8KYHUNsaefy+gdYSJ
	LAVr6tD1ZCgZkdUvRqq2io3kvS3pyuavsXuvl1f2oFmVM323/RutpSs2e66VuZllBO0K
	PWUB1IAPdfDk2nR97bE7dcYFk9aepoPuX/RfMpHaeTiF98GdgbGC1R1T7f3TYl3A6EI8
	55X51qNpv3zf0bGwB6yGnLTFxzWhs9ZyunT8pcm1y9OJow3BewPCh4i6oEo4DKNVxvOz
	UeVn7FEDC1vvmcl4FCIr7oOjYXmEPaZER6rfyhr6YnV6nkTWMuqONf+le2GH3Oj4pZ2t
	0FNg==
X-Gm-Message-State: ANhLgQ34S9YKsFCZxs8BOM0RwSPrM9h6FR1FlIvCfY2xKQd6XVtY5go4
	ZVIGGnox18BDOrg1sQ8FDe7xsrWUFeM=
X-Google-Smtp-Source: ADFU+vv96c09LAz9ptinSWkTsXzjDT0FVmVfHg9B2iWGGd94PVTFsICYNl2Kvr6gNgOa+7VEMC1xSg==
X-Received: by 2002:aa7:8548:: with SMTP id y8mr4252065pfn.166.1583952093690; 
	Wed, 11 Mar 2020 11:41:33 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:e8b9:f87c:18f3:1405?
	([2601:646:9200:4e0:e8b9:f87c:18f3:1405])
	by smtp.gmail.com with ESMTPSA id
	o126sm4967392pfb.140.2020.03.11.11.41.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 11:41:33 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20200311165221.23475-1-domarys.correa@ossystems.com.br>
	<CANNYZj_wh5Xxx38jyzDc6SaFWV9KfVsh=G-k8ceYim=NTi1iVw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <de49612a-fb8e-044b-accf-c87566c15c2f@gmail.com>
Date: Wed, 11 Mar 2020 11:41:32 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_wh5Xxx38jyzDc6SaFWV9KfVsh=G-k8ceYim=NTi1iVw@mail.gmail.com>
Subject: Re: [PATCH] weston-init: Allow use of weston without input devices
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
X-List-Received-Date: Wed, 11 Mar 2020 18:41:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Alex

On 3/11/20 10:22 AM, Alexander Kanavin wrote:
> I do not think we should be overriding upstream defaults like this. If 
> your use case is different, you can always provide a custom weston.ini 
> through a bbappend.
> 

I share your sentiments and we should be vigilant, however in this case 
I think it makes sense especially when we are doing testing on remote 
units or emulators on server farms which may have no input devices 
connected. I filed a bug recently on YP bugzilla [1] which is very 
related to what this patch it fixing. In embedded case I think its more 
common to not have attached input devices

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13828

