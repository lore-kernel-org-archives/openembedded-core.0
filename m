Received: from mail-lb0-f170.google.com ([209.85.217.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvVRg-0006Dv-2W
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:02:47 +0100
Received: by mail-lb0-f170.google.com with SMTP id j14so1151669lbo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=z7kIz7XprO9R8iBtPIFscw+vHK3Gf0oLILrf0H4WnYc=;
	b=qVh1jeZNAw3wh/PUKnMdyJoF1Yr/nG6TBFd5kEEl5pjf0aly0B/LqHcrX0oLWwJVnc
	UnQWO4TYX6BftiMRMdcXccinUQ+EqsF4Lmvm9GaAuopB3PGdaMArYiC0eTOm/r1b/tmS
	O94Wt24V+bnHlXNaXpMFO4dB1N5qcwPkB+o5enI8l8ESyyGA0t7z02QrsbluP8/zBujE
	7fYe33RbhYJnEkM+CrZbWnikb0vBdccotTWd4cD+NcZFb+aj4BA7b9BvFLs6+QVj30hz
	UU0eSibsaHIEyr3Rg72BW2F109y1LLHAR8bNz/DSLrWQEqfNfXpntGkPY3VH1vyYsdpp
	zEHA==
X-Received: by 10.112.49.202 with SMTP id w10mr831590lbn.2.1358351230164; Wed,
	16 Jan 2013 07:47:10 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 16 Jan 2013 07:46:49 -0800 (PST)
In-Reply-To: <1358350681.1665.31.camel@empanada>
References: <20130116115800.A69171034D@opal> <20130116140919.GD3002@jama>
	<1358350681.1665.31.camel@empanada>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Jan 2013 08:46:49 -0700
X-Google-Sender-Auth: DVlEeHOfq3eIxc6YXBK72NOjhVo
Message-ID: <CABcZAN=u7_BGuAQGhYF134PedRq0KkHrgBEtPoN1Tet_T-O6Lw@mail.gmail.com>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Tom Zanussi : lttng2-ust: rename to lttng-ust
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 16:02:47 -0000
Content-Type: multipart/alternative; boundary=bcaec554daa28ddfe104d369ca43

--bcaec554daa28ddfe104d369ca43
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 16, 2013 at 8:38 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:

> > lttng-ust had PE="1", bump PE to fix upgrade path:


Technically, that isn't going to "fix" the upgrade path. lttng 1.x requires
kernel patches and isn't compatible with lttng 2.x, as far as I'm aware. So
any machine with lttng 1.x that upgrades to this wouldn't be a real
'upgrade', it would switch interfaces, and potentially break compatibility
with the kernel running on that device. At mentor we have bsp layers for
1.x and for 2.x, and both work. I'm glad we aren't binary package feed
based, or we'd be in serious trouble with this.
-- 
Christopher Larson

--bcaec554daa28ddfe104d369ca43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 16, 2013 at 8:38 AM, Tom Zanussi <span dir=3D"ltr">&lt;<a href=
=3D"mailto:tom.zanussi@intel.com" target=3D"_blank">tom.zanussi@intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">&gt; lttng-ust had PE=3D&quot;1&quot;, bump =
PE to fix upgrade path:</blockquote></div><br>Technically, that isn&#39;t g=
oing to &quot;fix&quot; the upgrade path. lttng 1.x requires kernel patches=
 and isn&#39;t compatible with lttng 2.x, as far as I&#39;m aware. So any m=
achine with lttng 1.x that upgrades to this wouldn&#39;t be a real &#39;upg=
rade&#39;, it would switch interfaces, and potentially break compatibility =
with the kernel running on that device. At mentor we have bsp layers for 1.=
x and for 2.x, and both work. I&#39;m glad we aren&#39;t binary package fee=
d based, or we&#39;d be in serious trouble with this.<br>

-- <br>Christopher Larson</div></div>

--bcaec554daa28ddfe104d369ca43--
