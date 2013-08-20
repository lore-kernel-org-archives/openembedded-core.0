Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id F34B86B6AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:51:21 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id k15so166847qcv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LxpCsDx1wbt5k+27aSeZPCUc/4qRdFoBbAe0qQaSrgg=;
	b=Ht5qoo+Cm1EuzYe37njKyTma49+yUuXQFPTvaZvZ0zOAR7etGM5BAibDFoaSn0emc8
	lUF9rdf84XOZCAdt81Xl3THzbdH6mMMZw6HVAr+oKVMVVqoy+vdLhFa9OioujjK1A4Bz
	EaKIuE4Ap0kbHU9Cm8crNAoJm7cY96nNVNCjqJbEVZiVIDAtk+Ko35rC5df2YPPCnP4U
	T7N3bmCQvK10SI8QwK9LMGd8vQiEkQPLkZJ6SqIp3K4eD4TlPGBMadwiYP+5jqG/I+kI
	JKl1yRgA5xV8nFYrDqFx9T/khLagCnvRAJ7ArtDBd9qA7lvZigFxqJIcRVgAGEz+PfWn
	ZEiA==
MIME-Version: 1.0
X-Received: by 10.49.82.74 with SMTP id g10mr1585550qey.80.1377003081859; Tue,
	20 Aug 2013 05:51:21 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Tue, 20 Aug 2013 05:51:21 -0700 (PDT)
Date: Tue, 20 Aug 2013 15:51:21 +0300
Message-ID: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: qemu-native build regularly failing
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
X-List-Received-Date: Tue, 20 Aug 2013 12:51:22 -0000
Content-Type: text/plain; charset=UTF-8

Build of qemu-native regularly fails with:
|   LINK  sh4-softmmu/qemu-system-sh4
| /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
`_XEatDataWords'
| collect2: error: ld returned 1 exit status

This might be some dependency missing, as building first some packets
(+ more importantly their dependencies) that do not depend on qemu and
only then qemu dependant image success.


 - ML

