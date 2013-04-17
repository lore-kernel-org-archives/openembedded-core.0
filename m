Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USOY2-0000NP-LA
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:21:02 +0200
Received: by mail-vb0-f41.google.com with SMTP id f13so1115834vbg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 02:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=Bi5EdAhSNYH32qhZiGJNRVtGO/h+iw/s97Yf8EVm0Cg=;
	b=rBW6Eqxb7T6dUl84flsEDwULh8CcCYl2Tpr93ZaVNcV4GpLOyNWHs5ouRcwvUv/Np/
	cCALzGSbHAKYd9FNTPtJu3ngo/vAoO/qJ88UlFBOlSWBeZmIU5z/vvdoVL9DAlJunW1E
	WBnV6DfnFvZu6zpnVzkpcWINTldoAZZ6uv6avEOhu9nBckoeq7s5eTblzuORaO6dXxLt
	K6VpKe48Kphk0oyGetNfAiZ7qB7+Y84WawQDyQsSyuvYUM5IA1F7KxpyvmtoBGjlz9Er
	PTpbaOztaBnB8dZSIXemMwR/GMF/tQvCMckCrQCvn8EICVOxeu64UhTjWYTTsw9o/rJj
	D73Q==
MIME-Version: 1.0
X-Received: by 10.59.11.199 with SMTP id ek7mr4222483ved.19.1366189410923;
	Wed, 17 Apr 2013 02:03:30 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 17 Apr 2013 02:03:30 -0700 (PDT)
In-Reply-To: <18219582.KT7bte5u1O@helios>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<CE6CCFD7-CDBA-4669-9EA4-02BBA59EDE5E@gmail.com>
	<18219582.KT7bte5u1O@helios>
Date: Wed, 17 Apr 2013 11:03:30 +0200
Message-ID: <CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 09:21:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 10:28 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 16 April 2013 23:42:08 Khem Raj wrote:
>> On Apr 16, 2013, at 11:28 PM, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com>
>> wrote:
>> > sorry again me with another issue. I updated all layers from master
>> > few hours ago and built from scratch. On first boot with systemd
>> > postinst never finishes. I see only:
>> >
>> > [**  } A start job is running for Run pending postinsts
>> >
>> > and ** are moving around.
>> >
>> > Does anybody else face this one?
>>
>> ran into same issue. I disabled post installs to run on boot
>
> Could you guys please try to debug this and find out what is hanging here=
,
> because with core-image-minimal and systemd I don't see this problem, the=
 run-
> postinsts script finishes as expected.

are you using opkg as I do?

Andreas


