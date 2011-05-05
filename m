Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHpTZ-0003op-RA
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 05:43:41 +0200
Received: by ewy5 with SMTP id 5so543453ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 20:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=jw0ETz+TfCvVN4xQJh/Xv25i6+03SJRO1LxeKgkckog=;
	b=MAo/hhjqZBEEmWbfN8riWgIsxRZM90tRa4QSGVZ3uzKNE0UYwpw87+xyuSn/+D8pv8
	Bt3NpjIEjQw+oisIYOo51xS0EARMBDn6Yr2SfckkCHOm8HXwl/1b8qMqezoIDBBGGgmS
	V2Vylu7qV4wcy0qtY9LcBkXzezLasahaFhcxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=VsL9G75s+n6zV5pgnqJtuPpzUJLiF2uS9IrJ5S2L71ZRzj/r40gszypCvXjCn8DFJN
	eai+k+WwOnZKn8GyG+WC+6SuK63yshl/wvXjcIrdcFmuIQbiRITSJa1xLhOm2NEz+asX
	M5dnC/7fG2e5fFi3ll7wrgO2vXbcYY16W6nvc=
Received: by 10.14.52.132 with SMTP id e4mr917354eec.173.1304566861116; Wed,
	04 May 2011 20:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Wed, 4 May 2011 20:40:31 -0700 (PDT)
In-Reply-To: <4DC1F20A.4000906@intel.com>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
	<4DBF4F26.90404@intel.com>
	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
	<4DC03C43.8080507@windriver.com> <4DC04CCA.2030100@intel.com>
	<BANLkTikmGcS4hJY0+vmo-sGTTurFbY6HuQ@mail.gmail.com>
	<4DC1F20A.4000906@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 May 2011 20:40:31 -0700
Message-ID: <BANLkTimpqOp2+AjNJFqsyA4JVfJmbuToSw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Thu, 05 May 2011 03:43:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 4, 2011 at 5:40 PM, Zhai, Edwin <edwin.zhai@intel.com> wrote:
> Raj,
> We have a bug for Nvidia driver @
> http://bugzilla.pokylinux.org/show_bug.cgi?id=649
> and a fix @
> http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=gzhai/fix2&id=f596757000465a4b8350e16f21553a23b8bbedfa
>
> I think it deserves a try.
>
> BTW, where is your gl library, including original one and Nvidia's? I doubt
> the layout may changes in ubuntu 11.04, so that our code failed to detect
> it.

yes this helps indeed. Please propose this patch for oe-core's
scripts/runqemu-internal

Thanks
-Khem


