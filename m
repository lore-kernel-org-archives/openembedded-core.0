Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id D18E976A64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:34:55 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so36644058qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T1Sa0SEb0BWsjnNSux9XoJC0m4kG71peBn6fw+Oz3ZQ=;
	b=O666icnv/GE11oC73n5/C0xZac5Ql6FyAjZQvWIHbxPJLb372gj7NEI8BgkpEKF7OQ
	J8uKnIHgA/NF+xpUXhVQhsaswCaCDwFewN26lmZyINyBjU+hmMhBuZeC47sBRelkqSGG
	2UXGyA32BSrJruurPVVbxkGyZiakGh/mmGnqMtOz2IALw5EG4aiSKK0F8e/geGfTj13N
	SvDwRY8adYvnDOSQ2S8boZvAfccYAMGUM9cwOuMhtokPg6aNd4OYKJgM8DD/+BEPPtno
	ivauZYNsNb/cBSgzeyDhRIGH9MyTmIHM963YWuLzuiR7tIT6SYjECr2iUFLTCMVX1gcB
	8qsg==
X-Gm-Message-State: ALoCoQkufqXSvbbIu9VrDJKihoEjdT6N4JGLyXA7/nDNoj6owiPjOXOEnlxF+NVaS5wsmv0oKwDH
X-Received: by 10.140.194.145 with SMTP id p139mr10531363qha.84.1440106495377; 
	Thu, 20 Aug 2015 14:34:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 20 Aug 2015 14:34:35 -0700 (PDT)
In-Reply-To: <33006C99F5A5194A9B7A7715DFA3E383DC174C19@ALA-MBB.corp.ad.wrs.com>
References: <cover.1439471616.git.jussi.kukkonen@intel.com>
	<10269744a7e91ddf317b041f70d5810ae5c94c36.1439471616.git.jussi.kukkonen@intel.com>
	<20150818083635.GE2458@jama>
	<CAHiDW_EKTkPcQ+NVP9AocSfvpusiBtwp25rpkTDr5Zn0Ut=A4Q@mail.gmail.com>
	<tor.121455D5F425.1070308@windriver.com>
	<33006C99F5A5194A9B7A7715DFA3E383DC174C19@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Aug 2015 22:34:35 +0100
Message-ID: <CAJTo0LZJv5pJv+x46LjMa_NzT3hppzfUewHNBZjPa-i_owDdNQ@mail.gmail.com>
To: "Radzykewycz, T (Radzy)" <radzy@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
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
X-List-Received-Date: Thu, 20 Aug 2015 21:34:57 -0000
Content-Type: multipart/alternative; boundary=001a114323f0189719051dc4ece2

--001a114323f0189719051dc4ece2
Content-Type: text/plain; charset=UTF-8

On 20 August 2015 at 21:15, Radzykewycz, T (Radzy) <radzy@windriver.com>
wrote:

> I would very much prefer that the GPLv2 license of screen be
> maintained.  What do I need to do to keep a GPLv2 license on
> it ?
>

Basically you need to have a good reason why oe-core should invest the time
maintaining both modern screen and ancient screen (4.0.3 was released in
2008).   The easiest solution would be for your distro to maintain a copy
of ancient screen for people who want screen but also don't want GPLv3.
Or, switch to tmux which is BSD licensed.

Ross

--001a114323f0189719051dc4ece2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 August 2015 at 21:15, Radzykewycz, T (Radzy) <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:radzy@windriver.com" target=3D"_blank">radzy@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4x7" cl=
ass=3D"a3s" style=3D"overflow:hidden">I would very much prefer that the GPL=
v2 license of screen be<br>
maintained.=C2=A0 What do I need to do to keep a GPLv2 license on<br>
it ?<br></div></blockquote></div><br>Basically you need to have a good reas=
on why oe-core should invest the time maintaining both modern screen and an=
cient screen (4.0.3 was released in 2008). =C2=A0 The easiest solution woul=
d be for your distro to maintain a copy of ancient screen for people who wa=
nt screen but also don&#39;t want GPLv3.=C2=A0 Or, switch to tmux which is =
BSD licensed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a114323f0189719051dc4ece2--
