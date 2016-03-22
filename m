Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id C21EC607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 18:29:03 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id wz1so18265676obc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=R55Sa7GHhEQwQZr6euMmiy/z6lC9zYUfRAbZtzDgwC4=;
	b=OTivkwjNljs8Y9aWI6LG2fh/G9BBtCu3jZT0Ea8sedcToXOIn7UriUkCaMtXGfQ4sM
	FMz//nyveqUdBbpn/eF3ZEe1kNvDDceG4ua8AjjMuCxVfiKPSPcLq4t/3qiXz+yxtckp
	Wjv/tvSiGONltNKCGgQ9TmmuUkgvXRl2PjFqgzjgrFB1PF9jvyjHSN8F7yVP0vrAiGNn
	aEvWJ0vVCFZvNyF9n0gCvy0QOgglYf+gauE+mvTBNWRxeLbHGp128WnFOIiBuYSIIR6E
	JFHc9Bt3159z8YZJKXLFwwwvaccASKblryTT49kAa+il0kvk/osJUOSQm20G9alKkUNq
	mFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=R55Sa7GHhEQwQZr6euMmiy/z6lC9zYUfRAbZtzDgwC4=;
	b=QPvDy1sCha4jkV6ywHSaPC2ExBHIIrG/SrUxBTyaPx90YGOUGm7mJD3yXoIb229OdY
	FXodYGBV4sO2VR7ehYeCCMLfNGm3LEcEfGEVRHHOJjiztpQf9OdZ86PXKVMLNyn5VlM8
	kN+UaDdrnm+NEIwyR/C6YAK8ohzUalkVhLDvffp4O/Ca6vudT4NJphjtmMdVndVB/Yzw
	+q68C21Q0kMgXQEup0azFyXJHjGsHpfHAj2dt0DkgYtU4A+/lT8VR1eXobVoyvb3oATD
	VtJIbpSh8/XtZN7C3NsRDy0drilNyF9kWNlV9Jtih9iJ5GzEd/uNj+8MFAbZHu5mQOyq
	m3og==
X-Gm-Message-State: AD7BkJLXXg4kKBOnJ7inw1LEKg+HzvmDUm7LGXzRko/zDg/ocwKwOzqHYMP7tB4tBPRR8g53CPov+gLUKlAFmw==
MIME-Version: 1.0
X-Received: by 10.60.96.74 with SMTP id dq10mr9598801oeb.48.1458671344253;
	Tue, 22 Mar 2016 11:29:04 -0700 (PDT)
Received: by 10.157.8.248 with HTTP; Tue, 22 Mar 2016 11:29:04 -0700 (PDT)
In-Reply-To: <CADkTA4Mmbpf1=S7wgYoX3VJ_SaeH7-qBZ-26d2qF=uijhuCHqg@mail.gmail.com>
References: <cover.1456315808.git.zhe.he@windriver.com>
	<56E23C3E.2000101@windriver.com> <56F0AE86.3060105@windriver.com>
	<CADkTA4Mmbpf1=S7wgYoX3VJ_SaeH7-qBZ-26d2qF=uijhuCHqg@mail.gmail.com>
Date: Tue, 22 Mar 2016 14:29:04 -0400
Message-ID: <CADkTA4NS0JDQ98AK5XSsVk1+jdPa3jAo=GUnBJsCXWaT1aq5FQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/2] Yocto Bug #6945
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
X-List-Received-Date: Tue, 22 Mar 2016 18:29:06 -0000
Content-Type: multipart/alternative; boundary=089e01177a6d5182df052ea763f8

--089e01177a6d5182df052ea763f8
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 21, 2016 at 11:37 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Mar 21, 2016 at 10:31 PM, He Zhe <zhe.he@windriver.com> wrote:
>
>> Ping.
>>
>>
> This slipped through my filters. Sorry about that.
>
> We are too late for the 2.1 release at this point, but I'll review the
> changes again in the
> morning and send any comments that I may have.
>

I reviewed this version, and it looks fine to me.

Bruce


>
> Cheers,
>
> Bruce
>
>
>> Thanks,
>> Zhe
>>
>> On 03/11/2016 11:32 AM, He Zhe wrote:
>> > Any more comments?
>> >
>> > Thanks,
>> > Zhe
>> >
>> > On 02/24/2016 08:20 PM, zhe.he@windriver.com wrote:
>> >> From: He Zhe <zhe.he@windriver.com>
>> >>
>> >> v1 to v2:
>> >>  - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
>> >>  - Update related doc files
>> >>  - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
>> >>  - Link built vmlinuz to boot directory for reference
>> >>
>> >> v2 to v3:
>> >>  - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order
>> that users can still use the old variables.
>> >>  - Run oe_rummake in a loop for every types so that we can add
>> different configurations to them easily in the future.
>> >>  - Warn, intead of die, users if one of the types are over the size
>> limit.
>> >>  - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.
>> >>  - Remove the doc parts. They will be submitted yocto-docs later.
>> >>  - Change some grep usage to make it more clear.
>> >>  - Correct a typo.
>> >>
>> >> The following changes since commit
>> 23056103c949b498c23b47579e8dd57ce78e6ed9:
>> >>
>> >>   uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48
>> +0000)
>> >>
>> >> are available in the git repository at:
>> >>
>> >>   git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
>> >>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945
>> >>
>> >> for you to fetch changes up to
>> dc52a1efbb8248ea274a1cd0cca5734290b3025f:
>> >>
>> >>   kernel: Make symbol link to vmlinuz in boot directory (2016-02-24
>> 07:08:16 -0500)
>> >>
>> >> ----------------------------------------------------------------
>> >> He Zhe (2):
>> >>       kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one
>> time
>> >>       kernel: Make symbol link to vmlinuz in boot directory
>> >>
>> >>  meta/classes/kernel-fitimage.bbclass      |  20 ++++++++-------
>> >>  meta/classes/kernel-grub.bbclass          |  44
>> +++++++++++++++++++++-----------
>> >>  meta/classes/kernel-uimage.bbclass        |  22 ++++++++--------
>> >>  meta/classes/kernel.bbclass               | 187
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
>> >>  meta/conf/documentation.conf              |   3 ++-
>> >>  meta/recipes-kernel/linux/linux-dtb.inc   |  49
>> ++++++++++++++++++++++--------------
>> >>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>> >>  7 files changed, 218 insertions(+), 109 deletions(-)
>> >>
>> >> He Zhe (2):
>> >>   kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>> >>   kernel: Make symbol link to vmlinuz in boot directory
>> >>
>> >>  meta/classes/kernel-fitimage.bbclass      |  20 ++--
>> >>  meta/classes/kernel-grub.bbclass          |  44 ++++---
>> >>  meta/classes/kernel-uimage.bbclass        |  22 ++--
>> >>  meta/classes/kernel.bbclass               | 187
>> +++++++++++++++++++++---------
>> >>  meta/conf/documentation.conf              |   3 +-
>> >>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
>> >>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>> >>  7 files changed, 218 insertions(+), 109 deletions(-)
>> >>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e01177a6d5182df052ea763f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Mar 21, 2016 at 11:37 PM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Mon, Mar 21, 2016 at 10:31 PM, He Zhe <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Ping.<br>
<br></blockquote><div><br></div><div>This slipped through my filters. Sorry=
 about that.</div><div><br></div><div>We are too late for the 2.1 release a=
t this point, but I&#39;ll review the changes again in the</div><div>mornin=
g and send any comments that I may have.</div></div></div></div></blockquot=
e><div><br></div><div>I reviewed this version, and it looks fine to me.<br>=
<br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><=
div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div><div cl=
ass=3D"h5"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
Zhe<br>
<div><div><br>
On 03/11/2016 11:32 AM, He Zhe wrote:<br>
&gt; Any more comments?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Zhe<br>
&gt;<br>
&gt; On 02/24/2016 08:20 PM, <a href=3D"mailto:zhe.he@windriver.com" target=
=3D"_blank">zhe.he@windriver.com</a> wrote:<br>
&gt;&gt; From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; v1 to v2:<br>
&gt;&gt;=C2=A0 - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comme=
nts<br>
&gt;&gt;=C2=A0 - Update related doc files<br>
&gt;&gt;=C2=A0 - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES<b=
r>
&gt;&gt;=C2=A0 - Link built vmlinuz to boot directory for reference<br>
&gt;&gt;<br>
&gt;&gt; v2 to v3:<br>
&gt;&gt;=C2=A0 - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES=
 in order that users can still use the old variables.<br>
&gt;&gt;=C2=A0 - Run oe_rummake in a loop for every types so that we can ad=
d different configurations to them easily in the future.<br>
&gt;&gt;=C2=A0 - Warn, intead of die, users if one of the types are over th=
e size limit.<br>
&gt;&gt;=C2=A0 - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.<br>
&gt;&gt;=C2=A0 - Remove the doc parts. They will be submitted yocto-docs la=
ter.<br>
&gt;&gt;=C2=A0 - Change some grep usage to make it more clear.<br>
&gt;&gt;=C2=A0 - Correct a typo.<br>
&gt;&gt;<br>
&gt;&gt; The following changes since commit 23056103c949b498c23b47579e8dd57=
ce78e6ed9:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0uclibc: Do not use immediate expansion operator (2016-=
02-22 20:42:48 +0000)<br>
&gt;&gt;<br>
&gt;&gt; are available in the git repository at:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/poky-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky-contrib=
</a> zhe/yocto-bug-6945<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/p=
oky-contrib/commit/?h=3Dzhe/yocto-bug-6945" rel=3D"noreferrer" target=3D"_b=
lank">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dzh=
e/yocto-bug-6945</a><br>
&gt;&gt;<br>
&gt;&gt; for you to fetch changes up to dc52a1efbb8248ea274a1cd0cca5734290b=
3025f:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0kernel: Make symbol link to vmlinuz in boot directory =
(2016-02-24 07:08:16 -0500)<br>
&gt;&gt;<br>
&gt;&gt; ----------------------------------------------------------------<b=
r>
&gt;&gt; He Zhe (2):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel: Add KERNEL_IMAGETYPES to build m=
ulti types kernel at one time<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel: Make symbol link to vmlinuz in b=
oot directory<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 ++++++++-------<br>
&gt;&gt;=C2=A0 meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 44 +++++++++++++++++++++-----------<br>
&gt;&gt;=C2=A0 meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 22 ++++++++--------<br>
&gt;&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 187 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++------------------------=
---------------<br>
&gt;&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 ++-<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 =
49 ++++++++++++++++++++++--------------<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc |=C2=A0 =C2=A02 +-=
<br>
&gt;&gt;=C2=A0 7 files changed, 218 insertions(+), 109 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; He Zhe (2):<br>
&gt;&gt;=C2=A0 =C2=A0kernel: Add KERNEL_IMAGETYPES to build multi types ker=
nel at one time<br>
&gt;&gt;=C2=A0 =C2=A0kernel: Make symbol link to vmlinuz in boot directory<=
br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 ++--<br>
&gt;&gt;=C2=A0 meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 44 ++++---<br>
&gt;&gt;=C2=A0 meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 22 ++--<br>
&gt;&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 187 +++++++++++++++++++++---------<br>
&gt;&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 =
49 +++++---<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc |=C2=A0 =C2=A02 +-=
<br>
&gt;&gt;=C2=A0 7 files changed, 218 insertions(+), 109 deletions(-)<br>
&gt;&gt;<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div></div></div><span class=3D"HOEnZb"><font col=
or=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div>&quot;Thou =
shalt not follow the NULL pointer, for chaos and madness await thee at its =
end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature">&quot;Thou shalt not follow the NULL pointer, for chaos and madness=
 await thee at its end&quot;</div>
</div></div>

--089e01177a6d5182df052ea763f8--
