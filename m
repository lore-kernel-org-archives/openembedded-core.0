Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Mar 2015 10:07:27 UTC
Received: from retry101.mer-nm.internl.net (vif1-retry101.mer-nm.internl.net
	[217.149.192.107])
	by mail.openembedded.org (Postfix) with ESMTP id E4F63736B6;
	Tue, 31 Mar 2015 10:07:27 +0000 (UTC)
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id E20D34082D;
	Tue, 31 Mar 2015 12:01:31 +0200 (CEST)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id B6ECC3F5C8;
	Tue, 31 Mar 2015 12:01:28 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Tue, 31 Mar 2015 12:01:28 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Tue, 31 Mar 2015 12:01:24 +0200 (CEST)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 31 Mar 2015 12:02:25 +0200
Message-ID: <551A7074.1050302@topic.nl>
Date: Tue, 31 Mar 2015 12:01:24 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
References: <55119BD5.8060002@topic.nl>
	<OFA7360BB3.3C7D486A-ON86257E15.0053507A-86257E15.007554A7@ni.com>
	<5516A6CB.5070803@topic.nl>
	<OFD91DFF9D.4B92AA05-ON86257E18.0068D8D4-86257E18.0069E329@ni.com>
In-Reply-To: <OFD91DFF9D.4B92AA05-ON86257E18.0068D8D4-86257E18.0069E329@ni.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core-bounces@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Not selecting <old version of package> as installing it would break existing dependencies
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
X-List-Received-Date: Tue, 31 Mar 2015 10:07:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 30-03-15 21:16, Alejandro del Castillo wrote:
> Sounds like you hit an already reported bug:
>
>          https://code.google.com/p/opkg/issues/detail?id=3D142
>
> It is currently targeted for the 0.3 release, but I am not sure if Paul i=
s
> going to be able to get to it on the 0.3 timeframe. Could you add details
> to the bug report (how to reproduce steps would be great)? If Paul doesn'=
t
> get to it on the 0.3 timeframe, I'll take care of it on the next release.

It looks a lot like the problem described there, so I think it's a safe bet=
 to=20
say that they're one and the same.

As for steps to reproduce, well, it does that for some packages but not for=
=20
others, and I haven't been able to figure out what triggers it. The common=
=20
factor appears to be that it usually concerns libraries, i.e. packages that=
=20
the user didn't select but where there because of dependencies. If I find a=
=20
way to trigger it, i'll add that to the bug description.

Kind regards,
Mike.


>
> cheers,
>
> -Alejandro
>
>
>
>
> From:   Mike Looijmans <mike.looijmans@topic.nl>
> To:     Alejandro del Castillo <alejandro.delcastillo@ni.com>,
> Cc:     openembedded-core@lists.openembedded.org,
> openembedded-core-bounces@lists.openembedded.org
> Date:   03/28/2015 08:04 AM
> Subject:        Re: [OE-core] Not selecting <old version of package> as
> installing it would break existing dependencies
>
>
>
> On 27-03-15 22:21, Alejandro del Castillo wrote:
>> openembedded-core-bounces@lists.openembedded.org wrote on 03/24/2015
>> 12:16:05 PM:
>>
>>> From: Mike Looijmans <mike.looijmans@topic.nl>
>>> To: openembedded-core@lists.openembedded.org,
>>> Date: 03/24/2015 12:16 PM
>>> Subject: [OE-core] Not selecting <old version of package> as
>>> installing it would break existing dependencies
>>> Sent by: openembedded-core-bounces@lists.openembedded.org
>>>
>>> After upgrading a library to a newer version, for example, something
>>> called libdvbsi++ from 0.3.6 to 0.3.7, running opkg upgrade outputs the
>>> following cryptic error message:
>>>
>>> Not selecting libdvbsi++1 0.3.6 as installing it would break existing
>>> dependencies.
>>
>> When opkg runs, it creates a list of all the available packages on the
>> configured repos + all the installed packages. During an upgrade, it
> goes
>> through the process of finding the best upgrade match for each installed
>> package, searching on the master list. The process goes through a series
>> of checks for each candidate, like making sure the archs are compatible,
>> and making sure installing a candidate won't break existing installed
>> packages. In your case, opkg determines there are 2 candidates,
>> libdvbsi++0.3.6 and libdvbsi++0.3.7. While evaluating libdvbsi++0.3.6,
> the
>> pkg_breaks_reverse_dep check fails, triggering the message shown above
>> (and removing the candidate).
>>
>>> Adding "-V2" to opkg upgrade expands that with the following message:
>>>
>>> opkg_prepare_upgrade_pkg: Package libdvbsi++1 (0.3.7-r2.0) installed in
>>> root is up to date.
>>>
>>> So apparently it knows about the later version, so why complain about
>>> the old one?
>>
>> The function that returns the best candidate match correctly returns
>> libdvbsi++1 0.3.7. It then compares it against what's already installed.
>> The DEBUG message above shows that the best candidate found is already
>> installed on the system.
>>
>>
>>> There is only one package that (r)depends on that lib (enigma2).
> Nothing
>>
>>> else needs it.
>>>
>>> This often happens with other packages as well. Is this a bug in opkg,
>>> or is it trying to tell us we're doing something wrong?
>>
>> It is not a bug, the message is harmless as it is only pointing to the
>> reason why one of the possible upgrade candidates was discarded.
>
> But why does this message keep coming back, even months after the
> upgrade that installed 0.3.7?
> The 0.3.6 version is no longer installed, it is no longer in the feeds,
> but opkg still keeps whining about it. A bit of searching in the
> filesystem of the box reveals that it is only named in a file named
> "/var/lib/opkg/status", which contains the following lines:
>
> Package: libdvbsi++1
> Version: 0.3.7-r2.0
> Depends: libgcc1 (>=3D 4.9.1), libstdc++6 (>=3D 4.9.1), libc6 (>=3D 2.20)
> Provides: libdvbsi++
> Status: unknown ok installed
> Architecture: mips32el
> Installed-Time: 1427216569
> Auto-Installed: yes
>
> Package: libdvbsi++1
> Version: 0.3.6-r1.2
> Depends: libgcc1 (>=3D 4.9.1), libstdc++6 (>=3D 4.9.1), libc6 (>=3D 2.20)
> Provides: libdvbsi++
> Status: install ok not-installed
> Architecture: mips32el
> Installed-Time: 1423323784
> Auto-Installed: yes
>
>
> As you can see, 0.3.6 is mentioned here as "not-installed", but opkg
> keeps reporting about it. Removing the entry from the file works around
> the problem, but I would have expected opkg to remove the entry after
> upgrading it. Why didn't opkg remove the obsolete entry?
>
>
>> Hope this helps!
>
> It helps to know that the message is harmless.
>
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail


