Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 124DD766DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:53:35 +0000 (UTC)
Received: by iow1 with SMTP id 1so27834373iow.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=kZXb6aOB1BpbSakyFYSA0x1YG2YCY2dr8h9Q+8Lud4o=;
	b=c1beHkmei3gJg/8IaYv3eLvcCJleQQzZ5AgeE62EvhXpDXsCYFCgKDt+aCKToqyEqi
	DbegTfkTy8ZLRMfIihopRmqsuxlLPvzEBcJD7HsFn9/mq3lpag5q5a4rLgxmdk1N6FB4
	hOkCzcIYqDZS3MBk8MVSjWhRdjTldXRAQMFYCHgrykqKwRSFPZB0EMn8KWHPShG6VJfx
	q7EHx/2qFw54zar0Vm9RFlWktDmFj/2iNE/AQ7M4unC/wL1AJ6OskdfdXZvZifIJ8mr0
	KTR9LCXpmogbtn00LvpwmTHBNcddCW802QrWRZfv7o5QJ1SipYD4qiBQkWMYzeAN6PFr
	q95w==
X-Gm-Message-State: ALoCoQnny98UpZTcjdCZq2s+2sifIQy/Dd9UaPiYcr4jVEq7IuDn3rbDHB/JeJw5Yy1C0ns9yFs6
X-Received: by 10.107.157.80 with SMTP id g77mr32853984ioe.118.1444755215835; 
	Tue, 13 Oct 2015 09:53:35 -0700 (PDT)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180])
	by smtp.gmail.com with ESMTPSA id t2sm7318286igs.18.2015.10.13.09.53.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 09:53:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv82 with SMTP id v82so27740412iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:53:34 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr33503057ioe.37.1444755214515; 
	Tue, 13 Oct 2015 09:53:34 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 09:53:34 -0700 (PDT)
In-Reply-To: <2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
	<2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
Date: Tue, 13 Oct 2015 13:53:34 -0300
Message-ID: <CAP9ODKoN8S-nqASuUsRzt_qeuPGBuhsoHPeH_NFHEGbHWbGd+Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Oct 2015 16:53:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 13, 2015, at 9:45 AM, Otavio Salvador <otavio.salvador@ossystems.=
com.br> wrote:
>>
>> Hello,
>>
>> From time to time I see following error:
>>
>> | /usr/bin/install -c -m 644
>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnue=
abi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnue=
abi/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
>> | /usr/bin/install -c -m 644
>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnue=
abi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
>> /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnue=
abi/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
>> | msgfmt -o rw.mo rw.po
>> | /bin/bash: msgfmt: command not found
>> | Makefile:84: recipe for target 'rw.mo' failed
>> | make[2]: *** [rw.mo] Error 127
>> | make[2]: *** Waiting for unfinished jobs....
>> | make[2]: Leaving directory
>> '/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnu=
eabi/glibc/2.22-r0/git/po'
>> | Makefile:234: recipe for target 'po/subdir_install' failed
>>
>> and it seems to happen when a rebuild of glibc is triggered due a
>> change in the sstate hash. The host is a very minimal system so it
>> explains why it does not provide the msgfmt in host and also might
>> explain why it is not being catch in Yocto Project AB.
>
>
> are we missing a dependency on gettext-native ? it could be that AB slave=
s have gettext installed on host
> and you don=E2=80=99t.

First build works fine; rebuild fails. So I am not sure this is the culprit=
.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

