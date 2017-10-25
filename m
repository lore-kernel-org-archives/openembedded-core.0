Return-Path: <shubhabrata.sen@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7C56AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:56:40 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id z28so34325663qtz.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RdYzs+BOF0Nbma5dKuJyf8ITpUlOXG6gyCW86uQdGUQ=;
	b=k7e14c0NBhcxXe0e1CvSku1A6GrzWaND3QZEtMls8Kb/aj/3otYiyljQzHlBXcJuzp
	UKsZEaWwgu6pfCodVyGZZd+1o3r6W8mFrapErXibYWADDKiXmJmkgI/myGO7wt3/Jc/x
	WrmFR5LtSyAQcVRrTPWQ3Uqyj6/EuCUZiSYsNOOKRFVH82dI7jigkD754b/ZhWZAC2gU
	pjGrPTpy96b/tEOlJZFkuX9DXyYgbmLv+z0L2v0MS1d55RIEjsgo7G8fzSizWDX5qUgn
	Pg9gyfnYRqXq8DVk1yOpJd5RqwgiG1Qjg8p9cdawdaxVCS0v7+Muobgnak3TwjoIwH4A
	QBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RdYzs+BOF0Nbma5dKuJyf8ITpUlOXG6gyCW86uQdGUQ=;
	b=ndLyhMHYzmCvf+JKlP4lOFn/uIyHd3hTJ13fzRBzeANfOCnHfrxyDuagh+R8oN6BJl
	GmUEJA99tmR4I/xY/AjLvmjXlJbIgGzkWHTHhd10jazrA8hPOu8Cu+cVeWiqDzPpmTQt
	ux5WRQHwdAbifgWpvTv2W0efyNDH+RXDmIksS3TWUae5nIBlRwb4j8cceKmAoTpWUAmv
	nf5+JLgWbyA6b176B3rmIp8bBORxqbeRu8z4BBVI+sNiH56dIv3WzvCJ7LfW7YXOozcs
	sq3TM2vnm1lkA/x+WSZawJZt30u08m7O3iBHaLKdBomMfuQjWVuwlMGbcVZndubo0YuX
	ifHw==
X-Gm-Message-State: AMCzsaXFtyQ5X1h4s4LOkRAyMgibwOd4Hkz/F1qfcW0pY4+McGEaolkP
	7pYDKtXYfn4aPTRgDtSRXmn/kKgd0V55SfXswB0=
X-Google-Smtp-Source: ABhQp+QiwVA0OTJNrLTrCBW3T6Qjm4CdtJ1OY9hmcm3XPpGB4wBV1A7HkM0VFBNrGfH5t0cvUgh+3598pKuEkd6YTbg=
X-Received: by 10.200.53.111 with SMTP id z44mr31114553qtb.12.1508932601943;
	Wed, 25 Oct 2017 04:56:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.35.52 with HTTP; Wed, 25 Oct 2017 04:56:41 -0700 (PDT)
In-Reply-To: <CA+chaQfdT_wySFELWqaDtMC3Q-1k6MQ-0ApnwZEHmAPzvuMWcA@mail.gmail.com>
References: <CA+jxWbeubv1tSJLXs5v6wP0do_+jzgepSMc2okvj4imip=+yjA@mail.gmail.com>
	<CA+chaQfdT_wySFELWqaDtMC3Q-1k6MQ-0ApnwZEHmAPzvuMWcA@mail.gmail.com>
From: shubhabrata sen <shubhabrata.sen@gmail.com>
Date: Wed, 25 Oct 2017 13:56:41 +0200
Message-ID: <CA+jxWbfRDk9Fms1QtAQ6y1HQ-uVzE2Pwt_NZ8RiZC8jkMohj0w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Swig dependency error while building firmware with apparmor
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
X-List-Received-Date: Wed, 25 Oct 2017 11:56:41 -0000
Content-Type: multipart/alternative; boundary="001a11405c6cba9d3e055c5dbf00"

--001a11405c6cba9d3e055c5dbf00
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

Thank you for your reply. Could you please give a bit more details about
this ? I'm relatively new to the openembedded environment.

On Wed, Oct 25, 2017 at 12:28 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> you probably want swig-native dependency.
>
> On Wed, Oct 25, 2017, 11:09 shubhabrata sen <shubhabrata.sen@gmail.com>
> wrote:
>
>> Hi,
>>
>> I'm trying to build a firmware with the apparmor recipe and I keep
>> getting the following error
>>
>> *checking for swig... no*
>> | checking whether the libapparmor debug output should be enabled... no
>> | checking whether the libapparmor man pages should be generated... yes
>> | checking for podchecker... podchecker
>> | checking for pod2man... pod2man
>> | checking whether python bindings are enabled... yes
>> *| configure: error: swig is required when enabling python bindings*
>> | WARNING: /home/shubhabs/dists/cvp/builds/p1367/tmp/work/
>> cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/temp/run.do_configure.8464:1
>> exit 1 from 'PERL="${PERL}" PYTHON="/home/shubhabs/dists/
>> cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-
>> gnueabi/apparmor/2.10.95-r0/recipe-sysroot-native/usr/bin/python-native/python"
>> ./configure --build=x86_64-linux --host=arm-poky-linux-gnueabi
>> --target=arm-poky-linux-gnueabi --prefix=/usr --libdir=/usr/lib
>> --mandir=/usr/share/man --includedir=/usr/include --with-perl --with-python'
>>
>> I've included the SWIG recipe in the build and I can successfully build
>> the firmware including swig with the bitbake command but somehow the
>> apparmor recipe can't find the swig package. Any help regarding this would
>> be appreciated.
>>
>> Thanks
>>
>> Shubh
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--001a11405c6cba9d3e055c5dbf00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<div><br></div><div>Thank you for your reply. Co=
uld you please give a bit more details about this ? I&#39;m relatively new =
to the openembedded environment.</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Wed, Oct 25, 2017 at 12:28 PM, Martin Jansa <=
span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><p dir=3D"ltr">you probably want swig-native dependency.</p>
<br><div class=3D"gmail_quote"><div><div class=3D"h5"><div dir=3D"ltr">On W=
ed, Oct 25, 2017, 11:09 shubhabrata sen &lt;<a href=3D"mailto:shubhabrata.s=
en@gmail.com" target=3D"_blank">shubhabrata.sen@gmail.com</a>&gt; wrote:<br=
></div></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5"><d=
iv dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to build a firmware wi=
th the apparmor recipe and I keep getting the following error</div><div><br=
></div><div><div><b>checking for swig... no</b></div><div>| checking whethe=
r the libapparmor debug output should be enabled... no</div><div>| checking=
 whether the libapparmor man pages should be generated... yes</div><div>| c=
hecking for podchecker... podchecker</div><div>| checking for pod2man... po=
d2man</div><div>| checking whether python bindings are enabled... yes</div>=
<div><b>| configure: error: swig is required when enabling python bindings<=
/b></div><div>| WARNING: /home/shubhabs/dists/cvp/<wbr>builds/p1367/tmp/wor=
k/<wbr>cortexa9hf-neon-poky-linux-<wbr>gnueabi/apparmor/2.10.95-r0/<wbr>tem=
p/run.do_configure.8464:1 exit 1 from &#39;PERL=3D&quot;${PERL}&quot; PYTHO=
N=3D&quot;/home/shubhabs/dists/<wbr>cvp/builds/p1367/tmp/work/<wbr>cortexa9=
hf-neon-poky-linux-<wbr>gnueabi/apparmor/2.10.95-r0/<wbr>recipe-sysroot-nat=
ive/usr/bin/<wbr>python-native/python&quot; ./configure --build=3Dx86_64-li=
nux --host=3Darm-poky-linux-gnueabi --target=3Darm-poky-linux-<wbr>gnueabi =
--prefix=3D/usr --libdir=3D/usr/lib --mandir=3D/usr/share/man --includedir=
=3D/usr/include --with-perl --with-python&#39;</div></div><div><br></div><d=
iv>I&#39;ve included the SWIG recipe in the build and I can successfully bu=
ild the firmware including swig with the bitbake command but somehow the ap=
parmor recipe can&#39;t find the swig package. Any help regarding this woul=
d be appreciated.</div><div><br></div><div>Thanks</div><div><br></div><div>=
Shubh</div></div></div></div><span class=3D"HOEnZb"><font color=3D"#888888"=
>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div>
</blockquote></div><br></div>

--001a11405c6cba9d3e055c5dbf00--
