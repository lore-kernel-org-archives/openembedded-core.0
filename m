Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D5BB660210
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 17:45:02 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id k3so2028156pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:autocrypt:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=T9Rjilqwg1US7EfPTVQUdRV4Kk24nBcSgDD5FaMJF/k=;
	b=hukB07pN/cpZXf/dNJDZLeSmRJ1cIGwbxrJpIr1dI5NoVkAwp4vjd/dgmTBgehE3fF
	CSItzEmdr0Py0KdhhqIcZhXI6LnZq6R/mC+XmbUtUmIdvNRMCoAmwIgYJlk1ISPfI4lO
	h8mrn/Hfsr5dfvUnMwgXHp7nfQMQVLlT9sPBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:autocrypt:organization
	:message-id:date:user-agent:mime-version:content-language
	:content-transfer-encoding;
	bh=T9Rjilqwg1US7EfPTVQUdRV4Kk24nBcSgDD5FaMJF/k=;
	b=RLBCTFbez2T9CvWvT578EL/D3KMU8h0I909JU7fpf2Cirh6KjhhXj5Pmg2DBHgvIG2
	icMrS5EplffhmX93cyhfh0kvS3/wBeypzmNbfifP+9+m01OtJ2DF8VAoKdmWGpObAR55
	BT+cr6l4X8e0wVGHbmq7eAeDNxBNGOeNMD6AqU0+AmmvHiYNvy2P2/Obcb7sK+TBG36J
	n2SDNZTVY5eNvXHn4ABd4QnGX+mmVHiO13NI7I0EJgTJ5g+z7uep8A3jWbaPnPkF8WOt
	ozM3GU85w9J/ageD466+8GSNYAGJTeefOECjRCbzsGpMFFfHF8yhqZIcSPbD2ob1/CMc
	etgw==
X-Gm-Message-State: APjAAAXuMGZgYM4k5ib2FdXms15wqBCPgYs8wTQvwt4GZPk0hgrDLeCH
	d8DRmrrRkj6SJZj/hC17gJnCFQ==
X-Google-Smtp-Source: APXvYqxjTrGt9lHEkTYdyWHF1zT6TwV6y222l/zCTH3AxHJAwAYbMyanFZuaubLYJ8EHQb8bRk3khg==
X-Received: by 2002:a63:3084:: with SMTP id w126mr5718396pgw.169.1580406303833;
	Thu, 30 Jan 2020 09:45:03 -0800 (PST)
Received: from localhost.localdomain ([2601:1c0:ce00:457:a6c3:f0ff:fe97:6486])
	by smtp.gmail.com with ESMTPSA id
	o184sm7104188pgo.62.2020.01.30.09.45.02
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 30 Jan 2020 09:45:02 -0800 (PST)
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Autocrypt: addr=mhalstead@linuxfoundation.org; keydata=
	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
	xog=
Organization: Linux Foundation
Message-ID: <2ca92bae-847b-14aa-dc26-65945658cedd@linuxfoundation.org>
Date: Thu, 30 Jan 2020 09:45:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Subject: New Dedicated Licensing and Documentation Mailing Lists
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We are adding new lists for topics concerning subcommunities that
will benefit from focused list traffic.


The licensing list will separate licensing and legal discussion from
general development to aid participation of specialists in this area.

Please join at https://lists.yoctoproject.org/g/licensing/join.


Join the docs list to discuss all things documentation and to
collaborate on the patches to the docs.

Please join at https://lists.yoctoproject.org/g/docs/join.

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

