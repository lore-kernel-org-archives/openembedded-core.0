Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1603865D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 17:03:40 +0000 (UTC)
Received: by igbif5 with SMTP id if5so3872583igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=DeJnRE8GSiqyU3UTofGo4pFpLUeY1mgkVeNhTuRQyjQ=;
	b=JlPlzZg+6wvhR2KkHxyUnQUSQrCr62R+x14MCrXP8Z+IZhuX+XfBvFqgX505tRwQsw
	3rv3Cu3nSBtFHVHyf/0v4DupebdPUIUkKWahgsfPvV6gCUF48GR5/oNtktObcgbmgb43
	3D7wm2uMpXjjiFZ2ZtAvnluQXOnpae9gwAqwV7w83/OpMVOHAj67cjBP85Ti0bO8qZNx
	20ReULjJYeCy8ifiU/4IX9IRr0UXYeNgd/9+QAx0j3PvO6XnowbUvm2rM9Ucc3DKLF29
	KSeeanlHEU430cGd3FiPAVZvm9QuRqCVFUFSU9e5wB3X8T11s+RPMRp3RQFfwqe3fDux
	Wh6Q==
X-Gm-Message-State: ALoCoQnG3BhpFkdi7x1GAErrP0q+Fq6d4cct7542gqXA7Hrer8uJ7dd387SsIcNx/qkGY1y1rKVb
X-Received: by 10.50.30.7 with SMTP id o7mr17486376igh.90.1444755821046;
	Tue, 13 Oct 2015 10:03:41 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176])
	by smtp.gmail.com with ESMTPSA id d7sm1900281igl.1.2015.10.13.10.03.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 10:03:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofl186 with SMTP id l186so28050105iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:03:39 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr5047927ioi.192.1444755819116; 
	Tue, 13 Oct 2015 10:03:39 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 10:03:39 -0700 (PDT)
In-Reply-To: <EEE571F8-C3A1-49F6-89B6-30D5F50B972D@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
	<2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
	<CAP9ODKoN8S-nqASuUsRzt_qeuPGBuhsoHPeH_NFHEGbHWbGd+Q@mail.gmail.com>
	<CE766E63-DA13-44FF-AE6A-B76615CE56DA@gmail.com>
	<CAP9ODKpgFEmuXzG8xQpA3g4ou2Swoyq2wpds6v5Uqo5kk2aFcg@mail.gmail.com>
	<EEE571F8-C3A1-49F6-89B6-30D5F50B972D@gmail.com>
Date: Tue, 13 Oct 2015 14:03:39 -0300
Message-ID: <CAP9ODKrhZPZNHfYMc0H=VNdjqY=_rGOfWpEXF6FnU58XRdnotA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc build error when it is rebuild due hash mismatch
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
X-List-Received-Date: Tue, 13 Oct 2015 17:03:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 2:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 13, 2015, at 9:59 AM, Otavio Salvador <otavio.salvador@ossystems.=
com.br> wrote:
>>
>> On Tue, Oct 13, 2015 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Oct 13, 2015, at 9:53 AM, Otavio Salvador <otavio.salvador@ossystem=
s.com.br> wrote:
>>>>
>>>> On Tue, Oct 13, 2015 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>>> On Oct 13, 2015, at 9:45 AM, Otavio Salvador <otavio.salvador@ossyst=
ems.com.br> wrote:
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> From time to time I see following error:
>>>>>>
>>>>>> | /usr/bin/install -c -m 644
>>>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-=
gnueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
>>>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-=
gnueabi/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
>>>>>> | /usr/bin/install -c -m 644
>>>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-=
gnueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
>>>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-=
gnueabi/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
>>>>>> | msgfmt -o rw.mo rw.po
>>>>>> | /bin/bash: msgfmt: command not found
>>>>>> | Makefile:84: recipe for target 'rw.mo' failed
>>>>>> | make[2]: *** [rw.mo] Error 127
>>>>>> | make[2]: *** Waiting for unfinished jobs....
>>>>>> | make[2]: Leaving directory
>>>>>> '/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux=
-gnueabi/glibc/2.22-r0/git/po'
>>>>>> | Makefile:234: recipe for target 'po/subdir_install' failed
>>>>>>
>>>>>> and it seems to happen when a rebuild of glibc is triggered due a
>>>>>> change in the sstate hash. The host is a very minimal system so it
>>>>>> explains why it does not provide the msgfmt in host and also might
>>>>>> explain why it is not being catch in Yocto Project AB.
>>>>>
>>>>>
>>>>> are we missing a dependency on gettext-native ? it could be that AB s=
laves have gettext installed on host
>>>>> and you don=E2=80=99t.
>>>>
>>>> First build works fine; rebuild fails. So I am not sure this is the cu=
lprit.
>>>
>>> it might not be rebuilding message catalog first time.
>>
>> Right but in this case:
>>
>> - we fix it to not rebuild it
>> - we fix why it is not building it
>>
>> I am a complete ignorant in glibc build system. Can you help on this one=
?
>
> share the complete logs for first time and second time builds somewhere.

I will try to come up with  a way to reproduce it. I don't have the
logs anymore.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

