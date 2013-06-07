Return-Path: <net147@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3CED16A456
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 02:05:51 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w15so200710vbf.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 19:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eZUj6cy7jPzqAa3dhB6kMAewZJ36/hgjlCmUsNPXtDc=;
	b=bNJB7ILHkcTjZFK2daGkX52aN8waVUuV5GA60W/3yyqpJ/mZJdJI5gF2dnQzSIGpdq
	9rNOsWCDNQX21wF+7/raaSlKw3k4N5bUxt81pYeFSQ4cDvBmTBbUfYYQT8XOCCKA30SM
	7hpUtdB4RyyEHUcmM74jXFSqr0/P5dKQoAF4de1OQXK3z0qgllvBLwRjFwDwV7b8mMbF
	nkX7hANvO3wv66VUpQ3F6A5EoEMOGbIY3e3Vuswxs2Lwh53Bw2eZKywultaYwnyE3zR2
	U9ZjuxR3A6Ovco+Ahztn/87/LqNWLZtrjXaebf69h+SAynECtTzIH9W8OdP0IhUAc/3U
	xnjg==
MIME-Version: 1.0
X-Received: by 10.52.68.11 with SMTP id r11mr19445839vdt.93.1370570751641;
	Thu, 06 Jun 2013 19:05:51 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Thu, 6 Jun 2013 19:05:51 -0700 (PDT)
In-Reply-To: <CANwerB3Ha-dUVEGrzW8FkSpRD13qRqfbZrxSy9pftYR793s9yg@mail.gmail.com>
References: <1370501684-26590-1-git-send-email-net147@gmail.com>
	<CANwerB3Ha-dUVEGrzW8FkSpRD13qRqfbZrxSy9pftYR793s9yg@mail.gmail.com>
Date: Fri, 7 Jun 2013 12:05:51 +1000
Message-ID: <CANwerB0_VVfnuwFtTubxckhgvpSLzr-1MDb154eUg9ow+0V8+g@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/qmake2: export QMAKEPATH
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
X-List-Received-Date: Fri, 07 Jun 2013 02:05:51 -0000
Content-Type: text/plain; charset=UTF-8

On 6 June 2013 17:34, Jonathan Liu <net147@gmail.com> wrote:
> On 6 June 2013 16:54, Jonathan Liu <net147@gmail.com> wrote:
>> QMAKEPATH is exported so that qmake is able to detect the webkit module,
>> load it and add it to the QT_CONFIG variable. The detection is done in
>> mkspecs/features/qt_config.prf which reads the qmake QMAKE_MKSPECS
>> builtin. qmake will read QMAKEPATH, append /mkspecs to it and prepend it
>> to the QMAKE_MKSPECS list builtin returned. qt_config.prf will then load
>> modules matching modules/qt_*.pri inside each directory in QMAKE_MKSPECS.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/classes/qmake2.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
>> index 8b9861c..03ad2f1 100644
>> --- a/meta/classes/qmake2.bbclass
>> +++ b/meta/classes/qmake2.bbclass
>> @@ -5,6 +5,7 @@ inherit qmake_base
>>
>>  DEPENDS_prepend = "qt4-tools-native "
>>
>> +export QMAKEPATH = "${STAGING_DATADIR}/qt4"
>>  export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
>>  export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
>>  export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
>> --
>> 1.8.2.3
>>
> This may be causing some packaging QA problems. I am investigating...

Please disregard this patch. I will submit a different patch to fix.

Regards,
Jonathan

