Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB5260097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 11:52:23 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so4177474qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 04:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GOGZ5GrPcDMqG5VkJOaj9KVRNN7oCBOrZg7NhSeSlLY=;
	b=RWcYVcAVOAZDv6XUegKffG9OO4OdgJNVfYfrvZHxGDT/8Y7BXNp6yOu7AMeFbZBJNa
	SvBB41qU8DjN+pO3yxgolGHumdXmq/8A3jmybxLBILDuqH8EtgNBUv6snQ0H/R/6fMyi
	UD1gwqMknw16wNLDN1/p1mVvZNVXmnSKkR7d4EqK8UG5NM0JoW2y305sgKiBFPoznAx3
	IW7/ZYB/5FFCu5igDalwDn/wyRem8vJMOYf41MqVwbP7jdoTpvvLRtMKk6FKxwHrbQHy
	2HOhSI13UeYqJmjsLdadAiybCWCEtQWzst3RNxMBzsX12cyQCyutIJ0ATS61jYuHg/SF
	B47w==
X-Gm-Message-State: ALoCoQmlqrYiHJHUQJ9aCZlKm1WbCdYF6BzEwL3fdZTYwtaISibFi7CBFOK78mkD7QQ8E19u1dGx
X-Received: by 10.140.133.199 with SMTP id 190mr36939914qhf.17.1434369144830; 
	Mon, 15 Jun 2015 04:52:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 04:52:04 -0700 (PDT)
In-Reply-To: <135be24d84523a7ccfc166283a659109f238c713.1434013682.git.liezhi.yang@windriver.com>
References: <cover.1434013682.git.liezhi.yang@windriver.com>
	<135be24d84523a7ccfc166283a659109f238c713.1434013682.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 12:52:04 +0100
Message-ID: <CAJTo0LZgSPeeWf02swV4d7Aq_XxdywM+kogYboMuvTRUtAD66w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libpcap: fix PACKAGECONFIG
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
X-List-Received-Date: Mon, 15 Jun 2015 11:52:27 -0000
Content-Type: multipart/alternative; boundary=001a113533905ada7a05188d1708

--001a113533905ada7a05188d1708
Content-Type: text/plain; charset=UTF-8

On 11 June 2015 at 10:08, Robert Yang <liezhi.yang@windriver.com> wrote:

> The BLUEZ is default to bluez5, but there is only PACKAGECONFIG[bluez4],
> no PACKAGECONFIG[bluez5], and the current version of libpcap (or the
> higher version 1.7.3) only supports bluez4, we can't use
> ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
> for PACKAGECONFIG any more since BLUEZ is default to bluez5, and not
> supported, and there is no bluez4 in oe-core any more, set PACKAGECONFIG
> to ""
> by default, other layers where bluez4 is available can enable it via
> bbappend.
>

So the point of this logic is that simply removing bluez5 from
DISTRO_FEATURES results in bluez4 being enabled where relevant, which
you're removing.

Would a better fix would be to have a dummy (empty) bluez5 stanza?

Ross

--001a113533905ada7a05188d1708
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 June 2015 at 10:08, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":gy" clas=
s=3D"a3s" style=3D"overflow:hidden">The BLUEZ is default to bluez5, but the=
re is only PACKAGECONFIG[bluez4],<br>
no PACKAGECONFIG[bluez5], and the current version of libpcap (or the<br>
higher version 1.7.3) only supports bluez4, we can&#39;t use<br>
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluetooth&#39;, &#39;$=
{BLUEZ}&#39;, &#39;&#39;, d)}<br>
for PACKAGECONFIG any more since BLUEZ is default to bluez5, and not<br>
supported, and there is no bluez4 in oe-core any more, set PACKAGECONFIG to=
 &quot;&quot;<br>
by default, other layers where bluez4 is available can enable it via bbappe=
nd.</div></blockquote><div><br></div><div>So the point of this logic is tha=
t simply removing bluez5 from DISTRO_FEATURES results in bluez4 being enabl=
ed where relevant, which you&#39;re removing.</div><div><br></div><div>Woul=
d a better fix would be to have a dummy (empty) bluez5 stanza?</div><div><b=
r></div><div>Ross</div></div></div></div>

--001a113533905ada7a05188d1708--
