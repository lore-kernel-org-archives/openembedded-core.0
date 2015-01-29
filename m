Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3503E6013C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 19:59:29 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so33328498qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 11:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qTwltpFlcW899OHSyGdf18Bwo1VZW/x//8FnoOK39qs=;
	b=iZPk4aG7VWkPykhnp30USDm5qFxv8369wSoMSmfw+DJ4UCO6azxQSfMykUPhD0f4zL
	q7fbFojkcWkrMPewawg2ulEVaHrpnWRR3QSdJP/+C1wMq3RAQwA3Kdc4XoIAaxAUgFbh
	TJAVxCtddkoLcMiPd/wJqFdplhwjbAxdPMH+kLa7sVXveSGC8/lG7EWkJohTcI2uQtDw
	Z+XHucdXp+SoxIxPvFqAIBuAoBbHJKjt/nM0Fa37CLsU9V3PU5Gdg9NN6H6nReeqPGC3
	+ZmMC/VV93XCNIoLvomGxkBEbqM8nLdwJUkuizPN2phOGGmrCLIWEczRUj/LMYKD94gE
	sLzg==
X-Gm-Message-State: ALoCoQnFDF6+FE8JVyD806TosV4wezpc1et9WNvJaloBO+vEg22ZSRXO1xEfWDDkETdsm5wK7QCA
X-Received: by 10.140.21.48 with SMTP id 45mr4284954qgk.87.1422561570133; Thu,
	29 Jan 2015 11:59:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 11:59:09 -0800 (PST)
In-Reply-To: <20150129193358.GB2517@denix.org>
References: <0NIX00GV1Z8KO910@vms173019.mailsrvcs.net>
	<20150129193358.GB2517@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 19:59:09 +0000
Message-ID: <CAJTo0LYQp-tMeY+1+0tpwJ0kBZccMSWtYu1e2Tnk96RBtCYbhw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Thu, 29 Jan 2015 19:59:35 -0000
Content-Type: multipart/alternative; boundary=001a11c129940f2dcb050dcfed89

--001a11c129940f2dcb050dcfed89
Content-Type: text/plain; charset=UTF-8

On 29 January 2015 at 19:33, Denys Dmytriyenko <denis@denix.org> wrote:

> >    I believe I had that in DEPENDS... I'll check.
>
> So, yes, the patch does have DEPENDS = "openssl"
>
> Does it become openssl-native due to BBCLASSEXTEND = "native"? Or do I
> need a
> separate DEPENDS_class-native?


Unless you have an explicit DEPENDS_class-native assignment, openssl will
become openssl-native.

Ross

--001a11c129940f2dcb050dcfed89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 January 2015 at 19:33, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt;=C2=A0 =C2=
=A0 I believe I had that in DEPENDS... I&#39;ll check.<br>
<br>
</span>So, yes, the patch does have DEPENDS =3D &quot;openssl&quot;<br>
<br>
Does it become openssl-native due to BBCLASSEXTEND =3D &quot;native&quot;? =
Or do I need a<br>
separate DEPENDS_class-native?</blockquote></div><br>Unless you have an exp=
licit DEPENDS_class-native assignment, openssl will become openssl-native.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11c129940f2dcb050dcfed89--
