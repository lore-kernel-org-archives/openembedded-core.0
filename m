Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB8074DEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 21:46:31 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id a2-v6so1206225uak.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B9sIZ7Vg8NlqHHx7bj09oDyJOsytYxzyvOQkK3KLbOg=;
	b=mW+afA93lZ8S5BdGly6kfO2A472bNgLFty4VJQ7lYAisFigFeI6Dy7+9B9GBkznfU0
	w+0DgUZHYqQEl/i2EUa080oivNoew7OnRy08B7PbslRZf9xfCT6hDkQZ4jGL97pDwxdZ
	S4kCCZn0Jlfpo43AsL1E2obrPCKB5vjfB5VK+yMYvgKnAOC3nkpzl6Z1gBndv54T9FXl
	TDWPK7DY28XUMNg2rAMj9d+lc/9BOn0dwm1mJsjJcezFyyB81mQ8f4IJX5KKplq6CsUa
	StcFNbBUsQIldQKv/VDriPiHdA4j0AHt1Phqygk2BTq9K7G2HKssMXRUz/TuqUVdlUaa
	rP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B9sIZ7Vg8NlqHHx7bj09oDyJOsytYxzyvOQkK3KLbOg=;
	b=a+1DAyPV+k+gSi1Y8MRrtUFAVIh5p3Q6wepET3ML4nqDVaNXiWrvU/YtP/E51e3+yV
	Zkd/ixGnw/0hI8HxhEh/oQnPBUTJjHk4/vNPZVNbRQUt4VWYUCO3lop9C/RTbKoKPSn1
	qV7I25P1zCLab5s2jdmoJbVwN6CmIMSwW8RIfoFxLyZZHzR6F47x5kInf+wT9ivQCgz+
	WkGKdjGVjsrppeInGrt2EVlP085FKB5B14KO0Y4uWBrm3zO1Dp45GPyL3g5cWVpBiCzW
	wyTyj96+KIphlkCiyQ/0MtXh9rNdLzro0nunyza//11CDvxFsbQOWZ/1Fzp9oT22Bmvl
	KR3Q==
X-Gm-Message-State: ALKqPwe+xzGA7dhIhH5yfo39M8NwEgkuksfwQk1hrSs2k6w9HK5iZBvp
	dzgffBC4fn8/OVS8SVTPl17Su14mEEz0uikdfdU=
X-Google-Smtp-Source: AB8JxZosjsCoIlVZiJLvGLmI3FJp1byCrkbzizw4PmfSJLUbWGBXSnlYfqmwPvIawpwdHkHabMiypSImK2Q7WOI1irg=
X-Received: by 2002:ab0:5326:: with SMTP id
	x35-v6mr17899462uax.29.1526420792396; 
	Tue, 15 May 2018 14:46:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.4.44 with HTTP; Tue, 15 May 2018 14:46:11 -0700 (PDT)
In-Reply-To: <CAC+thW1r84j-+k_6xU3hESZnjwLYTUc3nWQFpca+=zkLU-ORNw@mail.gmail.com>
References: <BN6PR1201MB019576F9685E3FFFC5E183E08B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<1526286006.5720.113.camel@linuxfoundation.org>
	<CAC+thW1r84j-+k_6xU3hESZnjwLYTUc3nWQFpca+=zkLU-ORNw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 15 May 2018 23:46:11 +0200
Message-ID: <CAC+thW0aW-cuOFRb80JAKQi4hCLCaLGu9tONEev4byj8kuCJog@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Running BitBake multiple times without rechecking upstream AUTOREV versions
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
X-List-Received-Date: Tue, 15 May 2018 21:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 5:43 PM, Andrea Galbusera <gizero@gmail.com> wrote:
>
>
> Il 14 mag 2018 10:20 AM, "Richard Purdie"
> <richard.purdie@linuxfoundation.org> ha scritto:
>
> On Fri, 2018-05-11 at 18:23 +0000, Chris Laplante via Openembedded-core
> wrote:
>
>> Hi all,
>>
>> I=E2=80=99m working on using Jenkins to host our Yocto build. One of the
>> things that would be nice is to be able to do a =E2=80=9Cbitbake our-use=
r-
>> image=E2=80=9D, upload the artifacts to our network file storage, and th=
en do
>> a =E2=80=9Cbitbake our-user-image -c populate_sdk_ext=E2=80=9D. I=E2=80=
=99d like to do these
>> separately so that developers are not waiting around for the eSDK to
>> be generated if all they care about is the kernel, for example. My
>> concern is that the second bitbake invocation could end up building
>> different stuff if someone were to check in code in between when the
>> two =E2=80=9Cbitbake=E2=80=9Ds are run. This is primarily a concern with=
 recipes that
>> use AUTOREV (as we do for development purposes).
>>
>> Is there a way to essentially =E2=80=9Cfreeze=E2=80=9D the BitBake data =
store and re-
>> use it across multiple bitbake invocations?
>
> Have you tried BB_SRCREV_POLICY =3D "cache"?
>
>
> Out of curiosity and probably unrelated to the OP's issue with images/SDK
> SRCREVs consistency issue.... Could setting this variable be of any help
> even for building usable eSDKs when AUTOREV is around? There's an issue i=
n
> bugzilla (don't have id at hand) dealing with eSDK / AUTOREV
> incompatibility...

Here is the link to the above mentioned bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11350

