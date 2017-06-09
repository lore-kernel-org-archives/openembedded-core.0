Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 68FBE78299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:08:18 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v104so7063356wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rzs5mD0xD310y1jzhpK1wkYO7vKEaMEos5ZgvNiHn0w=;
	b=IZ0vg2NHRnCiNq1kbklchh7vKUz81i3rxK1OtnbsTQ1MifjM1+LTu3L+vG6CrdmobA
	oOfudTDvjNGnkYdbD3IvSurnnnNrdihQU6gANp+WLf3jD5sAY+1pgCtPIUXqV/OlNVt3
	R9uc1TT/C6s20TodAP23ZXN2a7FwLmvKBNX76f5V3JFrwcRfb8wOdEfYUyLhKxa4ahRs
	vZgBdRihQJkUSA/duvBKi4nHUDqHLsFagVRr4UWN+Q3DOc8t5ld0EPxH/4FTgpJtTV1U
	TN3UMosRVPtlfWpZGjvS8+qBGCMKRUucgBZrswetOzL3LxTeTeNlbfXXnC757UrSwcC5
	aflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rzs5mD0xD310y1jzhpK1wkYO7vKEaMEos5ZgvNiHn0w=;
	b=UpVo+VghIMSjTtmoG5nHkn5hIh6eJAGwPbY9SaVF+Ll7AwHwUti85ncrqZLo5e2NsW
	Xea16eQt7o6jszk039fTo2zZHG7dX3ooo1B0EFLhb8YEgoElhc+WTLxblVgVbzV6OFFB
	Uj9foyjt30hmsal7o5AwNl0uNamfjRnkvWwiGD7wX7Qw4z4Wc7OC9eZVUTc37WdsA6gJ
	DTpIYZgcIhYdbRdhF5BHK51T57RHAfFelUdG1MnjrE5fiyeyWpYIU9DM3jX0cXl8JDwq
	Suwh9AtM3sLMrSeI1avbrjPcid9zcBl3bfPugEtY6lrxqncnDMojorTkX/RlGpoGZALv
	GT1A==
X-Gm-Message-State: AODbwcB7WxNf8LI0kxP7n6xgzjb+TwHVkF4sPgyud7csu6SDb20DL32y
	ka7j+j/oOiU95pWEfHo9NvgDgLeq1Q==
X-Received: by 10.80.144.68 with SMTP id z4mr18899785edz.143.1497017299259;
	Fri, 09 Jun 2017 07:08:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Fri, 9 Jun 2017 07:07:48 -0700 (PDT)
In-Reply-To: <1497016935.4561.15.camel@andred.net>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
	<1497016935.4561.15.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Jun 2017 07:07:48 -0700
Message-ID: <CAMKF1srS+2VRneAsaZrH1y9GtZbA4Uf94ZdB0dWOSwuVDuBkHA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 09 Jun 2017 14:08:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2017 at 7:02 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
>> On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com> wrot=
e:
>>
>> >
>> > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > > +SECURITY_CFLAGS =3D "${SECURITY_NO_PIE_CFLAGS}"
>> > >
>> >
>> > These tend to go into security-flags.inc, not the recipe.
>> >
>>
>> I know that's been the case but I think having a global file is error
>> prone
>> its better to have it in recipe context since it can get attention at
>> upgrade time to test if this has been fixed in new release etc
>
> Isn't one of the main root causes really that bitbake passes -fpie -pie e=
ven
> when the recipe is building a shared library?

thats a different case not relevant to this one as much. here we have textr=
el
in pulseaudio  PIE executable

(Maybe not in this case here,
> though). Obviously, bitbake doesn't really know about shared libraries, a=
nd
> yes, each recipe's build system could filter out pie flags for shared
> library targets, but that's probably better done at libtool level:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/=
110048.html
>
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

