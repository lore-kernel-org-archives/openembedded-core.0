Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 940187FB1A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:21:26 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 15so6237319qkh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=S9mI7UzLmrVjz/4I3C/lfavweb/+cs00YEyxs6x4VGY=;
	b=NoDXlMdG7QmMo9NiYtQ1wNCOp+HDw+QXHmnk1r+w0qT0Nl8Dk9fUnrWeyW8dzwOKRU
	kMFJPxhHZsnB5+UFhynKqo2dOhRP3QSAHHa8/U1ZjNPK0xKOh6ROJeHaj0oRkFHg8R4U
	bs1NXw5mFjce6JcCtpaLhOKNBEdgpYLRuC+Bsl2H2IUaobw7IbxNExZLYPbAsQ4yEEh7
	i4Q4sTTSjW556gN5TQZmZ7lFNFYWsF7M/xQmLUewkEPNsI8jmeH9+APLXA8Q22nAsHmB
	G3KKbgozqHWyd0b6x2hWUuSldMt1yCvfrjwTj1MqHsQk+OIuMRLtEU38v+kZjkKmwJbM
	x7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S9mI7UzLmrVjz/4I3C/lfavweb/+cs00YEyxs6x4VGY=;
	b=Frz0DVbhNzPTYZTXe0wGFiVv0lPCcpd0XuVbiYnLR+NmUB9VIr4k8JpiXX8of+xTrf
	BRdn4iIRLbQDUzIL8+/LSNg3tyGp9+MQuVrrefyio38NgLvrBS3mBBJsZ74u9GNtcmj/
	uN2d+KCe5rWzq2WSVpDT3i6wjNv8MN9LppY4PWdOudm88+PcNK0IeaI36EZ6PvxHzC8V
	BdUuYeVnDJKsMfKb0AKEpupNLzcAbLjZKQHlborn6hy8qguXuDkXNUtg90kv8bK08am5
	G4DYIolQa7G8TEBj/60FyvFDGlSFJPkB/qn65hTiNhr5bvh7sj+qwZQhxAbmXxS/DKOW
	Oa2Q==
X-Gm-Message-State: APjAAAV4YKFAcJ53PGfOGN9d5qUVkTNSs1hbEhrbuoJi1XiOp22MYWM1
	miz7XEH4AhNOVHS3Wgp2h+p0+1nuILvuTwdAtwo=
X-Google-Smtp-Source: APXvYqz9tReuThRUEYJ4XhFGaA03W7ux1U5ivL8XxuWDNlBD0f2I/VgW5Qq9vp5/rBIjp5Tg0v1b6TXx5Jc+8VG3U6w=
X-Received: by 2002:a37:b985:: with SMTP id
	j127mr11958877qkf.337.1572189687022; 
	Sun, 27 Oct 2019 08:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <ee102dfc-af38-5a75-0b64-0c6bb13bb106@gmail.com>
	<CANNYZj_PpuXczLf7SPcXdukZNjeCAWMXu1y9ENFUt-sYxdZv=g@mail.gmail.com>
	<40172517-8f02-4657-68c3-115c6596d4b9@gmail.com>
In-Reply-To: <40172517-8f02-4657-68c3-115c6596d4b9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Oct 2019 16:21:00 +0100
Message-ID: <CAMKF1spfjHkq9abJzmTbmg+FF0vn=c_+JDT9bSOZh6ca+9TnMw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of stable warrior in Core/bitbake/YP layers
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
X-List-Received-Date: Sun, 27 Oct 2019 15:21:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2019 at 4:06 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/27/19 4:03 AM, Alexander Kanavin wrote:
>
> On Sun, 27 Oct 2019 at 09:13, akuster808 <akuster808@gmail.com> wrote:
>>
>> Of the past month the warrior stable branch has been plagued with a
>> build failure on FedoraCore30 regarding qemu virgl tests. This has
>> caused the slip of the next dot release to occur after Thud's.
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13543
>>
>> The error message was this:
>>
>> runqemu - ERROR - Failed to run qemu: libEGL warning: MESA-LOADER:
>> failed to open swrast (search paths /usr/lib64/dri)
>> libEGL warning: MESA-LOADER: failed to open swrast (search paths
>> /usr/lib64/dri)
>>
>> qemu-system-i386: egl: eglInitialize failed
>> qemu-system-i386: OpenGL is not supported by the display
>>
>> What has fixed this error is updating libdrm to 2.4.99 from 2.4.97. What
>> I can not tell is what commit(s) in those updates fixed the above error
>>
>> https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.html
>> https://lists.x.org/archives/xorg-announce/2019-April/002992.html
>>
>> Has anyone seen the above error and might have an idea what commits
>> would solve this issue?
>
>
> The DRI modules loaded from the host (swrast particularly) may try to res=
olve a symbol in libdrm-native that doesn't exist.
>
>
> What I justed noticed on the host is that his has both 5.2 and 5.3 kernel=
s. FC 30 was tested in the 2.7.1 so it worked at one point in time. I wonde=
r if the kernel got updated to 5.3 and now we need updated headers for libd=
rm? That might support the missing symbols you mentioned above.
>
> Thanks for the hint.
>
> - Armin
>
>
> I remember debugging a similar problem when TLS got accidentally switched=
 off in mesa-native, what helped was tracing symbol
> resolution with the help of environment variables described in 'man ld.so=
' (can't remember off the top of my head what was the exact one).
>

https://lists.x.org/archives/xorg-announce/2019-April/002992.html

does have header fixes which might be interesting to this issue

> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

