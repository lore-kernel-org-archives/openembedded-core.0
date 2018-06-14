Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id B803D75397
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 18:58:48 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id 14-v6so6649530oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 11:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UUdwtUmz/cn6pooWb0XBTEQPZ7gnNWfaowmhs+Ry6FM=;
	b=HGHvCUTSpnnKRMjJLS6TdwPM9/R6aIp1KGmA2cZ+FecUkcUqnVHPWUSBb8YFShNuRP
	SGmNt8L0171wzE9UvYhP67SJc3P6Qvk7JuA5Datg5OjugiR06fSFA6nMDx0OBzDGHLkV
	tx41ORAhuDnOXPCMuI6nye/whL4EvdVwO5OzYX1KFcTJH4D068OVErL1BCJxaNPafIts
	pSJuwyfoToIbXT2+F8mlRXTwv9KtFDEDxEwtXo1gjPBBIZkSBdGRmi4LPMbryYGGpipi
	c6o/7SKPNfE45i7Qe66QxEFY9Aw5USHceoo9HfwfULYNLKToX2ERmmsY3y5xBuIO0AdT
	zU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UUdwtUmz/cn6pooWb0XBTEQPZ7gnNWfaowmhs+Ry6FM=;
	b=JDsCbVaIvI/iG3xBElCFlM0NmKcM0eS5WR10nC+6nVx4Wh4K7NfxvSs+jrZ3uTah9Q
	x5zfi9m8ZOKYvi555fI+aCW1F2s/ttor5FnaT+0afOQbUspbJfUM5yLZdUGUgjQLbyNc
	m22zoSxq7qwTtamhGG+3fw0ncfZ49uuQRNt4rchRKCwUuJ2yErEs8cSNTo5Ef4DSNzxc
	2F+FUYk0giKNfzkPJETCXQ3UZZ14D8hAZuxLYcyW6mFtIOwiKS7KGkwE7KNsCrYkcLr+
	/s6Qvl0rNXXtqsP+11kous8tXxTuOOWIAHtO+JCWnNDxvM8if42OmasOgfbY8Pf/+CH3
	787g==
X-Gm-Message-State: APt69E1O2PVavqcpcpm4qXlHIAR7Q6lUhBo2MLjRjEIRXTBx3plD0lRK
	t0JoE9Y1CTmEtb13nhDqNd+2nDm8ZciBhpib6WiVuw==
X-Google-Smtp-Source: ADUXVKJe/KBlVbq1YD8r7Ibc14vStaaAgaMPFM+2xGD4yHRUVckaPw9EGtWEkVtUJfEyc/mr9GX6zNAPqL/BBL2XtkA=
X-Received: by 2002:aca:b7c3:: with SMTP id
	h186-v6mr1723653oif.54.1529002729737; 
	Thu, 14 Jun 2018 11:58:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 11:58:49
	-0700 (PDT)
In-Reply-To: <toe4li5z6pm.fsf@twin.sascha.silbe.org>
References: <20180608161841.10108-1-x-yo17@se-silbe.de>
	<CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
	<toeh8mdywfy.fsf@twin.sascha.silbe.org>
	<CANNYZj9uwH9erkgu8Of5xq6PTLfTqdTdnUJtqMbyqgJa1ONKzA@mail.gmail.com>
	<toeefhhyt86.fsf@twin.sascha.silbe.org>
	<CANNYZj894Yin6tnTSW1Mw3YdcLkX9CdSBcs8kOo1iubi+LmHEA@mail.gmail.com>
	<toe4li5z6pm.fsf@twin.sascha.silbe.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 21:58:49 +0300
Message-ID: <CANNYZj8rooTeP4w6xi220WH33qVYCw8ATH+Qo2JkLuQuW=EU_w@mail.gmail.com>
To: Sascha Silbe <x-yo17@se-silbe.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection: relocate typelib repository for native builds
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
X-List-Received-Date: Thu, 14 Jun 2018 18:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, I don't think so. You just need to be patient; patch testing and
merging are done by one overloaded person. If after 2-3 weeks it's not
in, resend.

Alex

2018-06-14 19:13 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
> Alexander Kanavin <alex.kanavin@gmail.com> writes:
>
>> 2018-06-08 22:27 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
>>> We have some Python modules that we are extracting some information fro=
m
>>> and generating documentation for at build time; both times the modules
>>> get imported. We don't need GLib to actually work; it only needs to be
>>> importable. Fortunately no other typelib is used by the code.
>>
>> Thanks for explanation. The patch is fine then and can be added to
>> oe-core - so that if later g-i needs to be fully supported on the
>> native side, this part would be already sorted. For now though it's
>> not 'officially' working.
>
> Fair enough. Thanks for the review! Is there anything else I should do
> for the patch to go in?
>
> Sascha
> --
> Softwareentwicklung Sascha Silbe, Niederhofenstra=C3=9Fe 5/1, 71229 Leonb=
erg
> https://se-silbe.de/
> USt-IdNr.: DE281696641

