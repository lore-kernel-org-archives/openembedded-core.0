Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Rb04g-0002DQ-4x
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 02:25:30 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2011 17:18:31 -0800
Received: by iazz13 with SMTP id z13so200098iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 17:18:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.186.165 with SMTP id fl5mr830536igc.86.1323911910716; Wed,
	14 Dec 2011 17:18:30 -0800 (PST)
Received: by 10.50.66.2 with HTTP; Wed, 14 Dec 2011 17:18:30 -0800 (PST)
In-Reply-To: <1323878772.24417.183.camel@phil-desktop>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
	<38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
	<1323878772.24417.183.camel@phil-desktop>
Date: Wed, 14 Dec 2011 17:18:30 -0800
Message-ID: <CAPhnLPBkYypd_S6-UcZ61UGy2kxG+=bQ56N179fmD5e6g0cLhQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] OECore license fixes: meta/*
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
X-List-Received-Date: Thu, 15 Dec 2011 01:25:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2011 at 8:06 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-12-07 at 11:34 -0800, Beth Flanagan wrote:
>> diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-exten=
ded/less/less_444.bb
>> index c78dbaa..f198692 100644
>> --- a/meta/recipes-extended/less/less_444.bb
>> +++ b/meta/recipes-extended/less/less_444.bb
>> @@ -7,11 +7,14 @@ SECTION =3D "console/utils"
>>
>> =A0# (GPLv2+ (<< 418), GPLv3+ (>=3D 418)) | less
>> =A0# less is a 2-clause BSD-like permissive license
>> -LICENSE =3D "GPLv3+ | less"
>> +# Reading LICENSE and COPYING indicate that GPL-3+ is suffient.
>> +# openSuse .spec and Debian seem to agree here. setting to GPL-3+
>> +
>> +LICENSE =3D "GPLv3+"
>
> This change is rather misleading. =A0The point of the "Less
> License" (effectively 2-clause BSD) option given by the README is that
> it provides a non-GPLv3 route for distributing the binaries -- i.e.
> makes the package usable by people who can't tolerate GPLv3 for whatever
> reason. =A0If the recipe is marked as simply GPLv3+ then it will appear
> unusable to those folks.
>
> If we have to pick just a single license for less then it seems that the
> BSD one would be a better choice than GPLv3+.
>
> p.

I have an email out to the author to verify if it would be ok to use
BSD-2-Clause. If so, we can switch it to that. If not, we'll add less
as a license type.

Sound ok?

-b

>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


