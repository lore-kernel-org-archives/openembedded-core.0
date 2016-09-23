Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id EAE60600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 16:25:19 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n24so5485523pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=V73rIHQX5cybwKYNrXSJU15m6V0e10PnecOs0XG6Gv8=;
	b=KdUWyNslRrAlWUoM77z7GWzUGOKhPvidw0mGQaUH3D3RD2yq3a7q+7HW5GW1+kXdYk
	b96AD4BLSMvB68GEivVsnRKfJePP7cjUFCNjNZRvtZpTo2lJuMFJuhp2TmVGu4Fz8X+V
	bYAqUBmfNDI/l8tw4wkCuC5CogY1HUteMJH22aZLVVHfZuYb4gqwLP9M0yoFI7Q6Jk+K
	rgBcAMcKs75peGvhhLh5WGpoExqdMAXL8HM2tfSitasb7S/gqo3Ok9JyMFxRiALMWUbJ
	P3KH7W0xVIBZzbsVawJyDL27DCRNxXrTh+L2ftjTWhfF89M/UgKm28S/1i8QWj7K6jP3
	bX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=V73rIHQX5cybwKYNrXSJU15m6V0e10PnecOs0XG6Gv8=;
	b=LjkINmFplmviqdW+aIuqmfzJSU6BkR8EJ5/OMLTB7/SJi8Jkat48GqBqfvri2PPQ1L
	tsIDT3+eBv0CG9yc1NWKeagcCV/7wwXiGOdPfSVV+EuNUX6l/WF7QL33FP/AfUgpyVIO
	GJTpL4qmhOvISZ862wmctS7F1MAleLNeh/scJxqzgczMllj88sz34DtruZvtGoYLK/Mi
	PN3aYP/9aiQxpfOmWR+uztdgNJL6pA2tOxKqW5INmYcigvQcYsD2JjdRP4MTtdl3lP3s
	EaU4jBD9PBfxuLLDjwcUTU6c5G1XOxGJxzQ+/HWmezJX7L1k+2cwcYH9NAKHorQPUN3D
	BSZw==
X-Gm-Message-State: AE9vXwM0iI+KYo3nfk6Pok4iCDr+klXBRPSe4c6wnrX9LuVygHvQ3NHCjWUNhGjLzHA1Hg==
X-Received: by 10.98.84.67 with SMTP id i64mr13945816pfb.105.1474647921109;
	Fri, 23 Sep 2016 09:25:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c560:5d36:d9b:7d07?
	([2601:202:4001:9ea0:c560:5d36:d9b:7d07])
	by smtp.gmail.com with ESMTPSA id
	c26sm5546727pfe.20.2016.09.23.09.25.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 09:25:20 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1474619763.git.patrick.ohly@intel.com>
	<d96c9d2d55f4f6dcc78a51fadfb847711e89a09a.1474619763.git.patrick.ohly@intel.com>
	<67fabe6e-fb01-7462-2e5e-8424d5d24571@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <86436db9-fb61-2d83-19a3-6396ee8a8de4@gmail.com>
Date: Fri, 23 Sep 2016 09:25:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <67fabe6e-fb01-7462-2e5e-8424d5d24571@linux.intel.com>
Subject: Re: [PATCH 1/1] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Fri, 23 Sep 2016 16:25:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/23/2016 05:01 AM, Alexander Kanavin wrote:
> On 09/23/2016 11:39 AM, Patrick Ohly wrote:
>> This update fixes several CVEs:
>> * OCSP Status Request extension unbounded memory growth (CVE-2016-6304)
>> * SWEET32 Mitigation (CVE-2016-2183)
>> * OOB write in MDC2_Update() (CVE-2016-6303)
>> * Malformed SHA512 ticket DoS (CVE-2016-6302)
>> * OOB write in BN_bn2dec() (CVE-2016-2182)
>> * OOB read in TS_OBJ_print_bio() (CVE-2016-2180)
>> * DTLS buffered message DoS (CVE-2016-2179)
>> * DTLS replay protection DoS (CVE-2016-2181)
>> * Certificate message OOB reads (CVE-2016-6306)
>>
>> Of these, only CVE-2016-6304 is considered of high
>> severity. Everything else is low. CVE-2016-2177 and CVE-2016-2178 were
>> already fixed via local patches, which can be removed now.
>
> This demonstrates that:
>
> a) if CVEs are fixed with backported patches, the process must be 
> *thorough* and not shotgun-ish like now. It's pointless to fix some 
> CVEs and ignore the others, just because that's what automated tools 
> like cve-checker reported or someone saw some mail on a mailing list.
>
> b) it's okay to not fix low-severity CVEs until the upstream makes a 
> new release. Upstream is much more competent than we are to judge 
> that, and if the issue is high severity, they should make a new 
> release anyway.

No this demonstrates that folks do want to help out. They to the best 
they can with their abilities and situation. The community has made a 
lot of noise about how important it is to address security issues. 
Except a few of us who do send patches, the community as a whole does 
not stepped up to the table to help out.

Opensource is not an all or nothing proposition. I for one appreciate 
contributions folks make in this area.

- Armin


>
> Please feel free to disagree.
>
> Alex


