Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id CA20B60138
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 18:34:59 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so25083024igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Apr 2015 11:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sk3M7rDC/mVdLsiaVHzkSf6ZLGd82+XLmJu6+5hH8aU=;
	b=yz6lB2/Dkyo0KqWFxQmnyTJYIlP5T9CLhHSv+0gOwxfWEHLmcLRSO7H0L7AeObMonl
	KjeJ9HiJjoGdIakvsktkCYZsfHITuWTVsubj1+RD6dv4WiDG42OR8/G5GJtfFMVll7b3
	hIJTynPGV467mRKXoPCj7E0v8hhhXdyz1VMcfruj7/0W2PIUkZaMBSe9AFaVNy7mFULx
	VrTgVYMG/F+NT4+NWTI+itHtS3QqgAJ2G/TjphI9dUb3KUZ8k24PTEyYQV9igAno1bWD
	S1UWrir6w0uOIqxa7IcBZZap/gVy2M/JSiokTuPXe4uthWs7V7UgMAqHTTF4drhpo2eC
	9hXg==
MIME-Version: 1.0
X-Received: by 10.107.130.165 with SMTP id m37mr9496841ioi.62.1428172500478;
	Sat, 04 Apr 2015 11:35:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Sat, 4 Apr 2015 11:34:59 -0700 (PDT)
Received: by 10.107.23.6 with HTTP; Sat, 4 Apr 2015 11:34:59 -0700 (PDT)
In-Reply-To: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Sat, 4 Apr 2015 15:34:59 -0300
X-Google-Sender-Auth: 3AA8oHeTx5Xow-9MIaXXICbMa58
Message-ID: <CAP9ODKprO_BWYjr4x0w2PXELXrZa6Y4C2=XgKMWXE+ppULZXTQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
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
X-List-Received-Date: Sat, 04 Apr 2015 18:35:00 -0000
Content-Type: multipart/alternative; boundary=001a113eb98a91b5680512ea522e

--001a113eb98a91b5680512ea522e
Content-Type: text/plain; charset=UTF-8

Em 04/04/2015 14:21, "Ed Bartosh" <ed.bartosh@linux.intel.com> escreveu:
>
> wic requires tools that are not always possible to find in $PATH.
> This causes wic to fail with confusing errors like this:
>  External command 'parted' not found, exiting.
>    (Please install 'parted' on your host system)
>
> Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
> /sbin and /bin to the list of paths makes find_binary_path to
> produce more reliable results.
>
> [YOCTO #7122]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

I think we shouldn't do that. If user wants something to be found the PATH
environment variable should have them included.

This also brings one serious error off wic which is it relying on host
utilities. It should use parted from native sysroot instead otherwise we
cannot be sure if witch version we will be using.

--001a113eb98a91b5680512ea522e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
Em 04/04/2015 14:21, &quot;Ed Bartosh&quot; &lt;<a href=3D"mailto:ed.bartos=
h@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt; escreveu:<br>
&gt;<br>
&gt; wic requires tools that are not always possible to find in $PATH.<br>
&gt; This causes wic to fail with confusing errors like this:<br>
&gt; =C2=A0External command &#39;parted&#39; not found, exiting.<br>
&gt; =C2=A0 =C2=A0(Please install &#39;parted&#39; on your host system)<br>
&gt;<br>
&gt; Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,<b=
r>
&gt; /sbin and /bin to the list of paths makes find_binary_path to<br>
&gt; produce more reliable results.<br>
&gt;<br>
&gt; [YOCTO #7122]<br>
&gt;<br>
&gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel=
.com">ed.bartosh@linux.intel.com</a>&gt;</p>
<p dir=3D"ltr">I think we shouldn&#39;t do that. If user wants something to=
 be found the PATH environment variable should have them included.</p>
<p dir=3D"ltr">This also brings one serious error off wic which is it relyi=
ng on host utilities. It should use parted from native sysroot instead othe=
rwise we cannot be sure if witch version we will be using.</p>

--001a113eb98a91b5680512ea522e--
