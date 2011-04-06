Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q7ZoX-0008Jw-58
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 22:58:57 +0200
Received: by fxm19 with SMTP id 19so1443023fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 13:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=6O9GzaNlHpTCyWH7fioqwCLO21rQRYoto5WjCLH5s3I=;
	b=HDFiGD8JG8EJlubCYM/o7fdhYqJ+W9DyZQPGtNMvCf9ovD0rkePCRrTbhYCWI+u1UE
	LPilfBdodM0QLdJs62GodZ9iru8vVcq+cto2UAlQhPq4uI+zKROU6TiDVPUnOnOzw7gF
	HDRNM+9v6sGqvG9F/geN3PZZdJLdEJmVh/z8c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=IhPewwNiuE/faHT+lqKH1OHZmcOtgAq7c6ZbMue9oX/ouynhKFLp7B+Vcf4Dup2sAt
	kii/wdxcxcxu6pVEdTgrK5gC7uPXR6bii0LgA/SxbvYJ5hFPZOsYUlUIBdlM0wDxgdLF
	j2p0jmrmfNrhIh+qenD1Hks+3XhP3B2soZsFs=
Received: by 10.223.14.137 with SMTP id g9mr84942faa.8.1302123410104; Wed, 06
	Apr 2011 13:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Wed, 6 Apr 2011 13:56:20 -0700 (PDT)
In-Reply-To: <4D9CB570.3010405@mentor.com>
References: <cover.1302050252.git.tom_rini@mentor.com>
	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
	<BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
	<4D9C78F5.1090808@mentor.com>
	<BANLkTi=UeQ22hquxLPihJAnLzpW8ODpAkg@mail.gmail.com>
	<4D9C9E75.1060203@mentor.com>
	<BANLkTimuM8GCHd11cuH5ULA6jL=3kZDk6w@mail.gmail.com>
	<4D9CA452.1020205@mentor.com>
	<BANLkTima10dD9MWq92OqTouOBqbMzAidqQ@mail.gmail.com>
	<4D9CB116.4010401@mentor.com>
	<BANLkTikqvNUWT5dDbJ6XDGCnnWH+3AeBxg@mail.gmail.com>
	<4D9CB570.3010405@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2011 13:56:20 -0700
Message-ID: <BANLkTinf=yjOqxwXS48gQVUVRdMromyk5Q@mail.gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Wed, 06 Apr 2011 20:58:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 6, 2011 at 11:48 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 04/06/2011 11:32 AM, Khem Raj wrote:
>> On Wed, Apr 6, 2011 at 11:29 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>> On 04/06/2011 11:27 AM, Khem Raj wrote:
>>>> On Wed, Apr 6, 2011 at 10:35 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>>>> On 04/06/2011 10:26 AM, Khem Raj wrote:
>>>>>> On Wed, Apr 6, 2011 at 10:10 AM, Tom Rini <tom_rini@mentor.com> wrot=
e:
>>>>>>> On 04/06/2011 10:05 AM, Khem Raj wrote:
>>>>>>>> On Wed, Apr 6, 2011 at 7:30 AM, Tom Rini <tom_rini@mentor.com> wro=
te:
>>>>>>>>> On 04/05/2011 11:18 PM, Khem Raj wrote:
>>>>>>>>>> On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> w=
rote:
>>>>>>>>>>> The previous 5.7 release was relatively close to 5.8 due to it =
bringing
>>>>>>>>>>> in a patch to sync with upstream work-in-progress. =C2=A0We ski=
p over the
>>>>>>>>>>> 5.8 release and move to 5.9.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> there already are patches for 5.9 available too
>>>>>>>>>> ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz
>>>>>>>>>
>>>>>>>>> Wrong link? =C2=A0That reverse applies to ncurses 5.9 release. Bu=
t
>>>>>>>>> regardless, is ncurses something we need to be tracking top of tr=
ee for?
>>>>>>>>> =C2=A0It seems like we needed to for 5.7 since there had been a l=
ot going on
>>>>>>>>> without a release but that seems to have changed now.
>>>>>>>>>
>>>>>>>>
>>>>>>>> those patches usually contain critical bug fixes including securit=
y updates
>>>>>>>> so it will be of interest to keep track of it
>>>>>>>
>>>>>>> Well, it doesn't currently. =C2=A0And while I agree we need to do a=
 good job,
>>>>>>> everywhere, of keeping track of security updates, I don't think we
>>>>>>> should move back to depending on a site that frequently removes pat=
ches.
>>>>>>>
>>>>>>
>>>>>> yes. cache the patches like yocto did for 5.7 recipes
>>>>>
>>>>> That still leaves the problem of there not being a valid patch there =
at
>>>>> the moment. =C2=A0And I still don't see why ncurses needs to be in th=
e bucket
>>>>> of recipes we track the scm for rather than relying on the latest sta=
ble
>>>>> release.
>>>>
>>>> 5.9 was released few days back so that patch might be lean for now
>>>> but I assume overtime it will get fatter
>>>
>>> It's invalid at the moment, yes. =C2=A0But you haven't explained why nc=
urses
>>> needs to be in the bleeding edge bucket. =C2=A0Usually this is for stuf=
f that
>>> hasn't really reached a stability point.
>>>
>> It does not have to be but those patches are cumulative fixed that are d=
one
>> on top of a release. I am sure we will also run into the problems those =
will
>> fix thats why its better to keep and eye on them
>
> That can be said for just about every recipe we have. =C2=A0It sounds lik=
e
> you're suggesting we need _svn recipe or similar recipe for ncurses as
> well. =C2=A0I still don't see why ncurses is special in this regard and a=
sk
> that when you see a worthwhile patch for ncurses 5.9 that you do another
> pull request. =C2=A0I'm just trying to keep oe-core in sync with
> openembedded.master.
>

Those patches are not same as all patches that would be applied to say
svn version these are fixes on top of a release e.g. 5.9 I was merely
suggesting that your upgrade patch is fine please see if there already
are some fixes on top of 5.9 that we need
thats all


> --
> Tom Rini
> Mentor Graphics Corporation
>


