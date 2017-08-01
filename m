Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47EBC78242
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 15:47:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q189so3675879wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9kS7FGdp11mzvF6XhHP5h2/PXBL9N/urXVWrpZa0ZZU=;
	b=IyXooUk/IFK6YRiSAtEU/gYBsCwSBnL41ai7nsxGTOny4LeSQkCkznGJeOiAivvjom
	dn4A5fAv7sloG1Go1pAZRQ8V6Rtb9f1Z0RegxEvHhhoT/VRYFmJCwvFYvoXKuLAYpdG3
	mbDRuEtHB0yRcUIzOyHtchzfGkDDSMDXB2amXgICAERgf+k0vmZ7qZwhNzcT9Ohqyn+W
	bzQAUyUCileP2xEvOTUQr0+M7AwgCpCjDZ0f+FaITBZa1wq+0uYsWVyAUleNOZfJrJsH
	zWz8RWAbC/VAldtFFr80ei608fKi54/fQr1GL9QVUFKEbi9uBOFHvFQCMv7IDvYiGpbS
	8ugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9kS7FGdp11mzvF6XhHP5h2/PXBL9N/urXVWrpZa0ZZU=;
	b=s5jtZabo+Thu23it6rbs1aH1JS1SktEGzmYJ8A6kgfF81Xxjd/aQ135mggLGvmU2Uk
	lVeDIlUkQFKV1Sl6W/ceagGVakCTH2HYTL0QS3QHFVNrh9b7lp+uAvce+7aGl/vTdswM
	st9xe66UrUWFxetdbiCtXHgnScnr27HN+OnaIZeQE5BM2UXudyY1KWarEc4Z0N1p2gs2
	Nr/eUEZ/lqWcKPSFtIT5M+N6X3Wg1QcnUsjzfNrTN4psd23SUAvLadIwEO2T/LHog/XE
	m/cMsFIZvqyCSmIGy1z7omzzk6RxJtr56hyiMJS/8wbK30ZuO84CkxeqEN5cE13eo7nF
	/adA==
X-Gm-Message-State: AIVw112TuyNWJWSrYtLZjIAU83jjekh9ODSG4qxClyhdAUtA12O51Yds
	8sKeTaTlBqgoZcX8ozA9s7aSS1je2g==
X-Received: by 10.80.147.197 with SMTP id o63mr18354912eda.194.1501602444830; 
	Tue, 01 Aug 2017 08:47:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 1 Aug 2017 08:46:54 -0700 (PDT)
In-Reply-To: <0ba13ea2-54b8-f447-1e85-5f84a15c3f82@windriver.com>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
	<1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
	<c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
	<e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
	<ef1580a9-9643-f8ad-1865-78fc5f6aeec4@gmail.com>
	<CAMKF1sp+4C4XPUf5Xhc=fhKiidy-YHqrkLZzhGpToTexCV=1pg@mail.gmail.com>
	<0ba13ea2-54b8-f447-1e85-5f84a15c3f82@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2017 08:46:54 -0700
Message-ID: <CAMKF1sp4xrp0hEXh2sY3tb0Sk61S8k_ToX=LBQfp5e3ioYUtOQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Tue, 01 Aug 2017 15:47:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2017 at 8:24 AM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 8/1/17 10:20 AM, Khem Raj wrote:
>> On Tue, Aug 1, 2017 at 8:17 AM, akuster808 <akuster808@gmail.com> wrote:
>>>
>>>
>>> On 07/31/2017 12:04 PM, Khem Raj wrote:
>>>>
>>>>
>>>> On 7/31/17 10:51 AM, Mark Hatle wrote:
>>>>>
>>>>> On 7/31/17 12:40 PM, akuster808 wrote:
>>>>>>
>>>>>>
>>>>>> On 07/31/2017 10:31 AM, Mark Hatle wrote:
>>>>>>>
>>>>>>> On 7/31/17 12:16 PM, Armin Kuster wrote:
>>>>>>>>
>>>>>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>>>>>> ---
>>>>>>>>   meta/conf/machine/include/arm/arch-armv8.inc | 25
>>>>>>>> +++++++++++++++++++++++++
>>>>>>>>   1 file changed, 25 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>> b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>> index 5e832fa..dc1ba5e 100644
>>>>>>>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>> @@ -1 +1,26 @@
>>>>>>>> +DEFAULTTUNE ?=3D "armv8-a"
>>>>>>>
>>>>>>> do we want the '-a'?  The other arm (7) are of the format armv7a (n=
o
>>>>>>> '-').
>>>>>>
>>>>>> works for me either way.
>>>>>>
>>>>>> While we are at it. How would we want =E2=80=98armv8.1-a=E2=80=99, =
=E2=80=98armv8.2-a=E2=80=99,
>>>>>> =E2=80=98armv8.3-a'
>>>>>> formated as?
>>>>>
>>>>> My preference is to drop the '-'.  As for the '.', I'm not sure.. not
>>>>> something
>>>>> we've run across before.
>>>>>
>>>>> We could just drop it (the '.'), but it really depends on if armv81a
>>>>> would
>>>>> confuse someone (familiar with arm) or not.
>>>>
>>>> I would suggest to also sync  with other distros and ensure that we do=
nt
>>>> do something different. Its very costly later. Since applications get
>>>> ported to most common combination
>>>
>>> Sync what part? naming of file? ( sorry lost regarding your comment)
>>
>> naming convention for arch e.g.
>>
>
> I'd say Debian/Ubuntu -- Fedora/RH would be the two primary sources I'd l=
ook at.
>  Between debian package names and RPM package names, it should give a clu=
e if
> there is any community standard forming for those names.
>
> (May still be too premature for those environments for the armv8.X-a nami=
ng...
> and I've not seen it discussed on any other lists either.)

yeah, it will be good to not go through the pain of community doing
something else later
like *-*-gnueabihf triplet was invented and to date we keep fixing
packages for OE
to account for gnueabihf can be gnueabi + -mfloat-abi=3Dhard but
packages just assume


>
> --Mark

