Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSazI-0002mQ-7W
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:33:28 +0200
Received: by eekd49 with SMTP id d49so530424eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=hMHLPIPE8POD9pju32yz7B3HSNHaJPyc6RBRhFxXdAU=;
	b=l5nmGNVwB4rbsLlIaT0/L8VszWyubOuZ5z2REwdEvEo/iGd1VuHkaHIpbNjjueMiN9
	F7gZfJ8JreaKagI6qJEH1/+MnnewieNDNzn6dvfTSYDwmw6eK8sR373vrhxfNdts5Ow9
	2wtGwsh4qqlX6GdR2zAQ71Dqxiw5YXoWEU70ajKVkAysH7PQDL7TUhQwpV+OjLO5cAz5
	RcsvS1rrH3qEikcH1z08bMYauSFlS7U8FJNq+OpK+8JW0KMEAnmDJBs/KydISHjLgfP0
	7CH6a2tCLx/q0cRjVZH/0iVGc480+MRsDoK3D9wTHtpNNkYfL9X1+IM3GjFEUHbRyQum
	OeyA==
Received: by 10.14.47.131 with SMTP id t3mr1193422eeb.118.1336685013997; Thu,
	10 May 2012 14:23:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 14:23:03 -0700 (PDT)
In-Reply-To: <4FAC2E33.7020204@windriver.com>
References: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
	<CAMKF1spfSiBy0F-cP7Q2NYT2dg2CFqvfXxuxR_=-F2o8gdBwGw@mail.gmail.com>
	<4FAC27A1.70902@windriver.com>
	<CAMKF1sp3RJsrUC5befeKBn+sDQNw2wpUvO2Co+O9eSAhJ5BiLA@mail.gmail.com>
	<4FAC2E33.7020204@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 14:23:03 -0700
Message-ID: <CAMKF1sr3buc=P3HxcNOv23P0pzRZpRJLP3Bbn_PsE-GuttkiBQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: fix packaging error for libext2fs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 21:33:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 2:08 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
>
> package install/image creation expects the full filesystem to be mounted.
> =C2=A0It's only during boot that partial mounts may exist.
>
> I don't know what the e2initrd_helper does.. if it's required for booting=
,
> then it's needed in /... (or if libext2fs can't run w/o it.)

yes I was meaning the runtime here not image creation time.


