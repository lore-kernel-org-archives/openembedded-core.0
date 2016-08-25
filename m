Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDC46AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 16:48:06 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id x131so282539895ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RUI1SDs94F+cZuQ448X0N90fD+GA9y/mqAOX7I2AUd8=;
	b=swhUQyRnejkog6ditzKKl46geAwkmvdGDXY+F16aEquhy0+FeLWWvJOJ4VFa/XnBl6
	UQKH23tDTiH+yeEs41jBhbf9DNcYHYCVb7sanew+/Sl/xIIG5erPlv9xuKBZJ7YR6NOc
	adYolR/wkDSK6AtYqFW4sUStkNvyBzgAaJiKtvI1yXGZmzjvy4qgJUD5MdbDymKtnDAa
	Vrynu25RnZ3I3+o3nkJl32c0YvHQCQ8UPAx3sZwl+58Hn09RMw8JZnPjxVeXV7vVJ2yj
	E25A2D7Jrz0tSF0nLegXJnPr34Fv/2uAsHUsgLfehpBuPyJ04vv8LOwQJ1QvsB1r4mBl
	sIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RUI1SDs94F+cZuQ448X0N90fD+GA9y/mqAOX7I2AUd8=;
	b=PhsvYMAqdZCiWKjSE56UsNSuivvvUXGOlnfgYW7WKNehykU5Lcn2qWMGr11LELQuH+
	2RT36wYu4PM+TTg7Oi/cioywOseT3ZUViaMnNfjXAf9kWE3KuRUDDym1cYzg5pS+IwHk
	/rL4/kzmFO6+DUgmt4uSgWy7VXE5sdPu98bv8Vi9dz3A7wBAPDAE7pEMRySUadap/glg
	iRniSLCt01IcXZPPvnxMuGM1Ihu09AylsAotbYlimykiIeDaWiRKQkkdgAnn/fBxFDCb
	0GPFXvetJAJBNTG+hP4cB0J3k1dOryj71tMjNhDojsp0C7NfyLxcQaHddre8MNywDxzl
	Z/0g==
X-Gm-Message-State: AEkoouvJEFfh2m0qCyuh+qP220uVusaq/KU0xGkLvuFS+iKsPXTqU7Iqm3Zy+5p440u9MaK/ujiG45ieo04S2xMx
X-Received: by 10.107.138.212 with SMTP id c81mr11139978ioj.148.1472143686566; 
	Thu, 25 Aug 2016 09:48:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 09:47:46 -0700 (PDT)
In-Reply-To: <0d4dab927efa4c5db4572715cb1dcaac@corpappl846.corp.saab.se>
References: <1472116833486.43456@saabgroup.com>
	<CAJTo0Lam5us06i_nJtooYcA3T87nCFjAgZ=Gz_3kh-M0GNHisw@mail.gmail.com>
	<0d4dab927efa4c5db4572715cb1dcaac@corpappl846.corp.saab.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 17:47:46 +0100
Message-ID: <CAJTo0LZpw-zvq9ei_KM3H2G7mVQCiSDoJhk0NaJgtGd-5-4a_A@mail.gmail.com>
To: Waldo Mattias <Mattias.Waldo@saabgroup.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Thu, 25 Aug 2016 16:48:06 -0000
Content-Type: multipart/alternative; boundary=001a113ed9327f8972053ae82983

--001a113ed9327f8972053ae82983
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 August 2016 at 16:16, Waldo Mattias <Mattias.Waldo@saabgroup.com>
wrote:

> Version 3 of the patch submitted, this time based on current master =E2=
=80=93
> thanks for your patience!
>
>
Something really odd is going on here...  the references blobs in the patch
don't exist according to my git, and it looks like the whitespace is being
mangled.  Can you verify that you're basing this patch from origin/master
or poky or oe-core, and use git-send-email to ensure that the whitespace
doesn't get trashed?

I'd normally just manually apply but something odd is happening and I'd
like to figure out what it is!

Ross

--001a113ed9327f8972053ae82983
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 August 2016 at 16:16, Waldo Mattias <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Mattias.Waldo@saabgroup.com" target=3D"_blank">Mattias.Waldo@saabgro=
up.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"=
MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,=
sans-serif;color:#1f497d">Version 3 of the patch submitted, this time based=
 on current master =E2=80=93 thanks for your patience!<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Something really odd is g=
oing on here... =C2=A0the references blobs in the patch don&#39;t exist acc=
ording to my git, and it looks like the whitespace is being mangled.=C2=A0 =
Can you verify that you&#39;re basing this patch from origin/master or poky=
 or oe-core, and use git-send-email to ensure that the whitespace doesn&#39=
;t get trashed?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">I&#39;d normally just manually apply but something odd is happeni=
ng and I&#39;d like to figure out what it is!</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed9327f8972053ae82983--
