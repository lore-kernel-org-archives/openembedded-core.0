Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id ACE7A6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:42:22 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id j37so184834383ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 04:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VahCf7rjjIgMlCVUXuhJd1wApTR4MjBD2tRmvY5/l3Y=;
	b=gYPS0b3aQ/EubOWwhBNiUHU2Zvy4i6bVXKip/2IX3Wu56F92D/YtvLTaxY0xOEltkf
	8DqgYFAEBasm/RyrtElrjBZ0685LjC7oyiYvvJ97yYTMQncyThbcc4JIe1EpxGUYmDK7
	Id5rfrlQCUm9dJJ3lGs4m/sa8zN5Lzer6ay+uFv/e+IB2QUaEtVJYF/gWBcnWj+OLGxw
	RAycbrZvPVA0ZXbHL4OIXq3ADUZLh/tgYNhz1cUW+v+8xKoJE/VFmo1eT63BGikws5Fv
	WEP21ka/GfFVgSpZf2ZkHluT0qScqLh3j0k8oLQjdMXDJBdrJJw8Tjrwk9ECZQsuRuo+
	s4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VahCf7rjjIgMlCVUXuhJd1wApTR4MjBD2tRmvY5/l3Y=;
	b=W+SQts8FoQ5F/AjaSDXoaLJE9nHXXoistAmm5O9QfVJfekfHZ7r9/n2ghLZtouFX8f
	Kw4hQ1WwGijOll4u+RKf1FiKKQcKY9Ydw1gF0WKKrpvTxEoxR7ngJqkBDWbogy13sbd+
	5VDh/rJJ45eyHskIh/VRUWYLQxKUUrJPcQOdgwjr+jzUQqr2hsmr84JJ6nbNSNSeg7aD
	dRI6PGxhHmhn/Vkvv4sdhz7v5rsWAqzzvnMzpRSdyLsP4V+EoY2QtqLKKUYnWtnRtnc+
	HVPxebZ6PBv4cCbEKspuZ+c7eSkJdsDD6Vm7lHaGfZTfeADzW7yDgplFZKfYTut/5y9+
	W0Dg==
X-Gm-Message-State: AA6/9RlE0I1ZFY/dF5ldLma6oV3NQdB4Xex6zkS2sh4cmnfh+/0j00ZyXV+lH/8y0bHtmZ7zG5lEIBuIPKw09XOp
X-Received: by 10.107.138.15 with SMTP id m15mr22787019iod.127.1476704543859; 
	Mon, 17 Oct 2016 04:42:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.168.146 with HTTP; Mon, 17 Oct 2016 04:42:03 -0700 (PDT)
In-Reply-To: <5458be631bd0e452a6b05b09e9b86d6fbf567eeb.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<5458be631bd0e452a6b05b09e9b86d6fbf567eeb.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Oct 2016 12:42:03 +0100
Message-ID: <CAJTo0LZCuuR-aacRaj-akM8dLWrMtcCP2yH46H7U1tkp5wZVjQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] selftest: skip some devtool tests when distro is poky-tiny due to missing libx11
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
X-List-Received-Date: Mon, 17 Oct 2016 11:42:24 -0000
Content-Type: multipart/alternative; boundary=001a113feb3cc6a28b053f0e1184

--001a113feb3cc6a28b053f0e1184
Content-Type: text/plain; charset=UTF-8

On 14 October 2016 at 17:40, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

>      def test_devtool_add_fetch_git(self):
> -        # Fetch source
> +        if self.distro == 'poky-tiny':
> +            self.skipTest('libmatchbox2 is not buildable with poky-tiny
> because it requires a libx11 provider')
>          tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>          self.track_for_cleanup(tempdir)
>          url = 'git://git.yoctoproject.org/libmatchbox'
>

Changing the test to use a recipe that doesn't require a distro feature
that many distros disable seems like a more sustainable fix.

Ross

--001a113feb3cc6a28b053f0e1184
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2016 at 17:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leona=
rdo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.=
gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":1ch" class=3D"a3s aXjCH m157c41168b5229f1">=C2=A0 =C2=A0 =
=C2=A0def test_devtool_add_fetch_git(<wbr>self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fetch source<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.distro =3D=3D &#39;poky-tiny&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;libmatchbox2 =
is not buildable with poky-tiny because it requires a libx11 provider&#39;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tempdir =3D tempfile.mkdtemp(prefix=3D&#3=
9;<wbr>devtoolqa&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.track_for_cleanup(<wbr>tempdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url =3D &#39;git://<a href=3D"http://git.=
yoctoproject.org/libmatchbox" rel=3D"noreferrer" target=3D"_blank">git.yoct=
oproject.org/<wbr>libmatchbox</a>&#39;</div></blockquote></div><br>Changing=
 the test to use a recipe that doesn&#39;t require a distro feature that ma=
ny distros disable seems like a more sustainable fix.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113feb3cc6a28b053f0e1184--
