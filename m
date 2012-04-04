Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SFKfU-0000R8-79
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 09:30:12 +0200
Received: by wera1 with SMTP id a1so306181wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lIhYFDP6fGNp8KAczu6qUwCv4enTHlJ8ak9cjtqtMfQ=;
	b=mR19DPfdYVqy1wTJQP0E8vYp6JYyN63+XfFZmwFNvbZqVzRuuvMK2PzLQCRAubrgS3
	M0SL8kzj8KKnafO98iGMUlcZ6annfqdU0awv2EvpkC0QbQT3WMEMw6fQ48IDofgjfqns
	/Dhy/fKLLPfeHtB9ddj/BHEEBfVQOderZybv1x+Fg29a2fbQLLFcJRRmwDupocIIpjC8
	f44QALSb3VjcL9AFY5NXDOiT/vfmzV+2mpvw2T73oQbLY/CpAyxbMVKMhfxckoz5ONmi
	8C1YOPrXUxUzNxlhOWCZQcKzJp0PpwsJSuY5CZoeQzVc23LpVRa1kn2bZFpfmesijwDw
	IPDw==
MIME-Version: 1.0
Received: by 10.180.79.72 with SMTP id h8mr2675516wix.1.1333524062140; Wed, 04
	Apr 2012 00:21:02 -0700 (PDT)
Received: by 10.223.104.68 with HTTP; Wed, 4 Apr 2012 00:21:02 -0700 (PDT)
In-Reply-To: <20120404091834.367f9617@eb-e6520>
References: <loom.20120404T082801-1@post.gmane.org>
	<20120404091834.367f9617@eb-e6520>
Date: Wed, 4 Apr 2012 09:21:02 +0200
Message-ID: <CAGiJk9f_=5pVUurpPT4pO3qPZC=bOn2Qg_1iaaE=A5g+0cG1Vw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to rebuilt the package after modified the source code in open embedded bitbake ...
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
X-List-Received-Date: Wed, 04 Apr 2012 07:30:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/4 Eric B=C3=A9nard <eric@eukrea.com>:
> Hi Surenda,
>
> Le Wed, 4 Apr 2012 06:34:39 +0000 (UTC),
> surendra dhobale <surendra.dhobalelinux@gmail.com> a =C3=A9crit :
>> =C2=A0I am working with the open embedded environment.
>>
>> I have added one u-boot package in that. First time by default the compi=
lation
>> done successfully using the bitbake. But Now i made some changes in the =
source
>> code , which is created in the Temp work directory.
>>
>> Now i have to built the same package with neglecting the fetch() stage.
>> and rebuilt it means need to compilation.
>>
>> Is any commands for that...
>> Can please anyone explain me in deatails about that. I am newbie in the =
open
>> embedded.
>>
> bitbake u-boot -c cleansstate
> bitbake u-boot
>
> Eric

Hi,
please note this will delete local changes (in thework directory) to
the sourcecode!

If you only want to compile again you can use

bitbake -c compile -f u-boot
and then "bitbake u-boot" to build the other tasks.

--=20
Regards
Samuel


