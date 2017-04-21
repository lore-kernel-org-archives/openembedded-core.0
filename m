Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 236D877B95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 13:48:51 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id g60so70002790qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yHSTnNxb6pa6uHbOny+2vs6Ql4sanaGQOZrLDziFoEA=;
	b=dFpsJpPjHPTKL/8xqOoHF2FbApJQxY6EUi856mlZP+Cp3PxOt+rq2PtHJIrUMkZdKE
	EGhcgUWPhJVUQ/i9EcmCi/3Gqk6OGlit6cv3JvbY63wtrq34AfUnIOmOyNKJyxNORcrW
	fbHX3RxcHWLiQF3sYWQl7z+sr/B1QxJJEejMV49ukF95GGn1T3IoPEMtxzpuWbUXJk92
	zTQC76njZyBLutB3K9v6oIwJwkwwHqyxvXtpA97Rrg6yCHY7YQX3+c9dLbZTXZpXcuZC
	zqltx/voWit4cq/OwMGWmngia22v01hPzUlq4I8MIJ/O2wgMYa0eH3OFFMfzYTV8pp2T
	V3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yHSTnNxb6pa6uHbOny+2vs6Ql4sanaGQOZrLDziFoEA=;
	b=YIBb/uP+FR75EI+9o0Nh0r3R4QIWzbUerVbwxpjCUMbb/GyB1VE8jJyHfHPfeN/2j3
	HEqgX8/Z3DfkfM5wK4+6jTMO3HFcQ+9gc6J1RWEbOEEXhuPoCjMGdJXx+XY4R2it0GcS
	Te1t4ejZKFf5ZBe9za4YnLpJhqPFmJqHXtoeC81R27VORuxHkkhhSokgskNLAA6iWMQy
	Ytj1rroEn7KdyaZmXlWoAAELvF/zsarf0esCykYzrNpuJVL3J27vt0QNfIznYzAoQi3x
	nF1H/kDEUMaf3eumiTMjQ8UVd7PLedgMv5z9bO3LX2IBraPyNxnloxDQeWcN42jNd7lN
	cARQ==
X-Gm-Message-State: AN3rC/5vhlG7+vh6sd5iHaMwM10cxG2/PUIree0MtpuHnVzt2u9NAw1o
	oSQDpylZh/wauVTUlBXkBNkiX9Hu5A==
X-Received: by 10.237.35.162 with SMTP id j31mr13080251qtc.117.1492782532822; 
	Fri, 21 Apr 2017 06:48:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 21 Apr 2017 06:48:52 -0700 (PDT)
In-Reply-To: <20170421134441.GB3024@jama>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<CADkTA4Pi7SWq_PrYYJZiJa0CQUU-EN+ZVxPTPZV0Z8SvAYjcaA@mail.gmail.com>
	<64a94df4-970f-b80c-3e43-0f6d75c52ba4@linux.intel.com>
	<CADkTA4PzffD=HdOQ3KQe7NTjTx-=GwJfUNmC3G0ZDvY738TeAw@mail.gmail.com>
	<20170421134441.GB3024@jama>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2017 09:48:52 -0400
Message-ID: <CADkTA4OCCCALDFq5jBRMhasC313djAwHg96me+GJ+RPMZwGTyg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Fri, 21 Apr 2017 13:48:53 -0000
Content-Type: multipart/alternative; boundary=001a113e7f5498939f054dad8492

--001a113e7f5498939f054dad8492
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 21, 2017 at 9:44 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Apr 21, 2017 at 08:39:33AM -0400, Bruce Ashfield wrote:
> > On Fri, Apr 21, 2017 at 8:36 AM, Alexander Kanavin <
> > alexander.kanavin@linux.intel.com> wrote:
> >
> > > On 04/21/2017 03:26 PM, Bruce Ashfield wrote:
> > >
> > >     Anyone else seeing this as well?
> > >>
> > >>
> > >>
> > >> Richard saw this once last week, and we weren't able to reproduce it.
> > >> I've just updated
> > >> and am doing builds now.
> > >>
> > >> If anyone has info on their config, build steps, etc, I'm interested
> to
> > >> hear so I can figure
> > >> out what is going on.
> > >>
> > >
> > > I saw this once as well today. I nuked tmp/ and it was gone.
> > >
> >
> > Interesting. I'm updating my existing build (I only ever have one that I
> > constantly update and re-use), so maybe it'll show up in that existing
> tmp
> > dir.
> >
> > If there's a clean/rebuild cycle that was in play, let me know as well,
> > since I'll try that as well.
> >
> > I've been carrying a config like Richard was using since last week and
> > in all my builds it has never happened.
>
> I've seen it 4 times already in various builds executed today and
> yesterday. All of them were incremental.
>
> Last failure was a bit different and failed in do_patch already (maybe
> some race-condition between do_patch and do_validate_branches?
>

Could be. I've got my kernel builds running in a loop now. Maybe my builder
is
too slow to expose it .. but it can't hide from me forever.

I'll start looking into the code while I wait for my build to explode.

Cheers,

Bruce


>
> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_patch:
> Could not apply patches for qemux86.
> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_patch:
> Patch failures can be resolved in the linux source directory
> work-shared/qemux86/kernel-source)
> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_patch:
> Function failed: do_patch (log file is located at linux-yocto/1_4.10.9+
> gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.25077)
> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+
> gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.25077
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['meta/recipes-devtools/quilt/
> quilt-native_0.65.bb:do_populate_sysroot', 'meta/recipes-kernel/kern-
> tools/kern-tools-native_git.bb:do_populate_sysroot']
> | NOTE: Considering setscene task: ['icecc-create-env-native',
> 'do_populate_sysroot']
> |   considering dependency: ['quilt-native', 'do_populate_sysroot']
> | Adding dependency on icecc-create-env-native
> | NOTE: quilt-native exists in sysroot, skipping
> | NOTE: kern-tools-native exists in sysroot, skipping
> | NOTE: icecc-create-env-native exists in sysroot, skipping
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_patch
> | ERROR: Could not apply patches for qemux86.
> | ERROR: Patch failures can be resolved in the linux source directory
> work-shared/qemux86/kernel-source)
> |
> | [ERROR] Can't find patch dir at .kernel-meta/
> | usage: kgit s2q
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_patch (log file is located at
> linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_
> patch.25077)
> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0:
> task do_patch: Failed
> ERROR: Task (meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_patch)
> failed with exit code '1'
>
> >
> > Bruce
> >
> >
> > >
> > > Alex
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> > at its end"
>
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e7f5498939f054dad8492
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 21, 2017 at 9:44 AM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Fri, Apr 21, 2017 at 08:39:33AM -0400, Bruce Ashfield wrote:<br>
&gt; On Fri, Apr 21, 2017 at 8:36 AM, Alexander Kanavin &lt;<br>
&gt; <a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin=
@linux.intel.<wbr>com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On 04/21/2017 03:26 PM, Bruce Ashfield wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Anyone else seeing this as well?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Richard saw this once last week, and we weren&#39;t able to r=
eproduce it.<br>
&gt; &gt;&gt; I&#39;ve just updated<br>
&gt; &gt;&gt; and am doing builds now.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If anyone has info on their config, build steps, etc, I&#39;m=
 interested to<br>
&gt; &gt;&gt; hear so I can figure<br>
&gt; &gt;&gt; out what is going on.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; I saw this once as well today. I nuked tmp/ and it was gone.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Interesting. I&#39;m updating my existing build (I only ever have one =
that I<br>
&gt; constantly update and re-use), so maybe it&#39;ll show up in that exis=
ting tmp<br>
&gt; dir.<br>
&gt;<br>
&gt; If there&#39;s a clean/rebuild cycle that was in play, let me know as =
well,<br>
&gt; since I&#39;ll try that as well.<br>
&gt;<br>
&gt; I&#39;ve been carrying a config like Richard was using since last week=
 and<br>
&gt; in all my builds it has never happened.<br>
<br>
</span>I&#39;ve seen it 4 times already in various builds executed today an=
d<br>
yesterday. All of them were incremental.<br>
<br>
Last failure was a bit different and failed in do_patch already (maybe<br>
some race-condition between do_patch and do_validate_branches?<br></blockqu=
ote><div><br></div><div>Could be. I&#39;ve got my kernel builds running in =
a loop now. Maybe my builder is</div><div>too slow to expose it .. but it c=
an&#39;t hide from me forever.</div><div><br></div><div>I&#39;ll start look=
ing into the code while I wait for my build to explode.</div><div><br></div=
><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
ERROR: linux-yocto-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0 d=
o_patch: Could not apply patches for qemux86.<br>
ERROR: linux-yocto-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0 d=
o_patch: Patch failures can be resolved in the linux source directory work-=
shared/qemux86/kernel-<wbr>source)<br>
ERROR: linux-yocto-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0 d=
o_patch: Function failed: do_patch (log file is located at linux-yocto/1_4.=
10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0/temp/log.do_<wbr>patch.2=
5077)<br>
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+<wbr>gitAUTOINC+a=
d2e885015_<wbr>fe0fb8da3d-r0/temp/log.do_<wbr>patch.25077<br>
Log data follows:<br>
| DEBUG: Executing python function extend_recipe_sysroot<br>
| NOTE: Direct dependencies are [&#39;meta/recipes-devtools/quilt/<wbr>quil=
t-native_0.65.bb:do_<wbr>populate_sysroot&#39;, &#39;meta/recipes-kernel/ke=
rn-<wbr>tools/kern-tools-native_git.<wbr>bb:do_populate_sysroot&#39;]<br>
| NOTE: Considering setscene task: [&#39;icecc-create-env-native&#39;, &#39=
;do_populate_sysroot&#39;]<br>
|=C2=A0 =C2=A0considering dependency: [&#39;quilt-native&#39;, &#39;do_popu=
late_sysroot&#39;]<br>
| Adding dependency on icecc-create-env-native<br>
| NOTE: quilt-native exists in sysroot, skipping<br>
| NOTE: kern-tools-native exists in sysroot, skipping<br>
| NOTE: icecc-create-env-native exists in sysroot, skipping<br>
| DEBUG: Python function extend_recipe_sysroot finished<br>
| DEBUG: Executing shell function do_patch<br>
| ERROR: Could not apply patches for qemux86.<br>
| ERROR: Patch failures can be resolved in the linux source directory work-=
shared/qemux86/kernel-<wbr>source)<br>
|<br>
| [ERROR] Can&#39;t find patch dir at .kernel-meta/<br>
<span class=3D"">| usage: kgit s2q<br>
| WARNING: exit code 1 from a shell command.<br>
</span>| ERROR: Function failed: do_patch (log file is located at linux-yoc=
to/1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0/temp/log.do_<wbr>=
patch.25077)<br>
NOTE: recipe linux-yocto-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3=
d-r0: task do_patch: Failed<br>
ERROR: Task (meta/recipes-kernel/linux/<wbr>linux-yocto_4.10.bb:do_patch) f=
ailed with exit code &#39;1&#39;<br>
<span class=3D""><br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.<wbr>openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee<br>
&gt; at its end&quot;<br>
<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
<br>
--<br>
</span>Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"ma=
ilto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113e7f5498939f054dad8492--
