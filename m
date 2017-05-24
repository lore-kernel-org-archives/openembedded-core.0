Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9E360557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 22:08:38 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id y201so165046697qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 15:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UngiohbRE2qK7Qsgye5Dwp+uFJtBY3U9K/oqIxdvqSw=;
	b=l75MX9n+DpzST7wLzlssFW4jDzqQSNbPBeqAUMsD+VNY7d6RmBsXM/Mm8xDi7kqJjP
	g16DJvT1HukN/CiwS8LsAnugILcNH0FMygGakV376ZA0tgs9jQIMHQB3EdM8/HHqg0GX
	uZR6bDDmctVr2aA91Xhi6iDBvBPCcXUh5Rx3SSaXIIWIIYUZFoAa2Hnufjd5NCIPcJ7c
	BbjLamKBevhmu1DNbWT0r20UrcXZ/f8ugA/pksGwHE4QQATK3pEwVJ5C+mJZkk8kMWNi
	0t9B3iSgixkWIAiZu717zl8KNlSciQ2M7HY8VVLjVhIAOs8oN9PjEXOtFuDlJEGeLCLw
	Qnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UngiohbRE2qK7Qsgye5Dwp+uFJtBY3U9K/oqIxdvqSw=;
	b=TzvgTOafrQgaUb+1HCljtswJls/haTDkSbOquOWeXcx469wz73L3kQGj8OJP4lEcLV
	c5UgDHCep1tgDWf/Ux0TWFjaBVq9yqpP8OJ5WTkZrIwl+Ve9Dzsfz+MB43BuKo4inypL
	vMPPv5Cbhe5g34cwOQDrjYdH5x9e2S82qF8mTODoQHbOVe3qyk+duImDZbZr0BBo/yoG
	5TSf0vTBc8w0hFXoxdRHpB6cur3e6vPovSSfHR3dk+eZO+ws+ejLMLGnxcev4srbtGak
	QeD1e7ApnxxebuTL7Rs1fLjXpKEzFeEO+Y4XEfPZYN3F2yYZUfkItTYKp+1jsr0qxGq0
	o+pw==
X-Gm-Message-State: AODbwcBDRR+SWYRFrI3J/SVw3tEpX+NUlok9C0B9qh1z5Tzl/DR3eroA
	ZNU7b+iveS86x6UdIKn3ReYK7QcuWsxp
X-Received: by 10.55.116.133 with SMTP id p127mr31446934qkc.154.1495663720097; 
	Wed, 24 May 2017 15:08:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 24 May 2017 15:08:19 -0700 (PDT)
In-Reply-To: <1495658864.26945.1.camel@linux.intel.com>
References: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LaJrNTwML2jQbPR+p5y3EOnwm=D2nDiD5VcHtfer8m+gA@mail.gmail.com>
	<1495658864.26945.1.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 May 2017 23:08:19 +0100
Message-ID: <CAJTo0LZUsLuPFgEb-G79VVhBxsNKstenHgk_V-njU51YRGotAg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] package_ipk: correct ipk descriptions
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
X-List-Received-Date: Wed, 24 May 2017 22:08:40 -0000
Content-Type: multipart/alternative; boundary="001a114fde72bd83cb05504c5826"

--001a114fde72bd83cb05504c5826
Content-Type: text/plain; charset="UTF-8"

On 24 May 2017 at 21:47, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> I will check that particular recipe and bb world just so see if some
> other recipe is broken with this change, then provide a v3.
>

And double check what opkg expects :)

Ross

--001a114fde72bd83cb05504c5826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 May 2017 at 21:47, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=3D=
"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leona=
rdo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div id=3D":16x" class=3D"a3s aXjCH m15c3c2f6ab05abe0">I=
 will check that particular recipe and bb world just so see if some<br>
other recipe is broken with this change, then provide a v3.<br></div></bloc=
kquote></div><br>And double check what opkg expects :)</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114fde72bd83cb05504c5826--
