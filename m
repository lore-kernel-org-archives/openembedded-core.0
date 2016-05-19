Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 663406057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 08:47:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w143so19000632wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 01:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=RvVbMWc68a2mDPCqNTxKd5z+4snrMle5tVGtbpgBNK8=;
	b=QJfID5W51+9Acx8M06uLtbe0Fk2Mw0MysoJ19/4LKWJrSKhAAWFTVs8YImgs4uCDI5
	xa5924nHiWBhP52CkaOXQXaxrUhy92wT3XkcQgm7D3Q0+weMxzjRtgdXVPwmxRGH5ZUI
	15VyC7ZSWjbfvmWCHFBy7V4da62cUhnp5tuKgnXQhH50oPBrJI6jyYHMPZ4EvcctmPoD
	Ct+Gb/rbkX3J8jm1YYUZ5dWxbfFaqn1fnXvRVWbsKjnOls0G6+78v4x9JkmSMpfeIB1q
	3Qg3hawNhbtzbgFwTAZgGyGJtAbkoXSMkmRPcKZxPVlPhgCLCGDSCbuszE/H4xIVMD+/
	tO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=RvVbMWc68a2mDPCqNTxKd5z+4snrMle5tVGtbpgBNK8=;
	b=gGVxsTtC9JCfYxMkjLU1MzzioZwZ1HD0yOIQiY2yR6D/xya7UnwLbYD1RMTz/RK4gh
	EEZdZ8WDfytcls5YWe1kjH0Bo9Tw2tqvVznw8aVDIyWaQHLtEOx7xsr8klOfnkTfxLGy
	4VMfuYdoL+EnPjO9P0QaGbWDPhbijcQYE1aPzStmrvWJdxqtrE4qxaAq+sQVUw1xxTK9
	3DJilvOovKnL/dImHF6gwC/+fxAiCYs1ZBeyqBT/biKtFqnAO9jMug78xMJtMhBHuGrB
	Rb/B5zFzbsioO6VdwUuGkigpyWBYHKbx0IuKq4gHenC7AU3nU6H4Kzrm6D0F/7ZvYTim
	Aoeg==
X-Gm-Message-State: AOPr4FWir2b2d896K+7HiEkuLdlN77wiiL1I7C/0wSS1jK7jKU/gihCsEGM/3TTeWTpbqt5ucsRKLnymDF3dBA==
MIME-Version: 1.0
X-Received: by 10.28.132.68 with SMTP id g65mr12540922wmd.91.1463647674437;
	Thu, 19 May 2016 01:47:54 -0700 (PDT)
Received: by 10.194.30.229 with HTTP; Thu, 19 May 2016 01:47:54 -0700 (PDT)
In-Reply-To: <573D260D.2020909@windriver.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com>
Date: Thu, 19 May 2016 10:47:54 +0200
Message-ID: <CA+chaQcuBXZ55wcAbzjCVEc1Xsq0UZ4obj=r5PsQt6bA57ZQAQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 08:47:56 -0000
Content-Type: multipart/alternative; boundary=001a114430a4b6205c05332e07f3

--001a114430a4b6205c05332e07f3
Content-Type: text/plain; charset=UTF-8

As the commit says, small change in package.bbclass also causes all
packages to be recreated with PR bump even when the content is most likely
the same.

Fixing bug in gcc may at least provide different binaries so it might be
useful to upgrade them on target (or at least distinguish if they were
already rebuilt with fixed gcc-cross or not).

Reverting the commit doesn't fix the issue that sstate handler cannot
compare if the change in signature produced "significantly different"
binaries. If it's reverted in oe-core I'll just revert the revert in our
builds, because we care about reproducible builds and we already gave up on
working upgrade paths, which are broken too often anyway.

Reflash of "system" partitions and storing user data/configuration
somewhere else is faster and safer since the sstate was invented (since we
stopped using OE classic). You can find some rant e-mails from me about
this e.g.
http://lists.openembedded.org/pipermail/openembedded-core/2011-November/051354.html
and the Yocto bug I gave you.

Regards,

On Thu, May 19, 2016 at 4:33 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
> Hi Martin,
>
> I found this patch in the bug:
>
>
> http://git.openembedded.org/openembedded-core/commit/meta/lib/oe/sstatesig.py?id=336a7897e39b9e42dcfcba9e2520ea96b0c6a8d6
>
> Too many PR bumps and rebuildings are caused by this patch. I'm
> not very sure about what this patch tries to fix, it seems that
> it is trying to fix problems when 32bit and 64bit uses the same
> sstate cache? Would you please provide a simple reproducer, please?
>
> Things will become much better after revert this patch. Be less
> stricter or more is a hard problem, if we still need the patch,
> can we leave such a choice to the end user? We can add some vars
> like DROP_NATIVE_SIG ? = "0/1". This would be good to the end user
> who uses stable release like jethro or krogoth to make their
> distributions, and PR Service really matters here. Even if they
> switch the build between 32 and 64 builds (This is unlikely to
> happen for production environment) and got problems, they still
> can fix the problem by rebuilding, this is still much better than
> current status: run a "smart/opkg/apt-get upgrade" on the target,
> *all* of the packages are downloaded and installed again after a
> CVE patch applies on native recipes like pseudo-native or rpm-native,
> but in fact, nothing is changed on the target this is really a bad
> experience.
>
> // Robert
>
>
> On 05/18/2016 06:15 PM, Martin Jansa wrote:
>
>> On Wed, May 18, 2016 at 05:31:09PM +0800, Robert Yang wrote:
>>
>>>
>>>
>>> On 05/18/2016 05:20 PM, Martin Jansa wrote:
>>>
>>>> On Wed, May 18, 2016 at 04:03:58PM +0800, Robert Yang wrote:
>>>>
>>>>> Hi Martin,
>>>>>
>>>>> On 05/18/2016 03:39 PM, Martin Jansa wrote:
>>>>>
>>>>>> See:
>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5970
>>>>>>
>>>>>> Just using recipe checksum wont work, because the main reason for PR
>>>>>> bumps is to
>>>>>> automatically upgrade the packages when one of the dependencies
>>>>>> changes .so
>>>>>> version, which you won't detect from recipe checksum of the app which
>>>>>> is just
>>>>>> using the library.
>>>>>>
>>>>>
>>>>> For the development branch like master, yes, that would happen. But for
>>>>> the stable release like jethro and krogoth, it is unlikely that would
>>>>> happen, and if if does, the user can manually bump the impacted
>>>>> recipe's
>>>>> PR to fix the problem. The current problem is that when *all* recipes'
>>>>> PR are bumped, there is no way to fix the problem.
>>>>>
>>>>
>>>> You can still stop using PR service and start doing manual PR bumps, but
>>>>
>>>
>>> We can't stop PR service and start doing manual PR bumps since we need
>>> keep
>>> update to date with upstream, the changes from upstream don't do the
>>> manual
>>> PR, and I don't think that we have to if they can be done automatically.
>>>
>>> it's quite annoying if you need to bump a lot of recipes you don't
>>>> control :).
>>>>
>>>
>>> What's your opinion about only consider RDEPENDS for PR service's
>>> checksum,
>>> please ?
>>>
>>
>> I would like to have separate handler as described in that bug, option
>> c).
>>
>> Not only because of unnecessary EXTENDPRAUTO bumps, but also unnecessary
>> rebuilds.
>>
>> On Wed, May 18, 2016 at 8:09 AM, Robert Yang <liezhi.yang@windriver.com
>>>>>> <mailto:liezhi.yang@windriver.com>> wrote:
>>>>>>
>>>>>>       The PRServer bumps PR according to do_package's task hash, that
>>>>>>       causes it bumps *all* packages' PR when recipes like
>>>>>> pseudo-native
>>>>>>       and rpm-native is changed. It is a very bad user experience
>>>>>> when we
>>>>>>       run "smart/opkg upgrade" on running target, for example, when
>>>>>> we apply
>>>>>>       a CVE patch to pseudo-native or rpm-native, or do some slight
>>>>>> changes
>>>>>>       in their do_compile, "smart/opkg upgrade" will download/install
>>>>>> *all*
>>>>>>       the packages since all of the packages' PR are bumped.
>>>>>>
>>>>>>       Here are some rough suggestions to fix this problem, and please
>>>>>> feel
>>>>>>       free to give your suggestions.
>>>>>>       1) Do not use do_package's task for bumping PR, the easiest way
>>>>>>           is simulate manually bump PR -- only bump PR when the recipe
>>>>>>           itself's checksum is changed.
>>>>>>
>>>>>>       2) Add a new task for PRServer, redefine its task hash for
>>>>>> bumping
>>>>>>           PR, for example, this task hash only considers RDEPENDS (no
>>>>>>           DEPENDS), and drop any native dependencies.
>>>>>>
>>>>>>       I prefer the first way, and an alternative way maybe add a var
>>>>>> so that
>>>>>>       the user can configure it:
>>>>>>       PR_CHECKSUM = "${BB_TASKHASH}" (current way)
>>>>>>       Or
>>>>>>       PR_CHECKSUM = "<recipe checksum>"
>>>>>>
>>>>>>       --
>>>>>>       Thanks
>>>>>>
>>>>>>       Robert
>>>>>>       --
>>>>>>       _______________________________________________
>>>>>>       Openembedded-core mailing list
>>>>>>       Openembedded-core@lists.openembedded.org
>>>>>>       <mailto:Openembedded-core@lists.openembedded.org>
>>>>>>
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>>>
>>>>>>
>>>>
>>

--001a114430a4b6205c05332e07f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As the commit says, small change in package.bbclass also c=
auses all packages to be recreated with PR bump even when the content is mo=
st likely the same.<div><br></div><div>Fixing bug in gcc may at least provi=
de different binaries so it might be useful to upgrade them on target (or a=
t least distinguish if they were already rebuilt with fixed gcc-cross or no=
t).</div><div><br></div><div>Reverting the commit doesn&#39;t fix the issue=
 that sstate handler cannot compare if the change in signature produced &qu=
ot;significantly different&quot; binaries. If it&#39;s reverted in oe-core =
I&#39;ll just revert the revert in our builds, because we care about reprod=
ucible builds and we already gave up on working upgrade paths, which are br=
oken too often anyway.</div><div><br></div><div>Reflash of &quot;system&quo=
t; partitions and storing user data/configuration somewhere else is faster =
and safer since the sstate was invented (since we stopped using OE classic)=
. You can find some rant e-mails from me about this e.g.</div><div><a href=
=3D"http://lists.openembedded.org/pipermail/openembedded-core/2011-November=
/051354.html">http://lists.openembedded.org/pipermail/openembedded-core/201=
1-November/051354.html</a><br></div><div>and the Yocto bug I gave you.</div=
><div><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Thu, May 19, 2016 at 4:33 AM, Robert Yang <span =
dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_bla=
nk">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
Hi Martin,<br>
<br>
I found this patch in the bug:<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core/commit/meta/lib/oe=
/sstatesig.py?id=3D336a7897e39b9e42dcfcba9e2520ea96b0c6a8d6" rel=3D"norefer=
rer" target=3D"_blank">http://git.openembedded.org/openembedded-core/commit=
/meta/lib/oe/sstatesig.py?id=3D336a7897e39b9e42dcfcba9e2520ea96b0c6a8d6</a>=
<br>
<br>
Too many PR bumps and rebuildings are caused by this patch. I&#39;m<br>
not very sure about what this patch tries to fix, it seems that<br>
it is trying to fix problems when 32bit and 64bit uses the same<br>
sstate cache? Would you please provide a simple reproducer, please?<br>
<br>
Things will become much better after revert this patch. Be less<br>
stricter or more is a hard problem, if we still need the patch,<br>
can we leave such a choice to the end user? We can add some vars<br>
like DROP_NATIVE_SIG ? =3D &quot;0/1&quot;. This would be good to the end u=
ser<br>
who uses stable release like jethro or krogoth to make their<br>
distributions, and PR Service really matters here. Even if they<br>
switch the build between 32 and 64 builds (This is unlikely to<br>
happen for production environment) and got problems, they still<br>
can fix the problem by rebuilding, this is still much better than<br>
current status: run a &quot;smart/opkg/apt-get upgrade&quot; on the target,=
<br>
*all* of the packages are downloaded and installed again after a<br>
CVE patch applies on native recipes like pseudo-native or rpm-native,<br>
but in fact, nothing is changed on the target this is really a bad<br>
experience.<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
// Robert</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 05/18/2016 06:15 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, May 18, 2016 at 05:31:09PM +0800, Robert Yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On 05/18/2016 05:20 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, May 18, 2016 at 04:03:58PM +0800, Robert Yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Martin,<br>
<br>
On 05/18/2016 03:39 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
See:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5970" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D5970</a><br>
<br>
Just using recipe checksum wont work, because the main reason for PR bumps =
is to<br>
automatically upgrade the packages when one of the dependencies changes .so=
<br>
version, which you won&#39;t detect from recipe checksum of the app which i=
s just<br>
using the library.<br>
</blockquote>
<br>
For the development branch like master, yes, that would happen. But for<br>
the stable release like jethro and krogoth, it is unlikely that would<br>
happen, and if if does, the user can manually bump the impacted recipe&#39;=
s<br>
PR to fix the problem. The current problem is that when *all* recipes&#39;<=
br>
PR are bumped, there is no way to fix the problem.<br>
</blockquote>
<br>
You can still stop using PR service and start doing manual PR bumps, but<br=
>
</blockquote>
<br>
We can&#39;t stop PR service and start doing manual PR bumps since we need =
keep<br>
update to date with upstream, the changes from upstream don&#39;t do the ma=
nual<br>
PR, and I don&#39;t think that we have to if they can be done automatically=
.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
it&#39;s quite annoying if you need to bump a lot of recipes you don&#39;t<=
br>
control :).<br>
</blockquote>
<br>
What&#39;s your opinion about only consider RDEPENDS for PR service&#39;s c=
hecksum,<br>
please ?<br>
</blockquote>
<br>
I would like to have separate handler as described in that bug, option<br>
c).<br>
<br>
Not only because of unnecessary EXTENDPRAUTO bumps, but also unnecessary re=
builds.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
On Wed, May 18, 2016 at 8:09 AM, Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br>
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 The PRServer bumps PR according to do_package&#39;s ta=
sk hash, that<br>
=C2=A0 =C2=A0 =C2=A0 causes it bumps *all* packages&#39; PR when recipes li=
ke pseudo-native<br>
=C2=A0 =C2=A0 =C2=A0 and rpm-native is changed. It is a very bad user exper=
ience when we<br>
=C2=A0 =C2=A0 =C2=A0 run &quot;smart/opkg upgrade&quot; on running target, =
for example, when we apply<br>
=C2=A0 =C2=A0 =C2=A0 a CVE patch to pseudo-native or rpm-native, or do some=
 slight changes<br>
=C2=A0 =C2=A0 =C2=A0 in their do_compile, &quot;smart/opkg upgrade&quot; wi=
ll download/install *all*<br>
=C2=A0 =C2=A0 =C2=A0 the packages since all of the packages&#39; PR are bum=
ped.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 Here are some rough suggestions to fix this problem, a=
nd please feel<br>
=C2=A0 =C2=A0 =C2=A0 free to give your suggestions.<br>
=C2=A0 =C2=A0 =C2=A0 1) Do not use do_package&#39;s task for bumping PR, th=
e easiest way<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is simulate manually bump PR -- only bum=
p PR when the recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 itself&#39;s checksum is changed.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 2) Add a new task for PRServer, redefine its task hash=
 for bumping<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PR, for example, this task hash only con=
siders RDEPENDS (no<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPENDS), and drop any native dependenci=
es.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 I prefer the first way, and an alternative way maybe a=
dd a var so that<br>
=C2=A0 =C2=A0 =C2=A0 the user can configure it:<br>
=C2=A0 =C2=A0 =C2=A0 PR_CHECKSUM =3D &quot;${BB_TASKHASH}&quot; (current wa=
y)<br>
=C2=A0 =C2=A0 =C2=A0 Or<br>
=C2=A0 =C2=A0 =C2=A0 PR_CHECKSUM =3D &quot;&lt;recipe checksum&gt;&quot;<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 Thanks<br>
<br>
=C2=A0 =C2=A0 =C2=A0 Robert<br>
=C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 _______________________________________________<br>
=C2=A0 =C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded=
.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.o=
penembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org=
</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org/mailman/listinfo/openembedded-core</a><br>
<br>
<br>
</blockquote></blockquote>
<br>
</blockquote></blockquote>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--001a114430a4b6205c05332e07f3--
