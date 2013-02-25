Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U9t1C-0008AY-Li
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 09:02:49 +0100
Received: by mail-ve0-f174.google.com with SMTP id pb11so1940338veb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2013 23:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=okKg5JVagSOs/UpHcvFECUsgetU/IRBq+joLU558pUs=;
	b=OjmtfrPwKmz5IZ0RRpfjnnoxAXYDqq0kA7h3iS2ekjhuEtjT69DxUqiG5zwkyfZRbt
	JqCCGHuPxF6jgOJ/ljesmRV7X0zDkjgyFPikst0bigoO1EEZPh7OQaSkxVREvIT1lA2i
	oVVQpopNUIOObgJE61KHN0lfHBuUwMMteLCGGaaNsOXmGMt1tFy6d6RtdxlzCzyFFqo0
	rBQmp3UDMfOL6wtqwvLPUczYCWRPG9tPJnAAoge3y/LaRQbjD2RO3GpcqUICXpm5I/Ml
	cmyn/Ops2Rpt0Ibw6QuWE2ogwQRruD3RPghFC+C47W0MyV8lpdTR6pzsOJ9y6yalbk+w
	RmDQ==
MIME-Version: 1.0
X-Received: by 10.58.50.7 with SMTP id y7mr9822294ven.24.1361778380991; Sun,
	24 Feb 2013 23:46:20 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Sun, 24 Feb 2013 23:46:20 -0800 (PST)
In-Reply-To: <399178DB9667444C94B177EA9AC61726@intel.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
	<CAP9ODKphcmassr66cE_=M5R20gEYVwbVLwyoZu5NnKi6W0T5Kg@mail.gmail.com>
	<399178DB9667444C94B177EA9AC61726@intel.com>
Date: Mon, 25 Feb 2013 08:46:20 +0100
Message-ID: <CALbNGRQAfAZLM8i3yPG0Jeczhupi-rgPrQ26qi4pxK_vHgTfhg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Mon, 25 Feb 2013 08:03:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 24, 2013 at 11:04 PM, Ross Burton <ross.burton@intel.com> wrote=
:
>> The size impact it not negligible; specially for initramfs images but
>> what concerns me even more is the upgrade path from previous users of
>> meta-oe systemd.
>
>
> I obviously didn't make myself clear - the size impact is negligible when=
 you're talking about just the init script - the >dependencies on systemd/u=
pdatercd could be recommends at most, as the postinst scripts could check w=
hat init system >they have before calling any tools.  Either way a rescue i=
mage that boots using busybox init shouldn't have systemd, clearly.
Maybe I missed something but I have seen some arguments for splitting
initscripts into single packages - but I can't remember one for having
all in one package. Maybe somebody can help me out here.

Andreas


