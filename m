Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAOst-0002aD-BU
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:04:20 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so5820661oag.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=W7/S42OGStufP43Rij9xMOvKHNyHLRmZ9vwynTKUemE=;
	b=IOVWAzZ5vS6Y9oYBbUHSGTlJ/tehSdVJzw9vyDgWrZU6blIm+UD2LO2/+M1gWiBWoQ
	wCl5aNZt4BDiPSIHWzgxCQgb7nHSv9ZDOGALzqmd+IMgqAdo+ttOu5boQe6kP4aIPeLz
	60zOvmhDBgrDmWdTTMoWd3ZDQ2277GL0kLPFh3hy/dv+7QNfFcP0Uwv3CZm+Te4SZCL4
	W09TgPwhwkxtv/WV6IM7OHW2Yhl7Yy0rAdiKE79nS9dAzBLXzAkCwVNYqtqKbgX5ifmF
	s/Z/BadfA4SoInoadYG3Y6x1AaOILlp1OPufd3B+1FOxAkoHAYMkxY5OJ/4E6PMNpIx8
	40ZQ==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr2405068oea.4.1361900871372; Tue,
	26 Feb 2013 09:47:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 09:47:51 -0800 (PST)
In-Reply-To: <CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
Date: Tue, 26 Feb 2013 14:47:51 -0300
X-Google-Sender-Auth: fgkpIrh837Nb4lYhcr6fb-fD6zU
Message-ID: <CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 18:04:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 2:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 February 2013 14:32, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Please inherit allarch
>
> That doesn't play nicely with autotools:
>
> | checking build system type... x86_64-pc-linux-gnu
> | checking host system type... Invalid configuration
> `allarch-poky-linux': machine `allarch-poky' not recognized
> | configure: error: /bin/bash ./config.sub allarch-poky-linux failed
>
> Considering a lot of allarch is designed to remove dependencies that
> this package uses and thus will need to be restored, directly setting
> PACKAGE_ARCH is the cleaner solution.

If it changes the build depending in target and host, in the end it is
not architecture independant code.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


