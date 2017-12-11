Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9158B7870D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 11:45:03 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id i1so14441761oth.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 03:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=qvDSZ3Rqjipar2HIo2/GVoRJbTCQb5iHYuoffAcbiLo=;
	b=m9LQK9rx3I5g8iNYooVQg2iYNWiHd0BkL94ZxHET1uDzR8QPuXfoqX4sO63ZZkuM1A
	xs0bUD6o+bsv5LMjGtLVT1LCrKbYJ77rXZ0P6MaA5ypBHtfclrconljNK5EEVyilb77T
	H0UjO+FKwgSMV5u9GuS9bldGLD8LQ/1F6Wnev9ozaBOxBo+sQZh9Pm4h6LYwU7ZB/3pK
	kVaQZUM2sl7Eh+26DXdrNeyFnjZz02jS64ouBuaw5tUJsaenGHGl4Me60lSaL0qQ9GX1
	RyzpHehAULUqnWoX3aIbi3WCAWfs1YxyXMFVFSFEYakh2RQnoEn6H2gWd2Lx2D2fRUd+
	MipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=qvDSZ3Rqjipar2HIo2/GVoRJbTCQb5iHYuoffAcbiLo=;
	b=Q7OOu+3LIyVw0dXXqbedcor+2u7TTciWZB0tDx0h566XN70f7Vu2QzL/cdJaop8rrY
	Z8uvGWQTPg+priwiY42wfosiWFV5Vhos/iFski+c31Dw5GyX/ag3kBKdENP2O9Qdj96t
	VfiqcuoNQsFt5HHonxIN5fT9M3JNhCuis75JL85bxT6mzLdoikIhyq/RnuoWM/PeQIGZ
	ngQlm1FcH4wJBSyPJtLLAO/IScF/e6jUV6P8sOjO7yKVhMfjMAd/YvykzVz7StaK56jX
	xStTCYNNFjt3MhuIwAwei+wH7tReZrtykFY4KtnKJhUGk85XmLSpiwZCBGVraWYovWxc
	U6eA==
X-Gm-Message-State: AKGB3mKMlcxanysdPKFkANJM0BgKUF2jMk+om2nhlx2tYT+1zNo7WOTo
	PV03+tqIZg5W/5/EncBw8ckwrCXO
X-Google-Smtp-Source: ACJfBouswARjfccVmTltFDCJYWifuhVtL6jIJurz/cLAwEhooxtOcu6xSZZVysz+IcQ/82DUucpLcQ==
X-Received: by 10.157.90.17 with SMTP id v17mr38056oth.380.1512992704145;
	Mon, 11 Dec 2017 03:45:04 -0800 (PST)
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com.
	[74.125.82.169]) by smtp.gmail.com with ESMTPSA id
	n74sm6623169ota.72.2017.12.11.03.45.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Dec 2017 03:45:03 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f169.google.com with SMTP id d5so14438832oti.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 03:45:02 -0800 (PST)
X-Received: by 10.157.48.123 with SMTP id w56mr37261otd.55.1512992702448; Mon,
	11 Dec 2017 03:45:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 11 Dec 2017 03:45:01 -0800 (PST)
In-Reply-To: <20171211053039.GC5051@pek-khao-d1>
References: <20171209024546.16918-1-kexin.hao@windriver.com>
	<20171209024546.16918-2-kexin.hao@windriver.com>
	<CAP9ODKqdYcwwz0U2FG_LQ7cX2JpsX3bQ5q-Mnn2-x7b7xfDaqg@mail.gmail.com>
	<20171211053039.GC5051@pek-khao-d1>
Date: Mon, 11 Dec 2017 09:45:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp_Y=CYLsi8okwH=JH+jNRWt7qTjF+XwxPg+ie-z7tDRg@mail.gmail.com>
Message-ID: <CAP9ODKp_Y=CYLsi8okwH=JH+jNRWt7qTjF+XwxPg+ie-z7tDRg@mail.gmail.com>
To: Kevin Hao <kexin.hao@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wic: plugins: rawcopy: Add support to download the raw image from a http server
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
X-List-Received-Date: Mon, 11 Dec 2017 11:45:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 11, 2017 at 3:30 AM, Kevin Hao <kexin.hao@windriver.com> wrote:
> On Sun, Dec 10, 2017 at 10:53:43PM -0200, Otavio Salvador wrote:
>> On Sat, Dec 9, 2017 at 12:45 AM, Kevin Hao <kexin.hao@windriver.com> wrote:
>> > Some firmwares are critical for the basic functions of the board, and may
>> > be used by the bootloader. Due to the license issue, we can't integrate
>> > it. But we do need it when creating a booting image by using WIC.
>> > So add the support for the WIC to download a raw file from http
>> > server and write it to a specific part. In order to restrict the
>> > downloading behaviour, we introduce a "WKS_ALLOW_DOWNLOAD" variable and
>> > only do the downloading when this variable is set.
>> >
>> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
>>
>> This does not make much sense.
>>
>> It does not allow to be downloaded? so build system can download it
>> and use it as a normal artifact.
>
> In some cases, it doesn't make sense to do so. Because:
> a) These firmwares are just raw binary files, they don't need any build or
>    process. They are only useful when we try to create a bootable image.

In any case, keep them on the download cache is a good thing as it
avoids build issues due network instability and avoids as well
undesired file content changes.

> b) There firmwares may be licensed under a proprietary license. We may not
>    integrate them to a fully open source build system. But we do want to provide
>    an easy way for the customer to build a bootable image.

Sure and I agree, but this is what layers are for.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

