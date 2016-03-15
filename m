Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 824EE6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 16:40:16 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id e6so27946118vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 09:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=HQOl5uF3S5Nu8uOl1t9OB2bGYb5N8yGzCBwMB6WQOvY=;
	b=E1x+ojbMABkpb9ZsMLuwNQx9FOySak0wzl+w76kgx436VVzxurKeM9RNWHCNlHgDBa
	E8GUMKuHDIzX+EbXPt0wF/sfnzZiUEc5kpbpr0ZJVHCCg40uTVEtlrmOAFbf/TVxIW3o
	sZVAiEDnzcyzC/VU+cOVy7uqkQKp73kEqZB2AomouvaeuzhACBP8tTj3XiVm0k9KLEYI
	tFzIkoCEX670/2SrRXLLGoYfMpDQQCoIgFNZw+40z3Fd7s9QoQsuOO+XXahKyuqc7fZb
	aubmkT7NvY3RzLS2S4WrKOJxV8Ne6sgXYfCXFrgCBbCstvW/VRXGSfisXa+WnFSg5RFl
	6xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=HQOl5uF3S5Nu8uOl1t9OB2bGYb5N8yGzCBwMB6WQOvY=;
	b=CZQNL3cBwklM8QO9SrHVYVqIz93VErYyxzK4YBumkXP5nYhJm1D/my6PMa05Ps3xe0
	ggYFagfwlATQgr6xM3+8clr9Zq5zF1w8ZZQK/udCEuM5SvaSdgEYW+f5uUZyBBP9qIZL
	3cu10Bo3WaYoXQgTyRLEgM+ep927qCBJAbyiIPVWeB8/3wk7k9RSWiQZVLFpLDHRkFFP
	5VWe0CPyqVEqzGzyFk7SF6uEUQLj1fJxMTlv4zYdHoF90DuE+H0YPQE6iuRmOZNhS5co
	sE5vzgWvoXIGBlJwQF2oj8QbPVLAwTwwIuDOUCLxE4RHrhd4V5m0whSiCyKMdpMARsK7
	750A==
X-Gm-Message-State: AD7BkJIsNdBORef9lyoMcnpnA+G0Nwu50Yjbd/pbvn7gtfYoPqpiKv9s2eeZqCgw0FoUp8SbpKa/BeTMbhk+nw==
MIME-Version: 1.0
X-Received: by 10.31.50.65 with SMTP id y62mr32919569vky.11.1458060016513;
	Tue, 15 Mar 2016 09:40:16 -0700 (PDT)
Received: by 10.159.35.45 with HTTP; Tue, 15 Mar 2016 09:40:16 -0700 (PDT)
In-Reply-To: <56E8315D.2080906@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
	<56E8315D.2080906@linux.intel.com>
Date: Tue, 15 Mar 2016 17:40:16 +0100
Message-ID: <CALbNGRTFFgv6k_e=CF-zHhOJ2Z1rSHUJ3CuFDhAp3G7zv57Vkw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Tue, 15 Mar 2016 16:40:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2016 at 4:59 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/10/2016 11:24 PM, Andreas M=C3=BCller wrote:
>
>> This one seems to report host's python3 version:
>>
>> [superandy@localhost sysroots]$
>> x86_64-linux/usr/bin/python3-native/python3-config --ldflags
>> -lpython3.4m -lpthread -ldl -lutil -lm -Xlinker -export-dynamic
>>
>> We are at 3.5
>
>
> This is because python3-config does not contain the version within itself=
,
> it reports the version of the python interpreter that it is run with. So
> NOTABUG.
I am tired of your way of dealing things but leave in total disagreement

Andreas

