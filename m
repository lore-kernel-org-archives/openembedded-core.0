Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id B1B826AE0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 17:46:06 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k14so13852293oag.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4KgatGhfg72LbkPG59oHxMB7B7+5imGfWA+4BYjddLA=;
	b=hH3cmrY7JPWlLIOgTJovLtAYZ26Y5oBuQz6dmevrrrq0slDBq6OlTruzIM/1AlMc6j
	Q1/QvipUau4lKFMaX2CyXPrCFBz4jf0iChy9N8rcj/dz5LsbrkiFSdAdRB1fWXUwjwwB
	GkOEiv2EH9XUjJsWu+M3xtJD1OKlSFaEQvEzeeOYoNzS4oy1a9eMJLiqaJTuaavLKgnr
	3LfOtuDAhKOsRrhyIwc/CKM/Gd7RluuPUW6ijM7ze/wNRUMNSrSVZ6jJZjxwN0vgM3hA
	7sEcKo4exiXrj2Vzox+oOXQ7s+LT0sF6Q/c/sFt7TiZQO3B+8e5YJjwajZoMBbddBcQD
	dJxg==
MIME-Version: 1.0
X-Received: by 10.60.40.42 with SMTP id u10mr106634oek.2.1372182367293; Tue,
	25 Jun 2013 10:46:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Tue, 25 Jun 2013 10:46:07 -0700 (PDT)
In-Reply-To: <56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
Date: Tue, 25 Jun 2013 14:46:07 -0300
X-Google-Sender-Auth: KInCfk2VYxvM2el2oVD7BTWCx3o
Message-ID: <CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 25 Jun 2013 17:46:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 2:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Jun 25, 2013, at 10:07 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
>>
>> Guys,
>>
>> There is a continuing failure on the auto-builder with the 4.8 version o=
f GCC for the fsl-ppc and fsl-arm BSPs.  This is currently holding oe-core =
back from updating GCC to 4.8, which we want to do soon so that we have get=
 any other issues worked out that might come up.
>
> First of all these are not reference BSPs for OE-Core so this should not =
be a hold off if its urgent and we still have 4.7 gcc in OE-Core But its ni=
cer if they worked.
>
>>
>> These seem to be ICE issues can get bee seen in the following log files:
>>
>> http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-arm/builds=
/148/steps/Building%20Images/logs/stdio
>>
>
> perf is tied to kernel, it works fine with linux-yocto, what kernel is us=
ed for imx53qsb ? a preprocessed callchain.c will be helpful.

http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=3Dimx_2.=
6.35_11.09.01

If you provide me the command I should do, I can get it. Or Saul might
get it from autobuilder as well.


--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

