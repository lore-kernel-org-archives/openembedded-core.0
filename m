Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 295B665CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:54:45 +0000 (UTC)
Received: (qmail 12648 invoked by uid 1003); 11 Feb 2015 01:54:47 -0000
Received: from unknown (HELO ?192.168.11.101?)
	(philip@opensdr.com@108.44.84.240)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	11 Feb 2015 01:54:47 -0000
Message-ID: <54DAB664.8010302@balister.org>
Date: Tue, 10 Feb 2015 20:54:44 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Gortmaker <paul.gortmaker@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1421866336-17183-1-git-send-email-paul.gortmaker@windriver.com>
	<20150211010307.GB3150@windriver.com>
In-Reply-To: <20150211010307.GB3150@windriver.com>
Subject: Re: [PATCH] procps: disable fancy new top output mode
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
X-List-Received-Date: Wed, 11 Feb 2015 01:54:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02/10/2015 08:03 PM, Paul Gortmaker wrote:
> [[PATCH] procps: disable fancy new top output mode] On 21/01/2015 (Wed 13:52) Paul Gortmaker wrote:
> 
>> General consensus is that the new output format, with the all red
>> colour and one line per core is too fugly to be left as the default.
>>
>> Use the configure option to switch it back to the sane default that
>> we've all become used to seeing for decades.
> 
> Ping -- discussion on IRC was in unanimous agreement with the above
> assessment; so it seems like we should get this merged.

Please. Do. This. ASAP.

Thanks,

Philip

> 
> P.
> --
> 
>>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> ---
>>  meta/recipes-extended/procps/procps_3.3.10.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb b/meta/recipes-extended/procps/procps_3.3.10.bb
>> index d8b04dc204a0..621b6dd5786c 100644
>> --- a/meta/recipes-extended/procps/procps_3.3.10.bb
>> +++ b/meta/recipes-extended/procps/procps_3.3.10.bb
>> @@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "a02e6f98974dfceab79884df902ca3df30b0e9bad6d76aee0fb5dce17f
>>  
>>  S = "${WORKDIR}/procps-ng-${PV}"
>>  
>> -EXTRA_OECONF = "--enable-skill"
>> +EXTRA_OECONF = "--enable-skill --disable-modern-top"
>>  
>>  CPPFLAGS += "-I${S}"
>>  
>> -- 
>> 2.2.1
>>

