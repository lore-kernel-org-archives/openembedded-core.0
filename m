Return-Path: <akuster808@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DC41F76D28;
	Mon, 31 Aug 2015 13:45:50 +0000 (UTC)
Received: by ykap84 with SMTP id p84so2140237yka.3;
	Mon, 31 Aug 2015 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+IsEuaqxzliFwSWGZmxKsVFN/Ji8pkn8UbZmlmf2z9k=;
	b=LPSIVB8NE2G/H3VdOdfzkq05b5Nce+Q6T+yUBJiWu54MU/OeE1Jz8oV1oChp/PyQlj
	inrc+IM+7YgdHDKdH0douvZFQQRAMrnPpGK+BI7AkqIk9mnjJVeKsuoTN3XPaN2LuUeT
	OZSmea8ypFx68ozfFxp6SVGi15lT3xy4c8XftUKR54jozIm+axk7fzNFtMPVhhsJJXru
	PWV0+T2HQjn9FRhWWy61I+0vaTGkFMawIwJy1rGxIK/Uh463xPhA028P2FNyDbwkVAzc
	121n6oIq101+8FKp0tBbV5KJwCRIsNGMDj7tvjITStLTjckDxe+k54Ma/u0nCBGsuDVb
	7fSg==
X-Received: by 10.129.133.197 with SMTP id v188mr19850875ywf.74.1441028750629; 
	Mon, 31 Aug 2015 06:45:50 -0700 (PDT)
Received: from [10.22.11.207] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	m205sm14223509ywc.45.2015.08.31.06.45.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 06:45:49 -0700 (PDT)
Message-ID: <55E45A8C.5000908@gmail.com>
Date: Mon, 31 Aug 2015 06:45:48 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <20150814073122.1BDDE5042E@opal.openembedded.org>
	<20150828182256.GA2488@jama>
In-Reply-To: <20150828182256.GA2488@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Armin Kuster : tzdata: update to 2015f
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
X-List-Received-Date: Mon, 31 Aug 2015 13:45:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 08/28/2015 11:22 AM, Martin Jansa wrote:
> On Fri, Aug 14, 2015 at 07:31:22AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 4e0fb630d3bb0250ece6e2071ae49b2601ae3e57
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=4e0fb630d3bb0250ece6e2071ae49b2601ae3e57
>>
>> Author: Armin Kuster <akuster808@gmail.com>
>> Date:   Tue Aug 11 11:29:04 2015 +0530
>>
>> tzdata: update to 2015f
>>
>> Changes affecting future time stamps
>>
>> North Korea switches to +0830 on 2015-08-15.  (Thanks to Steffen Thorsen.)
>> The abbreviation remains "KST".  (Thanks to Robert Elz.)
>>
>> Uruguay no longer observes DST.  (Thanks to Steffen Thorsen
>> and Pablo Camargo.)
>>
>> Changes affecting past and future time stamps
>>
>> Moldova starts and ends DST at 00:00 UTC, not at 01:00 UTC.
>> (Thanks to Roman Tudos.)
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>  meta/recipes-extended/tzdata/{tzdata_2015e.bb => tzdata_2015f.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Hi Armin,
> 
> Is it intentional that upgrades like this usually remove old version,

I view these package updates no different than any other package. If I
am not mistaken, the older packages are removed.

> e.g. 2015d upgrade in master:
> http://git.openembedded.org/openembedded-core/commit/?id=b9f366ab4e0a9cad69b631f402b9afa02d40f667
> 
> but the same upgrade in dizzy:
> http://git.openembedded.org/openembedded-core/commit/?h=dizzy&id=ff1547cccd840068500193d4aec772988a1f2023
> kept older 2015b version, which cause me issues, because we had
> 2015b.bbappend I've forgot to rename to 2015d.bbappend and bitbake
> didn't complain, because 2015b was still there.

oh, I should not have done that.

> 
> What's even worse, this upgrade to 2015d is still missing in fido
> branch:
> http://git.openembedded.org/openembedded-core/log/?h=fido&qt=grep&q=tzdata
> 
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/tzdata/?h=master
> tzdata_2015f.bb
> 
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/tzdata/?h=fido
> tzdata_2015b.bb

my bad. I should be adding [fido][dizzy] when I update the tz packages.

> 
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/tzdata/?h=dizzy
> tzdata_2014h.bb
> tzdata_2015b.bb
> tzdata_2015d.bb

I should clean those up.

thanks,
Armin
> 
>>
>> diff --git a/meta/recipes-extended/tzdata/tzdata_2015e.bb b/meta/recipes-extended/tzdata/tzdata_2015f.bb
>> similarity index 98%
>> rename from meta/recipes-extended/tzdata/tzdata_2015e.bb
>> rename to meta/recipes-extended/tzdata/tzdata_2015f.bb
>> index 92389a9..7cda40d 100644
>> --- a/meta/recipes-extended/tzdata/tzdata_2015e.bb
>> +++ b/meta/recipes-extended/tzdata/tzdata_2015f.bb
>> @@ -7,8 +7,8 @@ DEPENDS = "tzcode-native"
>>  
>>  SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
>>  
>> -SRC_URI[tzdata.md5sum] = "36f9056efb432ca945c73397acfce0d4"
>> -SRC_URI[tzdata.sha256sum] = "ffc9b5d38abda8277aa479e3f75aa7668819d0977cd1a0c8ef3b09128334ba6f"
>> +SRC_URI[tzdata.md5sum] = "e3b82732d20e973e48af1c6f13df9a1d"
>> +SRC_URI[tzdata.sha256sum] = "959f81b541e042ecb13c50097d264ae92ff03a57979c478dbcf24d5da242531d"
>>  
>>  inherit allarch
>>  
>>
>> -- 
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> 

