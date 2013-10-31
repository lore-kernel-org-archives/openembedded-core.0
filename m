Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 50DDC6D3BB
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 02:36:47 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id aq17so3728201iec.6
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 19:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FMlkOhU7z3Nb7IRXmbzTKfvGlU7JqRGc6QIda+RiZ2Y=;
	b=g6Xx989Z+oBP4+u2EnlzzM0hRaIsll793biCmd+R0MHqA7MQxFHWFCRdsnXLGmd+UH
	gnL+96dDfTXHJvhxrsCUTjVJDe4NHP3PuWNqiMrlvnTJsJvgIeCcxPXIJDRbYmRQ4Unm
	ZsX3pXtxhxit9uOLSoAW8VG603z9SL3/EEMwE6RrimYnf+CV3fyGWZ+BRm1w7AaTKfxb
	QtksSheV4NyoEZJuwX3R5DbRQUbNIuLnNI5s1wwSYEAaml88tlNa+8zH3zn4rcJIrrsC
	9sM6H+TIJH2pAbtR6eyy1/8KcIS982n2qOhae2K+ouszgajdTkRLt6xgX/HUc/pe0+Aq
	eXMQ==
X-Received: by 10.43.172.199 with SMTP id nz7mr494455icc.48.1383187009059;
	Wed, 30 Oct 2013 19:36:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Wed, 30 Oct 2013 19:36:18 -0700 (PDT)
In-Reply-To: <5271C101.2050802@windriver.com>
References: <1383173291-4017-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1srsz3njDJpvm4sr865VDkWtemeZzDshT2gY05noNqZZLA@mail.gmail.com>
	<5271C101.2050802@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 19:36:18 -0700
Message-ID: <CAMKF1sr1LdByMQ4bWZ7eaNSJAO9aBkuPZy+EoC7P0nFMPFfBrw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtools, syslinux: add ability to compile with nativesdk
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
X-List-Received-Date: Thu, 31 Oct 2013 02:36:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 30, 2013 at 7:31 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> On 10/30/2013 06:47 PM, Khem Raj wrote:
>> On Wed, Oct 30, 2013 at 3:48 PM, Jason Wessel
>> <jason.wessel@windriver.com> wrote:
>>> For regenerating and ISO or EFI boot image the nativesdk needs mtools
>>> and syslinux.
>>>
>>> Both recipes are patched in one patch since syslinux requires
>>> mtools.
>>>
>> as they depend on eglibc/glibc only. Can you also make sure that they
>> get flagged when building
>> systems with non-eglibc C libraries.
>
>
> Is there an example in a recipe of what you are talking about?
>
> I saw in another recipe:
> python __anonymous() {
>     if d.getVar("TARGET_OS", True) != "linux":
>         return
>     if d.getVar("TCLIBC", True) == "eglibc":
>         raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
> }
>
> Or is there a build test I should be using to test with uClibc for when things like this change in general?


yes converse of above is what we need here.

>
> Thanks,
> Jason.

