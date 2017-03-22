Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0767A72FB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:13:20 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id r45so150534664qte.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IlG2l3Yg/e4zYeD4yNyjP/b+ccaZ5PQXKqWyXVq9qaU=;
	b=F3eD12piMGd6Mc6aHG82+wYhf+oi4TYKTWmF/kNhoojTOQtEf1bmS5R4vPRqYCkTlV
	qRkJ65ilfRX7Re0j/k+6m8awwIcsDFgrS42ZbN+VCu8DFG8NLcGl3Bu85zYe/+LgVO4h
	A4+kr04bN3D3BCrgo1PFyPz54hoJ046faPKX//ppqcNwTR6DzDUXH39nKiFX/B1bYxEF
	HbqN/Ei/ACiA17cx2Rq9vOR2COZAcEzIqH2xE/ECyR//lqEU1I8DJaC/ZZgGnIhILzNo
	m7MQZJ8jKP1F4TD0eVkm7C2qzhTKnly/7KbbKbtP+iuo2Ojkm+uwTANTtNSYa9/NVHKZ
	DB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IlG2l3Yg/e4zYeD4yNyjP/b+ccaZ5PQXKqWyXVq9qaU=;
	b=BILXn2Vs6lgcqfcp8OhkSkvad2gD/22Och+7lAQpwGyDXQWR8DtGyuzYe9wDUrgjSj
	W13H4iCjQz/yIwSY2HKpnJ5UYHHyY6jdd5ycWwXSggok2Z9RiICdhGcWq0LhrRpC19v/
	vpmfChFIVAC+FoNyNWgnOcv7aEuOdUJqKstjhhceK3coo5yEkZLBpj7EZ66AER5oc/ET
	+a4+yZWJ5CqVUdhi30FPOz1jTDsUDuPnq0tiuMYSoamAgOZS4urQAjEA7fegL4v5zEFF
	ZvSC3NB0o0OpNauzmftJbcCvEAd9HFI+lrFF4Hp28e8dCpEqMcfrYhp+94iMqgK7yPHB
	ugPQ==
X-Gm-Message-State: AFeK/H1gLp9lg1kSG+vGgPwTUDyabvvfR05p4DO5iBwZcBjXEiT1D4z3wnakKDBb/+XBrGH70582A75Iq9rPYdMi
X-Received: by 10.200.2.150 with SMTP id p22mr39947499qtg.197.1490181201751;
	Wed, 22 Mar 2017 04:13:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 04:13:01 -0700 (PDT)
In-Reply-To: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
References: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 11:13:01 +0000
Message-ID: <CAJTo0LaYO_vijmuMyVW8m1DJNJjAoJdxNhmqH3MRKjPaRw-92Q@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] [V3] Fix some issues of kernel/image recipes
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
X-List-Received-Date: Wed, 22 Mar 2017 11:13:21 -0000
Content-Type: multipart/alternative; boundary=f4030435c2342e8a53054b4fd90c

--f4030435c2342e8a53054b4fd90c
Content-Type: text/plain; charset=UTF-8

On 21 March 2017 at 14:34, <liu.ming50@gmail.com> wrote:

>
> The changes in V3:
> 1 Drop one patch which is problematic.
> 2 Change a conditional checking line in kernel-initramfs.bb:
> From: "if type != 'vmlinux' or d.getVar('KERNEL_IMAGETYPE') == 'vmlinux':"
> To: "if type != 'vmlinux' or 'vmlinux' in (d.getVar('KERNEL_IMAGETYPE') or
> ""):"


To avoid confusion can you please ensure all the messages, not just the
cover letter, get the V3 prefix.  Git can do this for you with
--subject-prefix.

Ross

--f4030435c2342e8a53054b4fd90c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 March 2017 at 14:34,  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.min=
g50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
The changes in V3:<br>
1 Drop one patch which is problematic.<br>
2 Change a conditional checking line in <a href=3D"http://kernel-initramfs.=
bb" rel=3D"noreferrer" target=3D"_blank">kernel-initramfs.bb</a>:<br>
From: &quot;if type !=3D &#39;vmlinux&#39; or d.getVar(&#39;KERNEL_IMAGETYP=
E&#39;) =3D=3D &#39;vmlinux&#39;:&quot;<br>
To: &quot;if type !=3D &#39;vmlinux&#39; or &#39;vmlinux&#39; in (d.getVar(=
&#39;KERNEL_IMAGETYPE&#39;) or &quot;&quot;):&quot;</blockquote></div><br>T=
o avoid confusion can you please ensure all the messages, not just the cove=
r letter, get the V3 prefix.=C2=A0 Git can do this for you with --subject-p=
refix.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--f4030435c2342e8a53054b4fd90c--
