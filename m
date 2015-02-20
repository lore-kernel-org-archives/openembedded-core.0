Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9B34171F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 20:14:17 +0000 (UTC)
Received: by qcyl6 with SMTP id l6so2648115qcy.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uTFACRlXoDOE49f3paQ9S7jDTmR3YFOfY0xaWkyhBAA=;
	b=SuwWSjDxjZYFTkKOB+q8pK/d/utJiPMtr0xRwPyK3evmFMBDWWntaTYkkbfpmqd+vd
	YjPEtKlX7/p9KRH1purfHByc9opj8atQry9sH/Yr57xDW97GY+VVSYvGWCEmjUJkqXbG
	3xYV5mxa8OGUgNyU4rJ2J2KkoT1noAoVQCiVPedoRpkHtnwU7Rp2lq5gyd6ghJiJAqHX
	kiK8Y8urwkI9vXg9aszVAKptA62JJNKpwNzG5icQVQVHLtRoykosbU5YdbVhLnfcAlHu
	xLs95JgkwzDSvIKGTrDPUtuUEOICkPxqUsZOJC44xN4D0MmOLeGsUtl1Hpd7YrSoPvau
	p3qg==
X-Gm-Message-State: ALoCoQlkwOohNtflzgwcaCxnhr6YbfyJZ9mOjTu/WjRMXkHOPAUAR687OCeTkRG3I9WejJ5UzHY/
X-Received: by 10.229.191.3 with SMTP id dk3mr23452898qcb.30.1424463258736;
	Fri, 20 Feb 2015 12:14:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 20 Feb 2015 12:13:58 -0800 (PST)
In-Reply-To: <20150220195235.GA5382@bshelton-desktop>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
	<87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0La=KuSp2anpGk3=6GPaq_ksWHY1NmOBi9VQ31K=uVjSVQ@mail.gmail.com>
	<20150220124501.GB2322@jama>
	<1424436603.11836.42.camel@linuxfoundation.org>
	<20150220143657.GI2322@jama> <20150220152718.GA27210@bshelton-desktop>
	<20150220195235.GA5382@bshelton-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Feb 2015 20:13:58 +0000
Message-ID: <CAJTo0LaTN=PEYo9dDzdur7DNesaLbrShRr6SuBijWNBSk4FEow@mail.gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Fri, 20 Feb 2015 20:14:24 -0000
Content-Type: multipart/alternative; boundary=001a11339d6a8871ce050f8ab2ce

--001a11339d6a8871ce050f8ab2ce
Content-Type: text/plain; charset=UTF-8

On 20 February 2015 at 19:52, Ben Shelton <ben.shelton@ni.com> wrote:

> I submitted v4 of the patch series.  Note that with these three patches,
> the commit that's in question here, 'font-util: Fix incorrect
> PKG_CONFIG_PATH', is still needed and should not be reverted.
>

And they'll be running on the AB shortly, thanks Ben!

Ross

--001a11339d6a8871ce050f8ab2ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 February 2015 at 19:52, Ben Shelton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ben.shelton@ni.com" target=3D"_blank">ben.shelton@ni.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":42t" class=3D"a3s"=
 style=3D"overflow:hidden">I submitted v4 of the patch series.=C2=A0 Note t=
hat with these three patches,<br>
the commit that&#39;s in question here, &#39;font-util: Fix incorrect<br>
PKG_CONFIG_PATH&#39;, is still needed and should not be reverted.</div></bl=
ockquote></div><br>And they&#39;ll be running on the AB shortly, thanks Ben=
!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a11339d6a8871ce050f8ab2ce--
