Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBVom-0001K9-G6
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 20:40:40 +0100
Received: by mail-we0-f178.google.com with SMTP id u7so1493067wey.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=iu+FZXdRsJ3tIsyxlz6jezCVOLD34Qf5GjCVYUhllp4=;
	b=vOpoyEjLZtEKPNNqWaLmEzP1xvYGenGCMyaOnfDv1HuAMwmg8wLFrFzsZJG/tyoRzK
	KkGRqDlkWfwaofY+fkqPLObcP6V9k3YPcCBpOpagFNPSbNUwIUhZuIYspM6Rhcsh2epi
	hPXUukliqGQEmoPte1KcbJ1kRwMtqBuiRXIfVpeQKN74RV+jfnQOZ3COdnja36dNRM4s
	/m7bBYThetOtpPTHNpcu0VYpdUZwcWABlFQ8857A+TjIM9CZ0fdol2T0Fkx0G9GQgw7e
	5jOB5Yel01ARtuVb1rbw0yHTsFFRKA2YboYPP9X2ff2KfNU85NK7MXm7bnBKky1URU4W
	Ou7Q==
MIME-Version: 1.0
X-Received: by 10.194.157.42 with SMTP id wj10mr19711105wjb.12.1362165848782; 
	Fri, 01 Mar 2013 11:24:08 -0800 (PST)
Received: by 10.194.89.106 with HTTP; Fri, 1 Mar 2013 11:24:08 -0800 (PST)
In-Reply-To: <5130FD69.1020804@linux.intel.com>
References: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<1362141704.1055.56.camel@ted> <5130FD69.1020804@linux.intel.com>
Date: Fri, 1 Mar 2013 20:24:08 +0100
Message-ID: <CA+chaQewTJogM92pDtzTgQqz6f90U_F_57t8bQ0MfZx-J9h1rQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] btrfs-tools: added PV to git package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 19:40:45 -0000
Content-Type: multipart/alternative; boundary=089e0112c5128abd9004d6e1f3bd

--089e0112c5128abd9004d6e1f3bd
Content-Type: text/plain; charset=UTF-8

I don't think 0.20~rc1 sorts lower then 0.20 at least in opkg world:

OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.20~rc1 '<=' 0.20 &&
echo "Y"
OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.20-rc1 '<=' 0.20 &&
echo "Y"
OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.19+0.20~rc1 '<='
0.20 && echo "Y"
Y
OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.19+0.20-rc1 '<='
0.20 && echo "Y"
Y



On Fri, Mar 1, 2013 at 8:11 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 03/01/2013 04:41 AM, Richard Purdie wrote:
>
>> On Fri, 2013-03-01 at 14:19 +0200, Emilia Ciobanu wrote:
>>
>>> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@**intel.com<emilia.maria.silvia.ciobanu@intel.com>
>>> >
>>> ---
>>>   .../btrfs-tools/btrfs-tools_**git.bb <http://btrfs-tools_git.bb>
>>>             |    2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/btrfs-**tools/btrfs-tools_git.bbb/meta/recipes-devtools/btrfs-
>>> **tools/btrfs-tools_git.bb
>>> index e963a74..df216b1 100644
>>> --- a/meta/recipes-devtools/btrfs-**tools/btrfs-tools_git.bb
>>> +++ b/meta/recipes-devtools/btrfs-**tools/btrfs-tools_git.bb
>>> @@ -17,6 +17,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/**
>>> linux/kernel/git/mason/btrfs-**progs.git;p<http://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;p>
>>>
>>>   S = "${WORKDIR}/git"
>>>
>>> +PV = "0.20-rc1+git${SRCPV}"
>>> +
>>>   PR = "r6"
>>>
>>
>> Sadly this won't allow an upgrade path to 0.20 when its released.
>>
>> We'd either need to use 0.20~rc1 or 0.19+0.20-rc1 as the string.
>>
>
> I would suggest the 0.20~rc1 variation since the Git Rev we are at is
> already beyong 0.20-rc1 tag.
>
> Sau!
>
>
>
>> Cheers,
>>
>> Richard
>>
>>
>> ______________________________**_________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>
>>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--089e0112c5128abd9004d6e1f3bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t think 0.20~rc1 sorts lower then 0.20 at least =
in opkg world:<div><br></div><div><div>OE @ ~/projects/opkg-utils $ ./opkg-=
compare-versions 0.20~rc1 &#39;&lt;=3D&#39; 0.20 &amp;&amp; echo &quot;Y&qu=
ot;</div>
<div>OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.20-rc1 &#39;&lt=
;=3D&#39; 0.20 &amp;&amp; echo &quot;Y&quot;</div><div>OE @ ~/projects/opkg=
-utils $ ./opkg-compare-versions 0.19+0.20~rc1 &#39;&lt;=3D&#39; 0.20 &amp;=
&amp; echo &quot;Y&quot;</div>
<div>Y</div><div>OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.19+=
0.20-rc1 &#39;&lt;=3D&#39; 0.20 &amp;&amp; echo &quot;Y&quot;</div><div>Y</=
div></div><div><br></div></div><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">
On Fri, Mar 1, 2013 at 8:11 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 03/01/2013 04:41 AM, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri, 2013-03-01 at 14:19 +0200, Emilia Ciobanu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Emilia Ciobanu &lt;<a href=3D"mailto:emilia.maria.silvia.cio=
banu@intel.com" target=3D"_blank">emilia.maria.silvia.ciobanu@<u></u>intel.=
com</a>&gt;<br>
---<br>
=C2=A0 .../btrfs-tools/<a href=3D"http://btrfs-tools_git.bb" target=3D"_bla=
nk">btrfs-tools_<u></u>git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/btrfs-<u></u>tools/<a href=3D"http://btr=
fs-tools_git.bb" target=3D"_blank">btrfs-tools_git.bb</a> b/meta/recipes-de=
vtools/btrfs-<u></u>tools/<a href=3D"http://btrfs-tools_git.bb" target=3D"_=
blank">btrfs-tools_git.bb</a><br>

index e963a74..df216b1 100644<br>
--- a/meta/recipes-devtools/btrfs-<u></u>tools/<a href=3D"http://btrfs-tool=
s_git.bb" target=3D"_blank">btrfs-tools_git.bb</a><br>
+++ b/meta/recipes-devtools/btrfs-<u></u>tools/<a href=3D"http://btrfs-tool=
s_git.bb" target=3D"_blank">btrfs-tools_git.bb</a><br>
@@ -17,6 +17,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/=
pub/scm/linux/kernel/git/mason/btrfs-progs.git;p" target=3D"_blank">git.ker=
nel.org/pub/scm/<u></u>linux/kernel/git/mason/btrfs-<u></u>progs.git;p</a><=
br>

<br>
=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
+PV =3D &quot;0.20-rc1+git${SRCPV}&quot;<br>
+<br>
=C2=A0 PR =3D &quot;r6&quot;<br>
</blockquote>
<br>
Sadly this won&#39;t allow an upgrade path to 0.20 when its released.<br>
<br>
We&#39;d either need to use 0.20~rc1 or 0.19+0.20-rc1 as the string.<br>
</blockquote>
<br></div>
I would suggest the 0.20~rc1 variation since the Git Rev we are at is alrea=
dy beyong 0.20-rc1 tag.<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
<br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--089e0112c5128abd9004d6e1f3bd--
