Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id CCCAD77233
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 13:33:30 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id 5so11357674igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 05:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UXd29qtNWMWqlbx9nQEwW8IBj6Pka68ctqw485VPJJ0=;
	b=ZExMrRYCaI/2IkjVBCG5h9DGocGotxhGQhS+OK/gCUFOwcPzmkNQIGnIUNPnSHICEi
	2bpeFubCQJUa0JeW5FGZcJbeVQibHic6WJRcBJ3hhU1olPHU/L/fpXyvaGVvG/0/7TBs
	2sU4qWP94/MknWimftPvORomtPvRALSBGKckX0aalkBg2t/TusZBB8L9nyvBeqytXZ5V
	J4yMCblp3SiXN4zLs83b19D08fhsw0yr+QCOcwiE4IL5P73Pl0AHW9D1pfFuGmV93741
	Y2xw+vAzVYKyxMuxzbnCnOCzmrE58A+rEWyiUzyt2gZrRNB+BpSWA/CeMQHUiPfEulCG
	wEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UXd29qtNWMWqlbx9nQEwW8IBj6Pka68ctqw485VPJJ0=;
	b=kv1AqCSmPTyeCs/6kXnjWSMAgQ4uJWjxoKVG+Dyi+roTLpR6Eqzg7ZxfTqVnYGm2kO
	JjCNh757wItvjZodtlj4Edqq683fWydujIh5m2k8iAn7KPkhllJQZo3IMSkAjtpxIXr/
	/5XScUiF2/AWoojatFG5dPuYg+cDgH07/p1aDq15rdopL7jcG2UcrHclgsHsxzFSfNXV
	QZx+w77i3lG7tcB8LD/EFKOe8pmWsE3YPBH9FyaVBpGWMvb6mcw6i0GP7+MCeSQZVJw6
	iFCdp+T4lUL7TZWggHVnsOKUtrrXTlKgZUGmyXqa7XBSF73wZETmg3GdRVyvj9ldzX2G
	J1ng==
X-Gm-Message-State: AG10YOSzNffskGi6OPYlNymYdI8DhIsa/VVgMRnpP8l1xGW6fAbZpNffvHWjoLcUOcN/h9r6EUEfJ1ncjFE6IUFJ
X-Received: by 10.50.23.108 with SMTP id l12mr11447586igf.78.1454333610931;
	Mon, 01 Feb 2016 05:33:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 05:33:11 -0800 (PST)
In-Reply-To: <CAJTo0Lb3ZpOqC4Hik_cNh7PZqCF7-=EvosN82HWfpw6TKLNuig@mail.gmail.com>
References: <1454080041-28576-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LbQBoWf8krboqY87V4HCQTaPwXeMECo1jHPDu259Y6wHQ@mail.gmail.com>
	<CAJTo0Lb3ZpOqC4Hik_cNh7PZqCF7-=EvosN82HWfpw6TKLNuig@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 13:33:11 +0000
Message-ID: <CAJTo0LYmqnOfCQPUd26Jo0qn8MHOy=iDJQzYD0-ZH+NHx+kBQQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Jacob Champion <jacob.champion@ni.com>,
	Adam Chappell <adam.chappell@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Mon, 01 Feb 2016 13:33:31 -0000
Content-Type: multipart/alternative; boundary=089e0149cbe843d14d052ab56e55

--089e0149cbe843d14d052ab56e55
Content-Type: text/plain; charset=UTF-8

On 29 January 2016 at 21:21, Burton, Ross <ross.burton@intel.com> wrote:

> And for even more fun the resulting package doesn't actually depend on
> libssl, due to the layout confusing the shlibs code in package.bbclass.
>

Sigh.  Clearly I need a break.  Inserted a load of debugging and then the
obvious jumped out at me.

Using oe-pkg-data to see what files are in what packages:

apr-util:
        /usr/lib/libaprutil-1.so.0
        /usr/lib/libaprutil-1.so.0.5.4
...
apr-util-dev:
...
        /usr/lib/apr-util-1/apr_crypto_openssl-1.so
        /usr/lib/apr-util-1/apr_crypto_openssl.so
        /usr/lib/apr-util-1/apr_dbm_gdbm-1.so
        /usr/lib/apr-util-1/apr_dbm_gdbm.so

Those .so files are not development links, but library modules.  They
should be packaged into FILES_$PN, and no mention of apr-util-1 in
FILES_PN-dev.

Ross

--089e0149cbe843d14d052ab56e55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 January 2016 at 21:21, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div>And for even more fun the resulti=
ng package doesn&#39;t actually depend on libssl, due to the layout confusi=
ng the shlibs code in package.bbclass.</div><div></div></blockquote></div><=
br>Sigh.=C2=A0 Clearly I need a break.=C2=A0 Inserted a load of debugging a=
nd then the obvious jumped out at me.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Using oe-pkg-data to see what files are in =
what packages:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra"><div class=3D"gmail_extra">apr-util:</div><div class=3D"gmail_extr=
a">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/libaprutil-1.so.0</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/libaprutil-1.so.0.5.4=
</div><div>...</div><div><div>apr-util-dev:</div><div>...</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /usr/lib/apr-util-1/apr_crypto_openssl-1.so</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/apr-util-1/apr_crypto_openssl.so</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/apr-util-1/apr_dbm_gdbm-1.so</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/apr-util-1/apr_dbm_gdbm.so</div>=
</div><div><br></div><div>Those .so files are not development links, but li=
brary modules.=C2=A0 They should be packaged into FILES_$PN, and no mention=
 of apr-util-1 in FILES_PN-dev.</div><div><br></div><div>Ross</div></div></=
div>

--089e0149cbe843d14d052ab56e55--
