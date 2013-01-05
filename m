Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TrHw5-0005Wh-EQ
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 01:48:29 +0100
Received: by mail-oa0-f49.google.com with SMTP id l10so15300156oag.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 16:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+x670IdIfIbWLg4KS+sRTrjuxmdEE+1KlpQAVPTWDOI=;
	b=XMCnGlmcFpwllOFz+42knTNAD6PPqAPyaLvPpwoOCMEe5PgJSmZh/hslD0JF+zpKm2
	PhuZMFm19wcxLhUi4YRijpeMXzlPPx6qmIZc7zbzCj9otXM9aOL1LS+7gBNcYFT34K4n
	+KQNuFMWsrJeNChoNkwf/9E+0UAUaJJO3RXfGs5Ox7TQA6UaT0FS4iI4KWRnYApH1/ok
	Pbcx8JNtsUUGM66m2H7sAugAJ4Ixy2igHQW8dIXs5oh2P1/lHJCuslTKUQCaG8IWv8eP
	2ZwVbrZE/7p8PZSuM33W4cT536oVwdOJrUc+zXlXj1tNBHASMiQqOkPnjHKw3v+jkXI+
	L82A==
MIME-Version: 1.0
Received: by 10.182.207.3 with SMTP id ls3mr39953900obc.60.1357346003118; Fri,
	04 Jan 2013 16:33:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Fri, 4 Jan 2013 16:33:22 -0800 (PST)
In-Reply-To: <449d181c104843ef74cbc1f81a5a58f18051fc14.1357343832.git.raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
	<449d181c104843ef74cbc1f81a5a58f18051fc14.1357343832.git.raj.khem@gmail.com>
Date: Fri, 4 Jan 2013 22:33:22 -0200
X-Google-Sender-Auth: _CkmNjTugP1gcIub50lqn-B2mPc
Message-ID: <CAP9ODKqBnkx0U7FQjs1HB6VqWVsBOv+YOufouLebWT9=dJ=kpQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] eglibc_2.17: Fix Tibetian locale generation error
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
X-List-Received-Date: Sat, 05 Jan 2013 00:48:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 4, 2013 at 10:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This is fallout of BZ #13950 fix to glibc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Fix doesn't seem as an accurate name here; I'd prefer:

Workaround Tibetian locale generation error

as it better describes what it does; the patch file should be renamed
and updated as well.

What do you think?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


