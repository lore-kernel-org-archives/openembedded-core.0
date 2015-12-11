Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D6C1B60767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 00:15:00 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id v187so56410682wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 16:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6vLdGroL8KLrCQIdviEUne/6u7HX1TIlO40I53iD8v0=;
	b=yn63x7gMpokp9+EnIFmpkaXpOCHycx/Arm0uye4kO3doTvrYJZ3CEBM54M/75nFQNU
	8gkib2urdGZRXov5J2jOC424M6Wbjl1p6Ki5lvphjToLhHP5YA14KfuO0R1v/47h6SmJ
	nwghUc5TOZcbXf/KVRMarNbUM8McE//dP67YH2qH4sYVOciOFEV6KfEOGELY+ghVj8wq
	mecdBXPfZ7zpOVjYANvyKSM7/Q4Gvp+ojqwh9bXzRrBDAyMk7oE9Wqsu1Td/9ZbYzrp5
	UEVpiCesMydgb5idayqMoRdE5LuPhTBSY1hNQ2iPtSUQCJc2J6K5eSoCZuCTL0+vHQTp
	Kb5g==
MIME-Version: 1.0
X-Received: by 10.28.175.144 with SMTP id y138mr1959986wme.47.1449792900583;
	Thu, 10 Dec 2015 16:15:00 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Thu, 10 Dec 2015 16:15:00 -0800 (PST)
In-Reply-To: <CAJTo0LaabSzVjvsSsQ7Gudunb7YOiuX8Zc=b27J+6_LNFwAT5w@mail.gmail.com>
References: <1449702069-11889-1-git-send-email-alejandro.delcastillo@ni.com>
	<1449782540-4416-1-git-send-email-alejandro.delcastillo@ni.com>
	<CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
	<CAJTo0LaabSzVjvsSsQ7Gudunb7YOiuX8Zc=b27J+6_LNFwAT5w@mail.gmail.com>
Date: Fri, 11 Dec 2015 01:15:00 +0100
Message-ID: <CA+chaQfNL8XPqxgLkBq=ZP98TMLqjo3Zq9Va0-eqCv0raOUCyg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsolv: add new recipe
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
X-List-Received-Date: Fri, 11 Dec 2015 00:15:03 -0000
Content-Type: multipart/alternative; boundary=001a11444b64d65953052694367d

--001a11444b64d65953052694367d
Content-Type: text/plain; charset=UTF-8

I was hit by this regeneration again last month so it's still happening.

On Fri, Dec 11, 2015 at 12:55 AM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 10 December 2015 at 23:16, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> > +SRC_URI = "https://github.com/openSUSE/libsolv/archive/${PV}.zip"
>>
>> GitHub tar file archives sometimes get regenerated and the hashes
>> change. I'm not sure if the same can happen for zip files, but it's
>> probably safer to checkout a git release tag rather than trust the zip
>> file.
>
>
> For what it's worth this was true in the past but I'm now reliably
> informed that the archive tarballs are generated with literally git
> archive, which goes to great pains to be reproducible.  I would pick the
> tarball over the zip though.
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

--001a11444b64d65953052694367d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was hit by this regeneration again last month so it&#39;=
s still happening.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Fri, Dec 11, 2015 at 12:55 AM, Burton, Ross <span dir=3D"ltr">&lt=
;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_qu=
ote">On 10 December 2015 at 23:16, Andre McCurdy <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>&gt; +SRC_URI =
=3D &quot;<a href=3D"https://github.com/openSUSE/libsolv/archive/$%7BPV%7D.=
zip" rel=3D"noreferrer" target=3D"_blank">https://github.com/openSUSE/libso=
lv/archive/${PV}.zip</a>&quot;<br>
<br>
</span>GitHub tar file archives sometimes get regenerated and the hashes<br=
>
change. I&#39;m not sure if the same can happen for zip files, but it&#39;s=
<br>
probably safer to checkout a git release tag rather than trust the zip<br>
file.</blockquote></div><br></span>For what it&#39;s worth this was true in=
 the past but I&#39;m now reliably informed that the archive tarballs are g=
enerated with literally git archive, which goes to great pains to be reprod=
ucible.=C2=A0 I would pick the tarball over the zip though.</div><span clas=
s=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></font></span></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--001a11444b64d65953052694367d--
