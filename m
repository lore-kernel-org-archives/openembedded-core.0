Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvXZA-0001gO-1r
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 19:18:29 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so1712876lab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 10:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=GmL2fra5rwwY7W0TU1anbH0Q0UBWZuoLjQ7ZFueHxqM=;
	b=AVudYVSUO5Q1WcaWGxAKGTgM/ox9xcEFcGHzZKUjf4EbGzTQt7K/DHRjbpzZOyboJm
	3YQA3/GpnenhSLuqpeWBQ43FxSwOE0hY0NUXSr64uSe1mk7L97ehrGQgQtJkXHJLr5Na
	//z4hn+Kc8r8gXMRkwz8nADFaKrFmELNIRe+Lr6ZT+7fGat8O+TvIqiuJqM5nSC8RJL5
	/4sIUCGV1XQntgA6xSxmVwhNEK7wpZNGiZmWpKEySQMj4NEOoLC2oeMbVgLSM/OdEaQQ
	mMo90XRaMQsEVxj6b0dU3NVOVrT1kDEc9qsin2XgotMebBPO9uZjNS1d+8DL+BOHE3WI
	421g==
X-Received: by 10.152.103.99 with SMTP id fv3mr2034893lab.16.1358359382096;
	Wed, 16 Jan 2013 10:03:02 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 16 Jan 2013 10:02:41 -0800 (PST)
In-Reply-To: <1358354428.1665.54.camel@empanada>
References: <20130116115800.A69171034D@opal> <20130116140919.GD3002@jama>
	<1358350681.1665.31.camel@empanada>
	<CABcZAN=u7_BGuAQGhYF134PedRq0KkHrgBEtPoN1Tet_T-O6Lw@mail.gmail.com>
	<1358354428.1665.54.camel@empanada>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Jan 2013 11:02:41 -0700
X-Google-Sender-Auth: Pq4XNtGOrhTNA9rC2qWmzO3F2LY
Message-ID: <CABcZANmR8vAcEFwOWBf7PdufdZTCXwWFreegpREWj99EzH1caA@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2013 18:18:30 -0000
Content-Type: multipart/alternative; boundary=f46d04071655727c6804d36bb035

--f46d04071655727c6804d36bb035
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 16, 2013 at 9:40 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:

> This is for the userspace tracing part, lttng-ust, which AFAIK doesn't
> require any kernel patches.
>

Yes, but the point was, as far as I know, the newer ust requires the newer
kernel components, and the older requires the older kernel components, so
technically the package upgrade on a device is likely to change the
behavior.

I didn't say the current version required patches, the point was about the
upgrade path for this recipe. I suspect we're one of the only companies
that was actually using the old recipes, and we don't particularly care
about the binary package upgrade paths at this time, but again, this is
*not* a particularly smooth binary package upgrade path. I expect we're
fine with that, but I wanted make sure it was an explicit conscious choice
of behavior, not something unexpected.
-- 
Christopher Larson

--f46d04071655727c6804d36bb035
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jan 16, 2013 at 9:40 AM, Tom Zanussi <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:tom.zanussi@intel.com" target=3D"_blank">tom.zanussi@intel.com</a>&gt=
;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":az">This is for the userspace tr=
acing part, lttng-ust, which AFAIK doesn&#39;t<br>
require any kernel patches.</div></blockquote></div><br>Yes, but the point =
was, as far as I know, the newer ust requires the newer kernel components, =
and the older requires the older kernel components, so technically the pack=
age upgrade on a device is likely to change the behavior.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I didn&#39;=
t say the current version required patches, the point was about the upgrade=
 path for this recipe. I suspect we&#39;re one of the only companies that w=
as actually using the old recipes, and we don&#39;t particularly care about=
 the binary package upgrade paths at this time, but again, this is *not* a =
particularly smooth binary package upgrade path. I expect we&#39;re fine wi=
th that, but I wanted make sure it was an explicit conscious choice of beha=
vior, not something unexpected.<br>

-- <br>Christopher Larson</div></div>

--f46d04071655727c6804d36bb035--
