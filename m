Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id C141B71E21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 17:47:08 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id p16so113779656qta.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G2oeBUZO7U5OOkU/dJwK5uhSQ4jj6zF3r0fTaVSukC4=;
	b=vhdVNNEpKIx8aFQtpt9phc2gKvRgD1fRVx6MSO/ih8kr7mgmlQaSHQfeahIwjvVaWP
	YnBcM6RcJQn1eFWpHqVDmp11sLo0E0FLY615eY1J8CrCJvML3fQtk1WzuwIPaGiV7Nk7
	FZ5lv48+Em6KkZCCTsIIBW7wPPEP2zmIJ2WY89AyeNEHU6IJBed1oIepMwnX6S5uF+rE
	um8TvV9/e8kle0HGGMxqrsh1iJ31r2JP8EWsoLfWN5TqH/Vu9M0pfCkpA79Gmlz4yVpX
	yBA3Uxhqndecp5lrTfRg4PkWdmUplnq0CNvltjPQLrF+o8wPldwLTfQa7VJaqMCJqQ0B
	pq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G2oeBUZO7U5OOkU/dJwK5uhSQ4jj6zF3r0fTaVSukC4=;
	b=UFqAbGK+PcOX0uOFH7buWzG766ZI3mk33qHJtmq3nQSZxqCh/pfHWlxzbUldKc3op1
	cXsqj174NjAJk2Ze2/0y2SNZkG95fOccfeM7NRQtMdbvL6QSQO33sBW9X7cPzZo6ZQdr
	VSYl9mUgBA4OEY1hE051cb3KdRY9WXHg/8sw9Ka9D2KIfFDIgYxqE6fjd8ke+L3sPiaX
	ANGM6bGw41Si0iP3+fVtmpymwNXsxZX3bIxBRzSlNUGwiglVzvikDpo6glO32TN2YZO7
	Hdn4+NasWUQ+yzWOkpS9CEovgEwnwUZ+D8FfGlR2u542obii7DNgmV+YEzQDHwqPEHoc
	Xw9A==
X-Gm-Message-State: AKaTC01Cqi8pVUvubLGHB46CR3aHsN244EeW8tS2xgtl6YVG6BpxOwWN72mu9oWts24I8bH2au8C7TOmtG3wEt2x
X-Received: by 10.237.37.77 with SMTP id w13mr95586570qtc.197.1481651230006;
	Tue, 13 Dec 2016 09:47:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 09:46:49 -0800 (PST)
In-Reply-To: <CALbNGRSCR4bNEwKmH_cjEdoQqUUyarOJ+zp-0EP2bvFp5LXByA@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
	<CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
	<CAJTo0LZ-3hpYZcibQQX=D6o-wMRZbVeTGVSs9rkKNpEmOoqoZg@mail.gmail.com>
	<CALbNGRSCR4bNEwKmH_cjEdoQqUUyarOJ+zp-0EP2bvFp5LXByA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 17:46:49 +0000
Message-ID: <CAJTo0LazOcewXGiXoqrtxVTt=3994exQPwaf=DnqLkJRYP39qg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 13 Dec 2016 17:47:09 -0000
Content-Type: multipart/alternative; boundary=001a114108ea3eed8805438dcfe3

--001a114108ea3eed8805438dcfe3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 December 2016 at 17:46, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> I thought wayland depends on wayland-native already. Is it possible
> that you don't have wayland in your DISTO_FEATURES - honestly have not
> tested that on a machine with missing wayland-scanner.
>

If wayland comes from sstate then it won't pull in the native dependencies.

Ross

--001a114108ea3eed8805438dcfe3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 17:46, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":5il" class=3D"a3s aXjCH m158f94ae3e3de040">I thought wayland depe=
nds on wayland-native already. Is it possible<br>
that you don&#39;t have wayland in your DISTO_FEATURES - honestly have not<=
br>
tested that on a machine with missing wayland-scanner.</div></blockquote></=
div><br>If wayland comes from sstate then it won&#39;t pull in the native d=
ependencies.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a114108ea3eed8805438dcfe3--
