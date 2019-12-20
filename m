Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id B6FA57FE44
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:18:47 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id dp13so3313476qvb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lc01cihv+aS57Sit1nJ+vlljm/2GT9el+TlQe4yUXR4=;
	b=Eg1mGSWc+e9ncP9iEjgNMG0uJa/GXEHL+YSNHx/psEF4P8E2gX6rE/O5caXqu+4R5H
	LV7fD0mAb3ldA/5xLkbOzD5ufYeAdgdAEyvuPSSCCfCkMR12J9Zxs6AkDaJuNYb9gpoc
	qD/AQW88Kx9czeqv9QET/kXcKBmJ1bzNU/BBwpYub7lXj/q+LLheEkCR+shi8YVjQCnl
	fLohHDsUuJ10U3or32eXUdsEQ4eUyKsjDH2CxCtgolxKvZgwqaq6gnKiDTyxDq0CEat6
	Opxop0c6oXpbDMAwuwPT2Lrz8wecALMNARexI8N20Y/UMCmQ0kF0PJavyi8ngeyVqgvf
	EPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lc01cihv+aS57Sit1nJ+vlljm/2GT9el+TlQe4yUXR4=;
	b=RAPRiOYD3VXi04iOCxkF4q9Y9oYAjYLhiTEVK/vB2giy/UqagowePMU4kgzHfNTazl
	PbKCAJ2OaRjSeXUG9XkJ1UNrtKKNYcH6t6lWr+HrCTAEohDV0SDwQfH2vaoVO6h9ranr
	OkGa2XMNNOrwKuCYp5eQHD6gfQyeoGx7NtiNewSn0iOp19UPvAtzednBEEIW0coTlTec
	S5TdvQ/rh4LfTQMrHsNQD0kgFyjyGJ/T4Hrcq7vTR0evEMib68wbMMPz/PyIeXWRzfp6
	B2kNFVVI3PVLe6PYg0Z5zSAgLliDJK5GOWPmXL27fzv9xWbwGLU6CqwBfafC8/kBL9PG
	jnkg==
X-Gm-Message-State: APjAAAVvEnMMAJ5L/2FyL34k0jBIo1AZeWvlXa88sFpsJkSnvEUp7+du
	hSHadXMd7Bfh+Pe8QzSLoL4h397T62ejZc1gT6w=
X-Google-Smtp-Source: APXvYqziIhmzlI5bYYEzNVVAlbPFIksNTFX88jFXU+uFvg6+Z8dCKMZlCx/sasfiPqpr5fn+5laksE9vND+uyJzmmzg=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr11220694qvo.55.1576829928139; 
	Fri, 20 Dec 2019 00:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-3-alex.kanavin@gmail.com>
	<b4e0b39cda58583411b3e6c05cb0566053e6cdb1.camel@linuxfoundation.org>
	<CANNYZj9tf5c9_XOn1P-tTXSSHjKUSp6QMfsNYX_swJAp+h7Krg@mail.gmail.com>
	<CANNYZj-mywh64iuGoUPVkMTJm8ka4m4a6UYVY3cOd2+hVvU62A@mail.gmail.com>
In-Reply-To: <CANNYZj-mywh64iuGoUPVkMTJm8ka4m4a6UYVY3cOd2+hVvU62A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Dec 2019 00:18:21 -0800
Message-ID: <CAMKF1sojJ_biZa2cN6iJP_HFk-U5snWi3pojfyv1LKR1jNP22Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/30] gettext: update to 0.20.1
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
X-List-Received-Date: Fri, 20 Dec 2019 08:18:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 17, 2019 at 8:02 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 16 Dec 2019 at 14:25, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>>
>>> In an effort to try and get to the bottom of which patches cause which
>>> failures I ran the gettext updates pieces by themselves (patches 2-5).
>>>
>>> systemtap fails:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1354
>>>
>>> the main a-full build in case there are other issues:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/580
>>>
>>> I know there is a fix for the check-layer/mingw pieces in master-next
>>> of meta-mingw, just forgot to set that branch.
>>
>>
>> Thanks, there are also failures in meta-gpl2, for which I will also make patches.
>> Systemtap issue is now fixed.
>
>
> I have now sent the meta-gplv2 patches to yocto@ and the patchset for gettext+systemtap here.
>
> Alex

few meta-oe failures with poky/master-next

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/173/steps/8/logs/step1b

