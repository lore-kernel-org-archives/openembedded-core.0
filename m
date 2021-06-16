Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.158.1623883507645366725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 15:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=feEFwAGD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id y7so4366480wrh.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 15:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xpIG5wTv9If64XlTQhzcC4UI+FEfdEbxyVVnD7i9iHY=;
        b=feEFwAGDXHBAJnLPd6kNiwa/8i4uycn0qA2mEK72vO6WadpkYhX0rhmXZnb1foG/9K
         AaHb6kjDEE6nK4dR+N/fOdcdGTgpMSHfuv5gu9tZqOWnk1vEC2x8qWySoNOOCkfLHN6u
         aPyL736bkKhH1bwWRLbUd2bEuuQ/luQtDw3cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xpIG5wTv9If64XlTQhzcC4UI+FEfdEbxyVVnD7i9iHY=;
        b=uMaJ36ZP79pAQqgKfkQYo6KgvUjFL4fsjhyoPKSFL+ArZ83N2IaeKVfZb9BZJWSQ9f
         27hNB/xKY78DjfftNqSAyDDnXsJk8Ovy8MTMgnWOL/+EUCsZx/ZKSEIQbUuC3KZIj0L3
         Hg7+FEzYMULttil2faU+q4TRS5TgGZMn99jzCXQK3VcvJwNFCgUQI7cX4L/5PP7eqDeU
         dAMNSe00904V8EoYqCb9Iun03xGFVtdZrb/WDDnmdt8mLa3/NTgprVDfC6OfZ8UXYaxh
         ruFFvaSbr6y78KIK73ySbmsE8cm55ATfUogNZscALSF06hMr1q7LXvzv+kbKb9no6DxS
         k2OQ==
X-Gm-Message-State: AOAM533XnGwls/YfbyLs1RGvPmAROrBCL2qDK4den/PCcQtv9+19TggW
	7ygM+EQ5zBRSZI5WIfzX5w9LjA==
X-Google-Smtp-Source: ABdhPJwmwD13ae+8za+y8idOWfS+t1qnsaCVF26Z1cuUReJ5Pdlhm1E+5JnAPRI5C3gnvwXK5MuwWg==
X-Received: by 2002:a5d:6d87:: with SMTP id l7mr1652890wrs.287.1623883506016;
        Wed, 16 Jun 2021 15:45:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3ef0:94f4:af84:585a? ([2001:8b0:aba:5f3c:3ef0:94f4:af84:585a])
        by smtp.gmail.com with ESMTPSA id n13sm3940080wrg.75.2021.06.16.15.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 15:45:05 -0700 (PDT)
Message-ID: <1c55d1aca45e746034b791b2f1712e8f335b502c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, Michael Halstead
	 <mhalstead@linuxfoundation.org>, Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jun 2021 23:45:02 +0100
In-Reply-To: <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-4-alex.kanavin@gmail.com>
	 <1685B658849E960A.4717@lists.openembedded.org>
	 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
	 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
	 <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
	 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
	 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
	 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-06-06 at 21:51 +0200, Alexander Kanavin wrote:
> On Sun, 6 Jun 2021 at 01:10, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > I tried again with the autobuilder, still fails:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3516
> > 
> > so whatever it is, it is still "live".
> > 
> 
> 
> I did some digging. The issue happens when:
> - host is centos8
> - SDKMACHINE is i686 (e.g. cmake is 32 bit)
> 
> Then there's a failing syscall attempting to set file times:
> utimensat_time64(AT_FDCWD, "../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
> [{tv_sec=1622966723, tv_nsec=6319439026193432576}, {tv_sec=1622966579, tv_nsec=17840053692309438464}], 0) = -1
> EINVAL (Invalid argument)
> 
> On latest Fedora, there's no issue:
> utimensat_time64(AT_FDCWD, "../install2/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
> [{tv_sec=1623002886, tv_nsec=6369724778172907520}, {tv_sec=1623002886, tv_nsec=17839174083007217664}], 0) = 0
> 
> utimensat_time64 only appeared with 5.1 kernels, however, 4.18 should be returning ENOSYS in that case
> probably?

I hacked up a quick test bit of code (which makes assumptions 
about 32 bit):

#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

struct timespec64 {
    long long 		tv_sec;			/* seconds */
    long long		tv_nsec;		/* nanoseconds */
};

int main() {
  int fd = open("foo", O_RDWR | O_CREAT, 0644);
  write(fd, "foo", 3);
  struct timespec64 times[2] = {};
  times[0].tv_sec = 1622966723;
  times[0].tv_nsec = 631943;
  times[1].tv_sec = 1622966579;
  times[1].tv_nsec = 178400;
  int rc = syscall(SYS_utimensat_time64, fd, NULL, &times[0], 0);
  printf("rc=%d\n", rc);
  close(fd);
  return rc;
}

built with "gcc -m32 test-syscall.c -o test" and run with "strace ./test".
This works on all the systems I tried it in. As does:


  times[0].tv_sec = 1;
  times[0].tv_nsec = 2;
  times[1].tv_sec = 3;
  times[1].tv_nsec = 4;

however if you set (and ignore the compiler warning):

  times[0].tv_sec = 1622966723;
  times[0].tv_nsec = 6319439026193432576;
  times[1].tv_sec = 1622966579;
  times[1].tv_nsec = 17840053692309438464;

then you see EINVAL on the centos system but not on my ubuntu one. It will
do that until you reduce the values of tv_nsec right now. So it seems most 
systems accept large tv_nsec values but the Centos one does not.

I think tv_nsec may be being clamped to LONG_MAX of 4 bytes but should be 
a LONG_LONG_MAX of 8 bytes on a 32 bit since the field is a 64 bit long.

Michael: Hopefully that gives you something to raise with them?

Cheers,

Richard





