Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SB90u-0002GZ-7A
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:15:00 +0100
Received: by wibhj13 with SMTP id hj13so2152941wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QCeAmRgc1pFkQAMt40pw0biM9iZA7SDv8q7B0s+Qa2k=;
	b=L+7giZTeIYqTdCnxPM/C3my/AexSW8zRo2pdHgHXgmT+v0X2444IoM+1pGoTTLU6U8
	ka2gVbu/uxzpt4TntljvP7SXuZc1o07uXEP0zeHS3aYGelrwuDdIMNEQuVSe+cZQw5sB
	Y7q6qP1ByCpSURL7l67j4JFigtwPhNR24q2+YEhOSfledlRD4Am8AuY/elQXKXiCZYkR
	rbhu6gZh08Jby+0OJvCEyfrPVPjlpXCpjP7S72ziVqJ6yw/3NT9tel5aM4N6ORQHjrCO
	JUZVAYN0iOUbMBEsXLXBtF3z0vq9yKBt+/se+XpmRaZa8gYk3HOFMts10pPVi33CrayE
	cxaQ==
MIME-Version: 1.0
Received: by 10.180.85.35 with SMTP id e3mr8598510wiz.6.1332525963962; Fri, 23
	Mar 2012 11:06:03 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Fri, 23 Mar 2012 11:06:03 -0700 (PDT)
In-Reply-To: <CADkTA4PcxbK+Z7HpLj8fWvjBasGBE18MP=m9LBuByDP8bkUJHw@mail.gmail.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
	<01d8d027e7f39cd61467348d17ab94e468164c84.1332522200.git.bruce.ashfield@windriver.com>
	<CADkTA4PcxbK+Z7HpLj8fWvjBasGBE18MP=m9LBuByDP8bkUJHw@mail.gmail.com>
Date: Fri, 23 Mar 2012 14:06:03 -0400
Message-ID: <CADkTA4Nn_S-gotSUi_Shbq6FKZydT8jMsQPvhxrML8CzmghwMg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] linux-libc-headers: set default LINUXLIBCVERSION to 3.2
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
X-List-Received-Date: Fri, 23 Mar 2012 18:15:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 1:57 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Mar 23, 2012 at 1:07 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> Switch the default libc-headers to the 3.2 version.
>
> I spoke to soon. I seeing a problem with iptables in the builds I left ru=
nning.
> I know we looked at this just recently, so it may just be a matter of und=
oing
> that fix.
>
> I'm looking at it now, but waned to follow up right away.

Ah yes, this is the issue that was discussed with respect to some of the in=
tel
BSPs using headers that were newer than 3.2. We temporarily avoided it by
stepping back to the 3.1 headers.

The step back isn't a great solution, so I'm looking at fixing this
properly now.

Cheers,

Bruce

>
> Bruce
>
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> =A0meta/conf/distro/include/tcmode-default.inc | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dis=
tro/include/tcmode-default.inc
>> index 28c25db..b481163 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -22,7 +22,7 @@ SDKGCCVERSION ?=3D "4.6%"
>> =A0BINUVERSION ?=3D "2.22"
>> =A0EGLIBCVERSION ?=3D "2.13"
>> =A0UCLIBCVERSION ?=3D "0.9.33"
>> -LINUXLIBCVERSION ?=3D "3.1"
>> +LINUXLIBCVERSION ?=3D "3.2"
>>
>> =A0PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>> =A0PREFERRED_VERSION_gcc-cross ?=3D "${GCCVERSION}"
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


