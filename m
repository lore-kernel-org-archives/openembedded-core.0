Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id E095F74778
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 22:54:36 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id j17-v6so54318uap.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 15:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=41QyRqVeAY/0EuTikpoogJV9UA0sHUiWL/4taABVsHk=;
	b=qVFgpuxHQOCMBubgQbecWBRtLshT6J3amCmTd/7riQLlWBA7ZoVJBRuC4+mEigtTIS
	2FuZ8hKD8TVryzWhxe89j1eGTp9Xn6kghoSQpmxB/GEHfpwX0v3RSqoHbGhNVdtJznPt
	wKo+Nn4ZWkABcSmRenNXQ7dT3ZLMlAZYosXfiQnyUi+MUy6iA1OoRVcQYfA+h84iIvZx
	b/yqpTZPTbxbaRTsW8O/qQ0IO0NEEzF2LHvdLOb0IyLseHdlCkIgqwTvASU7KD87cfQL
	0+OAzxysxxShDS8V62ojF6cjlTWKqelkRY3bu/wJbPPZinl7cm2ele6AkrAvvArALrkL
	hm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=41QyRqVeAY/0EuTikpoogJV9UA0sHUiWL/4taABVsHk=;
	b=AGhwNXrvshqU2Wv2zoWFyNxO4t4l9ye4Grk/y+uemLTf/EwlvEYGoofVb2mBkJjkfJ
	rUYNX1/X+gZ3f21k+jDHWscVMuJ76yxu5ioLxJW3DyVzM+3e5sDP279SEOXoYH6sr6FV
	B4jMJzUYymfrPkVaSYWhJvI6pTQN7DM5OUBE++mi9kGxb11Id2TigD/xfiftk2Eyaq7P
	XFDRoMnCXm4ZiVFL2Asf57Ocsw2nOjx4DNZ2ys5WA/PmfvZrtsqjexvdIWnhP5zrGptB
	xTyw62HTFtDxyw1mfzpODTQYDMpo0ZBypCZpcyXHXgXk8WZ9uVwI54F7jqA8/P0g+56Q
	MiSg==
X-Gm-Message-State: APt69E0q8TjiGotoCK099YKzzbvDgZ7BROIN48buPNv64n7IAl/JF76N
	WR4avcCKWzLjLSVYk4VmbPbLJiFk4SOhoQtjJf4=
X-Google-Smtp-Source: AAOMgpfTFRBxdIT2aGscWinf9n+nQD3zsmMMQLlwgP9LZ8IRSTHUuzbg35dYLnYG6Naqx+Vv3xFiIrVCXGAIBNbElx0=
X-Received: by 2002:ab0:136c:: with SMTP id
	h41-v6mr2381703uae.193.1530053677653; 
	Tue, 26 Jun 2018 15:54:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 15:54:37 -0700 (PDT)
In-Reply-To: <3c778e17-bb7f-e934-e3ce-6f969defdac9@gmail.com>
References: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
	<3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
	<CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
	<CAEUSe7_AH1r9=g_HT-SYZXwyA3oWWxiJQ8z5GrYa31Uf21u0_A@mail.gmail.com>
	<11604122-a4df-e93c-6f34-baa7fe733723@gmail.com>
	<CAJ86T=WsQL-sH_Q75nhV_7U_68RENKeePTLQwPTqDZ7zwvHq6Q@mail.gmail.com>
	<CAEUSe7-NkJJR=ppBd5AoahaRygd4CrcbwgeLTo5VLcWXEiiX2w@mail.gmail.com>
	<3c778e17-bb7f-e934-e3ce-6f969defdac9@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Jun 2018 15:54:37 -0700
Message-ID: <CAJ86T=V+LjeDqJVug87__MTZT4=aovpij7Q680OD4ywjsGJVgQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Tue, 26 Jun 2018 22:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2018 at 3:33 PM, akuster808 <akuster808@gmail.com> wrote:
> On 06/18/2018 12:20 PM, Daniel D=C3=ADaz wrote:
>> On 11 June 2018 at 16:46, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Mon, Jun 11, 2018 at 2:38 PM, akuster808 <akuster808@gmail.com> wrot=
e:
>>>> On 06/11/2018 10:30 AM, Daniel D=C3=ADaz wrote:
>>>>> Ping on this series for Morty.
>>>> this is in the stable/morty-next branch which is on hold for the curre=
nt
>>>> morty QA.
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dsta=
ble/pyro-next&id=3D76ffc6b7e5ff6f2bab6e53bb07f52a25fcb81ac9
>>> That's a link for stable/pyro-next.
>>> The change doesn't seem to be in stable/morty-next though:
>>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/mor=
ty-next
>> Is there anything from my side that needs to be done for this patch?
> Nope. I have it in the stable/moryt mut branch and trying to address
> build issues.

Is there anything we can do to help with that? The delta between morty
and stable/morty-nmut is only 6 patches (and only 5 between morty and
stable/morty-mnut), so if these changes introduced the build issue it
should be relatively easy to track down.

  89940cc libnl: fix CVE-2017-0553
  dc6a0c4 staging.bbclass: use single quotes for path passed to file in is_=
elf()
  bd2fd02 package.bbclass: Add '-b' option to file call in isELF
  39c8e98 package.bbclass: use single quotes for path passed to file in isE=
LF()
  8a1b2b8 gdb: fix header ordering for TRAP_HWBKPT
  c944c71 glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions

