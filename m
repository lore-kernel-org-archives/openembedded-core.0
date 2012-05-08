Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRlhr-0000vz-Ua
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 16:48:05 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 May 2012 07:38:10 -0700
Received: by pbbro8 with SMTP id ro8so27083939pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 07:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=T4Oadc9PajDYKXGujFRpO0scAJE5ph1gTaFid5jE+T8=;
	b=IBLIr5cq5EjNc3LaARCOG8ny1MXFymqbHbZ56+Y0aY+SwLiQIiEubdcTHcCOs4AeZH
	WZXhNUxrVUS69yErY2Rai7FxLdyVU/S9BOAOhev5ds1wYDakt4BLyVUbEONdyBOoHEjX
	/wKyyD8StOVkqkT26m6cugpWvrTIY98UB7l305Lq7ilvekCbrpwpRVF7Wle3OBd1iVeK
	seYf300r/OAbMkzDsvXtRiXzN4m+KYnctaXEM6bzIZx1yMssHHtQHlVH8fTEBCn7NeUT
	tFw5DWyWbLp45mJrQ73hMdI/oatuJbFHriElGf2YU699Cj+MutPf836UjTb+EZlXBLSH
	7pcw==
Received: by 10.68.219.195 with SMTP id pq3mr3080459pbc.54.1336487889966;
	Tue, 08 May 2012 07:38:09 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id po10sm2059140pbb.56.2012.05.08.07.38.07
	(version=SSLv3 cipher=OTHER); Tue, 08 May 2012 07:38:08 -0700 (PDT)
Message-ID: <4FA92FDE.1010102@intel.com>
Date: Tue, 08 May 2012 07:38:22 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1335330662.git.scott.a.garman@intel.com>
	<2141be5ebcb7b14e348ad7e8a516a19333388eeb.1335330662.git.scott.a.garman@intel.com>
	<4FA8C5DE.5070404@opendreambox.org>
In-Reply-To: <4FA8C5DE.5070404@opendreambox.org>
X-Gm-Message-State: ALoCoQmHb08tuA+sPiMce7mQXVKG25x/wIqB5Ws3lgKBmq4VyDgQxEkamY+bOL77giJZTZGjCAK/
Subject: Re: [PATCH 2/2] openssl: upgrade to 1.0.0i
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2012 14:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2012 12:06 AM, Andreas Oberritter wrote:
> Hello Scott,
>
> On 25.04.2012 07:13, Scott Garman wrote:
>> --- a/meta/recipes-connectivity/openssl/openssl.inc
>> +++ b/meta/recipes-connectivity/openssl/openssl.inc
>> @@ -4,8 +4,7 @@ HOMEPAGE = "http://www.openssl.org/"
>>   BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
>>   SECTION = "libs/network"
>>
>> -# Big Jump for OpenSSL 1.0 support with meta-oe
>> -INC_PR = "r15"
>> +INC_PR = "r0"
>>
>>   # "openssl | SSLeay" dual license
>>   LICENSE = "openssl"
>
> this hunk broke the upgrade path of out-of-tree users of openssl.inc,
> e.g. users of openssl 0.9.8 in their own layer.
>
> Please reset INC_PR to r15. You should have reset only PR (if it wasn't
> already "${INC_PR}.0"), not INC_PR.

Ouch. Sorry about that. I will submit a patch in the next few minutes to 
correct this and will keep this in mind in the future.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


