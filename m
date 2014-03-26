Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 494896ED4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 23:27:16 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lc6so3238091vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 16:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=jXn6HQncSQKw1AVE41y2OjAHz2DRUQhvEkoZ5cVjlIA=;
	b=H9+GO+j8kV88ir1e9sOSH8U1A8wTOZfPtfUqZYYXnNu3ICtArSTyu2sJla7iptg/uS
	RjXhlN/ss4y5VXI7zOoma4YUEmDmo5OfByJxuDqqpphjW9wv5skeFs+tR61SjHICrR7V
	SFkjawa4viptFKfcNKASx4DB5ZlcThXnnyA8nxWZ0wtpKBqajZyGxullnfQ9qeK6TFiM
	ZOkeHG/CQgQgEMf0E2ZBMUwHxXsO/nH5L2klmCYUsr3t5Yj+DD9zLAAJ7+1bUwFuUX3L
	4hWvYvi8e+iSMxUMFOgnxqOPVLTGI9a7yJ3v5sA2u6MgWRguiFZ/pdaePOPTHkc1nu+I
	MbOQ==
MIME-Version: 1.0
X-Received: by 10.52.130.225 with SMTP id oh1mr18616461vdb.8.1395876437459;
	Wed, 26 Mar 2014 16:27:17 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Wed, 26 Mar 2014 16:27:17 -0700 (PDT)
Date: Wed, 26 Mar 2014 16:27:17 -0700
Message-ID: <CAFeBWL6Fa7mPHQ9RSNU49hsMxSs5G-55Tb5LLnpUiOS4TyXuiQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Question on linux-yocto-custom
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
X-List-Received-Date: Wed, 26 Mar 2014 23:27:19 -0000
Content-Type: multipart/alternative; boundary=bcaec520ef3b34884b04f58acfca

--bcaec520ef3b34884b04f58acfca
Content-Type: text/plain; charset=ISO-8859-1

Good afternoon everyone,
I got a quick question here: the example recipe linux-yocto-custom.bb in
meta-skeleton has these two lines:


inherit kernel
require recipes-kernel/linux/linux-yocto.inc


And I am trying to figure out if we must define 'inherit kernel' in this
recipe. Looking at linux-yocto.inc, it already contains the same line.

Is it important where we inherit a class?

Thank you,

Adam

--bcaec520ef3b34884b04f58acfca
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good afternoon everyone,=A0<div>I got a quick question her=
e: the example recipe <a href=3D"http://linux-yocto-custom.bb">linux-yocto-=
custom.bb</a> in meta-skeleton has these two lines:=A0</div><div><div><br><=
/div>
<div><br></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0=
px"><div>inherit kernel</div><div>require recipes-kernel/linux/linux-yocto.=
inc</div></blockquote><div><br></div><div>And I am trying to figure out if =
we must define &#39;inherit kernel&#39; in this recipe. Looking at linux-yo=
cto.inc, it already contains the same line.=A0</div>
<div><br></div><div>Is it important where we inherit a class?</div><div><br=
></div><div>Thank you,</div><div><br></div><div>Adam</div></div></div>

--bcaec520ef3b34884b04f58acfca--
