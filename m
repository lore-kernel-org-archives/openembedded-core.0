Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFE260601
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:21:21 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q108so1104182qgd.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 13:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+Wr3Lcvmlu2MvAkUm1JWq1e95saG1dczipItJrOcpII=;
	b=SoKIzrd55AFOE4nzFlYLkw12dWDuzVu2ZWt4TVTDmcgt3TQ9PxqIXI2PYD7stcGAvu
	jPqcmXXx7LCOwdtFwVx2UrGCVW7ZDI2Ga7IglAnGs1b+rwPFXHXcrYLbuoNFUrUB2d8a
	ZiC2FmhtqhPTxgg0QADagcxyO4Aql+POpHnuF8rHg8GjD1hzqCYZqB7ZRSe3ONHCtGOD
	R8WXj6fsRw0jlGEfBVvAx9KkxAW9ZRicoIJcBENz0mHEBvT13PNl2lj7qQj3fnoAi99G
	MgyhIMIRA4wGbSsfAU1LdfjBxZA7jGwMmps6PR9pG0Pxy+eL3/h/T+HmGS9SD+KyD/+k
	/SZg==
X-Gm-Message-State: ALoCoQn+RtsQ8+rhG22F/ZAzcGHzPl1Wge7f6ZCI0aWIG9xi5WDvP8q2gQ+xJ6BDQuBO68ubzhUO
X-Received: by 10.224.138.2 with SMTP id y2mr40484031qat.52.1416950482501;
	Tue, 25 Nov 2014 13:21:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 25 Nov 2014 13:21:02 -0800 (PST)
In-Reply-To: <1416561434-17862-6-git-send-email-jian.liu@windriver.com>
References: <1416561434-17862-1-git-send-email-jian.liu@windriver.com>
	<1416561434-17862-6-git-send-email-jian.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 21:21:02 +0000
Message-ID: <CAJTo0La7zohMGbqPyJ36rNaNPQq3kdQUi_rHOmRV5WZVKLRiwQ@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 5/5] nfs-utils: avoid overwritting editable files during package updating
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
X-List-Received-Date: Tue, 25 Nov 2014 21:21:24 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c32ca18b0508b57e81

--047d7b6709c32ca18b0508b57e81
Content-Type: text/plain; charset=UTF-8

On 21 November 2014 at 09:17, Jian Liu <jian.liu@windriver.com> wrote:

> Use CONFFILES to mark editable files as such,
>   /var/lib/nfs/etab
>   /var/lib/nfs/statd/state
>   /var/lib/nfs/rmtab
>

Again, why is state being shipped in a package?

Ross

--047d7b6709c32ca18b0508b57e81
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 November 2014 at 09:17, Jian Liu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:jian.liu@windriver.com" target=3D"_blank">jian.liu@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vc" class=3D=
"a3s" style=3D"overflow:hidden">Use CONFFILES to mark editable files as suc=
h,<br>
=C2=A0 /var/lib/nfs/etab<br>
=C2=A0 /var/lib/nfs/statd/state<br>
=C2=A0 /var/lib/nfs/rmtab</div></blockquote></div><br>Again, why is state b=
eing shipped in a package?</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--047d7b6709c32ca18b0508b57e81--
