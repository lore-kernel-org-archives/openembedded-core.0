Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1E76E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:06:28 +0000 (UTC)
Received: by igl9 with SMTP id 9so66201091igl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 13:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XzEqf5iNfSWbZpSr/LPvmLZXL+i+eRysh6MSIgcJ52o=;
	b=VnfDNbmhWq9gnP+uxCThsFboDIP0Dyeu9/nKJaDNbRZA72E+hfhp9WecNVFKql3LMb
	lTLoEeHDOHS52jL/M6OXA4oFknaefgf6MzvW2F4NfhQ6lf/dLxGPCva6ZrB5tYxtoxbK
	H40KLmKZIrWWwWaGz2GkPF6PAVh5AsHOjMEcBGNtVEpgZfEV4zGzUmAah+eTi/Pb6GJ6
	ZWtcSFfFlRBwsENV+LM35I0rptOXVF1nW5VHkUcU12F0pfYBm98ZEvOiPX/i0FTu+pyf
	4kHyxyDdOeloZXW7n7Y16frynSOFvTr9+cLbxelIKvVa5MnmLTbrQSPXcpqi9Sfi6Tb2
	dvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XzEqf5iNfSWbZpSr/LPvmLZXL+i+eRysh6MSIgcJ52o=;
	b=l7ICQcuZE0UfJXPSp29c3pF2aJSUrx/zy7+F1EDgswPHWZR5QmJtafmQDjXLKy3Nab
	glsqGB9bTnm5+pwra8kny46euLIC1f5rpOfu34m/UIEBIuDj5q+5zUmT7citI1qfXaqU
	WXlWSFwKGJCpFj34Z/rTLJk8tQeiOOpHNnVaImorMqF0LteEeDf79RPoyoox67X8TuSk
	7Y/Fk/5RgOF7KRScPabdD48SXvM8cq8cR0DHoe+Lrm/j4Jk4kn/gUUXSxw7hOYL5CoUP
	RNooGcG8IOtHpspjnlnr6Ry0cOw404J6MNORpeaLMk24ZMCny3E0jjGdVzV0ZqWYtbIc
	1Sww==
X-Gm-Message-State: ALoCoQmSRXReOQAAqMQzj79iSYlc/mI05+B9mTJMeYIVaKHyS/hhuBfoRNpA+09xZUsKYeHCdqwv
X-Received: by 10.50.30.69 with SMTP id q5mr7015122igh.78.1447707988645; Mon,
	16 Nov 2015 13:06:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 13:06:09 -0800 (PST)
In-Reply-To: <662f06a28213cfec134998e6acfc12112ac02866.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
	<662f06a28213cfec134998e6acfc12112ac02866.1447072488.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 21:06:09 +0000
Message-ID: <CAJTo0Lb5_hSeiC7GOwKL=4geSwEwbRFcOfiydRDsL61ysPaE7A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/8] glib-2.0: Upgrade 2.44.1 -> 2.46.1
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
X-List-Received-Date: Mon, 16 Nov 2015 21:06:29 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c66f5fe0524aec85e

--047d7bdc1c0c66f5fe0524aec85e
Content-Type: text/plain; charset=UTF-8

On 9 November 2015 at 12:43, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Fix cross-compilation build issue in gio tests.
>

glib-2.0-native fails with:

| make all-recursive
| make[5]: glib-compile-resources: Command not found
| make[5]: Entering directory
`/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.46.1-r0/build/gio/tests'
| make[5]: glib-compile-resources: Command not found
| make[5]: glib-compile-resources: Command not found
| make[5]: glib-compile-resources: Command not found

If the host doesn't have glib-compile-resources on.  I guess the patch
needs to say "if cross then use host glib-compile-resources, otherwise use
the one we just built".

Ross

--047d7bdc1c0c66f5fe0524aec85e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2015 at 12:43, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D":5q5" class=3D"" =
style=3D"overflow:hidden">Fix cross-compilation build issue in gio tests.<b=
r></div></blockquote></div><br>glib-2.0-native fails with:</div><div class=
=3D"gmail_extra"><span style=3D"color:rgb(0,0,0);font-family:&#39;Courier N=
ew&#39;,courier,monotype,monospace"><br></span></div>| make all-recursive<b=
r>| make[5]: glib-compile-resources: Command not found<br>| make[5]: Enteri=
ng directory `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm/bu=
ild/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.46.1-r0/build/gio/tests=
&#39;<br>| make[5]: glib-compile-resources: Command not found<br>| make[5]:=
 glib-compile-resources: Command not found<br>| make[5]: glib-compile-resou=
rces: Command not found<div><br></div><div>If the host doesn&#39;t have gli=
b-compile-resources on.=C2=A0 I guess the patch needs to say &quot;if cross=
 then use host glib-compile-resources, otherwise use the one we just built&=
quot;.</div><div><br></div><div>Ross</div></div>

--047d7bdc1c0c66f5fe0524aec85e--
