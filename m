Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6531D65C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 20:26:17 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so42729216iec.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 13:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=errK881uJwKTeNw0XXS889X4DNFFLd0WZNHEZ63WvYE=;
	b=OL8e5q2RRXtmivHMYWYJcR5Zzx2YOkbnpB85qI3lh3urgZDsHcHbOTeO25dAprw52O
	sUBK6HAG2y8JknqEUAEtgatoV3T/bxaL8StS5+CIxkGmqF87ozpNTQRrhydpwmJyn2q4
	q5TvG48Jl+5o/T4hPJDiKL2byV/oHdBHhyYJM8wmRyYnw7/nrWXkB1HK1Wr6YeEwrIUO
	RvSdcK5V00JPYigiT9m0jVPl3UaNCZMM06fNiNU546geZ1HXYVObbJBJVC/ti055Pbcw
	lYW9MZnRhPQO65PFMYHgUfrZ7Sx4vuvht0nOS0Wjsm81gdXLHxCas9iHvEbLfHxZEVAa
	aWsQ==
X-Received: by 10.107.16.74 with SMTP id y71mr18158951ioi.54.1435782377391;
	Wed, 01 Jul 2015 13:26:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Wed, 1 Jul 2015 13:25:47 -0700 (PDT)
In-Reply-To: <20150701184816.GK2409@jama>
References: <cover.1435774899.git.raj.khem@gmail.com>
	<2112607f62fe5c4abf6ff958c88c03d066a719c7.1435774899.git.raj.khem@gmail.com>
	<20150701184816.GK2409@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Jul 2015 13:25:47 -0700
Message-ID: <CAMKF1sq_n8fFTunuJ2jg_6hv0OjdAsUr4Z-UNPyRoGfNHO+3HA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] wayland: Upgrade 1.6.0 -> 1.8.1
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
X-List-Received-Date: Wed, 01 Jul 2015 20:26:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 1, 2015 at 11:48 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jul 01, 2015 at 11:24:53AM -0700, Khem Raj wrote:
>> Fetch from git, at same release revision SHA
>
> This doesn't match with the change anymore.

amended both weston and wayland commit messages on pull branch.

thx


>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.8.1.bb} | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>  rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.8.1.bb} (92%)
>>
>> diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
>> similarity index 92%
>> rename from meta/recipes-graphics/wayland/wayland_1.6.0.bb
>> rename to meta/recipes-graphics/wayland/wayland_1.8.1.bb
>> index 6413a0a..5b36745 100644
>> --- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
>> +++ b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
>> @@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
>>                      file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
>>
>>  SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
>> -SRC_URI[md5sum] = "d34c141c975084e4fb668e77b38f840e"
>> -SRC_URI[sha256sum] = "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb6737a20d0d86ba6fc7f"
>> +SRC_URI[md5sum] = "6e877877c3e04cfb865cfcd0733c9ab1"
>> +SRC_URI[sha256sum] = "f17c938d1c24fd0a10f650a623a2775d329db3168b5732e498b08388ec776fc8"
>> +
>>  SRC_URI_append_class-native = " \
>>      file://disable-macro-checks-not-used-for-scanner.patch \
>>      "
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

