Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0274E7F32F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 12:27:35 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id g11so6747972uak.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MjJPQT/lF2+cJDqAek3kfkfymAz8DCmWUWkk4Kc+C/s=;
	b=CpT1E8tDmZwN4W+Cu/GIjd1HMzXpl7Lp7IaC4uFM8kMfs/omB0OlHP7bx6f4oAEj94
	Q7VU0/ID0F3tERCmq9PdEgiVMPnjoYxXBR6u8TPzEQIJDjcBkrMLN5pAyvOR/ZEuh0z0
	1jltP/xkiV/W5B411CdLbCUiO5eb08+pFSsOiFzLtsh147SRcGjER3mGMNds2N4SqsJ/
	+tIkBS1aomVeSZGiFKEaMnHZyMKSZgFz2VM4rFf+Fb4uiv/5PD1JfmFMig3F3yFVatUd
	Vmvrw/3y1zAC3SXXP6MEVP8HmSdq4s7Ep8nM83Rm9z2t9a+tUBGXpJsno4uGUYHQdH/r
	QfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MjJPQT/lF2+cJDqAek3kfkfymAz8DCmWUWkk4Kc+C/s=;
	b=YhBBF7GqLipIcDzcf9mrGdC9Sq96812b7ozJ3VQx+yXyTTI3kkw6VlhTFv9lPrDHKx
	wZG7NmjQwS7mWNf7BAOboCU36IvXuIPfc93Z75k9iIS2xoHEUnnGwZAKgVhcMBuHfmCK
	VPKWmxsojYo08P3VfXPagj1HQBnHFQCet4mCqDR5OQjrrdRhIddZUV4xgtKEmJNqehko
	UUTumM0wKSbq6bdQMZgLXr4dJtCmIOLPJ3c2pEG0wyBSbxag4JAJE+uzK/pwytLjBiBn
	4n3MoTUBwdkTIfaTsLnbPALo1J3KWq+aaN4qQqQqMSeV9UD1hMCNz/mrKa20GBQOUaH1
	l+pw==
X-Gm-Message-State: APjAAAVytavg6ZfvltWW0P6mHB7zzbs689Rg5uTASqEMxAKAS7qUskzl
	FGDA3+cXo+gyekOuK23xExjbT9pR7ysTBSgIRjM=
X-Google-Smtp-Source: APXvYqw7ptSBHtmEnxbDSLjKbzYGLrLzTMWbBJoGBS4V8GnjEDgGrb8++qhoTzJ/cKf4KKNA2y34/uNxrtL/TzSI+vU=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr1934572ual.89.1565094456871;
	Tue, 06 Aug 2019 05:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
	<CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
In-Reply-To: <CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 14:27:25 +0200
Message-ID: <CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 12:27:36 -0000
Content-Type: multipart/alternative; boundary="00000000000024507b058f71f367"

--00000000000024507b058f71f367
Content-Type: text/plain; charset="UTF-8"

Could be, yes. I will next try to untangle the file-rdeps and see why it
fails if bash hasn't been packaged yet, and passes if it has. I have
reproduced this on thud, so this is an old problem.

Alex


On Tue, 6 Aug 2019 at 14:16, Martin Jansa <martin.jansa@gmail.com> wrote:

> Maybe another case of
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217#c6 ?
>
> On Tue, Aug 6, 2019 at 1:57 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Tue, 6 Aug 2019 at 13:18, Ross Burton <ross.burton@intel.com> wrote:
>>
>>> > Note that bash-completion files are not executable, and we do not
>>> > observe this with other recipes. We might have a false positive here -
>>> > can you look at the actual contents of the package please and see why
>>> > _qa thinks it needs /bin/bash?
>>>
>>> Also I don't see this with master.  Do you have some local patches or QA
>>> changes?
>>>
>>
>> Actually there is a determinism problem here. I have reproduced it with
>> master, and the error happens if and only if bash's do_package task has not
>> yet run. If it has already run, then the package_qa for stress-ng passes
>> fine. I'll poke at it to see if it's a recent issue.
>>
>> Alex
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--00000000000024507b058f71f367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Could be, yes. I will next try to untangle the file-r=
deps and see why it fails if bash hasn&#39;t been packaged yet, and passes =
if it has. I have reproduced this on thud, so this is an old problem.<br></=
div><div><br></div><div>Alex<br></div><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 6 Aug 2019 at 14:16, Mart=
in Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr">Maybe another case of=C2=A0<a href=3D"https://bugzilla.y=
octoproject.org/show_bug.cgi?id=3D9217#c6" target=3D"_blank">https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D9217#c6</a> ?</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 6, 2019 at 1=
:57 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Tu=
e, 6 Aug 2019 at 13:18, Ross Burton &lt;<a href=3D"mailto:ross.burton@intel=
.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br></div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt=
; Note that bash-completion files are not executable, and we do not <br>
&gt; observe this with other recipes. We might have a false positive here -=
 <br>
&gt; can you look at the actual contents of the package please and see why =
<br>
&gt; _qa thinks it needs /bin/bash?<br>
<br>
Also I don&#39;t see this with master.=C2=A0 Do you have some local patches=
 or QA <br>
changes?<br></blockquote><div><br></div><div>Actually there is a determinis=
m problem here. I have reproduced it with master, and the error happens if =
and only if bash&#39;s do_package task has not yet run. If it has already r=
un, then the package_qa for stress-ng passes fine. I&#39;ll poke at it to s=
ee if it&#39;s a recent issue.<br></div><div><br></div><div>Alex<br></div><=
/div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>

--00000000000024507b058f71f367--
