Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 483AB71A8D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 19:34:46 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id t4so978898plo.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 11:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6Kh9Dl8NGZYQ/6Sj3RIetwAiakgtF+MnYHlRTn+IFcg=;
	b=m2v/VmOWAzLj5QK/QR3N6KAhqu5s698zsTeOYRmcvEwUKjymvvaZ78iumASFfjRglN
	foaDUUafwCsxB8HmNi1HJb66PGN4t+Zkbb7exdVjGCbzV/ZXMGmp8JFLXVis0VIm1C0q
	+fosZ7cCdDiS0njZzqHY4wrr+MQH/lU6/CBKNRSlCDxnysVT6ooWxC/K327zocE8sVXz
	6h86JdQHXTBrpdImzBbFQ5C5ReDSHh6mnOUACf6U1tnjQPYUjDodnIzbbVl539SWWGAg
	LqztLv8PvjbwLqa4Rf15kab+dyn7omGCsLIsUs78iCw7soCwMO/k2L/9speRP3Yn2Wel
	w7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=6Kh9Dl8NGZYQ/6Sj3RIetwAiakgtF+MnYHlRTn+IFcg=;
	b=HQUfI5MTXr1LQhXNU3W6uv4JOnEOp7OE/w/Y7aSsBJdv75wt9QjZmSn2fFvirq75Kf
	yvglvyQVHEcKHrOuBqNekVl6CtCJNhuDVruOhl5ae9so1mwEoD9KHf7My8NzEWVd/8P1
	0krlZfPv/d45d0CPh64vF0Wy5L7C+Ts7IROCZWE/zq/tjGHEF3iqI5Envr8asL5oKujd
	Bzn0eDEaEhtf99ppgZGP/3TfFAvzTKUXOHdkhRlUsG6XaXK4KNook82q/dF/ZF0q0p6+
	5OwJQFi8wSINFPIpQxg2WgBfpofykfFMsNsmNQY8qyafH/TOhgT6E9EI6UHMT3p23fMt
	s4FA==
X-Gm-Message-State: AKwxytfGMz6YXDbLAZPsAsEpHF5xESVoU73mGRB6sKber0Jg42u+Np90
	KnPP97tVbyysazAWl9iX6r7ex0VI
X-Google-Smtp-Source: AH8x224JuQLMZKvbDugHRRm7x9XiQvRVDaz4DfdBH+kIDCY6Z/nUYCyfsugIZwo8cUMvwbJx7KZHDg==
X-Received: by 2002:a17:902:9a9:: with SMTP id
	38-v6mr17202266pln.202.1517081688115; 
	Sat, 27 Jan 2018 11:34:48 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:8cc2:eed3:a043:ef2a])
	by smtp.gmail.com with ESMTPSA id d4sm5884195pgc.58.2018.01.27.11.34.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Jan 2018 11:34:47 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <CAEQ58siiwEqY-KuFZDuCxyBOZnA2d-Bo8MFWTF9X_AGMfOxmzw@mail.gmail.com>
	<CAEQ58sjaushTPi=PBy-ttCL9XBtsmHN-p=XjZXA1VW-_4aKZRA@mail.gmail.com>
	<CAEQ58sje+LCZnqDykHQ_gvQoNvgCH5QFCa_k2tGfnCd__Y07Ww@mail.gmail.com>
	<CAEQ58sgADk0b5O_7vv=Y6Ru6zX151e3pPREYY2p6fuXEOuqZ9Q@mail.gmail.com>
	<CAEQ58sh+bBzbOxf+dv90jeAe91Pf4J30=VqT2LuFyZfnjwVoog@mail.gmail.com>
	<CAEQ58sivWmT-mnB=zAZRhzgnQFiV3KP9aNioyKu2k2RvDyjW3A@mail.gmail.com>
	<CAEQ58sjNMVASuDU5GaSKqf3Xp6-UC_8gZZEdM-mtQ_pRFNwR8A@mail.gmail.com>
	<CAEQ58sjBMsMhg4a_TWiKH8Vvo7UaGodtPO1GsXCcU0fxqFSa7A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <dc221756-d573-e60a-4f93-8792089ada1c@gmail.com>
Date: Sat, 27 Jan 2018 11:34:46 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CAEQ58sjBMsMhg4a_TWiKH8Vvo7UaGodtPO1GsXCcU0fxqFSa7A@mail.gmail.com>
Subject: Re: kernel-devsrc fails to install the rpm package
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
X-List-Received-Date: Sat, 27 Jan 2018 19:34:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/27/18 11:28 AM, Francesco Giancane wrote:
> Hi guys,
> 
> I am trying to build an image with kernel-devsrc in target and sdk 
> (teaching purposes, no production here) but when packages are to be 
> installed, bitbake fails, telling that nothing provides /bin/awk.
> 
> Looking at kernel-devsrc.spec,it seems that the requirement is added, 
> but following the inheritance chain, there is no trace of this 
> dependency in recipes.
> 
> Can someone tell me what is happening here?

perhaps you need the fixes in here
http://git.openembedded.org/openembedded-core/commit/?id=3360eadb719f1d3b406e6cf48d99a74fdb2f6c77

cherry-pick it to your local rocko branch and see if it helps

> 
> I am using rocko and building for raspberry pi3 64 bit. No other layer 
> is added.
> 
> Thanks,
> 
> Francesco Giancane
> 

