Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDDDE74621
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 15:45:11 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 101-v6so6177390uav.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OWDZKgKbTXJi6GCNxwaY+50OLrOqLvWcf3L0gXc56Gw=;
	b=El0OO7HwndW32Y4epPlIh3FiXYwPqmh38dxHMeLCJPpPyruee/UL/J8tVzyygAzYFW
	EvI3GOxbFtIZ9LfMAZzsQjE7x74qw9sw4cnqE48jhayUHwue2Zny1sbhYbqF0DAAvRyF
	mi4bpS3Ui6quL2C3/TKivWLh5E2kDFcMCBRilBcAO0arCmPZB02GcgbHCPMg6PZmIyTY
	KLNLW7QWFRTsX+b7hPvjfUSUZ2ENDunh67PcxeJcbpCR6SOiR8w9i/YTTtFGIOQi07dT
	wwohFTVpXYKIQdlQMfc4jFrz1hjv2JRQB1CKhbOI4kHHO2EyZ9nQZ1cSpR59gzidY2Fc
	EEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OWDZKgKbTXJi6GCNxwaY+50OLrOqLvWcf3L0gXc56Gw=;
	b=GZQdqh2RqA4Jsyql39MnZTjHRtPZWXj5+Gu2aypviHP1WBJiOmhTqKcwUExXLogvyY
	GbADpITVD69AU8yeA+j5XxUzGztg4iYNLLOqK2SKAYGeF7Y8qG97XeUbVz7ZVRuS3nlh
	rQYLEUTqH2LxhtBC1tVJZIy3JvagG2FVCm3U6RCtXlDgpgDXmbbk9TnWqidCv/5aWg35
	gSrodtSZphEnn0IVQBdCXFVS7I4y9O+zbhTu3QtvmjhVa/YeX6ebvXx9k/RiCeaZUErH
	S3NGZcLhmIXuoPDha4TBg89MbnIk/HnyYCtmEIyu/4lYK62JGZU8LQ93l41qn6pJKOMn
	5jGQ==
X-Gm-Message-State: APzg51Bn4Yj5xVZk5bGBBLhsNqn2SvR5pNWy5TurAvB8SK8Ci2zI81zH
	UxAnRztYIDTe3Qc1eR2e0wp4pWl53iASRnP3Kqg=
X-Google-Smtp-Source: ANB0VdYaEIA6tlH8UXCW3FRc+M9cqrkuz38Fwx3qDT0fMxSNyoJRnAh4iTdTFa4UasYDmUXe27fE5RZANEFsvmLqhjs=
X-Received: by 2002:a67:e2d8:: with SMTP id
	i24-v6mr13127278vsm.115.1536162312638; 
	Wed, 05 Sep 2018 08:45:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 08:45:11 -0700 (PDT)
In-Reply-To: <CAMKF1sqynK2-5b9ex5fcLW3s2XTH086Ajps_-50stxVvGX9xLQ@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
	<CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
	<20180905085322.GA1795@jama>
	<e7847d5e6eb6103ddf02e6da14a1449227e5665a.camel@linuxfoundation.org>
	<CAMKF1sqynK2-5b9ex5fcLW3s2XTH086Ajps_-50stxVvGX9xLQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 5 Sep 2018 08:45:11 -0700
Message-ID: <CAJ86T=V78dXJH8rOdN2LAshL8UqsC5aJ_njU8Dra9M=tCcBhgg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Wed, 05 Sep 2018 15:45:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 8:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Sep 5, 2018 at 7:45 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Wed, 2018-09-05 at 10:53 +0200, Martin Jansa wrote:
>> > But patching the components to use libssl10 might actually work
>> > (unlike
>> > just changing DEPENDS to openssl10).
>> >
>> > It's not only conflicting in build-time in RSS, but it will conflict
>> > on target as well. You either need to migrate all components included
>> > in image to 1.1 or all stay on 1.0.
>>
>> That isn't quite the case. For OE-Core we have images using both 1.0
>> (openssh) and 1.1 installed together. Its true there are some issues if
>> you try and parallel install both the -dev packages but normal target
>> images are working.
>>
>> We could probably "fix" the -dev images to an extent by making 1.1
>> replace 1.0 dev pieces.
>>
>> The build time sysroot problem is harder unfortunately, I've ideas
>> about things we might be able to do but haven't experimented as yet.
>>
>
> If runtime conflicts are clear

I don't think the runtime issues are clear.

Being able to install both versions of openssl on the target and have
them be used by different applications is one case (already solved by
different sonames).

But the builds that are failing in meta-oe are a different case - a
single application is indirectly linked against both versions of
openssl. Loading two versions of openssl into the same address space
at runtime hasn't been solved... and may not be realistically solvable
- e.g. what happens if code in an app compiled against openssl 1.1
tries to share an openssl data type with code in a library compiled
against openssl 1.0?

> I think we can install the headers into /usr/include/openssl10/
> and dev libs into /usr/lib/openssl10
> and provide a openssl10.pc file to we can use pkgconfig in packages

