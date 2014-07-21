Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6C68261585
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:41:06 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so4848819lbj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=4sd9gkVsNe1EeeUNSlrs3/78RW3S7+9JOnffcVTtfOs=;
	b=z+EGmh+40/hGQ87Lw0l9ALkOO3VySx6KWFeuQA/Fs55iWujGxEpanYzP2iwsJ4A/28
	/+STNbp53bMTiVL/fFpJg566OsjTqeOhkX0NipUnXr/FFi3h+ssQBn34Ssl7F0VRfZCU
	SnnV54XF4Z3lsnNQdNspdM/MUoZ4X4dvHYSVROUTFvIrpUEgj+6yigIZ+EczYun1r/Tj
	zSuYZA2p4VMBoyptUJaZaD4QglvQoyDvPrDMLCCn0+7CtyXdcgfS+VMPavHg6HAJL51g
	qiz5qqTF/MS/KrVHhLr04QSYeVdb/GKM8DBzAFcxKg4FcDiisg28MM2dtvDU1Aimgdwv
	Xl7Q==
X-Received: by 10.112.144.104 with SMTP id sl8mr25557243lbb.52.1405957267124; 
	Mon, 21 Jul 2014 08:41:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Mon, 21 Jul 2014 08:40:47 -0700 (PDT)
In-Reply-To: <CAJTo0Lafck2hOcUfpqYTnARMuzLOfNbA-GnnLcHF-oUBnc9zwA@mail.gmail.com>
References: <1405946349-16124-1-git-send-email-jacob.kroon@mikrodidakt.se>
	<CAJTo0Lafck2hOcUfpqYTnARMuzLOfNbA-GnnLcHF-oUBnc9zwA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 21 Jul 2014 08:40:47 -0700
X-Google-Sender-Auth: F2q2WYbZR9diqANj5Va2XjQ00ig
Message-ID: <CABcZAN=c+xOFrE+_nfg=9_OfdS_X_jLnfwEB=7Ox-s5xkF8Wcw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Jacob Kroon <jacob.kroon@mikrodidakt.se>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pixbufcache: Add missing dependency on jpeg-native
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
X-List-Received-Date: Mon, 21 Jul 2014 15:41:10 -0000
Content-Type: multipart/alternative; boundary=047d7b3441ec79f84004feb5ef91

--047d7b3441ec79f84004feb5ef91
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 21, 2014 at 5:49 AM, Burton, Ross <ross.burton@intel.com> wrote:

> If we can't change the sysroot creation order so that the order is
> zlib, libpng, libjpeg, and then gdk-pixbuf then I think this needs to
> be pulled out to a function that can do neater logic, such as iterate
> through PACKAGECONFIG and add the required dependencies (for each
> enabled option, turn the build depends into
> %s-native:do_populate_sysroot_setscene).
>

I'm a bit confused by this. It's the class that needs to know the deps, and
it's inherited by a bunch of recipes, but the packageconfig you're talking
about is in the gdk-pixbuf-native recipe -- how is it going to iterate over
the packageconfig of another recipe, or are you saying that the
packageconfigs of anyone using pixbufcache need to mirror that of the tool
in question?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics Corporation

--047d7b3441ec79f84004feb5ef91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jul 21, 2014 at 5:49 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":gy" class=3D"a3s" style=3D"overf=
low:hidden">If we can&#39;t change the sysroot creation order so that the o=
rder is<br>


zlib, libpng, libjpeg, and then gdk-pixbuf then I think this needs to<br>
be pulled out to a function that can do neater logic, such as iterate<br>
through PACKAGECONFIG and add the required dependencies (for each<br>
enabled option, turn the build depends into<br>
%s-native:do_populate_sysroot_setscene).</div></blockquote></div><br></div>=
<div class=3D"gmail_extra">I&#39;m a bit confused by this. It&#39;s the cla=
ss that needs to know the deps, and it&#39;s inherited by a bunch of recipe=
s, but the packageconfig you&#39;re talking about is in the gdk-pixbuf-nati=
ve recipe -- how is it going to iterate over the packageconfig of another r=
ecipe, or are you saying that the packageconfigs of anyone using pixbufcach=
e need to mirror that of the tool in question?<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics Corporation<br></div></div>

--047d7b3441ec79f84004feb5ef91--
