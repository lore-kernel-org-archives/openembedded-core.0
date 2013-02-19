Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U7rNd-00026C-WC
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 18:53:29 +0100
Received: by mail-ob0-f170.google.com with SMTP id wc20so6910113obb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 09:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=5eyha8nBQQqaycQ2G04/9nmC81SOaI+PATxMwP1yjz8=;
	b=zNTt+iY/utSu/m7uxK+TEbEgvH7dhFzS65ttqQ2Mcu7MJkSEPjUMnF7LI4SRk4Qm84
	aIpiatNEUHVnpvpkhbdj/JyWS9g2sR6eLVmB81wUvk5su0qcbv9y/rsyKXodwJ6EtN6z
	zGmF5ykjeFEfr8P2pvV1GZiMueJGgQsF8Yn3HzojKm8ml3m/hThA1mA7HDqPYiznxPOb
	dC+f2D/WjjP6yEU2lCTRjwB87mmyO0tPAfVQ78qsTWM3dKyfD0G5KqgzZARxUf1fsEt/
	7K0/zhkTj5tnVEcmpQZgguXsAYGu6CPYI1tXk8AimplDtzech+vF/9g6LEwdRYKiVu8L
	cvQA==
MIME-Version: 1.0
X-Received: by 10.60.13.65 with SMTP id f1mr7935871oec.87.1361295436025; Tue,
	19 Feb 2013 09:37:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 19 Feb 2013 09:37:15 -0800 (PST)
In-Reply-To: <1361295220.5927.46.camel@ted>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
	<1361123592-32572-4-git-send-email-otavio@ossystems.com.br>
	<5123AE35.5020007@linux.intel.com>
	<CAP9ODKpL1KUmq1L6r9aHarBcG-UcThvEqF0OWwxkfxYiNhbcNw@mail.gmail.com>
	<1361295220.5927.46.camel@ted>
Date: Tue, 19 Feb 2013 14:37:15 -0300
X-Google-Sender-Auth: NN4xI5nDy7k4yL1YKI4XRBGwvBU
Message-ID: <CAP9ODKqAa+eNz=oOoLVYjMJLUg7x4fBpjy38OjVnO5rZhERdUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/5] qt4-tools: Drop libx11 dependency when building without 'x11' distro feature
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
X-List-Received-Date: Tue, 19 Feb 2013 17:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 19, 2013 at 2:33 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-02-19 at 13:57 -0300, Otavio Salvador wrote:
>> On Tue, Feb 19, 2013 at 1:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > On 02/17/2013 09:53 AM, Otavio Salvador wrote:
>> >>
>> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >> ---
>> >>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
>> >>   1 file changed, 2 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> >> b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> >> index cfc6fd8..d7ce8dc 100644
>> >> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> >> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> >> @@ -1,10 +1,10 @@
>> >>   DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
>> >> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
>> >> +DEPENDS = "nativesdk-zlib nativesdk-dbus
>> >> ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11', '',
>> >> d)} qt4-native"
>> >>   SECTION = "libs"
>> >>   HOMEPAGE = "http://qt.nokia.com"
>> >>   LICENSE = "LGPLv2.1 | GPLv3"
>> >>
>> >> -INC_PR = "r13"
>> >> +INC_PR = "r14"
>> >>
>> >>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
>> >>
>> >>
>> >
>> > Does this also need a change to the EXTRA_OECONF to ensure that the x11
>> > functionality is disabled by default in the configuration.
>>
>> I didn't find this option; it'd be great so we'd ensure it wouldn't
>> link against host x11.
>
> We need to find or patch that option in otherwise this is not a viable
> change.

Once I finish what I am doing, I will take a look once again.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


