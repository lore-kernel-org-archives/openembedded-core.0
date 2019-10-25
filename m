Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1795E7FA2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:19:11 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q21so318584pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Fk4bf/5i4MLAag9Sd63slohzq6McAl3cCot8mxPZXH4=;
	b=JCoJf2exnJ/2fIBZ/U1v5bz1S/1K1yAj/qsHMNJCeOyyVtsooc9RQzN63Pcz07OOQz
	KRSaIx/zyXSZwEvzgvG54QWRqDVOlVLqoWcEu4CtsKRJN3mbpYojUX8N4bO/5epz5zcF
	A6Jgl1nqc8AzSA1Dw7UNdnRXllr3o2ONcOheU5C2i6/ZdQyuR0yQDjxwVNKWVzoPcs1k
	oV+IVixdXkJ8TMWNKP/BEHluTImvkc8wQ4ax4fwm0mPe3PYUEXY0+f0hEjeM4k1jU7aB
	UDN5DnOfuditjy53C6yWPTej2w3wF0CbzP63OgN69Tl6Aa/EbkMzw5HG9BAVDIMaK2lR
	1HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=Fk4bf/5i4MLAag9Sd63slohzq6McAl3cCot8mxPZXH4=;
	b=uEopfAiWsfJNMlt7BsvZVNqXr6COrkvt6IPGXyd+EF0Uba5nUKwbHYCfQo00abgBuB
	2OJAIPaTBC3I9O4DiJbhWbHkAiOFEoscTDCflEHmbF0sbylzmt9pq/PjbY2f4qhvzZhK
	jKmNKb1WzRYwA13CvnS2+CG9YmHBEaI+0K5EO8vX6mmtXBddnOfn69fFYALtkimvdDPg
	Sujh+Ux0B27FYiz+a0+T4mumiPgj3z86040VCYk4tu1HeKHuaHVewPwo3JFo0l98F4hl
	CgVDyAq8y9F3GB3J/Y37KRxkRWintU7qeh3/TX0fHVoWcHqebaHa9JL7I3tD2F//hpzA
	9f1w==
X-Gm-Message-State: APjAAAVyDFVUMecGKM/I+5NlEYoWOOE75M5xLEkDN+B0YgbmTzXmdoP/
	nHPOcFxyclZnK31rq/JYj4ReFyE6
X-Google-Smtp-Source: APXvYqxRMr+f7v2KjILzYXGFRuL4NYNeX3J6qtq97kB2chsRRVhJ+G7rkrSetDz+4FhDcr3aYqOpsw==
X-Received: by 2002:a63:d65:: with SMTP id 37mr887312pgn.386.1571962752822;
	Thu, 24 Oct 2019 17:19:12 -0700 (PDT)
Received: from [10.47.245.159] ([156.39.10.47])
	by smtp.gmail.com with ESMTPSA id z9sm163524pgs.46.2019.10.24.17.19.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Oct 2019 17:19:12 -0700 (PDT)
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Trevor Woerner <twoerner@gmail.com>,
	Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<33468050-37e6-a0ef-b95d-039814a52343@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <62d969ba-cf7f-8651-6dd9-e7e71b489c6e@gmail.com>
Date: Thu, 24 Oct 2019 17:19:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <33468050-37e6-a0ef-b95d-039814a52343@windriver.com>
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
X-List-Received-Date: Fri, 25 Oct 2019 00:19:12 -0000
Content-Type: multipart/alternative;
	boundary="------------EDB4B103FA13F18DA590E8F4"
Content-Language: en-US

--------------EDB4B103FA13F18DA590E8F4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/24/19 6:37 AM, Trevor Gamblin wrote:
>
> On 10/24/19 9:06 AM, Trevor Woerner wrote:
>
>> This upgrade caused my build to fail :-(
>> Is anyone else seeing this?

Me too but only on my older ubunto 16.04.

we should bug this. If no one does by Friday night I will.

- armin
>> 	22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat=
 -Wundef -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/bu=
ild/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot=
-native/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,=
/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux=
/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link=
 -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-=
linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl=
,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linu=
x/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl=
,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linu=
x/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/n=
etcap netcap.o proc-llist.o  -L/z/jenkins-workspace/nightly/cubietruck/bu=
ild/tmp-glibc/work/x86_64-linux/libcap-ng-na
>>  tive/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-workspace/n=
ightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.=
10-r0/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightly/cub=
ietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/buil=
d/src/.libs/libcap-ng.so
>> 	22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse=
-linux/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/wo=
rk/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: =
undefined reference to `pthread_atfork'
>> 	22:47:40 | collect2: error: ld returned 1 exit status
>> 	22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
>> 	22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/c=
ubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/bu=
ild/utils'
>> 	22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
>> 	22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/c=
ubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/bu=
ild'
>> 	22:47:40 | make: *** [Makefile:377: all] Error 2
>> 	22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp=
-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.1=
2127:1 exit 1 from 'exit 1'
>> 	22:47:40 |
>> 	22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Fa=
iled
>
> I see it too, when trying to build binutils:
>
> |||| x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat
> -Wundef -D_GNU_SOURCE
> -isystem/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/l=
ibcap-ng-native/0.7.10-r0/re[6/1973]||
> ||root-native/usr/include -O2 -pipe -Wl,--enable-new-dtags
> -Wl,-rpath-link
> -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libca=
p-ng-native/0.7.10-r0/recipe-sysroot-native/us||
> ||r/lib -Wl,-rpath-link
> -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libca=
p-ng-native/0.7.10-r0/recipe-sysroot-native/lib
> -Wl,-rpath -Wl,/ala-lpggp21/tgamblin/yocto/build/||
> ||tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot=
-native/usr/lib
> -Wl,-rpath
> -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libca=
p-ng-native/0.7.10-r0/r||
> ||ecipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o
> proc-llist.o=C2=A0
> -L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-=
ng-native/0.7.10-r0/recipe-sysroot-native/usr/l||
> ||ib
> -L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-=
ng-native/0.7.10-r0/recipe-sysroot-native/lib
> -L../src /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux|=
|
> ||/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so||
> |||
> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
> undefined reference to `pthread_atfork'||
> ||| collect2: error: ld returned 1 exit status||
> ||| Makefile:483: recipe for target 'pscap' failed||
> ||| make[2]: *** [pscap] Error 1||
> ||| make[2]: *** Waiting for unfinished jobs....||
> |||
> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
> undefined reference to `pthread_atfork'||
> ||| collect2: error: ld returned 1 exit status||
> ||| Makefile:471: recipe for target 'captest' failed||
> ||| make[2]: *** [captest] Error 1||
> |||
> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
> undefined reference to `pthread_atfork'||
> ||| collect2: error: ld returned 1 exit status||
> |||
> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
> undefined reference to `pthread_atfork'||
> ||| collect2: error: ld returned 1 exit status||
> ||| Makefile:475: recipe for target 'filecap' failed||
> ||| make[2]: *** [filecap] Error 1||
> ||| Makefile:479: recipe for target 'netcap' failed||
> ||| make[2]: *** [netcap] Error 1||
> ||| make[2]: Leaving directory
> '/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-n=
g-native/0.7.10-r0/build/utils'||
> ||| Makefile:445: recipe for target 'all-recursive' failed||
> ||| make[1]: *** [all-recursive] Error 1||
> ||| make[1]: Leaving directory
> '/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-n=
g-native/0.7.10-r0/build'||
> ||| Makefile:377: recipe for target 'all' failed||
> ||| make: *** [all] Error 2|
>
>


--------------EDB4B103FA13F18DA590E8F4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/24/19 6:37 AM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:33468050-37e6-a0ef-b95d-039814a52343@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>On 10/24/19 9:06 AM, Trevor Woerner wrote:<br>
      </p>
      <blockquote type="cite"
        cite="mid:20191024130641.GA30191@linux-uys3">
        <pre class="moz-quote-pre" wrap="">This upgrade caused my build to fail :-(
Is anyone else seeing this?
</pre>
      </blockquote>
    </blockquote>
    <br>
    Me too but only on my older ubunto 16.04.<br>
    <br>
    we should bug this. If no one does by Friday night I will.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:33468050-37e6-a0ef-b95d-039814a52343@windriver.com">
      <blockquote type="cite"
        cite="mid:20191024130641.GA30191@linux-uys3">
        <pre class="moz-quote-pre" wrap="">
	22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat -Wundef -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-llist.o  -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-na
 tive/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so
	22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-linux/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefined reference to `pthread_atfork'
	22:47:40 | collect2: error: ld returned 1 exit status
	22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
	22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/utils'
	22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
	22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'
	22:47:40 | make: *** [Makefile:377: all] Error 2
	22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.12127:1 exit 1 from 'exit 1'
	22:47:40 |
	22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Failed
</pre>
      </blockquote>
      <p>I see it too, when trying to build binutils:</p>
      <p><code></code><code>| x86_64-linux-libtool: link: gcc -W -Wall
          -Wshadow -Wformat -Wundef -D_GNU_SOURCE
-isystem/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/re[6/1973]</code><code><br>
        </code><code>root-native/usr/include -O2 -pipe
          -Wl,--enable-new-dtags -Wl,-rpath-link
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/us</code><code><br>
        </code><code>r/lib -Wl,-rpath-link
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib
          -Wl,-rpath -Wl,/ala-lpggp21/tgamblin/yocto/build/</code><code><br>
        </code><code>tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib
          -Wl,-rpath
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/r</code><code><br>
        </code><code>ecipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap
          netcap.o proc-llist.o 
-L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/l</code><code><br>
        </code><code>ib
-L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib
          -L../src
          /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux</code><code><br>
        </code><code>/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so</code><code><br>
        </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
          undefined reference to `pthread_atfork'</code><code><br>
        </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
        </code><code>| Makefile:483: recipe for target 'pscap' failed</code><code><br>
        </code><code>| make[2]: *** [pscap] Error 1</code><code><br>
        </code><code>| make[2]: *** Waiting for unfinished jobs....</code><code><br>
        </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
          undefined reference to `pthread_atfork'</code><code><br>
        </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
        </code><code>| Makefile:471: recipe for target 'captest' failed</code><code><br>
        </code><code>| make[2]: *** [captest] Error 1</code><code><br>
        </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
          undefined reference to `pthread_atfork'</code><code><br>
        </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
        </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
          undefined reference to `pthread_atfork'</code><code><br>
        </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
        </code><code>| Makefile:475: recipe for target 'filecap' failed</code><code><br>
        </code><code>| make[2]: *** [filecap] Error 1</code><code><br>
        </code><code>| Makefile:479: recipe for target 'netcap' failed</code><code><br>
        </code><code>| make[2]: *** [netcap] Error 1</code><code><br>
        </code><code>| make[2]: Leaving directory
'/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/utils'</code><code><br>
        </code><code>| Makefile:445: recipe for target 'all-recursive'
          failed</code><code><br>
        </code><code>| make[1]: *** [all-recursive] Error 1</code><code><br>
        </code><code>| make[1]: Leaving directory
'/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'</code><code><br>
        </code><code>| Makefile:377: recipe for target 'all' failed</code><code><br>
        </code><code>| make: *** [all] Error 2</code><br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
    <br>
  </body>
</html>

--------------EDB4B103FA13F18DA590E8F4--
