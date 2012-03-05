Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1S4fsu-0006uD-6N
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:56:00 +0100
Received: by bkcjg15 with SMTP id jg15so3919067bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 13:47:25 -0800 (PST)
Received-SPF: pass (google.com: domain of cliff.brake@gmail.com designates
	10.112.84.170 as permitted sender) client-ip=10.112.84.170; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of cliff.brake@gmail.com
	designates 10.112.84.170 as permitted sender)
	smtp.mail=cliff.brake@gmail.com;
	dkim=pass header.i=cliff.brake@gmail.com
Received: from mr.google.com ([10.112.84.170])
	by 10.112.84.170 with SMTP id a10mr9961379lbz.22.1330984045228
	(num_hops = 1); Mon, 05 Mar 2012 13:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Kis+8jpyu3cKKch3YLMpYeYhD4MWlclgL/Zn70zNCaw=;
	b=qqvuRwcF0IrzQVYBFNCHpxHUeDxH849MxSDGy79ntR6TyUUUhi84bCIjOIeYoA1tgm
	GPFpYkOXlRrp0XvGEOHLJyy8PZbfQ6NLT+we81qLgqHsnO4uPJshGS6ya+KBjrqsdPOJ
	N3NXJPhY4BqkjfrUzOm0J7kgFl4ZGzonjMODCQFUAreq0vCq1C7yin1xfMabVKmG3o9J
	XhXZ+GFVOHkJZz+M0GKRs6z8IMbk38qCJ3riHwQzcMes9IrF1zmRXUKui9HwMiuRrQdr
	0PdpdX1+lx3Nn4irhB1LC/8gjAOkeEXW/S8ix5jJlq2wTB6hWAzxcd8eFBouPyUmvJZD
	bhxw==
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr8131214lbz.22.1330984045007; Mon,
	05 Mar 2012 13:47:25 -0800 (PST)
Received: by 10.112.31.197 with HTTP; Mon, 5 Mar 2012 13:47:24 -0800 (PST)
In-Reply-To: <CAP9ODKq_JrKF4LJwRt5Fcg79+xQfdVQqPBJZyq_=Lv7zu36koA@mail.gmail.com>
References: <CAOd_LFz2nUOW4D4Q9YuDHzwvs6qTwgS2TJZA5UnJbYaROCiSGg@mail.gmail.com>
	<CAP9ODKq_JrKF4LJwRt5Fcg79+xQfdVQqPBJZyq_=Lv7zu36koA@mail.gmail.com>
Date: Mon, 5 Mar 2012 16:47:24 -0500
Message-ID: <CAOd_LFzmHn-V2MvvaiOhO0riY5L_Z=zs0qNWax39Ew7-COmzww@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: read only rootfs?
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
X-List-Received-Date: Mon, 05 Mar 2012 21:56:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 3:56 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> On Mon, Mar 5, 2012 at 17:39, Cliff Brake <cliff.brake@gmail.com> wrote:
>> What are the best practices for implementing a read-only rootfs built
>> with OE? =A0I've looked at a few things like poky-tiny.conf, but figured
>> I would ask.
>
> You could the image feature for it; depending on the image complexity
> it might just work or need few fixes for some postinsts to work in
> offline mode.

Thanks for the idea -- just for the record, I assume you mean the following=
:

IMAGE_FEATURES  read-only-rootfs

Looking briefly at what this does, it appears its only a diagnostic
feature that tells you if there are postinst processes that need to
run?

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


