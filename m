Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 575707BF9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 20:28:10 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 8CD4D220472;
	Tue, 18 Dec 2018 09:28:08 +1300 (NZDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181214011937.16881-1-douglas.royds@taitradio.com>
	<CAJTo0La3xLFbdsODnV9pp8_kc_GWSsCamesBmcELTvSqTh3z3w@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <1b719769-2937-b812-b307-d898c722bd9a@taitradio.com>
Date: Tue, 18 Dec 2018 09:28:08 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La3xLFbdsODnV9pp8_kc_GWSsCamesBmcELTvSqTh3z3w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] acl: trivial: whitespace only
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
X-List-Received-Date: Mon, 17 Dec 2018 20:28:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Yes, brilliant. Once he has those upgrades sorted out, these ones will 
be completely redundant, I believe.


On 15/12/18 3:54 AM, Burton, Ross wrote:

> Enrico just submitted some upgrades to acl and attr which touch the
> recipes quite dramatically, could you rebase all these patches on top
> of that?  Several will just disappear, for example ptest support was
> removed.
>
> Ross
> On Fri, 14 Dec 2018 at 01:20, Douglas Royds <douglas.royds@taitradio.com> wrote:
>> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
>> ---
>>   meta/recipes-support/attr/acl_2.2.52.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
>> index 6bc77d868d..7f5883a5d7 100644
>> --- a/meta/recipes-support/attr/acl_2.2.52.bb
>> +++ b/meta/recipes-support/attr/acl_2.2.52.bb
>> @@ -47,6 +47,7 @@ do_install_ptest() {
>>          install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
>>   }
>>
>> -RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
>> +RDEPENDS_${PN}-ptest = "acl bash coreutils \
>> +                        perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
>>
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



