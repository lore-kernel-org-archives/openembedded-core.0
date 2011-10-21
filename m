Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH79c-00039K-KM
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 06:56:24 +0200
Received: by pzk33 with SMTP id 33so8892741pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 21:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=EXZRJRd5fqpgN4Ii2QmAmtoUrUKarLN4OuO22zn59sw=;
	b=umYB+Lb2pO+04O0AV3m6TQR5aNhNTDB8ADapLg1aoszD1oY4dC5fYPjnzhOX80EYTi
	6/R0YBU/4P8ueO1rsOIRO1D8wABPBX+sP+UItt2ZFuqNBP/3/ndOVC3tNiU5ZscqlqXA
	gdrMporIVd6cVQUKQKbN3PrEJHkV9yYUMYmKU=
Received: by 10.68.23.6 with SMTP id i6mr25071992pbf.13.1319172629118; Thu, 20
	Oct 2011 21:50:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 21:49:59 -0700 (PDT)
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1A88E8@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
	<1319129657.2410.57.camel@ted>
	<CA+M6bXm9zigRMzMQSdwntHAUYD+vBAmuLbAdNA7RPkBM=wwFNA@mail.gmail.com>
	<1319148494.2410.100.camel@ted>
	<CAMKF1srf2LKe8iv5-KjC7crWFS5pvwbQZArZAzPB33Lmmn1xZA@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8849@MBX20.4emm.local>
	<CAMKF1souA16ckbCXuasee8fE2DDN+SpbY8dh1a92xPv6h72uXA@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A88E8@MBX20.4emm.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 21:49:59 -0700
Message-ID: <CAMKF1soGxeWScDX5_08tQNr+dD=6ww=v=06wuQCL6RHhgbQPzQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sdk path problem
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
X-List-Received-Date: Fri, 21 Oct 2011 04:56:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 20, 2011 at 9:38 PM, James Limbouris
<james@digitalmatter.com.au> wrote:
> --with-local-prefix=/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi/usr
> and
> --with-sysroot=/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi
>
> I think the relevant .bb is meta/recipes-devtools/gcc/gcc-configure-sdk.inc.
>

OK also
apply this http://paste.ubuntu.com/714839/

and then

bitbake -cclean gcc-cross-canadian-arm
bitbake <whatever you were doing>

-Khem


