Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA8373FE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:47:44 +0000 (UTC)
Received: by widdi4 with SMTP id di4so157441332wid.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=0Ey9/zpnGUy9lxOL9SOVkg01VWuPe2HZ0JdcDHDYpCU=;
	b=EN7y2h5jEHhWaskR0StdHc/SkghDz317bGZ5a7FziLQFZB34zn1I9efl2qJ7I0flIE
	jcDfa74LctTtoxdiV0YcVyCeSZe69f74/WF5VVxHd64KJkY0/Xcc6et3VVN5tas1kbHj
	U3nUvmwd7XwqeECB6xY4+e2e2tqmm7t0z0B1CsNqM4V19q5XAAkCJvhD7fL+KMD+dAdZ
	+f4WZ2FjOSRBkrUskLigYZ2z2hJWWIMOEJtYzoGPgVV2btfg0/hxmYKNmJEC4Wc57dpe
	KrQDZZwThLf54oORba6m7AKV5MSoYvKrCur2prMh9uW7t+AG2w44Do4LbrLPh5jX5dMi
	0LmA==
X-Received: by 10.194.62.132 with SMTP id y4mr31028926wjr.91.1431442065088;
	Tue, 12 May 2015 07:47:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id js3sm28100088wjc.5.2015.05.12.07.47.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 07:47:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 May 2015 16:47:49 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150512144749.GD2714@jama>
References: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>
	<CAJTo0LZUd4bcbfTL+TbtiXOU1wc9ZaFGP0mTM_Y0hVMb1eMqWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZUd4bcbfTL+TbtiXOU1wc9ZaFGP0mTM_Y0hVMb1eMqWg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND][PATCH 1/3] meta: add new qemuarma9 machine definition
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
X-List-Received-Date: Tue, 12 May 2015 14:47:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 03:25:43PM +0100, Burton, Ross wrote:
> On 11 May 2015 at 20:52, Dmitry Eremin-Solenikov <dmitry_eremin@mentor.co=
m>
> wrote:
>=20
> > Currently qemuarm is limited to 256 Mb of RAM. Sometimes this is too
> > little to run necessary applications. Add a new arm configuration based
> > on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of RAM.
> >
>=20
> Not sure I'm keen on oe-core having two almost-identical qemuarm machines.
> Why not just change the qemuarm machine to use the A9?

Then we should officially drop thumb1 support, because current qemuarm
builds are quite broken when thumb is enabled and dropping current
qemuarm or replacing it with A9 variant will prevent oe-core to be
testable on autobuilder. See
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

