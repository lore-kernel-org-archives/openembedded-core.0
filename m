Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1529B7CBF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:14:00 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id v10so23339185qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fz6WyaJl2kmcwSesek9eQXHYz/tm1PqnoFq7lj5vIxo=;
	b=oYzELTS5HRb5s0sHtc8wDkAjUevRR3c6RGn7GsxA9Acv4NW+0Rahe9TJFT584W1S6H
	z6Eu58iJyW+5v149FS5qKuib22PF+rxQnNhdJH5Wng6pWkCP8sYgafQMcBl58CXHdWk9
	LJWs8ptiXzc4GgrwHLYjwwCkqGxPT7kvMXeQd1j5YvY5j0gHoDuX/pnah/QT/P2pSeD2
	hd8Ncr4Bofl9Hwa9hYBMNVr4lqUPXmRui5tv0rynGpschJUzLYF304az8HvoxV2d8aLj
	eDejOGiquGFUAw0Dl16O+Joyvu07kx4rr1yV2Naqbg7MI5yiINRBCtirMhGi7YGGBc9g
	idUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fz6WyaJl2kmcwSesek9eQXHYz/tm1PqnoFq7lj5vIxo=;
	b=WPgqmKl5zPd3gxuEE4O9o4+d7LSSUaLYvKGEcAXInxL6YOPoGmuOopW54AfvRMu7dy
	sipRWYbmxWAE4hCUtWnuu142v5tMcT7hEI28zv+Q6uVV9bxLNm8Syo8rjeI0HOL5wN8h
	DRxzV8+3l7d2eJto46d+AsO3If6Ubcp+QUzpVCbD5Z5zwdcafzq3j6ZJJdkKoi6vBRdO
	G7N75234F+8C2VIImLC1ZWvzHD0EvYWuB1rTz7t9VoFKHAVwChCSJb8wswXVxH59tsNE
	cxwIt/IXlc/TCXV9Pk55GzafdmU5yMFC5ArgjlLHd6mDGh+UvYcq+sRY05qgulLBN487
	+btw==
X-Gm-Message-State: AHQUAuZcEewGxj6OlcXbeRxLOHsd7DtDv36nV3YE/Ht0OGJE++8V0kFg
	89sUupxovx8W1amCUxtp+ghBz7iAuCPHDDlZVZY=
X-Google-Smtp-Source: AHgI3IbF/dfZRVwA60xI9gXts9fa5vNXQng9kbAoi36JckwZlpywMKhsDSib6WCnaqOoPOTPgw+PmsvbSVveK9DAsWg=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr5953668qta.254.1551359641474; 
	Thu, 28 Feb 2019 05:14:01 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
	<CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
In-Reply-To: <CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 05:13:35 -0800
Message-ID: <CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GO runtime crashes
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
X-List-Received-Date: Thu, 28 Feb 2019 13:14:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Hi Damien,
>
> With GO_LINKSHARED =3D "" it work fine.
>

Please set
GO_DYNLINK_x86-64 =3D "1"
to
GO_DYNLINK_x86-64 =3D ""
in goarch.bbclass

> I'm very new to Go, does it mean that there is a mixing issue in go modul=
es from Yocto and from node_exporter vendor folder, so it links wrongly at =
runtime?
>
> Thanks for the quickfix,
> Vincent
>
>
>
>
> Le mer. 27 f=C3=A9vr. 2019 =C3=A0 23:22, Damien Riegel <damien.riegel@gma=
il.com> a =C3=A9crit :
>>
>> On Wed, 27 Feb 2019 at 12:10, Vincent Prince
>> <vincent.prince.fr@gmail.com> wrote:
>> >
>> > Hello everyone,
>> >
>> > I'm trying to add node_exporter from Prometheus project to an Intel x8=
6-64 machine.
>> > I made the following recipe:
>> >
>> > https://github.com/nefethael/meta-random/blob/master/recipes-connectiv=
ity/prometheus/go-nodeexporter_0.18.0.bb
>> >
>> > node_exporter is crashing with multiple different runtime errors, so I=
 raised an issue on github:
>> > https://github.com/prometheus/node_exporter/issues/1244
>>
>> I've faced the same kind of issue with a custom application of ours.
>> The fix was to add the following line to the recipe:
>> GO_LINKSHARED =3D ""
>>
>> Let me know if that helps.
>>
>> Cheers,
>> Damien

