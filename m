Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1883C65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:41:10 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so70863240qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4mTyQrjx4MPyzQ+MozykqoksRAcJxDhKBF2260h08fI=;
	b=EHRtjhVfoJTG/RfxKvOet8D+BHVOYD7GHSfFL2P3cfLvwoXa7LnNNSjJNa3PItT/rC
	AeD7mWTGmK7PI9EkCcCvsTlONCjldSv/1c/Av21Uy46/eRMVcl5D7vmR/ZYfw8SllfC2
	sOdMgWmqjUiEmr/btjGMwZhU4I5mtVbdNtk6SgKy7NLW0qM1Y5Qk36nNMsRMY4O2vb8V
	7sEO7isAP1PmybUogHFsqMwh1+zCpG3Y7gt003vT4rnuzJKF9uLyWEnEpktvXKFc/XGK
	ip6es1hnYZTq+EdCIi4b7QBF+9rno2uapkDH4WuOiM+Rqo7kEC8VGQyX4ar8CbLeG570
	a4Rw==
X-Gm-Message-State: ALoCoQnijN06MNyYUZLFr0DDBc5Om09iMNbkWrIOaaZlJ0kQea8sONagxjd4UyW0I7i3+ixBkFKE
X-Received: by 10.55.15.129 with SMTP id 1mr25992511qkp.29.1437144070397; Fri,
	17 Jul 2015 07:41:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 17 Jul 2015 07:40:50 -0700 (PDT)
In-Reply-To: <042E875E1B5D414CA9BB78B7D4FA691C287EAE73@IRSMSX107.ger.corp.intel.com>
References: <1437142674-8167-1-git-send-email-george.l.musat@intel.com>
	<CAJTo0La3bqO7ssvWgRKTFNm9K1WU-zAnmZ-69_1o7Q56A6Ze2w@mail.gmail.com>
	<042E875E1B5D414CA9BB78B7D4FA691C287EAE73@IRSMSX107.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 15:40:50 +0100
Message-ID: <CAJTo0Laa7JVVdJATFcpvMzd4C02TRoP9=QOzSdc3VFfZwk__4w@mail.gmail.com>
To: "Musat, George L" <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added skip condition to kernel module test
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
X-List-Received-Date: Fri, 17 Jul 2015 14:41:11 -0000
Content-Type: multipart/alternative; boundary=001a1146f100ceb2f6051b132d22

--001a1146f100ceb2f6051b132d22
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 July 2015 at 15:32, Musat, George L <george.l.musat@intel.com> wrote:

> The test case causes =E2=80=9C/usr/src/kernel: No such file or directory=
=E2=80=9D error when running in LSB images because they don=E2=80=99t have =
kernel-devsrc it seems. It=E2=80=99s not really a bug but the test code had=
 to be a little customized to skip when in a LSB image.
>
> That sounds like something we should fix in the images built for QA
purposes... what images do these tests work and fail on?

Ross

--001a1146f100ceb2f6051b132d22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2015 at 15:32, Musat, George L <span dir=3D"ltr">&lt;<a href=3D"=
mailto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><pre><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f49=
7d">The test case causes =E2=80=9C/usr/src/kernel: No such file or director=
y=E2=80=9D error when running in LSB images because they don=E2=80=99t have=
 kernel-devsrc it seems. It=E2=80=99s not really a bug but the test code ha=
d to be a little customized to skip when in a LSB image.<u></u><u></u></spa=
n></pre>
<pre></pre></blockquote></div>That sounds like something we should fix in t=
he images built for QA purposes... what images do these tests work and fail=
 on?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1146f100ceb2f6051b132d22--
