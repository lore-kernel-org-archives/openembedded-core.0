Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 63A4874007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:51:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 08:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; 
	d="asc'?scan'208";a="937753135"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by orsmga003.jf.intel.com with ESMTP; 24 Feb 2017 08:51:06 -0800
To: openembedded-core@lists.openembedded.org
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
	<26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
	<1487946072.10512.9.camel@intel.com>
	<d20dc7dc-c3d0-ab79-948e-2caab91d3caf@mlbassoc.com>
	<1487953650.10512.14.camel@intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <da870aaf-6b32-a0ae-787d-44108ba789ec@linux.intel.com>
Date: Fri, 24 Feb 2017 10:50:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487953650.10512.14.camel@intel.com>
Subject: Re: Patchwork not picking changes from the ML
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
X-List-Received-Date: Fri, 24 Feb 2017 16:51:07 -0000
X-Groupsio-MsgNum: 93945
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eIjMh4S4RSdCWDaJXA6RFrBXUVMfTcDQj"

--eIjMh4S4RSdCWDaJXA6RFrBXUVMfTcDQj
Content-Type: multipart/mixed; boundary="gSoHUxJEs4Hf4OmO36b1ix3K10nFEadfs";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <da870aaf-6b32-a0ae-787d-44108ba789ec@linux.intel.com>
Subject: Re: [OE-core] Patchwork not picking changes from the ML
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
 <20170222204736.GG3283@jama>
 <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
 <26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
 <1487946072.10512.9.camel@intel.com>
 <d20dc7dc-c3d0-ab79-948e-2caab91d3caf@mlbassoc.com>
 <1487953650.10512.14.camel@intel.com>
In-Reply-To: <1487953650.10512.14.camel@intel.com>

--gSoHUxJEs4Hf4OmO36b1ix3K10nFEadfs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On 02/24/2017 10:27 AM, Patrick Ohly wrote:
> On Fri, 2017-02-24 at 15:33 +0100, Gary Thomas wrote:
>> On 2017-02-24 15:21, Patrick Ohly wrote:
>>> On Wed, 2017-02-22 at 15:56 -0600, Jose Lamego wrote:
>>>>
>>>> On 02/22/2017 02:55 PM, Michael Halstead wrote:
>>>>> I've seen several issues with hooks. I was working on them yesterda=
y and
>>>>> will continue today.
>>>>>
>>>>> These are currently managed by hand but we are moving them into
>>>>> configuration management which should help keep them working consis=
tently.
>>>>
>>>> Michael: one syntax error in patchwork code was pulled into producti=
on
>>>> yesterday. This is the cause for missing patches. The error is fixed=
 in
>>>> the Yocto repo now, please perform a server code update ASAP.
>>>>
>>>> Martin: I will look at the UI issue you are describing and file a bu=
g if
>>>> needed.
>>>
>>> Would it perhaps make sense to reply to the original author with an
>>> email confirming that his patch is now in Patchwork? It should includ=
e a
>>> link to the patch series, too.
>>>
>>> This could have several advantages:
>>>       * submitters not aware of Patchwork or whether their target
>>>         currently uses it learn about it and then can follow the
>>>         progress of their patch
>>>       * everyone gets a confirmation that the submission made it thro=
ugh
>>>         the various mail servers and Patchwork itself
>>>
>>> It still relies on the original submitter to watch out for breakages =
in
>>> the processes, but I guess that can't be avoided with an asynchronous=
,
>>> mail-based process.
>>>
>>
>> I would love to see this added to the process - +1 :-)
>=20
> Let me clarify that my original proposal was to reply only to the
> original author. That was meant to keep noise down on the list. However=
,
> perhaps it should also go to the list?
>=20
> Then others can help check that Patchwork works, as the original author=

> might not be aware that a response is missing. It also tells everyone
> the relevant link in Patchwork.
>=20
There is a filed request to enable email notifications in patchwork:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7684

this notifications will let users (both submitter and CC'ed-users) know
through an email about any patch status change (including "New"). Users
will be able to opt-out of such notifications.

However, this do not covers the case when submitter is not registered as
a Patchwork user. So, there might be a one-time-only email notification
to this kind of submitter, as Patrick suggests.

If I don't get any objections for this, I'll file a request in bugzilla
next week.

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--gSoHUxJEs4Hf4OmO36b1ix3K10nFEadfs--

--eIjMh4S4RSdCWDaJXA6RFrBXUVMfTcDQj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYsGR6AAoJEFJAtowlSEbnK68H/1fw07GTsvg8iJneNmMviKqS
OsYluL76sk5Ki5GlJEvRyk6Vk0/2/gC4o2GXCWGURXUbG6CI9NcEasGrw73yenZl
1GdJOfRxwBaM0vZ86ARUbIkYHroiWp09Q/gbbx+REMEL7BhUtR6qBys+FywOUPHj
Xspm23JScUS4ELce58GHcz8ZXcei+CHRoj+JkxyWSXqUydGBqcEtg1Z8nuIANDdu
cP3+Ix9Lb+CLdVMVbANVAaDBnc5VZ/qGVjHeeaGMNYzXiBWTOzLk8+jLk9eVQDmP
L2toxDkRFAV0kGlo88POM1RpknYMqxDtNVQKwnNzfbiFkEBpBcYHc2nabIHG4EY=
=PGcY
-----END PGP SIGNATURE-----

--eIjMh4S4RSdCWDaJXA6RFrBXUVMfTcDQj--
