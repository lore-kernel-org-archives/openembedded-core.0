Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QudwC-00051a-T9
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:17:40 +0200
Received: by bkbzu17 with SMTP id zu17so2931794bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 22:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CVCJA8yWWAVWcTv9kmmumL7+jeld171OlILzGWBPIVc=;
	b=pZuvkVOUwTa2DqkVKvanC1NlOr+PqnWPwsm018Y/OztNeJhTqgv5fWeAFhKAVe7Wpw
	SAz94/O3V2qyxsND3gr/DNUiJLi05hFvs9J9LoXaWULM+ZvPUnh0LNFTzrTTghYjv8FK
	Kfll7oxKKE46ZoV36gnEenfZ0T2x04FiiXMAs=
MIME-Version: 1.0
Received: by 10.204.132.23 with SMTP id z23mr53195bks.383.1313817179436; Fri,
	19 Aug 2011 22:12:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Fri, 19 Aug 2011 22:12:59 -0700 (PDT)
In-Reply-To: <CADkTA4PBJLxUQx3PAkuzBxo+hp3B_=hPkx0rZ2_GuUvjQgDbMA@mail.gmail.com>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<fe4a8f56697a9915ca59d0dd4bc3f06a4072d7dc.1313816148.git.otavio@ossystems.com.br>
	<CADkTA4PBJLxUQx3PAkuzBxo+hp3B_=hPkx0rZ2_GuUvjQgDbMA@mail.gmail.com>
Date: Sat, 20 Aug 2011 02:12:59 -0300
X-Google-Sender-Auth: DhFzUMjayjxU5LgW6v3AbfDMPoc
Message-ID: <CAP9ODKq92dq0Su1RpkT3AkZb8esfe=5_VK-Gc+=xLAAtkSQqMA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] kernel.bbclass: move uboot image generation to a specific class
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
X-List-Received-Date: Sat, 20 Aug 2011 05:17:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2011 at 02:07, Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
> These aren't equivalent. We should maintain what is already in kernel.bbc=
lass
> and just move it over. If there already a uImage in the build tree, there=
's no
> need to run all the objcopy "mess" below. I found that it created useless=
 binary
> blobs forme in the past.

In this case can you take a look on this and also fix it in meta-oe?
The class had some differences and I do think we ought to avoid those
as much as possible since it only makes debugging harder.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


