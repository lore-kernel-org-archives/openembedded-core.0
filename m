Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 871347D10A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:50:45 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n11so1980728ioh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F/8jTSsnBEBKqm57l0z5rZM7xqRyjtQmD1GvMKMIcWA=;
	b=I1bfO88Ju54qu/gA16OFoEF1eUx02tIVFZa/FMTNaHylsLPE9ryfvarsbiuOyrZE7Y
	rSMZI+feOqaYHerKHyys4DkXRH1K61iuVzlIoqRWuYs1YZB42RnbKHA2tRS0eF4r76hg
	lARERqHBV8N408CM9O+WsBJd6TbjBPvoUmiBgZiZQAM6YTUpCtgyoGTfuV3BPajfMVwW
	QS7oWwJh7QSktuMHmlmqrTSnm5+HNNfvv11XosWuMsSl9BrPlla8F4raT8/EXwhYLeof
	7FmRWGZpHykfMn8r3NUAaeWM/Lc8ZmBuOArHKGVaBy7Xo5huDqt9J0qJ+MAF0z3wGWcb
	xrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F/8jTSsnBEBKqm57l0z5rZM7xqRyjtQmD1GvMKMIcWA=;
	b=t04I5yZpBozlxP2edodShwv+j6Zh+LzYDxvod7KB/U8YSG3IIEAGUAhHlPV1jBtF2Z
	Y8UDgU1poBo/+pVp2DdCls0R7WzENSi4GB9Lbl2uNPHDg+3mxgzotVMxld2sK7gzawbn
	i5qj0AeavNTsEf9jIzv7eIlSQ47N2zkhtME+O8fO05QiJw0ap1rWHODC9cy+8FncUO7k
	H/jvN1SHHQRqELrekFRrLKx9iEeoPQsjG4W2mfNvmTKRC4BusugYO8MpXEONl8tNHwPn
	dSPIPAVe9wvyS1XKGdbN1KWQO+vYfTlBk0Z2J6BPBvxYRM1z+KfRI9qBqvUtppaQnc8z
	L0YQ==
X-Gm-Message-State: APjAAAUNt9mNSLcvYHJz98Yi3LATqNlTyx7JlL/h2M2RqEkeDRGCXh1R
	sDt2Kww718Mg56mKBGFMCFS83xxE3iOQwqxl3VU=
X-Google-Smtp-Source: APXvYqyqrgkCtsnBXJ4WlQLjDWDB3JvkcX8zgoSRtP8xgPQvCcxr3GDpYGLg0UUqEYLYhNQ1lTLlseTZSgsds+JnstE=
X-Received: by 2002:a5d:8441:: with SMTP id w1mr564598ior.99.1553871046659;
	Fri, 29 Mar 2019 07:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
	<CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
	<CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
	<CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
In-Reply-To: <CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 29 Mar 2019 15:50:34 +0100
Message-ID: <CALbNGRRu-VFXsZVLU9HeQx232-oDPxRVDKG4EjCvaXhLe87QSA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 14:50:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 3:34 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 29 Mar 2019 at 14:29, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> > Thought same. Are you sure that does not link - or can you explain how
> > DEPENDs fixed adwaita: If it does not link: How comes that librsvg
> > makes it into adwaita's native sysroot?
>
> I suspect historical about how the sysroot is populated for native
> things, as until very recently RDEPENDS wasn't considered.
>
> (oe-core c62520b63284927e177831c351fafa4d2768cb1f)
>
* Think I had this patch in my builds - whatever
* The patch you just sent: Doesn't adwaita-icon-theme need a rdepend
on librsvg then? If so it is another allarch rdepending on arch
recipe...

Andreas

