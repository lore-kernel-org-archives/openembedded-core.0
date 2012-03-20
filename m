Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1S9w0j-0001Ku-4u
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 11:09:49 +0100
Received: by lbbgi4 with SMTP id gi4so3965132lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jTtBlUEMOvAlx5KO79WMUUUSH6JXl7Y03fU/jk53F4g=;
	b=xXcshfmV03bTCZD7YXxHKZeO+2L7vWkt4Aya6E0jAHZFW0PVFEgXbOqFKyTqRRDouq
	yRXd/SBAr0iX+XOwL21+PmzVMWD2d2IRNN9qygcb7vClBwnlcRwblSwGmJjBVs1ps0wU
	goVu8tA6Db1fgthXI5PKSZIwX/fj81H4HIsPyiA4gi5SCxMTOkoWbfaajiM016a9+pXZ
	jf5nadW2EBWvtzcEFS08C/5Wtj0CU4DR0rzkU7PTtgc5WcCZAjhuw9O3M5sr9oVypMmN
	+AXQSpG37Vgg0bioHMWFQ0sBWIeMzNxlV84wP5O4RG0OU7SHMMvWw7IEz2isZrh0xaTr
	JP5w==
MIME-Version: 1.0
Received: by 10.152.128.38 with SMTP id nl6mr11681675lab.15.1332237656767;
	Tue, 20 Mar 2012 03:00:56 -0700 (PDT)
Received: by 10.152.114.72 with HTTP; Tue, 20 Mar 2012 03:00:56 -0700 (PDT)
In-Reply-To: <4F6852C0.4050409@windriver.com>
References: <cover.1331877464.git.xiaofeng.yan@windriver.com>
	<22ff60ec34d2c54393d4ceb2a81394c6512baa17.1331877464.git.xiaofeng.yan@windriver.com>
	<4F679F53.40302@linux.intel.com> <4F681A97.4020201@windriver.com>
	<665F9083-9747-4972-BCDE-BCE209266221@dominion.thruhere.net>
	<4F685087.6080303@windriver.com> <4F6852C0.4050409@windriver.com>
Date: Tue, 20 Mar 2012 11:00:56 +0100
Message-ID: <CAE4k23-U8gr0_B9jyZb8qXhwQQZLFA6O20PdG7j1SohpdQdx6Q@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] archiver.bbclass: New bbclass for archiving sources, patches, logs and scripts
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
X-List-Received-Date: Tue, 20 Mar 2012 10:09:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2012 at 10:49, Xiaofeng Yan <xiaofeng.yan@windriver.com> wr=
ote:
> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 17:40, Xiaofeng Yan wrote:
>>
>> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 16:07, Koen Kooi wrote:
>>>
>>> Op 20 mrt. 2012, om 06:50 heeft Xiaofeng Yan het volgende geschreven:
>>>
>>>> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 05:04, Saul Wold wrote:
>>>>>
>>>>> On 03/15/2012 11:23 PM, Xiaofeng Yan wrote:
>>>>>>
>>>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>>>
>>>>> Why do you rebuild the tarball here are rename it instead of just
>>>>> copying the original tarball?
>>>>>
>>>> because many packages come from non-tarball and they could be git
>>>> sources , So I archive these sources after do_unpack.
>>>
>>> But if you have the original tarball and reuse it, you'll get the warm
>>> fuzzy feeling of matching checksums.
>>
>> So How about =C2=A0renaming archive-original-source to
>> archive-prepatched-source?
>
> Hi Saul,
>
> Or I can add a new functions to get tarball from downloads if have tarbal=
l
> and archive source codes directory if have directory without tarball.
> Do you think it is necessary for us to add this function?

I'd say that this is a change that should be made. If nothing else,
just to get the assurance that the archived tarball's are the same as
the ones that was used to build the system. (This is beneficial both
when it comes to using the archived tarballs for rebuilding the
system, as well as for ensuring licence compliance).

/Anders


