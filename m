Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T5imL-0003h6-Nm
	for Openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 21:45:49 +0200
Received: by eekb57 with SMTP id b57so968318eek.6
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2012 12:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UfQLTCVRnlqxUVQAGqc5OEV1QVPyPdvbqedrxIXj6wk=;
	b=pFh00PwmtmvlUfOyhVG8VFvppyWUhFzRW2mdugKkNHiShwRPya1WrMQGqiqXiuibHH
	+H27I0Ah6GR+0bejMniNYag71miHuRnF4gSLdL4wg3aqECO10+13UkpXzI59K4qkr5KC
	iE93fJN8iuBJZVUhKjQ79jfmLyXa7hkiqvwmcY4UqiaIEPCvH5CTT8bpJTXaJ4OcWv1g
	vKTL0Vo7TPaxdAOax33tvRj4XC8V3p9Ip2Q91HxZQmfa0Cz5jG9MkSrOI+84dexOmemF
	myrz91QfO42MHn0o68nIJ0rWvCLTilxZ4P1RXujtIlTiWNhv9iZ7A2pNjRIEHFjlT2pf
	wZOA==
Received: by 10.14.218.134 with SMTP id k6mr14866733eep.14.1346009619166; Sun,
	26 Aug 2012 12:33:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sun, 26 Aug 2012 12:33:08 -0700 (PDT)
In-Reply-To: <CAAeFaHY83=-vvqvrs8wNTkqAvoLVidp01ZHSzVXfAW=KX0n0iQ@mail.gmail.com>
References: <CAAeFaHY83=-vvqvrs8wNTkqAvoLVidp01ZHSzVXfAW=KX0n0iQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Aug 2012 12:33:08 -0700
Message-ID: <CAMKF1spv89aD9G4cZbtYTKhX-JX38g7cCRq-+wPVBg9rTA74Rw@mail.gmail.com>
To: Sriram Sundararajan <sriram.sundararajan@gmail.com>
Cc: oe-core <Openembedded-core@lists.openembedded.org>
Subject: Re: tar: This does not look like a tar archive; bzip2-native folder has empty binaries
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
X-List-Received-Date: Sun, 26 Aug 2012 19:45:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 26, 2012 at 11:33 AM, Sriram Sundararajan
<sriram.sundararajan@gmail.com> wrote:
> I was able to compile a 'core-image-minimal' on 08/23/12 without any issues.
> On 08/25 however, I came across the following issue for the same (bitbake
> core-image-minimal)
>
> ERROR: Function failed: Unpack failure for URL:
> 'http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2'. Unpack
> command
> PATH="/opt/oe/oe-core/scripts/native-intercept:/opt/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native:blah:blah"
> bzip2 -dc /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 | tar x
> --no-same-owner -f - failed with return value 2
> ERROR: Logfile of failure stored in:
> /opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3-r0.1/temp/log.do_unpack.3125
> Log data follows:
> | DEBUG: Executing python function do_unpack
> | DEBUG: Executing python function base_do_unpack
> | NOTE: Unpacking /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 to
> /opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3-r0.1/
> | tar: This does not look like a tar archive
> | tar: Exiting with failure status due to previous errors
> | DEBUG: Python function base_do_unpack finished
> | DEBUG: Python function do_unpack finished
>
> The bzip2-native binary files (including appropriate symlinks) were present
> under tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native, but were all
> empty! I was able to copy my /bin/bz* to
> /tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native and move on.  Don't
> know much about bzip2-native, but bitbake bzip2-native had no effect.  Both
> my installs were performed from scratch on identical ubuntu 12.04 installs.
> The oe-core sources were cloned from gibhub. One on 08/23 and another on
> 08/25. There was a checkin reference to bzip2-native for
> python-native_2.7.3.bb about a month back according to github.
>
> Can anyone shed any light on why bzip tools were not compiled or installed
> properly? What could've changed during these two days? I did a `find . |
> grep bzip2-native` and saw some references to a folder
> bzip2-native-1.0.6-r5. However, I could not find any references to
> bzip2-full-native_1.0.6.bb or bzip2-native_1.0.6.bb. Now I'm scratching my
> head and thinking where did this package come from in the first place? Any
> help appreciated!

what is your build host OS?

>
> Thanks
> Sriram
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


