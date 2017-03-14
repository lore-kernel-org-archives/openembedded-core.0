Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 28F8D776BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 12:11:12 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id p64so245809644qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gNIXmHyWvQSW5VLJ8UxU+OwF85RkBtpmHfuIFZVe2KM=;
	b=ebisvRF0d4Po+9wKD+VVsoh+MP7hUX062Cz9uqewOrcNp92pk5WrSEFLHhIL58HdBq
	8MUwcYN8785sWqECEA+yXmG07L4OE/3MYuWmpADGXyR4eechJTIofLCanB/zwY9oDjep
	/mbS7MCbDnRGPmSsP6saANQEJwmWSMhpqOngnN2iiD6dJB9JQT7JztMwRcsXto+FtsC4
	5PUQaVoTzAoCQ7F6TxuMlMuCogoR7Px2Lx/rb4WOFAw0j8F4PZ+ZL/NxA6xnw99yWCjk
	EGpHeJS8zqz0koLSihyuuUCyCDeFiHnrqa7s0qcOzCzeHDsCR2xgqRBI5II0SyPC1bZF
	B+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gNIXmHyWvQSW5VLJ8UxU+OwF85RkBtpmHfuIFZVe2KM=;
	b=KaRBAbxHa2w7XWS6s31TEfsu5bSYdw46X43nQ28YHNEufey8Gl6SZ4kixLxWyJyr0l
	fVsCTSB275KF9HWWcdJqbFmKS6phm9HLvE91AS10v33njo/6Db2aISv9xi5SUElYvYCq
	H5oRLTDoBQJbhhrhxPrQk+HsNpZ3vA5sOGCCMx21bfX5PxZ1mF2sDp01LWB6/KZNNZCV
	//XFMomYnd0bYQC7OxH/RuKYy+XsRyrozX0yCJO1qpPZmigRBws1XPVfneyY2uH7KgdE
	d+Fcx22BRQ1vnpNKl7V6p4zBpxOTbBopbchXsydRtlNFLFCW1xGefCgi94ri3rAxUEAK
	F/uA==
X-Gm-Message-State: AMke39kAJkfMVPOXr0FcRXd1H+YhTMcNKbqJ9QhaRcO2feebBeWkpNx/k6kabY179JvXqw1I4c/pKQIAfZzE/qNm
X-Received: by 10.55.183.133 with SMTP id h127mr38581524qkf.121.1489493473445; 
	Tue, 14 Mar 2017 05:11:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 14 Mar 2017 05:10:53 -0700 (PDT)
In-Reply-To: <CAJTo0LZipriFRQ8oRML1=9rze9C5ghzch-v87z637emaSQg6-g@mail.gmail.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
	<30b0c7a3bd07acb4f0b86ddb9076a4f443c59b50.1489481108.git.liezhi.yang@windriver.com>
	<CAJTo0LZipriFRQ8oRML1=9rze9C5ghzch-v87z637emaSQg6-g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Mar 2017 12:10:53 +0000
Message-ID: <CAJTo0LZ4hD7TMkqedh9ciJVvVbC3ee_yG1nsyhXk=hWd=B3NfA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] mc: set ac_cv_path_PERL to /usr/bin/perl
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
X-List-Received-Date: Tue, 14 Mar 2017 12:11:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c06005661990e054aafb99c

--94eb2c06005661990e054aafb99c
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 12:06, Burton, Ross <ross.burton@intel.com> wrote:

> On 14 March 2017 at 08:45, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>> +CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
>>
>
> Would it be sensible to put this in autotools.bbclass?
>

Hang on.  ac_cv_path_PERL is the result of AC_PATH_PROG(perl) which is the
path to the perl on the host.  Is mc using this path only for writing the
hashbang into scripts?  If it tries to execute the path on the build host
then there's several ways this can fail (perl in /usr/local or with
buildtools).

Ross

--94eb2c06005661990e054aafb99c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 12:06, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
><span class=3D""><div class=3D"gmail_quote">On 14 March 2017 at 08:45, Rob=
ert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div id=3D"m_-125199929849162915:r7" class=3D"m_-=
125199929849162915a3s m_-125199929849162915aXjCH m_-125199929849162915m15ac=
bff8aca769db">+CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_PERL=3D${USRBINPA=
TH}<wbr>/perl&quot;<br></div></blockquote></div><br></span>Would it be sens=
ible to put this in autotools.bbclass?</div></blockquote><div><br></div><di=
v>Hang on. =C2=A0ac_cv_path_PERL is the result of AC_PATH_PROG(perl) which =
is the path to the perl on the host.=C2=A0 Is mc using this path only for w=
riting the hashbang into scripts?=C2=A0 If it tries to execute the path on =
the build host then there&#39;s several ways this can fail (perl in /usr/lo=
cal or with buildtools).</div><div><br></div><div>Ross =C2=A0<br></div></di=
v><br></div></div>

--94eb2c06005661990e054aafb99c--
