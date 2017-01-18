Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9666271A72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 16:19:05 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t6so1742665pgt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=h1AxDI5LsUKbNuEsNF4qzfIDbtZ5BibIzJCMQlAAIDg=;
	b=PFuMjfHhwbC9nL0M9mSbNRLqcFA0Wsxb13yxOWjqgislbyrn625VeDd2LVFcl9dHiQ
	kk4IE4ZZ7jwFQSGEAQUYdDW5x0TqBXseqegPYjXobMRZj2YhzHzSb128UlXTjdQas5e9
	nsuOkudgu5RfAGrPLFvluULrdNzDj1t37sHsSiAsEX/WI6oYdQ7UlxqGj1uVk9kmu3Lg
	UZ49mFhzIQArJbfrdTtixYgS4lz7QkWZy9KOFOum5p9G/Hdcd+ar7bhKrDQhTmkuy81d
	tQYA8QVYTkkuG7sD8lFkCxWSlB0LeHLR9lazNdAbL6JijykH9AfupZOxSdLDO5Te/kYC
	V1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=h1AxDI5LsUKbNuEsNF4qzfIDbtZ5BibIzJCMQlAAIDg=;
	b=Zr4aXQ9m+Q/w/4TqTd8RafwE9oyfMTVjUsQoTXEi2dEQpnegpicYWlOB/Mz9SOWBsE
	uMwwgV7o9b4b7hgdrKfEfNGESFEAnw1CQanNd23lRV8PwD5QncXrIKLZSvOsfUkZzINE
	aou3g9ItlEgN0GlGAPMsDqAWzTIaWEC6vnXuUFp9hCigDsAzMlfUQpkAkb4rve7omwJM
	XpEslFihBsaJY4cQp6xlX14ebDLtFRCjcWIH3s68z9yFZQWv6nqYnH3/3R01W/k7Q4rK
	J9Rtvd3Vx5k3iIT+qjC1bv4jLpdrnoJ6pw9Aa0qJeuKMHNItqBMNpd68P0iQuOKK7tYY
	j7kg==
X-Gm-Message-State: AIkVDXKat6YwarQh/gDvRcS0AyJ1RmcJ8IRN1wYyG2YAEoppEBje63wMKP9sFsgq91zCvA==
X-Received: by 10.84.232.197 with SMTP id x5mr6260246plm.111.1484756345499;
	Wed, 18 Jan 2017 08:19:05 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	g70sm1837938pfb.50.2017.01.18.08.19.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 08:19:05 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1484094088-5338-1-git-send-email-denis@denix.org>
	<20170117172654.GO15833@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <528fb9c2-9dbb-6e3b-615a-1915a26d8f0e@gmail.com>
Date: Wed, 18 Jan 2017 08:19:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170117172654.GO15833@denix.org>
Subject: Re: [morty][PATCH v2] attr/ea-acl: pass --disable-gettext when USE_NLS=no
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
X-List-Received-Date: Wed, 18 Jan 2017 16:19:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/17/2017 09:26 AM, Denys Dmytriyenko wrote:
> Ping
in staging
> On Tue, Jan 10, 2017 at 07:21:28PM -0500, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Fixes following error in configure:
>>    FATAL ERROR: msgfmt does not seem to be installed.
>>    attr cannot be built without a working gettext installation.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>> (From OE-Core rev: d044fad8a0ac5d57deb88b25106f3a39cb7c1636)
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>> v2 - morty still requires expand option to d.getVar()
>>
>>   meta/recipes-support/attr/ea-acl.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
>> index 370e16f..4d6ad20 100644
>> --- a/meta/recipes-support/attr/ea-acl.inc
>> +++ b/meta/recipes-support/attr/ea-acl.inc
>> @@ -10,6 +10,7 @@ inherit autotools-brokensep gettext
>>   EXTRA_AUTORECONF += "--exclude=autoheader"
>>   EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
>>   EXTRA_OECONF_append_class-native = " --enable-gettext=no"
>> +EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
>>   
>>   EXTRA_OEMAKE = "PKG_LIB_DIR=${base_libdir} PKG_DEVLIB_DIR=${libdir}"
>>   
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


