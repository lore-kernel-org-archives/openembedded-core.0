Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF46B7E921
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 17:54:19 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id p17so17863896ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=/J9iXxMs/JrHlJhn8+/Yfty/sY7tENBq75Yk741Dqlc=;
	b=uqlRPDCfwK4LQkyBcjVAyhQ4g3X9sVT5NIux1ReTb4HpLz1wEoAXwsRrMaD+XKosBl
	0lMqmy5Hu+ZphJzwAu2fkmt+UMLpIT11pIx/FTu6krd1EJLLfuYp6z8c+WFAHMHLe6gH
	zKb1ZjjHtZI8/rvahBfnWGBzZyg615bqRSdxPjhKvqhvERFn0/GgBo3PtD1ivsXdOyOs
	Xgp62vQyHBPCDdV72ua0hoccu1j3q4aOP4k7PdD5AC1aNNFR65+Qd2796aPmCdYxJot9
	I1V7kC0HFe5rctm3wVWgQnQbKSjHjXaLkzoUHHZM0a+wBn/u/h0rLe9qN+lz3OQ1ou32
	QfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/J9iXxMs/JrHlJhn8+/Yfty/sY7tENBq75Yk741Dqlc=;
	b=iblnGhWbvAedzsp8OkQu4tCFuzXFWZL/li7h7D7Pd3K1WJ3XDHGrxS2AjvE05BWmIC
	s80BH3gb3M9uWekxJ5Ye45MImrGoOr7O41a0XVjYoPcdKw67a/17aoc+JkKYscIVChf/
	YkEAaja1s6E2iH4JZHVZEb3TG3Tlm5LXw8BsR3T6OWjtqa1IgTDZs+Og5MUzRreMBUKW
	ntim0hNjPMuDy3UFntz5FQSQinU3CdK0TiAuUw6coh0+TG452b0EmsVwbPYcTF1ez6mh
	vbx3XocpAi6jUmBToPFl8jWRZm0eURzkxbxVrXKcTw/+aCOUUMyeCJHTacXvrIqePERF
	rbcA==
X-Gm-Message-State: APjAAAXU9GuIj69NsQkuPWhxYfVAIWeDfV/Iord7sRgh0sTnzvbdBSL1
	umORsO07gEuBCIWuCiZng041rgqTgH4=
X-Google-Smtp-Source: APXvYqwMfRYnuGICMR1KfBbds0lIDxbO0xXDordO9ugjKFlrYiValAyXbdsh0qLVGEemrHpAMwunQQ==
X-Received: by 2002:a2e:9951:: with SMTP id r17mr17808746ljj.125.1562090059659;
	Tue, 02 Jul 2019 10:54:19 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id p27sm3049582lfh.8.2019.07.02.10.54.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 10:54:19 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190627154415.1924-1-open.source@oleksandr-kravchuk.com>
	<6586c7ca-10da-ae60-2494-1d3a605047a7@windriver.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <580bb0ee-537c-1250-8e4f-0eae6ad0dad3@oleksandr-kravchuk.com>
Date: Tue, 2 Jul 2019 19:54:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <6586c7ca-10da-ae60-2494-1d3a605047a7@windriver.com>
Subject: Re: [PATCH] autoconf-archive: update to 2019.01.06
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
X-List-Received-Date: Tue, 02 Jul 2019 17:54:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Robert,

Unfortunately I do not have an answer. I failed an issue:
https://github.com/rsyslog/rsyslog/issues/3738

Let's see what the project suggests.

On 02/07/2019 12:34, Robert Yang wrote:
> Hi Oleksandr,
>
> This patch makes
> meta-openembedded/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
> and
> meta-secure-core/meta-tpm2/recipes-tpm/tpm2-tss/tpm2-tss_git.bb
>
> fail to build. E.g.:
>
> MACHINE = "qemux86"
> $ bitbake librelp
>
> ../../git/src/cmdif.h:52:13: error: no previous declaration for
> 'relpSCSyslog' [-Werror=missing-declarations]
>    52 |  relpRetVal relp##type##C##cmd(relpFrame_t LIBRELP_ATTR_UNUSED
> *pFrame, relpSess_t *pSess) \
>       |             ^~~~
> ../../git/src/scsyslog.c:45:1: note: in expansion of macro 'BEGINcommand'
>
>
> $ bitbake rsyslog
> Makefile:14636: *** missing separator.  Stop.
>
> The errors are wild, do you have any ideas on how to fix them, please?
>
> // Robert
>
> On 6/27/19 11:44 PM, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>   ...f-archive_2018.03.13.bb => autoconf-archive_2019.01.06.bb} | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename
>> meta/recipes-devtools/autoconf-archive/{autoconf-archive_2018.03.13.bb
>> => autoconf-archive_2019.01.06.bb} (78%)
>>
>> diff --git
>> a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
>> b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
>> similarity index 78%
>> rename from
>> meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
>> rename to
>> meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
>> index 7d62e52ab8..985a254fcc 100644
>> ---
>> a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
>> +++
>> b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
>> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
>>       file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
>>     SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>> -SRC_URI[md5sum] = "46b13a5936372297b6d49980327a3c35"
>> -SRC_URI[sha256sum] =
>> "6175f90d9fa64c4d939bdbb3e8511ae0ee2134863a2c7bf8d9733819efa6e159"
>> +SRC_URI[md5sum] = "d46413c8b00a125b1529bae385bbec55"
>> +SRC_URI[sha256sum] =
>> "17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f"
>>     inherit autotools allarch
>>  

