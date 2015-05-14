Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6C48973F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 11:39:47 +0000 (UTC)
Received: by wgin8 with SMTP id n8so72394933wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 04:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=mBDm3yXAN+KiYu45jMakQAsxv8Z2Z/mjjgnfQ48vT8s=;
	b=nTrX6JLiJyxw+wi1Nc2nVE+YtI1ylbdarAC9O+y8u2xjp6ehr2hVPcLAoViKXKEfF6
	eI0smQzALPjMmVTQZxgBjbqJZBhLFnZqABYbq4sJjF/qlMUFLB0OxsGZOcpRn9cOMPkw
	PFleAqPTwc17t8+8X4XEUGMsLgPt/k0F6edcMU0bzFmQnU6tnKLVXbKP0J7TNIne15DH
	BlvYrsqPlzjH8V8VB/0fM6MF/uX40ZQNR54ZFGIfatMO9P2ijY2YHx6aWSU/Zf1rbgsa
	Zk+7Ix+Wz7ziL4srLOtsZF6e1EEDpPR5sl5vdcxJBhl02hc17wYVfIoq31C/kOEGJt4f
	dfqg==
X-Received: by 10.194.24.70 with SMTP id s6mr7360803wjf.25.1431603588655;
	Thu, 14 May 2015 04:39:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id u3sm37754330wjq.36.2015.05.14.04.39.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 May 2015 04:39:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 May 2015 13:40:02 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150514114002.GA2402@jama>
References: <1431520254-31607-1-git-send-email-Martin.Jansa@gmail.com>
	<1431600497.30971.208.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1431600497.30971.208.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable thumb where it fails for qemuarm
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
X-List-Received-Date: Thu, 14 May 2015 11:39:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 11:48:17AM +0100, Richard Purdie wrote:
> On Wed, 2015-05-13 at 14:30 +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc_4.9.bb               | 23 ++++++++++++++=
++++++++
> >  meta/recipes-devtools/guile/guile_2.0.11.bb        | 19 ++++++++++++++=
++++
> >  meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  5 +++++
> >  meta/recipes-extended/mailx/mailx_12.5.bb          |  4 ++++
> >  .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |  9 +++++++++
> >  meta/recipes-support/libunwind/libunwind_1.1.bb    |  6 ++++++
> >  6 files changed, 66 insertions(+)
>=20
> As mentioned on the bug relating to this, I think we should create an
> include file which sets the values as needed for these recipes rather
> than adding the quite long comments to the recipes themselves. This is
> similar to what we do where we know there are security flags issues for
> example.

Is it OK, to put overrides for recipes in other layers to .inc file in
oe-core? If yes then I agree and will convert this into .inc file in
conf/machine/include/ (included by default for thumb1 machine tunes)


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

