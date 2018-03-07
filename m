Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7BD600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 15:35:20 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id v194so3901523itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Cd5eH3CCw88KncBSWiY5zhoC+tF+AV9xwpI431uEEBA=;
	b=yl6231QfrY2JvV0GslHzA25ZvLCRiX8dkwlApUVjZBzLIwpBSdQv56EcZOqjJw4qNq
	SoB7mofWXVuaC5Fzp6b85vQfIVfVW6EPB9WIlR7ZYTpRma/o1h5AXu/ToiIB7xtsHXa2
	+vRCPA6kNr7/0E8tMx8JqkYxzpRNfuxjf/U3p1uXHO8HHSnw91NG2fex7EFj6vi7lJ8R
	yj5w8pJubr4lOwmaH+UOtVeq4aRshMKvL58VKVkfwJQb225kDO1jjoAEj4AeNKD8lle3
	jawlK7EsZKr9KC6hdwpPvoIl8myr7ipSRSP6uUbefQIoadBSslvRuE1/PYsNiV+KgTEj
	js2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Cd5eH3CCw88KncBSWiY5zhoC+tF+AV9xwpI431uEEBA=;
	b=fBGPaF/shjRBIN70WXVQybFqE8ZxKM6BEYK73hFGi4MiNnprHJJyVmctVSRKgulGwk
	5J3s39rZc+vgO5HkGeA3zFRrUD/Vkf1bTAmJ34HXXQiwbhyRdrbV18RhM19AvpSZ9OQ4
	z6MpdUEnOM8cg6h5MLNUZJpd70HFdrddQGdnhxCOG2tsWxiR4pFrHWl7LTzYYwkEmUCz
	Bn05xgKfm6uI2MNMsvPggQ9x4ZSeYcsdbF/xuQTa/FeDdYUL3sEm7SWUc0V8MuHBK3ik
	nJMhqpOzm7x5V+Csu8Qqnf1vdWyzjtNnE5W0RfxqxFK+Ui7vHw1TVzHOKlOskz1Tco2k
	fQFQ==
X-Gm-Message-State: AElRT7GQyrlo0w+FWe/OgykGHPs7NdfVzLd1Nqj6U4skX5/pRhrXUyjP
	S1PHZd2AgmWdYSsrJD9vKZxnZYelzL3AsrWrCL86yg==
X-Google-Smtp-Source: AG47ELsQr+Bi559vDW5Kc0Y0pCwJDIL6nOF2Uo+o8t4/s5ezGYHUIVAxwBOwENgY7ffDftanB6opHnfn4p3Wmx7G1qk=
X-Received: by 10.36.36.144 with SMTP id f138mr22647515ita.131.1520436922072; 
	Wed, 07 Mar 2018 07:35:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 7 Mar 2018 07:35:01 -0800 (PST)
In-Reply-To: <8a99e9f3-22c8-8c6f-294d-302f79d8c2ed@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0Lahsa_Bnzuw2yXQypkfk+qSVxmuPP1YAJUKw5euzocL4w@mail.gmail.com>
	<8a99e9f3-22c8-8c6f-294d-302f79d8c2ed@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Mar 2018 15:35:01 +0000
Message-ID: <CAJTo0LZB7cas2gJXuizJB_S-NuO=rvZyMy3V79V5CvQHbyepjg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 07 Mar 2018 15:35:21 -0000
Content-Type: multipart/alternative; boundary="001a1147cd30a4d8380566d44ecd"

--001a1147cd30a4d8380566d44ecd
Content-Type: text/plain; charset="UTF-8"

On 7 March 2018 at 15:06, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

>
> Odd. My merge of standard/tiny/base -> tiny* didn't go automatically.
> Could have been the new branch naming. Either way, that SRCREV is
> now valid for 4.14, and there's no patch to resend.
>
> Bruce
>
> ------
>
> [/home/bruc...-yocto.git]> kgit-merge v4.14/standard/tiny/base
> :v4.14/standard/tiny
> Already up-to-date.
> Already up-to-date!
> Merge made by the 'recursive' strategy.
> Already up-to-date!
> Merge made by the 'recursive' strategy.
> Switched to branch 'v4.14/standard/tiny/base'
> [/home/bruc...-yocto.git]> git branch --contains
> 09828ddd8d8c91b2d68afdcd8eb99a48e0253582
> * v4.14/standard/tiny/base
>   v4.14/standard/tiny/common-pc
>   v4.14/standard/tiny/intel
> [/home/bruc...-yocto.git]> git push origin
> Counting objects: 2, done.
> Delta compression using up to 4 threads.
> Compressing objects: 100% (2/2), done.
> Writing objects: 100% (2/2), 336 bytes | 0 bytes/s, done.
> Total 2 (delta 1), reused 0 (delta 0)
> To ssh://git@git.yoctoproject.org/linux-yocto.git
>    69908a02e1e9..59628e3129a3  v4.14/standard/tiny/common-pc ->
> v4.14/standard/tiny/common-pc
>    23d712fdbb9b..6a5e7b08591d  v4.14/standard/tiny/intel ->
> v4.14/standard/tiny/intel
>

Great, thanks.

Ross

--001a1147cd30a4d8380566d44ecd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 March 2018 at 15:06, Bruce Ashfield <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruc=
e.ashfield@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Odd. My merge of standard/tiny/base -&gt; tiny* didn&#39;t go automatically=
.<br>
Could have been the new branch naming. Either way, that SRCREV is<br>
now valid for 4.14, and there&#39;s no patch to resend.<br>
<br>
Bruce<br>
<br>
------<br>
<br>
[/home/bruc...-yocto.git]&gt; kgit-merge v4.14/standard/tiny/base :v4.14/st=
andard/tiny<br>
Already up-to-date.<br>
Already up-to-date!<br>
Merge made by the &#39;recursive&#39; strategy.<br>
Already up-to-date!<br>
Merge made by the &#39;recursive&#39; strategy.<br>
Switched to branch &#39;v4.14/standard/tiny/base&#39;<br>
[/home/bruc...-yocto.git]&gt; git branch --contains 09828ddd8d8c91b2d68afdc=
d8eb99a<wbr>48e0253582<br>
* v4.14/standard/tiny/base<br>
=C2=A0 v4.14/standard/tiny/common-pc<br>
=C2=A0 v4.14/standard/tiny/intel<br>
[/home/bruc...-yocto.git]&gt; git push origin<br>
Counting objects: 2, done.<br>
Delta compression using up to 4 threads.<br>
Compressing objects: 100% (2/2), done.<br>
Writing objects: 100% (2/2), 336 bytes | 0 bytes/s, done.<br>
Total 2 (delta 1), reused 0 (delta 0)<br>
To ssh://<a href=3D"http://git@git.yoctoproject.org/linux-yocto.git" rel=3D=
"noreferrer" target=3D"_blank">git@git.yoctoproject.org<wbr>/linux-yocto.gi=
t</a><br>
=C2=A0 =C2=A069908a02e1e9..59628e3129a3=C2=A0 v4.14/standard/tiny/common-pc=
 -&gt; v4.14/standard/tiny/common-pc<br>
=C2=A0 =C2=A023d712fdbb9b..6a5e7b08591d=C2=A0 v4.14/standard/tiny/intel -&g=
t; v4.14/standard/tiny/intel<br></blockquote><div><br></div><div>Great, tha=
nks.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1147cd30a4d8380566d44ecd--
