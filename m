Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RNoAV-0005K4-ID
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 17:04:59 +0100
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Nov 2011 07:57:39 -0800
Received: by ggnv5 with SMTP id v5so1201497ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 07:57:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.197.167 with SMTP id iv7mr50316152igc.46.1320767858906;
	Tue, 08 Nov 2011 07:57:38 -0800 (PST)
Received: by 10.50.40.194 with HTTP; Tue, 8 Nov 2011 07:57:38 -0800 (PST)
In-Reply-To: <4EB9507C.8060507@hale.at>
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
	<4EB90155.3070705@hale.at> <1320761558.10843.39.camel@ted>
	<4EB9507C.8060507@hale.at>
Date: Tue, 8 Nov 2011 07:57:38 -0800
Message-ID: <CAPhnLPACHNsFC6rx1uNOcLKgn68D6qeTYcN=VGns+eRAEqKstw@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 Nov 2011 16:04:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 7:53 AM, Wolfram Stering <wolfram.stering@hale.at> w=
rote:
> On 11/08/2011 03:12 PM, Richard Purdie wrote:
>> On Tue, 2011-11-08 at 11:15 +0100, Wolfram Stering wrote:
>>> On 11/02/2011 07:41 AM, Beth Flanagan wrote:
>>>> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>>>>
>>>> tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies
>>>> buildstats to not collect diskio statistics when we encounter a case w=
here
>>>> the os.major/os.minor is not represented with an entry in /proc/diskst=
ats.
>>> A similar issue exists for building on a btrfs partition.
>>> I posted a message on Oct 28 concerning buildstats on btrfs volumes.
>>> The problem there is, that btrfs's stat() reports fake device ids that
>>> cannot be found in /proc/diskstats.
>> Did this patch help address that problem for you too?
>
> I'll be able to check that tomorrow and report back.

It should as the patch will just disable diskio collection if it
cannot find a valid device id in /proc/diskstats. Let me know if it
doesn't and I'll rework it and resubmit.

-b

>
> regards,
>
> - wolfi
>
>> Cheers,
>>
>> Richard
>
>
>
> --
> Wolfram Stering
> =A0(Entwicklung)
> HALE electronic GmbH
> Eugen-M=FCller-Stra=DFe 18, 5020 Salzburg, Austria
> =A0Tel: +43 (662) 439011 550
> =A0Fax: +43 (662) 439011 9
> http://www.hale.at/
> Firmenbuchnummer: FN 66801m HG Salzburg
>
>
>
> --
> Scanned by MailScanner.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


