Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E14826013D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 13:45:26 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id f30so134624454ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2016 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jlCsz1gtXpPkoSHL4qSwlmqYyOt/HjmD29SXsthc1zI=;
	b=dkhpPpcu5DquOua+LdbvkDEL6LpNoUwk+Jh7kRQ4mH3vPwiiIjAHHUYIHIi8GkJFO3
	I9JdTb8fMfmUxYdzVhBjlqFwDcMGNWMp6zmm2WLq/9sLksjlAFCy24QE0lbf4cb1q4kj
	DLOxOXr8BHVFMILdBIY37jdy0h9SYmJV7xpiAjOJ2Dgze7lf1C6StcUhiKwf1GS4H7AE
	uDPd9SWVKkph5xnv7/KR7VgpMihFM/88r5oGHRoLcdz95P4H1Tay6rt0LlLRBID9tqty
	QzmUDt0QzcF873pnqQ/1Bc17chP6LQ17I3WFt8h+TSc7h3uQaehAxVIAkLoOo8uGScta
	PUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jlCsz1gtXpPkoSHL4qSwlmqYyOt/HjmD29SXsthc1zI=;
	b=NrTpRjAZEfbICQknD16pjvgSMxF5Yngi5qZlgbKzhxTdaPHbh55q29WcEBYFt/gcSY
	POZMgijUsIqvnFg1RLl5Bqft9FenMPaeK6uimt4d28Qd2A45JjaJMSiFFCyzcSgRbnGv
	s13OHnlWW7CQd/WOAEyRhYJippdYsVMJ6ltfrJsoSY52mkEZssN95vGfogw9JP/OckML
	4UHXHD9E1000AxhvbbQCOoH/6pKfh7wmcAGYI3EOQEo0MCCLMNworIltjc4YGZh5Waqx
	pDq+qecInsIDXaebtrY+dQoiFvdBVKbaAptRtYlLS4e6O794sYJXWeybgD656oi06r7y
	UO8w==
X-Gm-Message-State: ALyK8tIMztcir8spmRKhAIiX3HbBhHjGFk2c5oRGa6DMLV2yQ1V89t3WPi3I/7EsYiWFuA==
X-Received: by 10.107.128.73 with SMTP id b70mr5075624iod.87.1467553526970;
	Sun, 03 Jul 2016 06:45:26 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	n63sm7705918ion.5.2016.07.03.06.45.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Jul 2016 06:45:26 -0700 (PDT)
Date: Sun, 3 Jul 2016 09:45:38 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160703134538.GA4902@openSUSE-i7.site>
References: <cover.1463157783.git.raj.khem@gmail.com>
	<fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] glibc: Add recipes for 2.24 release
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
X-List-Received-Date: Sun, 03 Jul 2016 13:45:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I just finished a bisection task which implies this patch is the reason why
chromium crashes when run on x86_64 (minnow) with signal 4 ILL_ILLOPN. Note
that chromium compiles fine both before and after this patch, the problem is
when chromium is run.

I'm not 100% how to move forward, at this point. Maybe the problem is caused
by the remove of the SSE patch?

Any suggestions greatly appreciated! :-)


Received signal Received signal 44 ILL_ILLOPN  ILL_ILLOPN 557b2cb6cc90557b2cb6cc90

Received signal 4 ILL_ILLOPN 557b2cb6cc90
Received signal 4 ILL_ILLOPN 557b2cb6cc90
##0 00x 557b2860a60e0x 557b2860a60e <unknown>
<unknown>#
1# 1 0x0x557b2860a9d9557b2860a9d9  <unknown>
#2 0x7f0923227e40 <unknown><unknown>

##32  0x0x7f0923227e40557b2cb6cc90  <unknown>
#3 0x557b2cb6cc90 <unknown>
#4 0x557b2931b580 <unknown>
#5 0x557b2931bd93 Received signal 6
<unknown>
#6 0x557b29319956 #0 0x557b2860a60e <unknown>
#7 0x557b2931a1dc <unknown>
#1 0x557b2860a9d9 <unknown>
#2 0x7f0923227e40 <unknown>
#<unknown>8
 #0x3557b29a6ec5d  0x7f091e801d38 <unknown>
#9 0x557b29a6301e <unknown>
#10 <unknown>0x
557b29a63cf0# 4 0x7f091e80318a <unknown>
#11 0x557b2bb8f5fe <unknown>
#5 0x557b28694b5a <unknown>
<unknown>#
6# 120x 0x557b2869533b557b2bb90321  <unknown>
#7 0x557b2860a885 <unknown>
#8 0x557b2860a9f7 <unknown>
#9 0x7f0923227e40 <unknown>
#13 0x557b2bb84a1b <unknown>
#10 0x557b2cb6cc90 <unknown>
#11 0x557b2931b580 <unknown>
#12 0x557b2931bd93 <unknown>
#<unknown>13
 #0x14 557b293199560x 557b2d0a1172 <unknown>
#14 0x557b2931a1dc <unknown>
#15 0x557b29a6ec5d <unknown>
#16 0x557b29a6301e <unknown>
#17 0x557b29a63cf0 <unknown>
<unknown>#
18#15  0x0x557b29135d86557b2bb8f5fe #0 0x557b2860a60e <unknown>
#19 0x557b2bb90321 <unknown>
#20 0x557b2bb84a1b <unknown>
#21 0x557b2d0a1172 <unknown>
#22 0x557b29135d86 <unknown>
#1 0x557b2860a9d9 <unknown>
#23 0x557b286747fd <unknown>
#24 0x557b2d10a8ce <unknown>
#25 0x557b2d10aec4 <unknown>
#26 <unknown>
0x#2557b286747fd 0x7f0923227e40  <unknown>
#3 0x557b2cb6cc90 Received signal 11 <unknown> 000000000000
<unknown>
#4 0x557b2931b580 #0 0x557b2860a60e <unknown>
#1 0x557b2860a9d9 <unknown>
#2 0x<unknown>7f0923227e40
# 5 0x557b2931bd93 <unknown>
#3 0x7f091e803286 <unknown>
#6 0x557b29319956 <unknown>
#7 0x557b2931a1dc <unknown>
#4 0x557b28694b5a <unknown>
#5 0x557b2869533b <unknown><unknown>

##8 60x 557b29a6ec5d0x 557b2860a885 <unknown>
#7 0x557b2860a9f7 <unknown>
#8 0x7f0923227e40 <unknown><unknown>
#
9 #0x9557b29a6301e  0x7f091e801d38  #0 0x557b2860a60e <unknown>
#1 0x557b2860a9d9 <unknown>
#2 0x7f0923227e40 <unknown>
#10 0x557b29a63cf0 <unknown>
#3 0x557b2cb6cc90 <unknown>
#16 0x557b286747fd Received signal 6
<unknown>
#17 0x557b2d10a8ce #0 0x557b2860a60e <unknown>
#1 0x557b2860a9d9 <unknown>
#18 0x557b2d10aec4 <unknown>
#3 0x7f091e801d38 <unknown>
#19 0x557b286747fd <unknown>
#20 0x557b2862865b <unknown>
#4 0x7f091e80318a <unknown>
#21 0x557b286291dd <unknown>
#22 0x557b286294ab <unknown>
#5 0x557b28694b5a <unknown>
#6 0x557b2869533b <unknown>
#7 0x557b2860a885 <unknown>
#8 0x557b2860a9f7 <unknown>
#9 0x7f0923227e40 <unknown>
#23<unknown> 
0x#557b2862ada910  0x557b2cb6cc90 <unknown>
#11 0x557b2931b580 <unknown>
#12 0x557b2931bd93 <unknown>
#13 0x557b29319956 <unknown>
#14 0x557b2931a1dc <unknown>
#15 0x557b29a6ec5d <unknown>
#16 0x557b29a6301e <unknown>
#17 0x557b29a63cf0 <unknown>
#18 0x557b2bb8f5fe <unknown>
#19 0x557b2bb90321 <unknown>
#20 0x557b2bb84a1b <unknown><unknown>

##2124  0x0x557b2d0a1172557b286413fa  <unknown>
#25 0x557b28627495 <unknown>
#26 0x557b2bba6cd0 <unknown>
#27 0x557b285d99a1 <unknown>
#28 0x557b285d9f3d <unknown>
#29 0x557b285d91d1 <unknown>
#30 0x557b281a2f9a <unknown>
#31 0x7f091e7ef040 <unknown>
#22 0x557b29135d86 <unknown>
#32 0x557b281a2dfa <unknown>
  r8: 0000000000000000  r9: 0000000000000000 r10: 0000000000000000 r11: 0000000000000202
 r12: 000027522aa181e0 r13: 0000000000000004 r14: 000027522aa181f8 r15: 0000557b2fc06352
  di: 0000357c8b781000  si: 000000000001e000  bp: 000027522aa64000  bx: 000027522aa18200
  dx: 0000000000000008  ax: ffffffffffffffff  cx: ffffffffffffff58  sp: 00007ffe2cd33b70
  ip: 0000557b2cb6cc90 efl: 0000000000010286 cgf: 0000000000000033 erf: 0000000000000000
 trp: 0000000000000006 msk: 0000000000000000 cr2: 0000000000000000
[end of stack trace]
<unknown>
#23 0x557b286747fd <unknown>
#24 0x557b2d10a8ce <unknown>
#11 0x557b2bb8f5fe <unknown>
#12 0x557b2bb90321 <unknown>
#13 0x557b2bb84a1b <unknown>
#14 0x557b2d0a1172 <unknown>
#15 0x557b29135d86 <unknown>
#16 0x557b286747fd <unknown>
#17 0x557b2d10a8ce <unknown>
#18 0x557b2d10aec4 <unknown>
#19 0x557b286747fd <unknown>
#20 0x557b2862865b <unknown>
#21 0x557b286291dd <unknown>
#25 0x557b2d10aec4 <unknown>
#26 0x557b286747fd <unknown>
#27 0x557b2862865b <unknown>
#28 0x557b286291dd <unknown>
#22 0x557b286294ab <unknown>
#23 0x557b2862ada9 <unknown>
#24 0x557b286413fa Received signal 11 <unknown> 000000000000
#<unknown>0
 #0x25557b2860a60e  0x557b28627495 <unknown>
#26 0x557b2bba6cd0 <unknown>
#27 0x557b285d99a1 <unknown>
#28 0x557b285d9f3d <unknown>
#29 0x557b285d91d1 <unknown>
#30 0x557b281a2f9a <unknown>
#31 0x7f091e7ef040 <unknown>
#1 0x557b2860a9d9 <unknown>
#32 0x557b281a2dfa <unknown>
  r8: 0000000000000000  r9: 0000000000000000 r10: 0000000000000000 r11: 0000000000000202
 r12: 00001991086181e0 r13: 0000000000000004 r14: 00001991086181f8 r15: 0000557b2fc06352
  di: 00002a0341a41000  si: 000000000001e000  bp: 0000199108664000  bx: 0000199108618200
  dx: 0000000000000008  ax: ffffffffffffffff  cx: ffffffffffffff58  sp: 00007ffe2cd33b70
  ip: 0000557b2cb6cc90 efl: 0000000000010286 cgf: 0000000000000033 erf: 0000000000000000
 trp: 0000000000000006 msk: 0000000000000000 cr2: 0000000000000000
[end of stack trace]
<unknown>
#10 0x7f091e80318a <unknown>
#11 0x557b28694b5a <unknown>
#12 0x557b2869533b <unknown>
#13 0x557b2860a885 <unknown>
#14 0x557b2860a9f7 <unknown>
#15 0x7f0923227e40 <unknown>
#16 0x557b2cb6cc90 <unknown>
#17 0x557b2931b580 <unknown>
#2 0x7f0923227e40 <unknown>
#3 0x7f091e803286 <unknown>
#4 0x557b28694b5a <unknown>
#5 0x557b2869533b <unknown>
#6 0x557b2860a885 <unknown>
#18 0x557b2931bd93 <unknown>
#19 0x557b29319956 <unknown>
#20 0x557b2931a1dc <unknown>
#21 0x<unknown>557b29a6ec5d
 #7 0x557b2860a9f7 <unknown>
#8 0x7f0923227e40 <unknown>
#9 0x7f091e801d38 <unknown>
#22<unknown> 
0x#557b29a6301e10  0x7f091e80318a <unknown>
#11 0x557b28694b5a <unknown>
#12 0x557b2869533b <unknown>
#13 0x557b2860a885 <unknown>
#14 0x557b2860a9f7 <unknown>
#15 0x7f0923227e40 <unknown>
#23 0x557b29a63cf0 <unknown>
#16 0x557b2cb6cc90 <unknown>
#17 0x557b2931b580 <unknown>
#18 0x557b2931bd93 <unknown>
#19 0x557b29319956 <unknown>
#20 0x557b2931a1dc <unknown>
#21 0x557b29a6ec5d <unknown>
#22 0x557b29a6301e <unknown>
#23 0x557b29a63cf0 <unknown>
#24 0x557b2bb8f5fe <unknown>
#25 0x557b2bb90321 <unknown>
#26 0x557b2bb84a1b <unknown>
<unknown>#
27# 240x 557b2d0a11720x 557b2bb8f5fe <unknown>
#25 0x557b2bb90321 <unknown>
#26 0x557b2bb84a1b <unknown>
#27 0x557b2d0a1172 <unknown>
#28 0x557b29135d86 <unknown>
#29 0x557b286747fd <unknown>
#30 0x557b2d10a8ce <unknown>
#31 0x557b2d10aec4 <unknown>
#32 0x557b286747fd <unknown>
#33 0x557b2862865b <unknown>
#34 0x557b286291dd <unknown>
#35 0x557b286294ab <unknown>
#36 0x557b2862ada9 <unknown>
#28 0x557b29135d86 <unknown>
#29 0x557b286747fd <unknown>
#30 0x557b2d10a8ce <unknown>
#31 0x557b2d10aec4 <unknown>
#32 0x557b286747fd <unknown>
#33 0x557b2862865b <unknown>
#34 0x557b286291dd <unknown>
#35 0x557b286294ab <unknown>
#36 0x557b2862ada9 <unknown>
#37 0x557b286413fa <unknown>
#38 0x557b28627495 <unknown>
#39 0x557b2bba6cd0 <unknown>
#37 0x557b286413fa <unknown>
#38 0x557b28627495 <unknown>
#39 0x557b2bba6cd0 <unknown>
#40 0x557b285d99a1 <unknown>
#41 0x557b285d9f3d <unknown>
#42 0x557b285d91d1 <unknown>
#43 0x557b281a2f9a <unknown>
#44 0x7f091e7ef040 <unknown>
#40 0x557b285d99a1 <unknown>
#45 0x557b281a2dfa <unknown>
  r8: 0000000000000000  r9: ffffffffffffffff r10: 0000000000000008 r11: 0000000000000202
 r12: 00007ffe2cd31320 r13: 0000557b276ad000 r14: 0000557b286747fc r15: 0000000000000040
  di: 0000000000000001  si: 0000000000000001  bp: 00007ffe2cd31690  bx: 000000000000004e
  dx: 0000000000000006  ax: 0000000000000006  cx: 00007f091e801d38  sp: 00007ffe2cd311d0
  ip: 00007f091e803286 efl: 0000000000010246 cgf: 0000000000000033 erf: 0000000000000000
 trp: 000000000000000d msk: 0000000000000008 cr2: 0000000000000000
[end of stack trace]
<unknown>
#41 0x557b285d9f3d <unknown>
#42 0x557b285d91d1 <unknown>
#43 0x557b281a2f9a ChromeMain
#44 0x7f091e7ef040 <unknown>
#45 0x557b281a2dfa _start
  r8: 0000000000000000  r9: ffffffffffffffff r10: 0000000000000008 r11: 0000000000000202
 r12: 00007ffe2cd31320 r13: 0000557b276ad000 r14: 0000557b286291dc r15: 00000000000000c0
  di: 0000000000000001  si: 0000000000000001  bp: 00007ffe2cd31690  bx: 000000000000004e
  dx: 0000000000000006  ax: 0000000000000006  cx: 00007f091e801d38  sp: 00007ffe2cd311d0
  ip: 00007f091e803286 efl: 0000000000010246 cgf: 0000000000000033 erf: 0000000000000000
 trp: 000000000000000d msk: 0000000000000008 cr2: 0000000000000000
[end of stack trace]


On Fri 2016-05-13 @ 09:46:49 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../fix_for_centos_5.8.patch                       | 18 --------
>  ...tive_2.23.bb => cross-localedef-native_2.24.bb} | 18 ++++----
>  ...glibc-initial_2.23.bb => glibc-initial_2.24.bb} |  0
>  .../{glibc-locale_2.23.bb => glibc-locale_2.24.bb} |  0
>  .../{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} |  0
>  ...glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} |  0
>  ...libc-Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
>  ...libc-Fix-buffer-overrun-with-a-relocated-.patch |  8 ++--
>  ...libc-Raise-the-size-of-arrays-containing-.patch | 34 ++++++---------
>  ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch | 10 +++--
>  ...500-e5500-e6500-603e-fsqrt-implementation.patch |  6 +--
>  ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  8 ++--
>  ...-Fix-undefined-reference-to-__sqrt_finite.patch |  6 +--
>  ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +--
>  ...bug-1443-which-explains-what-the-patch-do.patch |  8 ++--
>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch | 10 ++---
>  ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +--
>  ...ersion-output-matching-grok-gold-s-output.patch | 14 +++----
>  ...-configure.ac-handle-correctly-libc_cv_ro.patch |  6 +--
>  .../glibc/glibc/0014-Add-unused-attribute.patch    |  8 ++--
>  ...thin-the-path-sets-wrong-config-variables.patch | 10 ++---
>  ...-timezone-re-written-tzselect-as-posix-sh.patch | 16 ++++----
>  ...move-bash-dependency-for-nscd-init-script.patch |  8 ++--
>  ...c-Cross-building-and-testing-instructions.patch |  6 +--
>  ...019-eglibc-Help-bootstrap-cross-toolchain.patch |  8 ++--
>  .../glibc/0020-eglibc-cherry-picked-from.patch     | 18 ++++----
>  .../0021-eglibc-Clear-cache-lines-on-ppc8xx.patch  | 10 ++---
>  ...0022-eglibc-Resolve-__fpscr_values-on-SH4.patch |  8 ++--
>  .../glibc/0023-eglibc-Install-PIC-archives.patch   |  8 ++--
>  ...ard-port-cross-locale-generation-support.patch} | 30 +++++++-------
>  ...0025-Define-DUMMY_LOCALE_T-if-not-defined.patch | 32 +++++++++++++++
>  ...ing-SSE-make-sure-fpmath-is-not-set-to-us.patch | 48 ----------------------
>  .../glibc/{glibc_2.23.bb => glibc_2.24.bb}         | 12 +++---
>  33 files changed, 171 insertions(+), 217 deletions(-)
>  delete mode 100644 meta/recipes-core/glibc/cross-localedef-native/fix_for_centos_5.8.patch
>  rename meta/recipes-core/glibc/{cross-localedef-native_2.23.bb => cross-localedef-native_2.24.bb} (84%)
>  rename meta/recipes-core/glibc/{glibc-initial_2.23.bb => glibc-initial_2.24.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-locale_2.23.bb => glibc-locale_2.24.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} (100%)
>  rename meta/recipes-core/glibc/glibc/{0025-eglibc-Forward-port-cross-locale-generation-support.patch => 0024-eglibc-Forward-port-cross-locale-generation-support.patch} (97%)
>  create mode 100644 meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch
>  rename meta/recipes-core/glibc/{glibc_2.23.bb => glibc_2.24.bb} (93%)

