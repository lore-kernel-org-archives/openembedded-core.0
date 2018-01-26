Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8E30771A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:03:07 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w50so1386232wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 11:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UAWXVys08e5HK+gf0eKn7Vdec88bPKmCExQFonzO+SA=;
	b=ub8mbTO/K+0E6A39llUJeJmRvzLzF32WJZnxltkMu0VkKrYMflBiebgWbxq54KXf0k
	etmngW7Q4HMi3RdOTbf/vpCEFWcBYMVXICwmey+tgmLCt0Sv1usz9e3iZzLifCYUHr9m
	YPdY9j9Sd9zs+REvtSGcrRB2n113Zic9JjPC7K+nM2KOHowU12ToGKQI4uRoyC4QIhII
	P2wWs0b/7CtlSbxWJ8WJdgn557GL8y+kpRDKLhn6qaNVHWw6eAAOMr8+ZlSBDmzhGcz/
	Za/pQ+bfXtnFP94ssq4DzvnSoDXVclPJT8wR+a80SU/gLjE8010cdeb028//OoDgOIQC
	euvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UAWXVys08e5HK+gf0eKn7Vdec88bPKmCExQFonzO+SA=;
	b=EdaMIc0EW9rEsyTEVelM/+dzUAm118KXtgS5gqq0f5JqKVUCZUGPvB1LWbM8x1/h2U
	6JpVRDtM0ZvV13lU337UA7Jv3mgRYWE5iNpgl8ZLvmAhiAjkg73nkui08Sm9qYHkr+Pr
	wJ3Sb4tI4UeT2e+5pP2Emv5Fm8Wwr0U0TimdCJotBmgOX9YEVpbD5YEnPK1gp2KEyIfe
	g44nG/NCQ9kX55ipVn7YSmBQCrL+Vm5eHVH73Gnd7ciXT/H9Ebmf6pVRXEgQkW2pGnAC
	bwOQIaRjr0FjnDSvpw4Fs4W+QYO+0TCqk7543ly27mx9kPCWh1RkjTqaDyHq1v+c4Ar3
	AA9A==
X-Gm-Message-State: AKwxytfjF3L3OYEc9Q2wvKqzK+oN6huKTPq3x60UZ+emMXzuzVLcKUeO
	06fikcrdkX8peUjFwwf7mn6Cpdvv7CoqM8RRfoE=
X-Google-Smtp-Source: AH8x227rz00TQJ/oR0sltXLfRpF/jjR7jAvFIoVF2dDhy2v312qvseI/lt5jMpCWePjLQPsBBaRvrOg6mG93ndfadBE=
X-Received: by 10.223.189.136 with SMTP id l8mr13047672wrh.58.1516993388668;
	Fri, 26 Jan 2018 11:03:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 26 Jan 2018 11:03:08 -0800 (PST)
In-Reply-To: <CA+chaQeLNdfn5piAtuXnpEsO=z=qz=Vh-=_P10xOgBw1fZPxpg@mail.gmail.com>
References: <1490031500-38242-1-git-send-email-denis@denix.org>
	<20170421231816.GC20419@denix.org>
	<0fa0e630-137b-73ba-f212-0049b92e5199@gmail.com>
	<20170516215021.GO28053@denix.org>
	<d5b89969-7833-d1a7-8685-71468968b93f@gmail.com>
	<CA+chaQeLNdfn5piAtuXnpEsO=z=qz=Vh-=_P10xOgBw1fZPxpg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 Jan 2018 20:03:08 +0100
Message-ID: <CA+chaQfpeXTf_DwBO-KZxhphHfHzPJdV-Y9VgVnigfPCyXdO7g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Fri, 26 Jan 2018 19:03:09 -0000
Content-Type: multipart/alternative; boundary="089e082b0df00eec640563b28c7c"

--089e082b0df00eec640563b28c7c
Content-Type: text/plain; charset="UTF-8"

I'm sorry to revive this old thread, but today I've noticed a bit
surprising (to me) aspect of this.

I've recently started using sshfs to temporary share sstate-cache between
various builders.

The files on the other builder are owned by different user and the
SSTATE_MIRROR should be used as read-only.

drwxrwxr-x 1 jenkins jenkins 52K Jan 26 18:29 sshfs-mount/sstate-cache/fd/
-rw-r--r-- 1 jenkins jenkins 38K Jan 26 18:09
sshfs-mount/sstate-cache/fd/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_qa.tgz.siginfo

touch under my user fails:
touch
sshfs-mount/sstate-cache/fd/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_qa.tgz.siginfo
touch: cannot touch
'sshfs-mount/sstate-cache/fd/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_qa.tgz.siginfo':
Permission denied

but test -w is successful:
test
-w sshfs-mount/sstate-cache/fd/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_qa.tgz.siginfo
&& echo writeable
writeable

and all setscene tasks are failing as shown e.g. in
log.do_package_qa_setscene.22663
DEBUG: Executing shell function sstate_unpack_package
touch: cannot touch
'sshfs-mount/sstate-cache/fd/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_qa.tgz.siginfo':
Permission denied
WARNING: exit code 1 from a shell command.
DEBUG: Python function do_package_qa_setscene finished

Anyone seeing similar issue?

The simple fix for this is to use "-o ro" when mounting with sshfs, but it
was a bit surprising to me that it didn't work OOTB.

Regards,


On Tue, Jun 13, 2017 at 8:21 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Unfortunately this nice change breaks quite common scenario when
> developers have read-only mount of sstate mirror and this touch causes all
> _setscene tasks to fail, because they fail to update atime on symlink which
> points to read-only mount.
>
> Please backport the fix for this as well ASAP:
> http://git.openembedded.org/openembedded-core/commit/meta/
> classes/sstate.bbclass?id=b8f26c011d5ed888d85fef040bd821400d54c8fe
>
> On Wed, May 17, 2017 at 1:05 AM, akuster808 <akuster808@gmail.com> wrote:
>
>>
>>
>> On 05/16/2017 02:50 PM, Denys Dmytriyenko wrote:
>>
>>> On Mon, Apr 24, 2017 at 09:08:55AM -0700, akuster808 wrote:
>>>
>>>> On 04/21/2017 04:18 PM, Denys Dmytriyenko wrote:
>>>>
>>>>> Ping. It's been over a month now...
>>>>>
>>>> its in my stagging since 4/1.  The AB has been failing with my
>>>> current changes.
>>>>
>>> Is morty now dead?
>>>
>>
>> No. why do you say that? I just sent a pull request over the weekend for
>> both Krogoth and Morty. Krogoth is the one heading to community supported
>> now that Pyro is out.
>>
>> this changes is in the pull request
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commi
>> t/meta/classes/sstate.bbclass?h=akuster/morty-next&id=838580
>> 431a8923bf38820f10963aca4af51f6f97
>>
>> - armin
>>
>>
>>
>>>
>>> On Mon, Mar 20, 2017 at 01:38:20PM -0400, Denys Dmytriyenko wrote:
>>>>>
>>>>>> From: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>>>>
>>>>>> .siginfo files are not being accessed from local or NFS-mounted
>>>>>> sstate mirrors when sstate package is installed, so their atime
>>>>>> is not updated. If sstate mirror is cleaned based on access time,
>>>>>> they get deleted, even though they are still being used.
>>>>>>
>>>>>> Updated atime of .siginfo symlinks with 'touch -a'. This command
>>>>>> dereferences symlinks pointing to the local mirror and updates
>>>>>> atime of the .siginfo file on the mirror.
>>>>>>
>>>>>> [YOCTO #10857]
>>>>>>
>>>>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>>>> ---
>>>>>>   meta/classes/sstate.bbclass | 2 ++
>>>>>>   1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>>>>>> index 8643f3d..4fdfcc8 100644
>>>>>> --- a/meta/classes/sstate.bbclass
>>>>>> +++ b/meta/classes/sstate.bbclass
>>>>>> @@ -724,6 +724,8 @@ python sstate_sign_package () {
>>>>>>   #
>>>>>>   sstate_unpack_package () {
>>>>>>         tar -xvzf ${SSTATE_PKG}
>>>>>> +       # update .siginfo atime on local/NFS mirror
>>>>>> +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>>>>>>         # Use "! -w ||" to return true for read only files
>>>>>>         [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
>>>>>>         [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] ||
>>>>>> touch --no-dereference ${SSTATE_PKG}.sig
>>>>>> --
>>>>>> 2.7.4
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--089e082b0df00eec640563b28c7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry to revive this old thread, but today I&#39;v=
e noticed a bit surprising (to me) aspect of this.<div><br></div><div>I&#39=
;ve recently started using sshfs to temporary share sstate-cache between va=
rious builders.</div><div><br></div><div>The files on the other builder are=
 owned by different user and the SSTATE_MIRROR should be used as read-only.=
</div><div><br></div><div>drwxrwxr-x 1 jenkins jenkins 52K Jan 26 18:29 ssh=
fs-mount/sstate-cache/fd/<br></div><div>-rw-r--r-- 1 jenkins jenkins 38K Ja=
n 26 18:09 sshfs-mount/sstate-cache/fd/sstate:foo:bar:1.0:r0:MACHINE:3:fd13=
a9949f4915ff611d5757cd18d8b4_package_qa.tgz.siginfo<br></div><div><br></div=
><div>touch under my user fails:</div><div>touch sshfs-mount/sstate-cache/f=
d/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_=
qa.tgz.siginfo<br></div><div>touch: cannot touch &#39;sshfs-mount/sstate-ca=
che/fd/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_pac=
kage_qa.tgz.siginfo&#39;: Permission denied</div><div><br></div><div>but te=
st -w is successful:</div><div>test -w=C2=A0sshfs-mount/sstate-cache/fd/sst=
ate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_qa.tg=
z.siginfo &amp;&amp; echo writeable<br></div><div>writeable</div><div><br><=
/div><div>and all setscene tasks are failing as shown e.g. in log.do_packag=
e_qa_setscene.22663</div><div><div>DEBUG: Executing shell function sstate_u=
npack_package</div><div>touch: cannot touch &#39;sshfs-mount/sstate-cache/f=
d/sstate:foo:bar:1.0:r0:MACHINE:3:fd13a9949f4915ff611d5757cd18d8b4_package_=
qa.tgz.siginfo&#39;: Permission denied</div><div>WARNING: exit code 1 from =
a shell command.</div><div>DEBUG: Python function do_package_qa_setscene fi=
nished</div></div><div><br></div><div>Anyone seeing similar issue?</div><di=
v><br></div><div>The simple fix for this is to use &quot;-o ro&quot; when m=
ounting with sshfs, but it was a bit surprising to me that it didn&#39;t wo=
rk OOTB.</div><div><br></div><div>Regards,</div><div><br></div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 13, 2017 at=
 8:21 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa=
@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Unfortunately this nice =
change breaks quite common scenario when developers have read-only mount of=
 sstate mirror and this touch causes all _setscene tasks to fail, because t=
hey fail to update atime on symlink which points to read-only mount.<div><b=
r></div><div>Please backport the fix for this as well ASAP:<br><div><a href=
=3D"http://git.openembedded.org/openembedded-core/commit/meta/classes/sstat=
e.bbclass?id=3Db8f26c011d5ed888d85fef040bd821400d54c8fe" target=3D"_blank">=
http://git.openembedded.org/<wbr>openembedded-core/commit/meta/<wbr>classes=
/sstate.bbclass?id=3D<wbr>b8f26c011d5ed888d85fef040bd821<wbr>400d54c8fe</a>=
<br></div></div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 17, 2017 at 1:05 A=
M, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br>
<br>
On 05/16/2017 02:50 PM, Denys Dmytriyenko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, Apr 24, 2017 at 09:08:55AM -0700, akuster808 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 04/21/2017 04:18 PM, Denys Dmytriyenko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Ping. It&#39;s been over a month now...<br>
</blockquote>
its in my stagging since 4/1.=C2=A0 The AB has been failing with my<br>
current changes.<br>
</blockquote>
Is morty now dead?<br>
</blockquote>
<br>
No. why do you say that? I just sent a pull request over the weekend for bo=
th Krogoth and Morty. Krogoth is the one heading to community supported now=
 that Pyro is out.<br>
<br>
this changes is in the pull request<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/me=
ta/classes/sstate.bbclass?h=3Dakuster/morty-next&amp;id=3D838580431a8923bf3=
8820f10963aca4af51f6f97" rel=3D"noreferrer" target=3D"_blank">http://git.yo=
ctoproject.org/cg<wbr>it/cgit.cgi/poky-contrib/commi<wbr>t/meta/classes/sst=
ate.bbclass?<wbr>h=3Dakuster/morty-next&amp;id=3D838580<wbr>431a8923bf38820=
f10963aca4af51f<wbr>6f97</a><br>
<br>
- armin<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Mon, Mar 20, 2017 at 01:38:20PM -0400, Denys Dmytriyenko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=
=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;<br>
<br>
.siginfo files are not being accessed from local or NFS-mounted<br>
sstate mirrors when sstate package is installed, so their atime<br>
is not updated. If sstate mirror is cleaned based on access time,<br>
they get deleted, even though they are still being used.<br>
<br>
Updated atime of .siginfo symlinks with &#39;touch -a&#39;. This command<br=
>
dereferences symlinks pointing to the local mirror and updates<br>
atime of the .siginfo file on the mirror.<br>
<br>
[YOCTO #10857]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
 target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/sstate.bbclass | 2 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 8643f3d..4fdfcc8 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -724,6 +724,8 @@ python sstate_sign_package () {<br>
=C2=A0 #<br>
=C2=A0 sstate_unpack_package () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tar -xvzf ${SSTATE_PKG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS mirror<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -h ${SSTATE_PKG}.siginfo ] &amp;&amp; touch -=
a ${SSTATE_PKG}.siginfo<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use &quot;! -w ||&quot; to return true for re=
ad only files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -w ${SSTATE_PKG} ] || touch --no-dereferenc=
e ${SSTATE_PKG}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_P=
KG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig<br>
-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><span class=3D"m_-176235492198026=
4264HOEnZb"><font color=3D"#888888"><br>
</font></span></blockquote></blockquote><span class=3D"m_-17623549219802642=
64HOEnZb"><font color=3D"#888888">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></blockquote><span class=3D"m_-17623549219802642=
64HOEnZb"><font color=3D"#888888">
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--089e082b0df00eec640563b28c7c--
