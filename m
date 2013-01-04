Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tqx5i-0004Ho-Eh
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 03:33:13 +0100
Received: by mail-vc0-f170.google.com with SMTP id fl11so16167499vcb.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 18:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MabUC4HI5P9ovi3ntXnUM/nBHJX34dg8xjnfd92XF78=;
	b=t0t8PYY6MZjX6L2JzTXYMWUOIAfeHwY9WhiPHNoJzHD2PF4OpAK5UlxoDq6QHMBboN
	9LWHocm570mxMoQI+xFJkUQ/CzkzZ/gIddAuo2/4c0oGLqky9Hs/bAEocjL3ZTVM9bdb
	Ljq1Vd8awZKYc34pI5ujDehgNww3hNXwSgzgS9iRW8yE6BPT/miCwoKxuh9FH1nKbT6x
	G3uwLA2bxYHAjCF4+g/GE4Z+APNMh+ySK737kIWLLM/JEi55nqBCKW/kAW9H65fVSwhF
	Zi3fCi1SbOoWY/m8hMwFjMOEQ6rfgn0zMYtribKGeU0NAxx9vBbf72wR/HPXQ+Aasxec
	OjnA==
MIME-Version: 1.0
Received: by 10.220.218.197 with SMTP id hr5mr74106351vcb.8.1357265877610;
	Thu, 03 Jan 2013 18:17:57 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Thu, 3 Jan 2013 18:17:57 -0800 (PST)
In-Reply-To: <50E601F9.7010705@linux.intel.com>
References: <1356662690-16034-1-git-send-email-cazfi74@gmail.com>
	<1356662690-16034-2-git-send-email-cazfi74@gmail.com>
	<50E601F9.7010705@linux.intel.com>
Date: Fri, 4 Jan 2013 04:17:57 +0200
Message-ID: <CAF6bG8f5d8GbkRtT2L8ZS4ZCJ0n6FUByyZAcJ=M5V-oH5HnxXQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: update to upstream version 50.1.1
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
X-List-Received-Date: Fri, 04 Jan 2013 02:33:26 -0000
Content-Type: text/plain; charset=UTF-8

On 4 January 2013 00:11, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/27/2012 06:44 PM, Marko Lindqvist wrote:
>>
>> This seems to fix HarfBuzz compile problems.
>>
> Just found a problem with this in my testing:
>
>> | configure:3983: error: No such directory
>> /home/sgw/yocto/builds/world/tmp/sysroots/x86_64-linux/usr/share/icu/50.1.1
>> supplied as the argument to --with-cross-build. Use an absolute path.
>
> Seems that icu lays down a /usr/share/icu/50.1 directory, not a ${PV}, so
> this needs a little work.

 Can you tell anything more about the situation where this came up? I
tried to reproduce, but icu-native build created, and icu build used
.../icu/50.1.1/... just right.

 Was that with already populated tree where just the icu update patch
had been applied? I'm guessing if icu-native and icu builds somehow
happened concurrently, and icu-native was not ready by the time icu
needed it. Then that 50.1 directory you saw could be leftover from
earlier version.


 - ML


