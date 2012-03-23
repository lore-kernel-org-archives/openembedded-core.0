Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SBBba-0004ys-1L
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 22:01:02 +0100
Received: by lbbgi4 with SMTP id gi4so2747140lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=/P8CuIS2Mq+IbexVl9swYw0FPelAc6r3joNN3S9egEY=;
	b=BwfoQwn08gLkepcegPlzUqM4mzbKIBHoho/UANi5KuOoqYEFU4KIHUne4U4tmclEcB
	SHjy/cnqabI/sCoTGdA3pJTDjkYqZtQ5ZJznv1vJ7e3sERyo70dLKMeLQFUBHXbzfSt1
	sBExeyoCej4aCWd4R/dKWHf2MTuy9lnZ664Uyt0Ppk05UG5gcmZvxTpkRzWe+MMYtfLY
	AKKQWpxzb28kZ2WwyYxTHrnixq346f5woqA80dqIJqmy9XWNPTN/2FQWIppm0sCf+8Or
	wYSVrrRQoBe74FVkD2V32l4MjlDv9FxhwvcaVIthvoKFwZ/v87fNT3o0NdLO54saXeMl
	/neA==
Received: by 10.152.102.228 with SMTP id fr4mr9827409lab.23.1332535925397;
	Fri, 23 Mar 2012 13:52:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Fri, 23 Mar 2012 13:51:35 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137C822@ORSMSX106.amr.corp.intel.com>
References: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137C822@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Mar 2012 13:51:35 -0700
Message-ID: <CAMKF1sp6Jap9yGJfzDZ2k1dHm6XbwMmWL_UctvO21ngf3teMtw@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: Fix linking issues when python support is enabled
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
X-List-Received-Date: Fri, 23 Mar 2012 21:01:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 11:16 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>>
>> gdb-cross-canadian was linking with static version of libpython
>> and looking for build host python when run. This could be mismatch
>> between python-nativesdk and build host provided python. So we
>> make it consistent to always use python-nativesdk
>>
>
>
> Khem,
> =C2=A0In my debug effort, I did not find that gdb-cross-canadian was
> linking with static version of libpython. How did you find that out ?
> I think I can learn a lot from you :)

Fire up gdb and persevere there is no secret sauce :) and hope for
good luck that you see something.

>
> Thanks,
> Nitin
>


