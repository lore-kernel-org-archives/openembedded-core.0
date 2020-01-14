Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id DBE797F953
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 04:03:27 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id g6so4696734plt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 20:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2h79UnAKD8hwqrzfX2I9wI3H1qoMReRl9omP83PeY8k=;
	b=jvKowj1qHDRqbfwBhGjgiI1sFXOfRH1gxGV9QBJlb/9tDzc9QDwhcN+cMOsu1pzmYd
	NOub6g4M6a2Q6GE0RAtw37F+zkJwwMs0zZCcAOsIOsKcAjQ4dVFLmiIecY7u4sDfwPKu
	iKyIZMGNIKsZTAGsLqAZ68ZwzoxKZy1ipvqKx5hedGNo3/fMfTQ64UefTawnRFj28IzG
	f5pokzoPCGcS8tONQNxKLEbxe1NJGmFocZlIOSbhtOxYPHf5IJLl7jZJfzDkMMjrblL9
	oZ+iT1fV1kx6Z/aXism2iwLHpKmicGXXWV+qbCjdtE8ay/83A1OsNn3Fc+MEaYHxnpTP
	YL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=2h79UnAKD8hwqrzfX2I9wI3H1qoMReRl9omP83PeY8k=;
	b=mi3UKABIOcPKQZRLP6if7JU73VNbNx6FfRbaoTXRhzx38iwEA+bWzBDAfoWnR154Al
	JCyyBLqYZUNetLtfX4PM1P0W6l1JDvTaAY2AnnN7rsnevtccfX9WVhbQAH0ziNmuAdyv
	QXk/4GzskdeVRIcdAbiEULq9e+z+IS7xib/wQd0ucuVC9WtUh4VMPonI4RauLj4uis/9
	/5Fq7n6wVh9ATvELpOk2a9mFipnbVqyTPcya6O5NLKxWCdJppx+Heeb4h1GQKiSOALYk
	+pN9BkrF9mBnDTzVoze/tDcEpkwxZY+4Yu+KzK2UvoArHqOVzzX70GTEccbIcvjNZePl
	70EA==
X-Gm-Message-State: APjAAAVGRbyLKD1Jq0vefly4dwZQhRuz3vCNk+ib9Gs72fTLVR8O84bq
	B1pt342M5lRa78TcGqqwoAiZp3u6dCw=
X-Google-Smtp-Source: APXvYqx6A3niE/1Piz0VzKd6tv7On/5q4oXLPTveZfcAe6F3SJD/q4WKU4wVmaSlIeAezKUsmkW4Cg==
X-Received: by 2002:a17:902:864a:: with SMTP id
	y10mr2353049plt.2.1578974608592; 
	Mon, 13 Jan 2020 20:03:28 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:c8c8:687f:1d3e:adde?
	([2601:646:9200:4e0:c8c8:687f:1d3e:adde])
	by smtp.gmail.com with ESMTPSA id
	d27sm14899980pgm.53.2020.01.13.20.03.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 13 Jan 2020 20:03:28 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200114034013.3421903-1-raj.khem@gmail.com>
	<20200114040225.2275.1919@do>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a06491c0-098e-c59a-3b49-755d85e10c51@gmail.com>
Date: Mon, 13 Jan 2020 20:03:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114040225.2275.1919@do>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdzdHJlYW1lcjEuMDogRW5hYmxlIGRlYnVnIGluIGJ1aWxkcw==?=
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
X-List-Received-Date: Tue, 14 Jan 2020 04:03:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/13/20 8:02 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: gstreamer1.0: Enable debug in builds
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/21994/
> State : failure
>

this applies on top of master-next, tool is confused a bit here.


> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at b6d4150f9c)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 


