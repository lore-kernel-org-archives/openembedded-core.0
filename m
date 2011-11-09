Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1ROCtK-0001ha-M6
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 19:28:54 +0100
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 09 Nov 2011 10:21:32 -0800
Received: by ywb5 with SMTP id 5so1488223ywb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 10:21:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.173.74 with SMTP id bi10mr4753127igc.4.1320862892157; Wed,
	09 Nov 2011 10:21:32 -0800 (PST)
Received: by 10.50.40.194 with HTTP; Wed, 9 Nov 2011 10:21:32 -0800 (PST)
In-Reply-To: <92D35213-63C5-49E2-A1A8-3D6AC8F00079@dominion.thruhere.net>
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
	<4EB90155.3070705@hale.at> <1320761558.10843.39.camel@ted>
	<4EB9507C.8060507@hale.at>
	<CAPhnLPACHNsFC6rx1uNOcLKgn68D6qeTYcN=VGns+eRAEqKstw@mail.gmail.com>
	<92D35213-63C5-49E2-A1A8-3D6AC8F00079@dominion.thruhere.net>
Date: Wed, 9 Nov 2011 10:21:32 -0800
Message-ID: <CAPhnLPC1KtJm0yvq62UekPOdudUfgMeA26iEtqJ4bk0+JDMx_A@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on non physical disks
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
X-List-Received-Date: Wed, 09 Nov 2011 18:28:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 9, 2011 at 4:13 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 8 nov. 2011, om 16:57 heeft Flanagan, Elizabeth het volgende geschreven:
>
>> On Tue, Nov 8, 2011 at 7:53 AM, Wolfram Stering <wolfram.stering@hale.at> wrote:
>>> On 11/08/2011 03:12 PM, Richard Purdie wrote:
>>>> On Tue, 2011-11-08 at 11:15 +0100, Wolfram Stering wrote:
>>>>> On 11/02/2011 07:41 AM, Beth Flanagan wrote:
>>>>>> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>>>>>>
>>>>>> tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies
>>>>>> buildstats to not collect diskio statistics when we encounter a case where
>>>>>> the os.major/os.minor is not represented with an entry in /proc/diskstats.
>>>>> A similar issue exists for building on a btrfs partition.
>>>>> I posted a message on Oct 28 concerning buildstats on btrfs volumes.
>>>>> The problem there is, that btrfs's stat() reports fake device ids that
>>>>> cannot be found in /proc/diskstats.
>>>> Did this patch help address that problem for you too?
>>>
>>> I'll be able to check that tomorrow and report back.
>>
>> It should as the patch will just disable diskio collection if it
>> cannot find a valid device id in /proc/diskstats. Let me know if it
>> doesn't and I'll rework it and resubmit.
>
> Related question: what do you use to visualize the buildstats? I heard rumours about getting bootchart to support our format natively, is that the case? I will be needing pretty graphics for a report on the oe-core buildflow in a few weeks :)
>
> regards,

Koen,

There is a patch to pybootchartgui that allows visualization. RP has
the patchset IIRC.  I'm going to be working on buildstats
visualization soon and I'm leaning towards using jquery/flot to create
a way to allow end users to generate via browser some comparative
graphing of buildstats against different builds/statistics. This way I
can set it up for the AB to compare all the builds we're doing there
and end users can just use it through a browser either locally or via
a server.

-b

>
> Koen
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk66bmcACgkQMkyGM64RGpHMCQCguHdgtS3SrIVV5+T1dOktTpAT
> FkQAnRZzZqwPJlGa3QlGGmxRrZnNtv/8
> =fEA3
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


