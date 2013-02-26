Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1UAG24-0007Wv-Vh
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:37:24 +0100
Received: by mail-vc0-f180.google.com with SMTP id fo13so2290090vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 00:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=OBUjI9aAxzaxzHJLpbVm6iUP/DD0OgaxcJoEHfx5KC4=;
	b=Qv19/k3uwmNE72OygVL2I2YedO/CT1sc6PQ5aSqWTpmAmTwgggn1wVnGr+b8Ko9/ZK
	v+TFIO02XkQZTsbF/5ZUSZHAZif3ax8UC3W9NKOQ2bwHTRMSJZlsKErvQp+WHCbbFq5N
	PQa3qTY+NMk2e/w+lSn7dWRzQYnt1INQ7nA0c3Z1FP8vL9pM3BqiHwI+e3uenZn6Fjlm
	mKoUSotz4jkD23JTWJAf9TloKn4vP9Q+5sJm10ofOJ5jYkzCKJ+u05PmM51mv33ZFSH0
	cwR5UcmcLOL4qIlI2RFBrkr7jcA+x8rK5T75eb4V0e7x+pL+lp3KU1L1DthUQrUEbAFF
	ovug==
MIME-Version: 1.0
X-Received: by 10.52.66.176 with SMTP id g16mr854767vdt.22.1361866842904; Tue,
	26 Feb 2013 00:20:42 -0800 (PST)
Received: by 10.59.10.137 with HTTP; Tue, 26 Feb 2013 00:20:42 -0800 (PST)
In-Reply-To: <512C69A6.6040707@linux.intel.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
	<5123B265.9050003@linux.intel.com>
	<CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
	<CAF6bG8c9BU06uGvuM0ENuyGL4yggQOct620yP18kbkrh_bxbLA@mail.gmail.com>
	<512BE70F.4050707@linux.intel.com>
	<CAF6bG8fPGOjUB_nvNML1SAckQngEOSijzDH43dtSSQ7FmCmquw@mail.gmail.com>
	<512C69A6.6040707@linux.intel.com>
Date: Tue, 26 Feb 2013 10:20:42 +0200
Message-ID: <CAF6bG8fYAidC-APPqiZMifXPcMQ3CXMfH4Whwr23FtvgRi3sHw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Tue, 26 Feb 2013 08:37:25 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 09:52, Saul Wold <sgw@linux.intel.com> wrote:
>
> There seems to be some issue lurking here with configure and libtool.
>
> Sau!

 libffi seems to include all the libtool m4-files, updated between
libffi-3.0.11 and libffi-3.0.12. These might be incompatible with
libtool files in your system, or does the build force them to be
replaced (libtoolize -f)?

 I've got around a bit similar problems (not in OE, but building in
general) by simply deleting m4/libtool.m4 m4/lt*.m4 from the project,
and letting libtoolize/autoreconf to place correct versions there
instead. Could you test that?


 - ML


