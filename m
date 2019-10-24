Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4B02B7F9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 23:05:20 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 21so223886pfj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=/4wWz+svbTaZn63EVZu+VV+HeoKgZpud3J1GQVuYVjg=;
	b=WKfvrt0TmHh4mzofzrHIe1XOpoqqIipS+ekc/Z6eNP6Y/zLA6TPW8g+ZTOphC/ljxV
	ka85QvQfC3w6raiB/QEHJq8UAmBTe/Sq6Wp5UMre8NVux3qie6iFx5+ohbXiEWLvrnxA
	paGxnRt8zAbGHrj/EiEsnOiCBkJAl+f0rzZfAdk+rFbVmHIPcBfEQKBorp/xzeSUtqHw
	kjWAh2F1Rg3C1++T9SqAh/HHoXb3/HJHTZa8Bn/ot0gbuv1QqY0o0vpJgZyf5UdjZQSp
	NP8LEq1okAQ9bZLlw61c0Lt32h2rPsmS7k5a0XGcEOMswlyzWIhsqj6goZ6CA3rDRM0D
	z5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=/4wWz+svbTaZn63EVZu+VV+HeoKgZpud3J1GQVuYVjg=;
	b=tuO65cFRhdfBX4sOLMWVqkFskii2Mc7RFD2bOSdXJoQHs0E9c1kctETtU9x00CzB6L
	y7JL+ZZVWZno104RirXjAor+6fLkjdRcU0gMuSPb411h5MsN85VPd1au5MZYcSwVx3Jl
	n1gYb3vzNoQl/ZiC7urClfoGommyLW8k9cM6qeqs3AJUcL7C+R2cNnDIRPLY4sUeAC/P
	1CgOfwmaiFmAbRzDKkkUCKckpCi/X180C0wWNmq8d/le7gQTwieHrjrNyJhuEQCKa67V
	TGCh3ZnDa1s5LT+n0pdOoPlx5mTCj3f6oTgmlnQpdncThOYx3zS7ocwzmeM5MDdkE0hh
	5NXg==
X-Gm-Message-State: APjAAAX2HW63cWEI+nRoX4NQyFOq6uQWQOIrmZ4PAfUCWBnhkgx5OCPh
	IBWw5GcJi9fzQDSE9nCgREU=
X-Google-Smtp-Source: APXvYqxF0KcmEGSE81zGrVz+HLmo0ZGuw9PGkDP1ODwQKrOw5mqVAPpxURFK9TsWYVRz5g3F1qRDfA==
X-Received: by 2002:a63:3003:: with SMTP id w3mr584791pgw.364.1571958320695;
	Thu, 24 Oct 2019 16:05:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id d17sm18119pfd.118.2019.10.24.16.05.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 16:05:20 -0700 (PDT)
Date: Thu, 24 Oct 2019 16:05:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20191024130641.GA30191@linux-uys3>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Thu, 24 Oct 2019 23:05:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 09:06:41AM -0400, Trevor Woerner wrote:
> This upgrade caused my build to fail :-(
> Is anyone else seeing this?
>=20
> 	22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat -W=
undef -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/build/t=
mp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native=
/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,/z/jenkin=
s-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/z/jenki=
ns-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,/z/jenkins-works=
pace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/=
0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,/z/jenkins-workspace=
/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.=
10-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-llist=
=2Eo  -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64=
-linux/libcap-ng-na
>  tive/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-workspace/nigh=
tly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0=
/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightly/cubietruck=
/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.li=
bs/libcap-ng.so
> 	22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-li=
nux/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x8=
6_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefin=
ed reference to `pthread_atfork'
> 	22:47:40 | collect2: error: ld returned 1 exit status

perhaps you need to add -pthread to LDFLAGS

> 	22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
> 	22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/cubi=
etruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/u=
tils'
> 	22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
> 	22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/cubi=
etruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'
> 	22:47:40 | make: *** [Makefile:377: all] Error 2
> 	22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-gl=
ibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.12127:=
1 exit 1 from 'exit 1'
> 	22:47:40 |
> 	22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Failed
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

