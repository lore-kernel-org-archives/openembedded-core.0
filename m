Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD05B60069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 10:00:59 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w194so224514vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 02:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Pwgc8Z2dYWrwSdoDik/lav0xwIG5adEg6HEwF0vtqs0=;
	b=Y2+KVW37nKXJOoJNZmTx0SkRg403q+OEiwsidkvzspdXo/1FhDdfFAndNG9iouZLZa
	3bfmz1ICK1Hs8Kb+objvdcaB0ZWOIPaTuwSE3MyRb0MXij6aZ5WiNUh0rdk1G2ULcKb8
	VUk74XxQC69wPFXtZo34ES1BnZszVHxigZKlVbnMh3yG45UY2gFV4nvgYCEzNre5wABv
	E3pF+IM8s7ucLKhbjKkhKliqrnFUOIl+vFuKCJarxUg0AkdmYifANRSbtUZIL4uWfJUt
	QwqdEXagjNuzAmURH+Ap0PC+wuyte1bR6PN/ndH5HKIpCZXBh+ail85tMqHFz7JLLKPo
	v3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Pwgc8Z2dYWrwSdoDik/lav0xwIG5adEg6HEwF0vtqs0=;
	b=biRvslSiiPdi41B77lNuNAAJ4oyhQvMNQH9Kp2LzxVd7cb2YwFD6agOJcT6Kam/Eyh
	9mnm7OqLruMeQWNVuKdRYenKuUJYYFAk50PapNfQ147Z0tjYIZtmxguBc5CCLqu6OCUZ
	Fw37QCv+R3nde0LM+suLBXKvJQZ0UIwf5nGJwfVSYcyvYKPdN6HbQAVlETSMzTYADCg7
	asjL1/2UzEmkTOdPj9W0RH6uPMKKKeUGuAAKLwJKPriQT9fXxe5vXUcc6WKMdVG0s+mw
	k8duRaxAluchM9If/QddZ5hcTVgk8uLqn53P3Wfv1LX/022lYgb08e5XOLA5qCbhFMYv
	2PRw==
X-Gm-Message-State: AKaTC01l5sVkboMIt7ErXLHVLDQBdRpIGNtMHNpxWNt2Q65mznnTRicv10/YmgtJ5Tzruw==
X-Received: by 10.31.197.195 with SMTP id v186mr731649vkf.84.1479895260471;
	Wed, 23 Nov 2016 02:01:00 -0800 (PST)
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com.
	[209.85.213.47])
	by smtp.gmail.com with ESMTPSA id b4sm8347581vka.3.2016.11.23.02.00.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 02:00:59 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f47.google.com with SMTP id p9so4814363vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 02:00:59 -0800 (PST)
X-Received: by 10.31.55.205 with SMTP id e196mr743855vka.4.1479895258747; Wed,
	23 Nov 2016 02:00:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.151.16 with HTTP; Wed, 23 Nov 2016 02:00:57 -0800 (PST)
In-Reply-To: <CABcZANnL5MxwQmiZZ0i8CGHaYxsD9zapNfcyB_a37OoigHq2oA@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
	<CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
	<CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
	<CAAPZna2dHKqh-rDSo6UGu0uP=CBLRHaGbhC-c=OisccQ4HUUsQ@mail.gmail.com>
	<CABcZANnL5MxwQmiZZ0i8CGHaYxsD9zapNfcyB_a37OoigHq2oA@mail.gmail.com>
Date: Wed, 23 Nov 2016 08:00:57 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr7igkbbvi2tu6qwAv+gVLbty0HrkfF30cDtiG+5xqdWQ@mail.gmail.com>
Message-ID: <CAP9ODKr7igkbbvi2tu6qwAv+gVLbty0HrkfF30cDtiG+5xqdWQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Wed, 23 Nov 2016 10:01:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 2:24 PM, Christopher Larson <clarson@kergoth.com> w=
rote:
>
> On Thu, Nov 17, 2016 at 9:21 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>>
>> No, I created a patch, git format-patch and then edit generated files wi=
th
>> Upstream-Status tag and added to recipe. Is this wrong?
>
>
> As I indicated in my first reply, it=E2=80=99s best to put the tag outsid=
e the
> generated patch (above it, or below the =E2=80=94-), as it isn=E2=80=99t =
part of the commit,
> only part of the patch file. It=E2=80=99s minor, and you don=E2=80=99t ne=
ed to re-submit,
> but in general the tag is not part of the commit message. For example, if
> your patch was applied to a git repository with git-am, it=E2=80=99d be i=
n the
> commit message, which should not be the case.

To be honest, there a many files which does as Fabio did and I also
personally do as well. I don't like it outside of the commit log as it
looks out of context.

If someone is getting the patch file, it is expected they will review
it and not blindly apply it on upstream repository.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

