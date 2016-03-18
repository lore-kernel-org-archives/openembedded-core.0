Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9ED6011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 22:47:10 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id y89so113492540qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=GR2l1ntyYtOc9bu9TiivT7THWy16yyuqHIDb6gfKNPE=;
	b=RIwebSVImlidEucpos24D/wE7zG1ze330rf2+zrZ9r4olmpFK6+9ifB8K7Q7zDZv3l
	901+3EGDx55E+G5OUuPI5ZHVR+WdfY718oqwBUPgSJu7oAgmpZyG8cadm8JKYu2Nfbq8
	Wp1B8STaPVCIQQ6sFiLr3uBB50qBvmlzFyCFaC5BLx8L3nERXBLLjv56sfI9s/DiN93x
	ROnwUK5FjgMbm5b9DEtQcUuDYd0ulajkIcasWeMNOPpzEevWzPSFlgxApEh0Xs3akDLZ
	ednFTy7UC2lqSuGpY+N59EINNBvZdpYTV0k7f5f42BzIJHpgEdQlVXmS9j12wHgTxW5V
	l/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=GR2l1ntyYtOc9bu9TiivT7THWy16yyuqHIDb6gfKNPE=;
	b=Yfa1QjcWaYUxTgZvWhZz9YAg0tyTrNKwig4AEhCsBSilAjsr7yYx9AXGHs58VZisE7
	QbPBJ36HimA2wjClNwUyf5nCuaOywJpcrlk7FvbLihxS3J3rDObtDwjZTy6t1suwpiDx
	gaZIeRbGp6YK14tTad8Waz86NlX35HwJqPK+manMS1gdslsdGvvfaBhWffkUKmINMc9A
	j2H3BfTOfW1cjz1t+BPBv62yCnM395daKN6ltNXtZUqwHyte9tkIRKbaVnFc6E+c/gMS
	ViFzGhR4yquHEnh0i2MboQPAB2W9q3wqIts//JW5IXfEuqqLvmPJVMU17WW6/Wnbv8QE
	cE5w==
X-Gm-Message-State: AD7BkJLcp9PsFvQ1pAtoqEuqTtdUgpGY/oG1Pasfg6gDVY7NT1ZOV8xyqqdU5trjjPKWjWN2lWQi36DtvQuuag==
MIME-Version: 1.0
X-Received: by 10.140.104.234 with SMTP id a97mr25623425qgf.57.1458341231212; 
	Fri, 18 Mar 2016 15:47:11 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Fri, 18 Mar 2016 15:47:10 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Fri, 18 Mar 2016 15:47:10 -0700 (PDT)
In-Reply-To: <CAJTo0Laq7Re6hAEmY=Dd1=UUr0+Zg9UCDO5STXoDJni+Md86+g@mail.gmail.com>
References: <1456753354-7448-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYcCQ9f0W6gQPtemxKjzCVo55M-pS+iWatV5YsfDrq41A@mail.gmail.com>
	<1BF009E9-B718-4FE2-BBF3-83CEA93D1ABB@gmail.com>
	<CAJTo0Laq7Re6hAEmY=Dd1=UUr0+Zg9UCDO5STXoDJni+Md86+g@mail.gmail.com>
Date: Fri, 18 Mar 2016 15:47:10 -0700
Message-ID: <CAMKF1soCxyOdWGEAxz_5FbR4pwirUGXmTCQtOdT062eD6NX2mg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Jacob Champion <jacob.champion@ni.com>
Subject: Re: [PATCH v1] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Fri, 18 Mar 2016 22:47:11 -0000
Content-Type: multipart/alternative; boundary=001a11352ee20c3ed8052e5a8744

--001a11352ee20c3ed8052e5a8744
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mar 18, 2016 4:38 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 18 March 2016 at 00:22, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> Which is interesting as building apr-native (so the site files don't
get used) for x86-64 gives:
>>>
>>> apr_cv_process_shared_works=3Dyes
>>>
>>> Can we not go around disabling stuff when it actually does work?
>>
>>
>> No it really doesnt work. its running a configure time test on your
build host ( which I assume is x86_64 mostly now
>> a days) and then deciding that process shared mutexes work, which is not
correct.
>>
>> If we think that it should work on x86_64 then lets cache the value to
=E2=80=98yes=E2=80=99 but not leave it
>> at the mercy of configure.
>
>
> That was my point: the patch was to add works=3Dno to x86-64 target build=
s,
but if I run the same test on x86-64 hardware directly then the result is
works=3Dyes.

Actually it depends on libc implementation of process shared mutexes. So
glibc for most arches should set it yes. Musl doesnt have it. So that
should be no mostly
>
> Ross

--001a11352ee20c3ed8052e5a8744
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Mar 18, 2016 4:38 AM, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ros=
s.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 18 March 2016 at 00:22, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Which is interesting as building apr-native (so the site files=
 don&#39;t get used) for x86-64 gives:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; apr_cv_process_shared_works=3Dyes<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can we not go around disabling stuff when it actually does wor=
k?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; No it really doesnt work. its running a configure time test on you=
r build host ( which I assume is x86_64 mostly now<br>
&gt;&gt; a days) and then deciding that process shared mutexes work, which =
is not correct.=C2=A0<br>
&gt;&gt;<br>
&gt;&gt; If we think that it should work on x86_64 then lets cache the valu=
e to =E2=80=98yes=E2=80=99 but not leave it<br>
&gt;&gt; at the mercy of configure.<br>
&gt;<br>
&gt;<br>
&gt; That was my point: the patch was to add works=3Dno to x86-64 target bu=
ilds, but if I run the same test on x86-64 hardware directly then the resul=
t is works=3Dyes.</p>
<p dir=3D"ltr">Actually it depends on libc implementation of process shared=
 mutexes. So glibc for most arches should set it yes. Musl doesnt have it. =
So that should be no mostly<br>
&gt;<br>
&gt; Ross</p>

--001a11352ee20c3ed8052e5a8744--
