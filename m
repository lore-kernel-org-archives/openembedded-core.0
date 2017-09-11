Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6485C78410
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:09:32 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id w23so2398145vkw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jo8tF2kTtKkbhhv05nfzo1HW7ggCg+VxeeX66omyZZY=;
	b=WWRaItmnPBg/veq+r0p1+fBQPkSNizj65qm8omfAiprnnFd5dPOu/CP4YzYzmkEtzY
	7oQGSCUixmwowUdwnzi/cviFpikZEsedlbhGVP2jTZ9qdkd5ANMn79t98H/fW9/F1n2g
	qiAeU2pvvB/isDBkrnn9Eq0eFoau0xCtWqRMAlY6mdzC1qnKm4c6arSKJ3fbZnoEb49U
	piDdUeqUoddzZuKPIc1zBIG2bQscRl8fCyAvMXSHz70cZRyLNNCs2Ca007n4kCKENEQI
	UFCow3/KPMG1d5ZFvUtvgHH4icrl6wXkmbUlgIrzve6w7iy+5gxPgJNxYdQV94Vpn53f
	w7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jo8tF2kTtKkbhhv05nfzo1HW7ggCg+VxeeX66omyZZY=;
	b=rWWY096WnbUbJGtnGYqY9uUemULrnqeWFMasqhK+4ickX9RztLueJZFG8oU0ZO/Vls
	kbma8WsGXGjEzDdBdWdL4nYcyPvTEXSUeySmjGAu6dw5wZkTvpbEsBOfHfxoFLvmKpyT
	L0zVn+7aTYbdJ91ue/qSePbV5M1gZ+zzDpb6dtNr8XBiUxdr7NRPISlPPqbNzi3SR/bA
	udCposeYboKxDtmk2W3XuwwyfctIwKW04be+rUOU8pphGeC5V91EHk7b02gKGVx2ybM0
	JqEOYOvz+Wq/LQvM5i0rJTeMrZ47d1f6LtQOHdfbhpskdsQMy6MomQicZJuQmvRd//h1
	BryQ==
X-Gm-Message-State: AHPjjUhyLhXPDKfOw5M/ku3+dJQ2by67AFDsRh9Z0ssA/DrXMkGPmBzW
	NAP4Qu7iRTm0NSSmbPAtN7VJZIcvYQ==
X-Google-Smtp-Source: AOwi7QB6LUy5T8r/F91sBQjtl3lseoKk0VZgkiErFd3Dk5FWec9Hop7g0NMJ7HYsTkYZ1Fj0MP2/QafkWcVUaS0TT3w=
X-Received: by 10.31.157.71 with SMTP id g68mr9480354vke.130.1505167773406;
	Mon, 11 Sep 2017 15:09:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Mon, 11 Sep 2017 15:09:32 -0700 (PDT)
In-Reply-To: <CAJTo0LbQKuJhVBVTCh1ay2i95egZxbvfhLC=Cgh__OQRS01i+w@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
	<CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
	<CAJTo0Lb42b-PT3_u-1vS-apadje4+ZYpP=8jB4q9oc2jmzjgPw@mail.gmail.com>
	<CAP9ODKqN7nj2esxkVR08jYSaRj-SrybTqbOYManDvC566no_qQ@mail.gmail.com>
	<CAJTo0LbQKuJhVBVTCh1ay2i95egZxbvfhLC=Cgh__OQRS01i+w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Sep 2017 00:09:32 +0200
Message-ID: <CA+chaQcHzfovU588PVbky_AOrmXgUrgu0qe7U+Uhe8Azh_VUVw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 22:09:32 -0000
Content-Type: multipart/alternative; boundary="001a1141673c761aac0558f12e8d"

--001a1141673c761aac0558f12e8d
Content-Type: text/plain; charset="UTF-8"

> Changing arch on a package resets the incrementing PR?  Isn't that a bug?

Arch is part of the key in PR server database.

It's not a bug, because when you have MACHINE_ARCH recipe then it's normal
that different MACHINEs (with different bbappends in BSP layers) have
different EXTENDPRAUTO, without the arch in the key, the EXTENDPRAUTO would
be incremented in PR server database every time you change MACHINE
variable. It's not ideal but better than the alternative.

On Tue, Sep 12, 2017 at 12:03 AM, Burton, Ross <ross.burton@intel.com>
wrote:

> On 11 September 2017 at 23:01, Otavio Salvador <otavio.salvador@ossystems.
> com.br> wrote:
>
>> On Mon, Sep 11, 2017 at 6:59 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > On 11 September 2017 at 22:58, Otavio Salvador
>> > <otavio.salvador@ossystems.com.br> wrote:
>> >>
>> >> On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross <ross.burton@intel.com>
>> >> wrote:
>> >> > On 11 September 2017 at 22:33, California Sullivan
>> >> > <california.l.sullivan@intel.com> wrote:
>> >> >>
>> >> >> Bump initramfs-framework PR, as it was missed in the previous
>> >> >> initramfs-framework patch.
>> >> >
>> >> >
>> >> > There's no need to bump PR.  In the ideal world, the PR isn't
>> assigned
>> >> > at
>> >> > all.
>> >>
>> >> there is, the package moved across arches so adding the PR makes sure
>> >> it is upgraded.
>> >
>> >
>> > Surely the PR service handles this if you're running a feed.  If you're
>> not
>> > running a feed then this isn't a problem.
>>
>> It does not; it goes back to r0.
>
>
> Changing arch on a package resets the incrementing PR?  Isn't that a bug?
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1141673c761aac0558f12e8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">Changing arch o=
n a package resets the incrementing PR?=C2=A0 Isn&#39;t that a bug?</span><=
div><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"f=
ont-size:12.8px">Arch is part of the key in PR server database.</span></div=
><div><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D=
"font-size:12.8px">It&#39;s not a bug, because when you have MACHINE_ARCH r=
ecipe then it&#39;s normal that different MACHINEs (with different bbappend=
s in BSP layers) have different EXTENDPRAUTO, without the arch in the key, =
the EXTENDPRAUTO would be incremented in PR server database every time you =
change MACHINE variable. It&#39;s not ideal but better than the alternative=
.</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Tue, Sep 12, 2017 at 12:03 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><span class=3D"">On 11 September 2017 at 23:01, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.<wbr>com.br</a>&gt;</span> wrote:<br></sp=
an><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D""><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span>On Mon, Sep 11, 2017 at 6:59 PM, Burton=
, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.=
burton@intel.com</a>&gt; wrote:<br>
&gt; On 11 September 2017 at 22:58, Otavio Salvador<br>
&gt; &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bla=
nk">otavio.salvador@ossystems.com<wbr>.br</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br=
>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; On 11 September 2017 at 22:33, California Sullivan<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:california.l.sullivan@intel.com" target=
=3D"_blank">california.l.sullivan@intel.c<wbr>om</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Bump initramfs-framework PR, as it was missed in the prev=
ious<br>
&gt;&gt; &gt;&gt; initramfs-framework patch.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; There&#39;s no need to bump PR.=C2=A0 In the ideal world, the=
 PR isn&#39;t assigned<br>
&gt;&gt; &gt; at<br>
&gt;&gt; &gt; all.<br>
&gt;&gt;<br>
&gt;&gt; there is, the package moved across arches so adding the PR makes s=
ure<br>
&gt;&gt; it is upgraded.<br>
&gt;<br>
&gt;<br>
&gt; Surely the PR service handles this if you&#39;re running a feed.=C2=A0=
 If you&#39;re not<br>
&gt; running a feed then this isn&#39;t a problem.<br>
<br>
</span>It does not; it goes back to r0.</blockquote><div><br></div></span><=
div>Changing arch on a package resets the incrementing PR?=C2=A0 Isn&#39;t =
that a bug?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></=
div><div>Ross=C2=A0</div></font></span></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a1141673c761aac0558f12e8d--
