Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 88F0260746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 20:44:42 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q62so9392610qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 13:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ouMlQylZArNDo5uZGGN+2ur/jngSriMJ6NkuvtbMDyg=;
	b=j5l+fU3+lY5lLSWSP47hy8esj0xkt8XRWw1swT4juyH+QWvdokWjeAUZAaSdZRnd/n
	CON6ftg69UJ8/DHTEOnfLCyEpp7LXd1gQOa/rnE6SWdaf5Z2aZJiyztCVt5Rij8EwxT7
	YOiV8Nq0jcRe5XRIc3l6YXBjshfKdfvCOoBvZ658qSsoxrhSTYmnmxNjUBeXyfMH1rvh
	z4AVUv2dGU53JUR0UDyp9Rk3TTXiTltqJi1JjkKQzhh/QsyCJ9UzDF2prXUlPTP/kMzh
	MXWNZArR77KLMTvL717KG6vqCa/VtDO8ohbZjNUt2kop9YYvhlQE2siUkjMFxSMeZfui
	+eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ouMlQylZArNDo5uZGGN+2ur/jngSriMJ6NkuvtbMDyg=;
	b=Oy4l5vlCqhLFZ0N+/UjTPHsQOKp7J92oqCfsi0kjApaSBprun9023DRVX66Z0gcM12
	EU3CsS71N4vH0rT/MH4hUcOE8jilaQS47C509xI45Q+Ih4rN2Zz/mK8weiNEU6GOWwHr
	YCN6Ext3xUyo3tAcV2RWXKMGtdYjVkxDscEfwgKNgqjVueCzK9v7St8kod5MCdHQYGfN
	jTtRrq5EvSm7qr4wql5bWnvGBKw8bIOH22VRPHJ4RQeSgHaahJtDwA5y7zLEZpxUCMHl
	Kr8KH79tm6Igal3gGdarXCU6KBDHjEkWoxlVvXknWcmkO1Z7tn8h+pqhROXD+baI4cON
	6Qdw==
X-Gm-Message-State: AEkoouv5OkpREK36rO41xsxk87VjcAjlJ9tsQadWz/lizXuLz2bVz66I9EpfSJ5oWQUliMmCjJ5U7tU0zuaEBw==
MIME-Version: 1.0
X-Received: by 10.55.178.195 with SMTP id b186mr6596542qkf.81.1469220282858;
	Fri, 22 Jul 2016 13:44:42 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 13:44:42 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 13:44:42 -0700 (PDT)
In-Reply-To: <CAMKF1spZ5qT2xfcyZtXKWYHk=6yiX0sQkWOpuOro_1ZAp_M=pQ@mail.gmail.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<e6dc6baf0f850853605319815acc19cb14de189c.1468935802.git.liezhi.yang@windriver.com>
	<CAJTo0LbWf5q40LQmEZQxPF0wLNVmoi=J7HXjtJNwCxgMU2WtOQ@mail.gmail.com>
	<5791DDA1.1070707@windriver.com>
	<CAJTo0LaXgox5AuqLkjJ6xiJoLpYX6SDAnVnP4pzf30W-SWeaxA@mail.gmail.com>
	<CAMKF1spZ5qT2xfcyZtXKWYHk=6yiX0sQkWOpuOro_1ZAp_M=pQ@mail.gmail.com>
Date: Fri, 22 Jul 2016 13:44:42 -0700
Message-ID: <CAMKF1soDrhTdO0hxNb3L_Op=QCG-QGpkiS5oz2_PxRL=CVxNFg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Fri, 22 Jul 2016 20:44:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c06ee040e81e605383f81f1

--94eb2c06ee040e81e605383f81f1
Content-Type: text/plain; charset=UTF-8

On Jul 22, 2016 12:52 PM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 22 July 2016 at 09:47, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Sorry, updated in the repo:
>>
>>   git://git.openembedded.org/openembedded-core-contrib rbt/pu
>
>
> And now I notice that its failing on musl:
>
> | (cd elfshared; i586-poky-linux-musl-gcc  -m32 -march=i586
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/sysroots/qemux86
-o libcom_err.so.2.1 \
> | -L../../../lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-Wl,-z,relro -Wl,-z,now -fPIC -shared \
> | -Wl,-soname,libcom_err.so.2 error_message.o et_name.o init_et.o
com_err.o com_right.o )
> | i586-poky-linux-musl-ar rc libcom_err.a error_message.o et_name.o
init_et.o com_err.o com_right.o
> | error_message.o: In function `init_debug':
> | /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/error_message.c:260:
undefined reference to `__stack_chk_fail_local'
> | com_err.o: In function `default_com_err_proc':
> | /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/com_err.c:63: undefined
reference to `__stack_chk_fail_local'
> | collect2: error: ld returned 1 exit status
>
> I guess the hardening needs to be glibc specific? (CC'ing Khem for an
opinion).

Musl work that have been done has been using hardening from day 1. So this
should be fixed. Musl images work fine with pie
>
> Ross

--94eb2c06ee040e81e605383f81f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Jul 22, 2016 12:52 PM, &quot;Burton, Ross&quot; &lt;<a hr=
ef=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt;<br>
&gt; On 22 July 2016 at 09:47, Robert Yang &lt;<a href=3D"mailto:liezhi.yan=
g@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Sorry, updated in the repo:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-c=
ore-contrib">git.openembedded.org/openembedded-core-contrib</a> rbt/pu<br>
&gt;<br>
&gt;<br>
&gt; And now I notice that its failing on musl:<br>
&gt;<br>
&gt; | (cd elfshared; i586-poky-linux-musl-gcc =C2=A0-m32 -march=3Di586 --s=
ysroot=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/=
build/tmp/sysroots/qemux86 -o libcom_err.so.2.1 \<br>
&gt; | -L../../../lib -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z=
,relro -Wl,-z,now -fPIC -shared \<br>
&gt; | -Wl,-soname,libcom_err.so.2 error_message.o et_name.o init_et.o com_=
err.o com_right.o )<br>
&gt; | i586-poky-linux-musl-ar rc libcom_err.a error_message.o et_name.o in=
it_et.o com_err.o com_right.o<br>
&gt; | error_message.o: In function `init_debug&#39;:<br>
&gt; | /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/error_message.c:260: u=
ndefined reference to `__stack_chk_fail_local&#39;<br>
&gt; | com_err.o: In function `default_com_err_proc&#39;:<br>
&gt; | /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/com_err.c:63: undefine=
d reference to `__stack_chk_fail_local&#39;<br>
&gt; | collect2: error: ld returned 1 exit status<br>
&gt;<br>
&gt; I guess the hardening needs to be glibc specific? (CC&#39;ing Khem for=
 an opinion).</p>
<p dir=3D"ltr">Musl work that have been done has been using hardening from =
day 1. So this should be fixed. Musl images work fine with pie<br>
&gt;<br>
&gt; Ross<br></p>

--94eb2c06ee040e81e605383f81f1--
