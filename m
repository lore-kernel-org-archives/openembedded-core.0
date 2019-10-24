Return-Path: <twoerner@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 04D137F9AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:06:43 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id t8so20175169qtc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=1A/9QDfo3RDaSN7bJSgJKip+pxw+xl+Gfv86qvzxxjY=;
	b=gosfodZGgdNn05R86f+sL+mgoSqf9HAU5GfNuyd4xNPvhE5SJFzKyypItHu4DMnm4l
	X/gXR2WZxxBYo0jIN66MR1DqbYa4QNAIurbvnuUhOmJqJb6LUQhG4X4KHN1YX+uBD+P0
	wlhKMISt9eBBBnlOGGFDx+gEaGnADg0IU3fIzrWcLhFBQAZBvmRbbB5tVl9yGUr5cIFT
	7dGYFPDxhEvMGLailJbXGMkpAw0mt2Xh6+OH0eZtbgvp3qGfp6IbyMpgNqxc9j/ldoOS
	dOW5QhqUFH91v8wWAT+ttkIE8evbRdCvAaKNEwoyqPWjmqFRwMk4MY9MsZBGBz0y8PzL
	4aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=1A/9QDfo3RDaSN7bJSgJKip+pxw+xl+Gfv86qvzxxjY=;
	b=VOCFdPcjZnQh1/Fup27MoV2NymB2UY3214ih6RRM/+6E7zWcfA19NBp6gZLQw9GOLZ
	cHf6FOn5x6TOAvUbjEtjTK3YJvkV1IqWNn8f3z+QM8tN1k0+z04qHSb4jBjBfe/MixO1
	Kv5Ue96TxV8ozsa96gCcsBZR2I4vno4+LAzjopb8F7PssqiYC9QFFlwzh6cEQmTDpW+2
	VVOAjHoCJJzq4uOzLkTg/9TK3tL8heQjL9lqmpHmYWco1GOtZfulAt50bYh0N3nrwaMs
	BUgHYhkD8M4v3FSG2AtEhGrp8QVxNtMwit30vCBGqzc7JLM/XeR2hpieEWJks6RgmUTF
	Zc3Q==
X-Gm-Message-State: APjAAAXgpdqvaCZGwtkRAhnxx+eil093XhYQzSJyITwDdduUP5Ayam/Z
	dIfAGlss9HRwQ7FxRK5zE84=
X-Google-Smtp-Source: APXvYqylu1eABDXgNawzIDKKS5wdeZU5fC23cTU3CndyOxEenT3LpOenwHz3Q3AcDdxFhTREVNrYwA==
X-Received: by 2002:ac8:4501:: with SMTP id q1mr1445448qtn.206.1571922404583; 
	Thu, 24 Oct 2019 06:06:44 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	n65sm13686859qkb.19.2019.10.24.06.06.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Oct 2019 06:06:43 -0700 (PDT)
Date: Thu, 24 Oct 2019 09:06:41 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20191024130641.GA30191@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
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
X-List-Received-Date: Thu, 24 Oct 2019 13:06:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This upgrade caused my build to fail :-(
Is anyone else seeing this?

	22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat -Wun=
def -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/build/tmp=
-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/u=
sr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,/z/jenkins-=
workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-na=
tive/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/z/jenkins=
-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-n=
ative/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,/z/jenkins-workspa=
ce/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.=
7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,/z/jenkins-workspace/n=
ightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10=
-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-llist.o=
  -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-lin=
ux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-wo=
rkspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-nati=
ve/0.7.10-r0/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightl=
y/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/b=
uild/src/.libs/libcap-ng.so
	22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-linu=
x/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_=
64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefined=
 reference to `pthread_atfork'
	22:47:40 | collect2: error: ld returned 1 exit status
	22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
	22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/cubiet=
ruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/uti=
ls'
	22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
	22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/cubiet=
ruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'
	22:47:40 | make: *** [Makefile:377: all] Error 2
	22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glib=
c/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.12127:1 =
exit 1 from 'exit 1'
	22:47:40 |
	22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Failed

