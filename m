Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkfXJ-0006lJ-IG
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 20:03:17 +0200
Received: by eaal1 with SMTP id l1so1504171eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 10:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=F9EK7jC9WWgv2/bzZy/XLkEwKFxYvAfWkxdAeOm8FP8=;
	b=kposDhJObN0o3Ry9CpH6FOgZBPbL4RixiHU0MGErhk8cpAQAoJQUHMbdzHX20CW464
	2Ls9nAAuMKda9f4mWT3ud03C9R5y/Y0JUacCZE5RpWnR07y1zwlxT5407eOJdn5+BWoO
	QnE8CXC0Aa31S9LxoZoNPLhTfVzKnoriF/9Y8ds6g/hs+5VMvVhuJfDIg/LW12q9Pi5h
	XxSmEtOja5GhCFpYKIpu4w2mDVsye3gd84Qq427MvWCZmGEnwWfimRbYeXfGgNjr9zh9
	6pLZ39gj+ZjYaJG0z4UjRbTvqnB0f6FDIwDBKFQ4sdoG5e/FMBKu55K3opbB31iUTTpS
	RbEg==
MIME-Version: 1.0
Received: by 10.14.185.137 with SMTP id u9mr896567eem.220.1340992341532; Fri,
	29 Jun 2012 10:52:21 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 10:52:21 -0700 (PDT)
In-Reply-To: <4FEDB4B3.7040802@windriver.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
	<CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
	<4FED4226.30700@linux.intel.com>
	<CAMKF1sojfidUA9mne_RfXz+tE8d3pRboHbGxJL-dLD5wkeKVRw@mail.gmail.com>
	<4FED47D7.7080107@linux.intel.com>
	<CAMKF1sqm=A5za70vND38jdyUdUUyB017+OuoCWwpwBX3w6WWqA@mail.gmail.com>
	<4FEDAA70.3070009@windriver.com> <4FEDAF4F.5070104@linux.intel.com>
	<4FEDB4B3.7040802@windriver.com>
Date: Fri, 29 Jun 2012 10:52:21 -0700
Message-ID: <CAMKF1srHwbxOQYNHcvdXinqdJ95ZKO4U7V8vg6+z2dd5Umdphg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] kernel: Add kernel-headers package for target module build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 18:03:17 -0000
Content-Type: multipart/alternative; boundary=bcaec517a74229e11e04c3a01c5e

--bcaec517a74229e11e04c3a01c5e
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:
> On 12-06-29 09:36 AM, Darren Hart wrote:
>>
>>
>> On 06/29/2012 06:15 AM, Bruce Ashfield wrote:
>>>
>>> On 12-06-29 03:22 AM, Khem Raj wrote:
>>>>
>>>> On Thu, Jun 28, 2012 at 11:14 PM, Darren Hart<dvhart@linux.intel.com>
  wrote:
>>>>>
>>>>>
>>>>> On 06/28/2012 11:04 PM, Khem Raj wrote:
>>>>>>
>>>>>> On Thu, Jun 28, 2012 at 10:50 PM, Darren Hart<dvhart@linux.intel.com>
  wrote:
>>>>>>>
>>>>>>> However, I don't have a strong opinion here, I'll happily call it
>>>>>>> kernel-devel if that is strongly preferred by some.
>>>>>>
>>>>>> in oe terminology it will be -dev
>>>>>
>>>>> THe other reason I didn't go that route is that we already have a
>>>>> kernel-dev (although I don't much like the way it is used):
>>>>>
>>>>>  From kernel.bbclass:
>>>>>
>>>>> PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev
\
>>>>>             kernel-misc kernel-headers"
>>>>> FILES = ""
>>>>> FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>>>>> FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
/boot/config*"
>>>>> FILES_kernel-vmlinux = "/boot/vmlinux*"
>>>>> # misc is a package to contain files we need in staging
>>>>> FILES_kernel-misc = "/kernel/include/config /kernel/scripts
>>>>> /kernel/drivers/crypto /kernel/drivers/media"
>>>>> FILES_kernel-headers = "/usr/src/kernel-headers"
>>>>>
>>>>> And looking at that it appears I broke kernel-misc by moving things to
>>>>> /usr/src (didn't notice that in my testing).
>>>>>
>>>>> How would you propose we redefine the above in order to use
"kernel-dev"
>>>>> for the new package?
>>>>
>>>> hmmm interesting so I guess, linux-dev being already taken, you might
>>>> call it linux-kernel-headers as you were doing. So we have
>>>> linux-libc-headers and linux-kernel-headers to differentiate between
>>>> raw and sanitized headers
>>>
>>> What would break if the new files were simply added to the existing
>>> kernel-dev
>>> package ? I'm already putting System.map and others on targets in
>>> different environments for dev/debug, so would adding enough to build
>>> kernel modules on the target be a big problem ?
>>
>>
>> I was considering this last night as well.
>>
>>> But I probably just don't understand *what* the existing -dev package
>>> is used for, and my comment makes no sense :)
>>
>> And I landed here as well.
>
> :)
>
>>
>> Should we attempt this approach and only break them apart if somebody
>> screams?
>
> In the absence of definitely proof that we are missing something, I'm
> ok with suggesting that we have a single -dev package.
>
>>
>>>
>>> Outside of that, I also like linux-kernel-headers as the package name.
>>
>> Would you prefer this even if we merge it with the existing kernel-dev?
>> I think my order of preference would be:
>>
>> 1) Merge with kernel-dev and leave the name as kernel-dev for
>>    consistency
>>
>> 2) New package called linux-kernel-headers
>
> Is there a 3rd option of a virtual package called linux-kernel-headers
> that maps to -dev ? I have no idea if that is even possible or desirable,
> but I thought I'd mention it.
>
> I like #1, since we really are talking about development vs just some
> headers lying around :)
>

I think packaging more into -dev is OK upgrade wise so let's use kernel-dev
and.put it in usr/src/kernel
> Cheers,
>
> Bruce
>
>>
>> --
>> Darren
>>
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>>
>>>>>
>>>>> --
>>>>> Darren Hart
>>>>> Intel Open Source Technology Center
>>>>> Yocto Project - Linux Kernel
>>>>>
>>>>>
>>>
>>
>
>

--bcaec517a74229e11e04c3a01c5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Bruce Ashfield &lt;<a href=3D"mailto:bruc=
e.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt; wrote:<br>&g=
t; On 12-06-29 09:36 AM, Darren Hart wrote:<br>&gt;&gt;<br>&gt;&gt;<br>&gt;=
&gt; On 06/29/2012 06:15 AM, Bruce Ashfield wrote:<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; On 12-06-29 03:22 AM, Khem Raj wrote:<br>&gt;&=
gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; On Thu, Jun 28, 2012 at 11:14 PM, Darren Ha=
rt&lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@linux.intel.com</a>&=
gt; =C2=A0 wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; On 06/=
28/2012 11:04 PM, Khem Raj wrote:<br>&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&g=
t;&gt;&gt;&gt; On Thu, Jun 28, 2012 at 10:50 PM, Darren Hart&lt;<a href=3D"=
mailto:dvhart@linux.intel.com">dvhart@linux.intel.com</a>&gt; =C2=A0 wrote:=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; However, I don=
&#39;t have a strong opinion here, I&#39;ll happily call it<br>&gt;&gt;&gt;=
&gt;&gt;&gt;&gt; kernel-devel if that is strongly preferred by some.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt;&gt; in oe terminology it w=
ill be -dev<br>&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; THe other reaso=
n I didn&#39;t go that route is that we already have a<br>&gt;&gt;&gt;&gt;&=
gt; kernel-dev (although I don&#39;t much like the way it is used):<br>
&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; =C2=A0From kernel.bbclass:<br>=
&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; PACKAGES =3D &quot;kernel kern=
el-base kernel-vmlinux kernel-image kernel-dev \<br>&gt;&gt;&gt;&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel-misc kernel-headers&quot;<=
br>
&gt;&gt;&gt;&gt;&gt; FILES =3D &quot;&quot;<br>&gt;&gt;&gt;&gt;&gt; FILES_k=
ernel-image =3D &quot;/boot/${KERNEL_IMAGETYPE}*&quot;<br>&gt;&gt;&gt;&gt;&=
gt; FILES_kernel-dev =3D &quot;/boot/System.map* /boot/Module.symvers* /boo=
t/config*&quot;<br>
&gt;&gt;&gt;&gt;&gt; FILES_kernel-vmlinux =3D &quot;/boot/vmlinux*&quot;<br=
>&gt;&gt;&gt;&gt;&gt; # misc is a package to contain files we need in stagi=
ng<br>&gt;&gt;&gt;&gt;&gt; FILES_kernel-misc =3D &quot;/kernel/include/conf=
ig /kernel/scripts<br>
&gt;&gt;&gt;&gt;&gt; /kernel/drivers/crypto /kernel/drivers/media&quot;<br>=
&gt;&gt;&gt;&gt;&gt; FILES_kernel-headers =3D &quot;/usr/src/kernel-headers=
&quot;<br>&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; And looking at that =
it appears I broke kernel-misc by moving things to<br>
&gt;&gt;&gt;&gt;&gt; /usr/src (didn&#39;t notice that in my testing).<br>&g=
t;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; How would you propose we redefin=
e the above in order to use &quot;kernel-dev&quot;<br>&gt;&gt;&gt;&gt;&gt; =
for the new package?<br>
&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; hmmm interesting so I guess, linux-dev=
 being already taken, you might<br>&gt;&gt;&gt;&gt; call it linux-kernel-he=
aders as you were doing. So we have<br>&gt;&gt;&gt;&gt; linux-libc-headers =
and linux-kernel-headers to differentiate between<br>
&gt;&gt;&gt;&gt; raw and sanitized headers<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; =
What would break if the new files were simply added to the existing<br>&gt;=
&gt;&gt; kernel-dev<br>&gt;&gt;&gt; package ? I&#39;m already putting Syste=
m.map and others on targets in<br>
&gt;&gt;&gt; different environments for dev/debug, so would adding enough t=
o build<br>&gt;&gt;&gt; kernel modules on the target be a big problem ?<br>=
&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; I was considering this last night as well.=
<br>
&gt;&gt;<br>&gt;&gt;&gt; But I probably just don&#39;t understand *what* th=
e existing -dev package<br>&gt;&gt;&gt; is used for, and my comment makes n=
o sense :)<br>&gt;&gt;<br>&gt;&gt; And I landed here as well.<br>&gt;<br>
&gt; :)<br>&gt;<br>&gt;&gt;<br>&gt;&gt; Should we attempt this approach and=
 only break them apart if somebody<br>&gt;&gt; screams?<br>&gt;<br>&gt; In =
the absence of definitely proof that we are missing something, I&#39;m<br>
&gt; ok with suggesting that we have a single -dev package.<br>&gt;<br>&gt;=
&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Outside of that, I also like linux-ker=
nel-headers as the package name.<br>&gt;&gt;<br>&gt;&gt; Would you prefer t=
his even if we merge it with the existing kernel-dev?<br>
&gt;&gt; I think my order of preference would be:<br>&gt;&gt;<br>&gt;&gt; 1=
) Merge with kernel-dev and leave the name as kernel-dev for<br>&gt;&gt; =
=C2=A0 =C2=A0consistency<br>&gt;&gt;<br>&gt;&gt; 2) New package called linu=
x-kernel-headers<br>
&gt;<br>&gt; Is there a 3rd option of a virtual package called linux-kernel=
-headers<br>&gt; that maps to -dev ? I have no idea if that is even possibl=
e or desirable,<br>&gt; but I thought I&#39;d mention it.<br>&gt;<br>&gt; I=
 like #1, since we really are talking about development vs just some<br>
&gt; headers lying around :)<br>&gt;<br><br>I think packaging more into -de=
v is OK upgrade wise so let&#39;s use kernel-dev and.put it in usr/src/kern=
el<br>&gt; Cheers,<br>&gt;<br>&gt; Bruce<br>&gt;<br>&gt;&gt;<br>&gt;&gt; --=
<br>
&gt;&gt; Darren<br>&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Cheers,<br>&gt;=
&gt;&gt;<br>&gt;&gt;&gt; Bruce<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;<br>&gt;&=
gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; --<br>&gt;&gt;&gt;&gt;&gt; Darren H=
art<br>
&gt;&gt;&gt;&gt;&gt; Intel Open Source Technology Center<br>&gt;&gt;&gt;&gt=
;&gt; Yocto Project - Linux Kernel<br>&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&=
gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;<br>&gt;<br>&gt;

--bcaec517a74229e11e04c3a01c5e--
