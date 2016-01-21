Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8D85F7002B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 16:07:25 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 77so58723990ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 08:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=THl5rjf1MXsIkEERRWmFvpbu389tDxUXA/NBRFdK3+Y=;
	b=QIcUeLKpHwifKfwZjN0jMxbSugjp46XZS9JoMCWitFZhn8rW/VDGDO9/yV3zax8lRC
	UrI5VDE+0rTZ8+0+jIDm/B4tnQi7RY2ZOh2MREtp6f3X2eZ5kjUQbdYn3skXm7BMlxYk
	LG+28Jj1Cy97CIfubhcBXZVZjIfNU5GzxP+rtaFBdTp1zmBt6utC67E5msbh6szTu1b3
	vAhha/6dbnevTpShjLP5XCwtWqUx2f8JPue/fLB/K8YQh63l6ZJZ7tZCD3Dp7HRmcnI6
	fpZQQIoKhTpmxwGctA/xQSmnNbqRMhDOdEpr8/IsONSWvlNY3VATDLW3Wgg41z/qeVz8
	nKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=THl5rjf1MXsIkEERRWmFvpbu389tDxUXA/NBRFdK3+Y=;
	b=lBLXNDqWNMjuYYtFPHZyRx8IPdmfY/ZPxBpxxJmMl4JXK58mqekLZ7byETIi6IjMPy
	XyF/ywZMK8lYYsgoWJCec9AxLBCP41U+mJIDyBWLJl10/kmd4qX49zaU5MHfVQnZpBpV
	ut/d2NpsbUKgFCWxaha2F5U/aiVAvaFChfnunCVsaYKvlM8Evoll1+f2U00C4v/75/6G
	XaeiDFMR8/1ZSr0qZew2nHAvMsRGSfFylByjujTmz+KTN7HTZQkwrxnffDOb55+x/aFU
	T+jL2Y/FzvjRH5bpt4xrxVjbfVz1lpSrQKe0E+lobnQkAaWUrMUAdnKa3tc469kmawP1
	gwqQ==
X-Gm-Message-State: ALoCoQnBuixQgvVVRZ7s5TQm5+ObNK5+/ssa9vQqMiZtFLW5lAm/bhdBlSBY29J1a0+t/LaP/PHF7RRaPLE6Mvy7s79ojRKQORmVWpmWMDN7wYjnmjZz9wc=
X-Received: by 10.107.3.154 with SMTP id e26mr35772464ioi.99.1453392446634;
	Thu, 21 Jan 2016 08:07:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 21 Jan 2016 08:07:07 -0800 (PST)
In-Reply-To: <41e5cfb9f2c47f139496bf6b0001d2df112d776c.1453308549.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453308549.git.alejandro.hernandez@linux.intel.com>
	<41e5cfb9f2c47f139496bf6b0001d2df112d776c.1453308549.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jan 2016 16:07:07 +0000
Message-ID: <CAJTo0LaC5oOZze-qoAEd2zxuLuWD3b_n0Sg24RzqjFYYp2_wnw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] python-native: Make python-native also RPROVIDE python-unittest-native
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
X-List-Received-Date: Thu, 21 Jan 2016 16:07:29 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a80538e0529da4ca6

--001a113ec10a80538e0529da4ca6
Content-Type: text/plain; charset=UTF-8

On 20 January 2016 at 16:49, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

>  meta/recipes-devtools/ruby/{ruby_2.2.2.bb => ruby_2.3.0.bb} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/ruby/{ruby_2.2.2.bb => ruby_2.3.0.bb} (100%)
>

Pretty sure this shouldn't be in this patch!  :)  Removed locally.

Ross

--001a113ec10a80538e0529da4ca6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2016 at 16:49, Alejandro Hernandez <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejan=
dro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":p31" class=3D"a3s" style=3D"overflow:hidden">=C2=A0m=
eta/recipes-devtools/ruby/{<a href=3D"http://ruby_2.2.2.bb" rel=3D"noreferr=
er" target=3D"_blank">ruby_2.2.2.bb</a> =3D&gt; <a href=3D"http://ruby_2.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">ruby_2.3.0.bb</a>} | 0<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/ruby/{<a href=3D"http://ruby_2.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">ruby_2.2.2.bb</a> =3D&gt; <a href=3D"ht=
tp://ruby_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">ruby_2.3.0.bb</a>}=
 (100%)<br></div></blockquote></div><br>Pretty sure this shouldn&#39;t be i=
n this patch! =C2=A0:) =C2=A0Removed locally.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec10a80538e0529da4ca6--
