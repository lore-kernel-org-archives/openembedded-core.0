Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 018F577527
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:52:47 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id v72so3713589ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=GqA0fIckLWjmDu8LFhe58mamSDxuYyt2J23klSeJ8+4=;
	b=l9LBMen2sR6FPsc1Kyt/NNz5hSOMDsS6RWEGBCXIqy4rgFO2c1OTDjROBMFC0yaRMd
	dUHnfPrGCP4ezR5+SrlW4fqSHpQe9uWmnQbVasp6ZePxsQ6rUIQeoKZfZSZOyWPJ85Q2
	tFy3gyYDrvqn63/vJAJztxFPK8sY/4fGOCiyEtGejciP4pZw1iK3aeLmG7DTnavuj9jJ
	09OR1MDhNoJcD8A1Hbgrs8WO9uO06lmdKR1B5tSR3aZ6C7XmvnPceQywW2UGRRFKJ/PU
	t7y5dV3id3hPPi1565B8at1cNRQXJNOsLgnDH7g83a+EyTwKCD0i8IpPJMw4BFnqia8H
	8v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=GqA0fIckLWjmDu8LFhe58mamSDxuYyt2J23klSeJ8+4=;
	b=TBzYqMSoDjvCrJy7e53LVnMQTdpOk+wlJZuui1frxD7Q1eSc8OeglvU9KX2UG78mvZ
	XBAe6aKFxNz+GOGBUyAoRAuvhBKCicGRCZAhaeM7WQDYG9USS/RL/VLjlbtPPFss3AOH
	Bltvb6UKKA6sfGr7Q0ZmeVFGG7PY9Afa8EpfZwBMCV5U6I+pfNWu/Ox6OLdNbUzt524i
	izTrWTpUtPseqvUoXdrnjL7CBhTVy6UZMrUFq0AJSOqxB+N9CZZ7jManlr6qYJKdmjp0
	2J6iSHSdb4EjqbJJ4TFKxUjO2YS0uC3iU3NSaC1C9ziGL7WAtmSPFpvNYr5GinXUv9UC
	Fo7A==
X-Gm-Message-State: AHPjjUjbdiUcIcjCVJtBzpCErYyznnLeBUmB/+HHtC6NfvUOVui3cI8H
	GQw7YKfZJ/Q8adAKqhecG3bvrtpF
X-Received: by 10.37.132.8 with SMTP id u8mr12776360ybk.384.1506955968400;
	Mon, 02 Oct 2017 07:52:48 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54])
	by smtp.gmail.com with ESMTPSA id m8sm196389ywd.27.2017.10.02.07.52.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 07:52:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id y64so9409180oia.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:52:46 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDoQ4gwaT53nIGu4gbMPFCFr/c6xL9TuhWIWmgfLhUtXlagLU5mO/pzI4U/DWjwsuY1ndRQrpNh7oZVRHo6tyU=
X-Received: by 10.157.8.134 with SMTP id 6mr7339513otf.189.1506955966414; Mon,
	02 Oct 2017 07:52:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 2 Oct 2017 07:52:45 -0700 (PDT)
In-Reply-To: <0a24cf32-b806-c63d-095e-75b14111065c@linux.intel.com>
References: <20171002141814.29709-1-otavio@ossystems.com.br>
	<28ebae92-b3c1-7664-87f7-4c326711e647@linux.intel.com>
	<CAP9ODKpr_ypij4Z919kVkQkJgWcr_VaS7AzP=0Wi7oumP3k8oA@mail.gmail.com>
	<0a24cf32-b806-c63d-095e-75b14111065c@linux.intel.com>
Date: Mon, 2 Oct 2017 11:52:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo7njSPpc3dSBWjPssGfuymzugYb3s5si3=cQgSY1yaRA@mail.gmail.com>
Message-ID: <CAP9ODKo7njSPpc3dSBWjPssGfuymzugYb3s5si3=cQgSY1yaRA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 14:52:48 -0000
Content-Type: text/plain; charset="UTF-8"

Alex,

v3 is out.

On Mon, Oct 2, 2017 at 11:34 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/02/2017 05:34 PM, Otavio Salvador wrote:
>
>> It does not work as you are explaining. Without this patch I /need/ to
>> use:
>>
>> dnf install --nogpgcheck nano
>>
>> to install nano. dnf has it enabled.
>>
>> root@qemux86-64:~# grep gpg /etc/dnf/dnf.conf
>> gpgcheck=1
>
>
>
> Yes; your patch is solving this problem incorrectly, introducing a new,
> different problem. The new problem is:
>
> - enable package signing, disable package feed signing, check that the
> resulting dnf.conf file has package verification enabled (it won't).
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

