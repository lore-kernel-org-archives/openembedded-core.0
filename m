Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 526886007B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 17:52:00 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id k7so3842337oag.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=hCNkcBDzrXjpQ9LjobgV58GsiqJ3p2vFph6eTIRS+eY=;
	b=xTVX9mh2jVHAE251G6l4TC1e5SIRQO4BTSrorbAAQCQXmOz1V887hUZ668BmDsqJ/x
	AKGV/9Kp51ThvxJPSlftY5BsonI1ZTY7E7KDm+n2f8ikztaL43TwykspW534JvHovqPb
	HKSono1r6jjgMvEZ9QvihfbfYsS7GlY6vt7q0O/bvUO2gkF6h8tqut7op1q8+V/tJngW
	R2wd+PuSyIJRA/2q44yoDH7+xL13kDvfRftK2b3UdLDuHqAOV0QgcmV2ashlPvyYAmiJ
	Z6WYhqG3u8rDTKwDyjFfVyLSqIbKLiNV9VOS7n354RLk4CdgWsFnKKoeVFTy6fUjd2df
	HBuQ==
MIME-Version: 1.0
X-Received: by 10.60.55.10 with SMTP id n10mr3880851oep.45.1371491521268; Mon,
	17 Jun 2013 10:52:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 17 Jun 2013 10:52:01 -0700 (PDT)
In-Reply-To: <4caf51c1d2225dc66aeef8326ba0616d97f7c691.1371447869.git.Qi.Chen@windriver.com>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<4caf51c1d2225dc66aeef8326ba0616d97f7c691.1371447869.git.Qi.Chen@windriver.com>
Date: Mon, 17 Jun 2013 14:52:01 -0300
X-Google-Sender-Auth: bFOX_jCf5h6CW9CZaz9oExtdH_c
Message-ID: <CAP9ODKrhOpbGDXmU0Qhec5GJvzr1FFVv8TXdtT=AMJiOk-A2Rg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/9] busybox: remove the postinst part of the recipe
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
X-List-Received-Date: Mon, 17 Jun 2013 17:52:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 17, 2013 at 2:49 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Remove the pkg_postinst_${PN} from this recipe, as it's redundant.
> It basically wants to do the same thing as the update-alternatives
> does. But it doesn't do it well.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Most of patch 1 and 2 should be merged; here you should drop the
postinst and convert these to the update-alternative way so we don't
have the tree broken after this patch and allow for bisect  to be
used.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

