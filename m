Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 966296FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 15:18:31 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 21so880691pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=+R+P392oeQe9AZUeN2rdm4QoCUH7/PRxSD4ytyt+rEA=;
	b=zSBZM7BivEaXe0CriSEXj+HLav3o4U0zxgmaJD69Cuglm60mXVWtNO2ULMQ/2gMOxp
	TlUccPfnD0/KS9uQdofuaheOCC0o+lloAA9xC5whtSqfhFCNkhusFVihJoTBqB6Vqijc
	qArUWL0y7nVAq9JiKKow8bJc3n3NSvS3qSLmJGXNkyBE3b1iIOvdd2wT0MB4fVHKJeag
	4zaLzsneQC/iW+T1rNM/Y96wQL4rdqxPHBwCC8XEWVx+Qe8dXzclQTOE+kZO9C25ohuS
	+/AZ8todNsR4P3MG+FeGBmk8AQHI2UkbHOw358q0Hu0vbk4bKMhSKuA9IWkdqqM1aCil
	iT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=+R+P392oeQe9AZUeN2rdm4QoCUH7/PRxSD4ytyt+rEA=;
	b=izykuQyiB+uEgWaowGEK6K44D38Enz6r34PQhbOetuxoHHTM5HfGKYz+f/NMUWvGZJ
	2PEPen8OlpcegMrShxECFnZLhDpbDUby+3AoCsaMEM+kmajU11f+sJCSTH7T08M7Vuys
	7ybEYR7/SRdPkfjhuXryCSP+Uy1TTjj6R9RLjHG7aXBrfPHq8OOuX2KSC0hW5wbSGOBg
	YTCdC8FH9zYi/VeYxRGd1eJVYVUhXTwUC+QdEkXor/0BTE8Mfrb7EVY5WEhKkzxINjwO
	WkB4PmBG3pf/WH62w+XNWJWAJgn1fznXpVPA4AKpO8Tv5MwRjW4Ul4iIxt7/OG2KROs0
	GQpg==
X-Gm-Message-State: AE9vXwMJGfELegvU1h3M4d+9KbcWEYwXXjRfSK3EygBMXqXw8oNd5ZbjFiMSd+s6PSuWsw==
X-Received: by 10.98.58.65 with SMTP id h62mr48488674pfa.82.1474989512935;
	Tue, 27 Sep 2016 08:18:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:840b:652c:6ab2:3074?
	([2601:202:4001:9ea0:840b:652c:6ab2:3074])
	by smtp.googlemail.com with ESMTPSA id
	28sm5773980pfp.33.2016.09.27.08.18.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Sep 2016 08:18:32 -0700 (PDT)
To: "Mittal, AnujX" <anujx.mittal@intel.com>,
	Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1474815558.git.akuster808@gmail.com>
	<DFCB2C9E62139C41B3FDE8F2B46593310A19B928@PGSMSX101.gar.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6fb04c61-e315-afcd-452e-17b1a91b7b7f@gmail.com>
Date: Tue, 27 Sep 2016 08:18:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <DFCB2C9E62139C41B3FDE8F2B46593310A19B928@PGSMSX101.gar.corp.intel.com>
Subject: Re: [PATCH 0/9] Jethro pull request
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
X-List-Received-Date: Tue, 27 Sep 2016 15:18:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 09/25/2016 06:05 PM, Mittal, AnujX wrote:
> Hi,
> 
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Armin Kuster
>> Sent: Sunday, September 25, 2016 11:05 PM
>> To: akuster@mvista.com; openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 0/9] Jethro pull request
>>
>> Please consider these changes for Jethro
>>
>> The following changes since commit
>> c9c85df86cd2270b144fa824ef76adedd3636c8a:
>>
>>   util-linux: Security fix for CVE-2016-5011 (2016-09-23 23:21:43 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib akuster/jethro-next
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-
>> contrib/log/?h=akuster/jethro-next
>>
>> Armin Kuster (9):
>>   openssl: Security fix CVE-2016-2180
>>   openssl: Security fix CVE-2016-8181
>>   openssl: Security fix CVE-2016-2182
>>   openssl: Security fix CVE-2016-6304
> 
> I think there's a typo here. Shouldn't this be CVE-2016-6302?

yep.

I will re-spin shortly.

thank,
Armin
> 
>>   openssl: Security fix CVE-2016-6303
>>   openssl: Security fix CVE-2016-6304
>>   openssl: Security fix CVE-2016-6303
> 
> And, this CVE-2016-6306?
> 
>>   tzdata: update to 2016f
>>   tzcode-native: update to 2016f
>>
>>  .../openssl/openssl/CVE-2016-2180.patch            |  44 ++++
>>  .../openssl/openssl/CVE-2016-2181_p1.patch         |  91 ++++++++
>>  .../openssl/openssl/CVE-2016-2181_p2.patch         | 239
>> +++++++++++++++++++++
>>  .../openssl/openssl/CVE-2016-2181_p3.patch         |  30 +++
>>  .../openssl/openssl/CVE-2016-2182.patch            |  70 ++++++
>>  .../openssl/openssl/CVE-2016-6302.patch            |  53 +++++
>>  .../openssl/openssl/CVE-2016-6303.patch            |  36 ++++
>>  .../openssl/openssl/CVE-2016-6304.patch            |  75 +++++++
>>  .../openssl/openssl/CVE-2016-6306.patch            |  71 ++++++
>>  .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   9 +
>>  ...code-native_2016e.bb => tzcode-native_2016f.bb} |   8 +-
>>  .../tzdata/{tzdata_2016e.bb => tzdata_2016f.bb}    |   4 +-
>>  12 files changed, 724 insertions(+), 6 deletions(-)
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 2180.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 2181_p1.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 2181_p2.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 2181_p3.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 2182.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 6302.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 6303.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 6304.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
>> 6306.patch
>>  rename meta/recipes-extended/tzcode/{tzcode-native_2016e.bb => tzcode-
>> native_2016f.bb} (68%)
>>  rename meta/recipes-extended/tzdata/{tzdata_2016e.bb => tzdata_2016f.bb}
>> (98%)
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

