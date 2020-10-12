Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.2213.1602519235788919258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 09:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uDzHCXi7;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id e22so24009833ejr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zEmo/IMphcXqjWs0+FQOUx5P5CNOKPCZYOBcUfCJ4K0=;
        b=uDzHCXi72biXtn/TJWiRaiQ8Slp01jruG8yP3tVG8PL58RvQtyK24fGUes/JwMpHFT
         FhBLMfxj06AvBpJ+a3KuPoq2yxLsHeYMN8rRvwbVb2dlWIDGJPw/EH1WxFry58KkOVw3
         QuPaznqL0fd8fV1zS+ZeFepbLYJEfY+TeMeAVOJuy0NgnP82sPj1KaGbMgX19OIpHgmM
         c4KZU4Za2P8wfSgkhNeuWg6vU/QoVvXTmh/RVmdpLHB5kqN/RZBU6ZsC5UG2131d60h9
         LF70Qi/jTG7yN9AMakEF1jmSB9GLZbVsgDDnCrJ1O4Ytoi9JsjxC2/mdsGO0Kgfzo4dj
         ZYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zEmo/IMphcXqjWs0+FQOUx5P5CNOKPCZYOBcUfCJ4K0=;
        b=NDDgehhdPt30apq5lV276MdyFQ9JAc5dVZLbSw5dEB2HO012Ic/FmmailMaJbcdjLT
         aywUTGEyfwbT8YGB34f2o19hASuGcXrnID8+KV8ysH7509AsGGCaI7UlxuouyKGuhsls
         UXZLHjBQHhSFcv3Ws/m+iB47wlOfLl3HRy6oGWNZS0QwtBEJaZOqy1NQNgyll9GIqqFJ
         0DWjy/es0aUr7wemCBQ0QXupEvlg4kK98iRugYa6jmzYthV3diUzjuRtWA3I6DshHB17
         WP/5JX9pSmuO4fGY4292k8KnGSNL0DSAnOMxzfzbFVEc2CUnAySgZHf2w6/Hx36+5Yd+
         dJ1g==
X-Gm-Message-State: AOAM532aDsALLnsoMcgqfFWe658XWykzWb73M3QFI644JrKZ4WuoH3V4
	mxrfPWkBWiT4ADZCLCjhxYPVa+TCanditAQl9C4=
X-Google-Smtp-Source: ABdhPJzQbh5n2DAD1BaA1DAtN8hoGxRysiXTg0z5aCdbR8nxMKCfqsBIU7t6hSaY3UCTvFoPvp3n06d+WGznFq9PL34=
X-Received: by 2002:a17:906:5509:: with SMTP id r9mr29799998ejp.12.1602519234016;
 Mon, 12 Oct 2020 09:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
In-Reply-To: <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 12 Oct 2020 17:13:43 +0100
Message-ID: <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As I understand, the problem is not related with the vulkan package.

To build the vulkan gstreamer plugin whe need a native binary that is
not provided in OE core.
This binary is [glslc]

It is provided by the shaderc project
https://github.com/google/shaderc

Gstreamer upstream also suggests this project.
As glslangValidator is the tool coming from Khronos it would probably
be good to support it.
https://github.com/KhronosGroup/glslang

I can try to build a recipe to fix the missing glslc native binary.
But it's better if anyone can provide more information on this because
I am not expert in this area.

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
12/10/2020 =C3=A0(s) 16:54:
>
> On Mon, 12 Oct 2020 at 14:36, Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>>
>> -PACKAGECONFIG[vulkan]          =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisab=
led,vulkan-loader"
>> +# FIXME: vulkan build fail
>> +# to build vulkan, a new package is needed.
>> +# add shaderc package as a separate pacth
>> +# https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/134=
9
>> +#| Program glslc found: NO
>> +#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc'] n=
ot found or not executable
>> +#PACKAGECONFIG[vulkan]          =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisa=
bled,vulkan-loader shaderc"
>
>
> I think this needs to be addressed, as it's a regression in what previous=
ly worked. If a newer version of vulkan is required, I have done some work =
towards that here:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanav=
in/package-version-updates-later&id=3Dd6715a06317b1799f5380cc8169acfbd0696d=
498
>
> but had to put it on hold because gstreamer 1.16 is not compatible with i=
t :) Can you cherry-pick that and see if it helps? (there's an even newer v=
ulkan available since, so maybe you need to do additional upgrading)

I understand the problem and is because of this that I put it in a
separate patch.
I will try your work on
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin=
/package-version-updates-later&id=3Dd6715a06317b1799f5380cc8169acfbd0696d49=
8
But as I mentioned before I think the problem needs to be solved with
a new recipe.

>
> Alex



--=20
best regards,
Jos=C3=A9 Quaresma
