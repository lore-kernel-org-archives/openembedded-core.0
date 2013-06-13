Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id A17AE6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 23:09:03 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj3so27874pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rBdgNi1gU2LaxFYCtspNZll86hH1/iDvyL3xP2qN4H8=;
	b=gkY9A5uPoy7RB7nQDQA1k1RpSifi5L6RAfpsnt0syniyIL8Os1SQZ3sOfp762BYHaA
	DgwYblklfSEKhxb222DXCGxyJXIVCRRJAnpFc9ZteVTE4Zu5KEM3QMeTiFCNImTJOAoH
	SObDzld3Rj2WG9u1YrnL5N3+b3AWaehoseAtPOac+72amzolain264JNE6CTOXuiYy5r
	9snQWeUZxAYH1N205ovJVFnD3+iwhUQZ8AJuoYRcH72hnCuHiq130rS/lU2fBY8FZnk4
	tidxAjoGIb0dV9zirK75tFQP0wCYOZDkinScgGY9q8BQr7SWAbMuhmzPUdRJU/9t2dsj
	o9Lw==
X-Received: by 10.68.0.66 with SMTP id 2mr193002pbc.15.1371164944189;
	Thu, 13 Jun 2013 16:09:04 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	qi1sm31040020pac.21.2013.06.13.16.09.01 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 16:09:02 -0700 (PDT)
Message-ID: <51BA4FE8.3080903@gmail.com>
Date: Fri, 14 Jun 2013 09:04:08 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1371000065-23866-1-git-send-email-net147@gmail.com>
	<51BA371D.8030609@linux.intel.com> <20130613213834.GA14021@jama>
In-Reply-To: <20130613213834.GA14021@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Qt fixes
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
X-List-Received-Date: Thu, 13 Jun 2013 23:09:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 14/06/2013 7:38 AM, Martin Jansa wrote:
> On Thu, Jun 13, 2013 at 02:18:21PM -0700, Saul Wold wrote:
>> On 06/11/2013 06:21 PM, Jonathan Liu wrote:
>>> A couple of Qt fixes. These have been tested by Paul Eggleton.
>>> I have fixed some typos in the commit message for Felipe's patch and
>>> dropped the note regarding the build system going crazy as requested by
>>> Paul.
>>>
>>> Felipe F. Tonello (1):
>>>     qt: update qmake2 class to export qconfig.pri mkspec
>>>
>>> Jonathan Liu (1):
>>>     classes/qmake_base: allow parallel make
>>>
>>>    meta/classes/qmake2.bbclass     | 1 +
>>>    meta/classes/qmake_base.bbclass | 2 +-
>>>    2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>> Jonathan,
>>
>> I think your patches may be causing this failure:
>>
>>> | mv -f libQtFeedbackE.so.1.2.0 libQtFeedbackE.so libQtFeedbackE.so.1 libQtFeedbackE.so.1.2 ../../lib/
>>> | { test -z "../../lib/" || cd "../../lib/"; } && test $(gdb --version | sed -e 's,[^0-9]\+\([0-9]\)\.\([0-9]\).*,\1\2,;q') -gt 72 && gdb --nx --batch --quiet -ex 'set confirm off' -ex "save gdb-index ." -ex quit 'libQtFeedbackE.so.1.2.0' && test -f libQtFeedbackE.so.1.2.0.gdb-index && objcopy --add-section '.gdb_index=libQtFeedbackE.so.1.2.0.gdb-index' --set-section-flags '.gdb_index=readonly' 'libQtFeedbackE.so.1.2.0' 'libQtFeedbackE.so.1.2.0' && rm -f libQtFeedbackE.so.1.2.0.gdb-index || true
>>> | /bin/sh: gdb: command not found
>>> | /bin/sh: line 0: test: -gt: unary operator expected
>> See the world build log:
>> http://autobuilder.yoctoproject.org:8011/builders/nightly-world/builds/169/steps/Building%20Images/logs/stdio
>>
>> I did not catch this as I have gdb installed locally, but this does not
>> seem very cross-compile friendly and we have not seen it before.
> Is qt4 now trying to use gdb_dwarf_index? see
> https://github.com/meta-qt5/meta-qt5/commit/1a272bc79d0e9aba9385d00b0aa1acf116552ad5
>
It seems qt4 has gdb_dwarf_index enabled in the CONFIG. In the target 
sysroot, /usr/share/qt4/mkspecs/linux-oe-g++/qmake.conf contains:
CONFIG          += qt warn_on release incremental link_prl gdb_dwarf_index

Regards,
Jonathan

