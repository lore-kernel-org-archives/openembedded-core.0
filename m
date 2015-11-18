Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 101C260043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 22:50:27 +0000 (UTC)
Received: by igcto18 with SMTP id to18so50148846igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/oRuPo5o8MC5GC9QoYrEDmnjtKd4O47+WbRMbRVDYyQ=;
	b=lTuyPPYHPJXD399vIjmwBoq9gF0EADtkgRuIoN01JzqFmhZv8akRnudUjOclILlhJ7
	LOMgP1ffgZkI2+hinoqcFazNPMrVEMi5dFGQxmsSsHpAQkGqVSogbKT8moTwN9RM1yZ4
	lh510p4DXQ8u6mPd1vUYeoXE0ghFdh22T/4FoHd0rJMjjMroMrOD8cm3QaUBwYC11wtG
	8AISUr7zuxd47bsXx7jMH5o5Ub1MpkrRhaXxDYZFPAgqIR3H5tDdVsrP6PpOiBiFJBkN
	MtfaVZNxqvWOYpHUAbMwTmK7H/cKMcO4sPlM1+0UxOl6fwJy1Lbl063wAgIu2DqR6enQ
	SyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/oRuPo5o8MC5GC9QoYrEDmnjtKd4O47+WbRMbRVDYyQ=;
	b=Lg6cTmWr72u4HgFH9ghZ+q9Y1XO4oScTX4yxN5EvqZB8mX5Hzz3j0Ttn6s++tu9BE/
	FBE9sKxIwIYOJrR4MZD9RdLSb4TZ46KhOhJ/xJ/B2qh7p4TAFV627SAV4aK7zYFArBFT
	ASg8vn6RtSGWMQ4LO8w+5bvPXpf2rkAmIgHVKsvY4m8crjigxVlpQj7SWSXD0rBppiAD
	OjfwFN3Lhzrhr+oAEXN87RYFdmV2MuST9eUu+dcm+2p9P7S2BwsWwadbjwK+KYg3I88s
	Oyz0YmRUYa52PZclxAhpvY60rvJUXJAjicru9RXOxq60TLTncXbX+WzBo6WNPVVjYBdu
	O9mA==
X-Gm-Message-State: ALoCoQk2rB5rvqZZUvw3n+f943YMOEtTHbRvZRpBnw6EITDFSO0CGMFFV75yfzw7Xtv4zGydvlWD
X-Received: by 10.50.43.161 with SMTP id x1mr9695803igl.64.1447887028204; Wed,
	18 Nov 2015 14:50:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 18 Nov 2015 14:50:08 -0800 (PST)
In-Reply-To: <564BD815.2090204@gmail.com>
References: <1447744712-18615-1-git-send-email-wenzong.fan@windriver.com>
	<564BD815.2090204@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Nov 2015 22:50:08 +0000
Message-ID: <CAJTo0LZ6jvDWp006DM7EjJi1KW-mm3MTb0VygdC8NdE03NogVw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: Security Advisory - rpcbind - CVE-2015-7236
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
X-List-Received-Date: Wed, 18 Nov 2015 22:50:28 -0000
Content-Type: multipart/alternative; boundary=089e0111bffefdd4a20524d87726

--089e0111bffefdd4a20524d87726
Content-Type: text/plain; charset=UTF-8

On 18 November 2015 at 01:44, akuster808 <akuster808@gmail.com> wrote:

> Can we get the CVE mentioned in the patch or rename the the patch to
> include the CVE #.
>

I'd already merged this into mut, so have renamed the patch.

Ross

--089e0111bffefdd4a20524d87726
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 November 2015 at 01:44, akuster808 <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":mq" class=3D"a3=
s" style=3D"overflow:hidden">Can we get the CVE mentioned in the patch or r=
ename the the patch to<br>
include the CVE #.</div></blockquote></div><br>I&#39;d already merged this =
into mut, so have renamed the patch.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--089e0111bffefdd4a20524d87726--
