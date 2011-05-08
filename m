Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIxRs-0002gv-Rr
	for openembedded-core@lists.openembedded.org;
	Sun, 08 May 2011 08:26:37 +0200
Received: by pzk36 with SMTP id 36so2049004pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 23:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=3PweIlOgamahSHunmIWYyASF7R3ICgGEqCRkXKkpKrc=;
	b=ajvubcB2bg1sHkefrjUGeJ0HTZuJY1/6v3RSDXLQjsK8DfIGBx6es6kp3AGk4nOHR1
	IvsntdKSmp+HktWuvzV+CEyH2GqBu6FC89JEWS1PvHXERe9EEek+CPJcApKZ4sQ8fqS3
	Ji0b8uB9AmX48CBY1fF0uBTA6IqmK6qncGFqY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=WCiv5f/xrnSF8QQXca6w27WBZbcEzQcS7McIYn3hdf4jtVTD2YRWfaAV2G3Eq0hrn7
	Ve1yU6QjnQOf9AtEDhCKbBOHoZ06pJ3BngshHhO3WhzhQ8BeXm7Stxa/KNL3+TsIvgvc
	AeGz3LdCnbdwhSO+AeTcwtrQkB401wmbA7yeU=
Received: by 10.143.78.14 with SMTP id f14mr3091541wfl.110.1304835832237;
	Sat, 07 May 2011 23:23:52 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s39sm6418677wfc.16.2011.05.07.23.23.50
	(version=SSLv3 cipher=OTHER); Sat, 07 May 2011 23:23:50 -0700 (PDT)
Message-ID: <4DC636EB.6080809@gmail.com>
Date: Sat, 07 May 2011 23:23:39 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>
	<1304787012.8459.1.camel@doubt>
In-Reply-To: <1304787012.8459.1.camel@doubt>
Subject: Re: [PATCH] package.bbclass: convert unpackaged file message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Sun, 08 May 2011 06:26:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/2011 9:50 AM, Darren Hart wrote:
> According to my discussion with RP, bb.note() is supposed to appear on
> the console. If it doesn't, that is a bug in bitbake, not the recipe

it does if we increase verbosity but it also dumps a lot of other 
information along. Default is to print errors and warnings which seems a 
sane default to me. May be there is another level which dumps notes on
top and then as you increase the level you get more info dumped would be
a good to have

> logging. I used this information to document the intended use of the
> similarly named bbnote() in logging.bbclass.
>
> --
> Darren
>
> On Fri, 2011-05-06 at 16:48 +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>   meta/classes/package.bbclass |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index e6b3df7..082f233 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -676,9 +676,9 @@ python populate_packages () {
>>   				unshipped.append(path)
>>
>>   	if unshipped != []:
>> -		bb.note("the following files were installed but not shipped in any package:")
>> +		bb.warn("the following files were installed but not shipped in any package:")
>>   		for f in unshipped:
>> -			bb.note("  " + f)
>> +			bb.warn("  " + f)
>>
>>   	bb.build.exec_func("package_name_hook", d)
>>
>



