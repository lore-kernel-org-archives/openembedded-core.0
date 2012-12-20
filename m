Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tlfns-0004JP-6I
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:05:05 +0100
Received: by mail-ob0-f178.google.com with SMTP id eh20so3243886obb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IC5/00ew/ZmVb//uKKvfVME5dPJxsnYF5hvqEhi+HFs=;
	b=pjDJqY/irSQS+DwYZUx4qm5ojtj6HLy2MR7rBtdAIOiZU8UmkH1ID5hNK3OmJrgQo2
	GtotCSamxb2+6yD/xzdGJrJGpuuY+5lJ3Tb3TXwXuDIcQGQjIMqG25WZCaGKPHtJIIh1
	5gS1e8FH4+uiP76kDO8Qv2qeguodOcimgEkCV7rURyKBtRIXiMkKjVAcfTNyKBDbpq2m
	tHC9LclbOEuucmgSmzp+bTGaBAG8+JT/rc/hgFiBJ5gbM2e4v9OtBNB8iCf7IdgJJEyf
	3KWDagEvMMJNc7DItyY4gLmWIrx1Hfz3uIvSLXb6v7bW2AyPEzSe+/E8swTV8Yarn6OI
	PNBA==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr7722113obp.62.1356007803284; Thu,
	20 Dec 2012 04:50:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 20 Dec 2012 04:50:03 -0800 (PST)
In-Reply-To: <CAJTo0LYA9-__u-ptX+=2D61wjVEDDc=6mfdFDc_+8-9zr22s8g@mail.gmail.com>
References: <50D1F76D.4070000@intel.com>
	<EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
	<CAJTo0LYA9-__u-ptX+=2D61wjVEDDc=6mfdFDc_+8-9zr22s8g@mail.gmail.com>
Date: Thu, 20 Dec 2012 10:50:03 -0200
X-Google-Sender-Auth: 0SmkVaeewknYP7lZqUaz5CPPNjw
Message-ID: <CAP9ODKrrSKgd4oFc06Ea=qero4i8Lc1awT7NH_+WwbZru0+XEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 13:05:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 20, 2012 at 10:39 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 December 2012 10:47, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>     You can activate systemd by  DISTRO_FEATURES_INITMAN = "systemd"
>>
>> What happens when I do DISTRO_FEATURES_INITMAN = "sysvinit systemd"?
>
> As systemd is showing, the choice of init manager isn't just something
> you can do at image generation time, but impacts the build.  Services
> may opt to use systemd-native interfaces if systemd is available, or
> streamline their daemonisation based on the support that systemd has.
>
> This is why this series makes the choice of init a distribution
> choice, and doesn't allow multiple choices.

Not really, I've been using sysvinit images and systemd images in OE
with meta-oe and it works fine.

There're some changes need, indeed, but it is possible to make it
work. The biggest change I had to do is to get systemd-udevd using
init scripts.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


