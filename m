Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 618D16FFC8;
	Wed,  2 Dec 2015 21:58:57 +0000 (UTC)
Received: by lfs39 with SMTP id 39so65385556lfs.3;
	Wed, 02 Dec 2015 13:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uy2K9x3nspScejCbNzl71PpGZSjjPKMep4eJnm665bY=;
	b=hkDqMLGl26/PM5YqxPSYJ3lguqE+VmKSHg7+z/bAeVLMK0KqlrMg0VrYK6GCQJOwSW
	0opw1Xgq3SJTpkZ3SDUhkPiiJEEgWvZxH1PugzBwrwH10ZEBqvsH6S4fYXLvAczAcA++
	3EVIfYcNTzF5eKu6Qn/qif6oHjJy1wbybJGso0SNbZVjWJPyrfLeYkHC7v5V8EUBGazx
	cgEaBlCWat9zKgtGMEKuUaf9flcBOHaUpbnROmKepKlse7hJT7fYhoN979UjxUzHe1I6
	mNPwx+a252GMH93nkCx8HRMGt97ux1ucGWj+rQrX6tGOg2tOh9sfu/cZa8sRJudwKr9e
	mXZA==
MIME-Version: 1.0
X-Received: by 10.112.13.98 with SMTP id g2mr3820962lbc.18.1449093537857; Wed,
	02 Dec 2015 13:58:57 -0800 (PST)
Received: by 10.25.199.73 with HTTP; Wed, 2 Dec 2015 13:58:57 -0800 (PST)
In-Reply-To: <CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
	<20151202180440.GC2248@jama>
	<CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
Date: Wed, 2 Dec 2015 13:58:57 -0800
Message-ID: <CANx9H-BhX6kY19y=6yX+9OSh9xOMp2g_-S=NC=sQd4m6A+0=Qg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Patchwork & patch handling improvements
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
X-List-Received-Date: Wed, 02 Dec 2015 21:58:59 -0000
Content-Type: multipart/alternative; boundary=001a11c3b8a69208cd0525f16197

--001a11c3b8a69208cd0525f16197
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 2, 2015 at 10:43 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 2 December 2015 at 18:04, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> I'm depending on bundles heavily, to "mark" the patches for layers with
>> dedicated maintainer and also for extra "status" like merged in
>> "master-next" branch for jenkins build, because standard status values
>> aren't fine-grained enough.
>>
>
> Sounds like instead of bundles the new patchworks needs the ability for a
> single list to represent multiple projects (so there'd be a meta-oe,
> meta-python, etc), and more status values.
>
> I agree with Ross that if we can get the functionality we truly need into
Patchwork--and JaMa can live with the result or help guide the
functionality--that we have a better path into the future.

Also, for what it's worth I vote for spaces only. We can provide editor
templates/settings to make it easy on the end users. There are languages
that require tabs, there are languages that require spaces. Deal with the
required tabs when the necessary evil arises.

--Tim

>
>

--001a11c3b8a69208cd0525f16197
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Dec 2, 2015 at 10:43 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 2 December 2015 at 18:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflo=
w:hidden">I&#39;m depending on bundles heavily, to &quot;mark&quot; the pat=
ches for layers with<br>
dedicated maintainer and also for extra &quot;status&quot; like merged in<b=
r>
&quot;master-next&quot; branch for jenkins build, because standard status v=
alues<br>
aren&#39;t fine-grained enough.</div></blockquote></div><br></span>Sounds l=
ike instead of bundles the new patchworks needs the ability for a single li=
st to represent multiple projects (so there&#39;d be a meta-oe, meta-python=
, etc), and more status values.</div><span class=3D"HOEnZb"><font color=3D"=
#888888"><div class=3D"gmail_extra"><br></div></font></span></div></blockqu=
ote><div>I agree with Ross that if we can get the functionality we truly ne=
ed into Patchwork--and JaMa can live with the result or help guide the func=
tionality--that we have a better path into the future.</div><div><br></div>=
<div>Also, for what it&#39;s worth I vote for spaces only. We can provide e=
ditor templates/settings to make it easy on the end users. There are langua=
ges that require tabs, there are languages that require spaces. Deal with t=
he required tabs when the necessary evil arises.</div><div><br></div><div>-=
-Tim=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<br></blockquote></div><br></div></div>

--001a11c3b8a69208cd0525f16197--
