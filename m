Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE5A73CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:59:34 +0000 (UTC)
Received: by iofl186 with SMTP id l186so27910207iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=2tP3gQ1P+hvU1wJzIYWqKg0bATKckVqolzbptwgnMAg=;
	b=c7XP28NGOPV7FQeJ2lmZr3c/+5V392Czl7lnBqN5f/Pt3PDxb5ulVUIi/+xp2Ee4F3
	3QpAQbtLSGZvVz5FjbbofEGJTozuxezZB5okaW18VQ+oi2OM19hRcaGssG4393a+OuTQ
	mRl8GQ5dRBu9a2UGJYeGEaGO3ndBLNwBpe1zlPy/hc+Wc2VJqlhBFr+rqYczowJFtdM+
	+GCpB8Dqi/PTpJi0jLYle8PdMdC2Prg8HSeRytcJI0hcXJoqFuq1s/qUL3Rhen0NKQ1H
	ybZtTH8NkXnfbbMgQOhCR/HbzIb4IGCCEkK2bMkSBgKXP2PMhCqrU6hov3Uzr17iRAGV
	zsag==
X-Gm-Message-State: ALoCoQmPGwrEOr2t4Ro9jlKe9srmkXGLu4ZSymbeJtKgYY2gCMroaFVdd++nvALEE2S9KANCyBX7
X-Received: by 10.107.162.136 with SMTP id l130mr33491345ioe.86.1444755574685; 
	Tue, 13 Oct 2015 09:59:34 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176]) by smtp.gmail.com with ESMTPSA id
	i26sm1883241iod.27.2015.10.13.09.59.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 09:59:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so95046936igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:59:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.12.39 with SMTP id v7mr21422820igb.46.1444755572730; Tue,
	13 Oct 2015 09:59:32 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 09:59:32 -0700 (PDT)
In-Reply-To: <CE766E63-DA13-44FF-AE6A-B76615CE56DA@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
	<2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
	<CAP9ODKoN8S-nqASuUsRzt_qeuPGBuhsoHPeH_NFHEGbHWbGd+Q@mail.gmail.com>
	<CE766E63-DA13-44FF-AE6A-B76615CE56DA@gmail.com>
Date: Tue, 13 Oct 2015 13:59:32 -0300
Message-ID: <CAP9ODKpgFEmuXzG8xQpA3g4ou2Swoyq2wpds6v5Uqo5kk2aFcg@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Oct 2015 16:59:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 13, 2015, at 9:53 AM, Otavio Salvador <otavio.salvador@ossystems.=
com.br> wrote:
>>
>> On Tue, Oct 13, 2015 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Oct 13, 2015, at 9:45 AM, Otavio Salvador <otavio.salvador@ossystem=
s.com.br> wrote:
>>>>
>>>> Hello,
>>>>
>>>> From time to time I see following error:
>>>>
>>>> | /usr/bin/install -c -m 644
>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gn=
ueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gn=
ueabi/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
>>>> | /usr/bin/install -c -m 644
>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gn=
ueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
>>>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gn=
ueabi/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
>>>> | msgfmt -o rw.mo rw.po
>>>> | /bin/bash: msgfmt: command not found
>>>> | Makefile:84: recipe for target 'rw.mo' failed
>>>> | make[2]: *** [rw.mo] Error 127
>>>> | make[2]: *** Waiting for unfinished jobs....
>>>> | make[2]: Leaving directory
>>>> '/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-g=
nueabi/glibc/2.22-r0/git/po'
>>>> | Makefile:234: recipe for target 'po/subdir_install' failed
>>>>
>>>> and it seems to happen when a rebuild of glibc is triggered due a
>>>> change in the sstate hash. The host is a very minimal system so it
>>>> explains why it does not provide the msgfmt in host and also might
>>>> explain why it is not being catch in Yocto Project AB.
>>>
>>>
>>> are we missing a dependency on gettext-native ? it could be that AB sla=
ves have gettext installed on host
>>> and you don=E2=80=99t.
>>
>> First build works fine; rebuild fails. So I am not sure this is the culp=
rit.
>
> it might not be rebuilding message catalog first time.

Right but in this case:

 - we fix it to not rebuild it
 - we fix why it is not building it

I am a complete ignorant in glibc build system. Can you help on this one?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

