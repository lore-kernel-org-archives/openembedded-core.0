Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8562365CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 10:36:43 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so114184387qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 02:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6pbkEoneLvXuPk3iLkjPInGMPY9iVY8xEWjapre3xNY=;
	b=EAASlVFzANmBQKTv5lzIBYAFcfbW0hmi4YnjIcGnEID3wvvVa/qxVqMtP1CmhnGOTy
	Nx6MleBKdWCz0zJrbQP9Fv9fwq/r9M6CR43Q6LsJD/b/+rIr7N8/rYhfX17W/69XhTEn
	tj8n++uF3M89sdK3kGjhAIM1Q1rXjw2yIq6AlSUVbCYwammR/ScTr/TsyzuFpmAioTku
	lR6W0/7aL7rnGUWu6Gvdi9mEhh8QvNeEudyq8rCG7lgvw5qmMwHNhv3uIBj8sfBuCrqa
	ITkUNz3S0pTn3R1Bzvu4ChdwT/MTXEDHpMjSELDO1BBNlCg4Sbz9eMbXFquhryN40aTS
	+qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6pbkEoneLvXuPk3iLkjPInGMPY9iVY8xEWjapre3xNY=;
	b=MVxIZrAHYhxMMqZuvLrlZhZ5f+b0h7cVY4sFc3AenKvcKoRgP2vZmHPgFrA0QFY44y
	6oxh7BeguJi0UmUFpVgIB+vn2cC3pOYO5hkpyqgg/qb0ZK6gtwKAwRf7T/XdpadV/3G2
	CpEhZIbQytkyOSQVhnwKydPbrbLMVEXMvdkfd8A8EiW+lURe1q/zCPzPz7NgmZe5lTWg
	5FYVCbh/nFSB+4KVcwI0gUeW436iJYUCtwXYy8n/64piUB9o1zG2dUCcC/sTrU/2adBs
	ZZOrPKbJ+5A10DBDMcPO/eT+08jDwlK73a8m910EzkDQJt1bPm44kyiLBinGZh7xjBC/
	xB2g==
X-Gm-Message-State: ALoCoQnyrHVj/6zsNerYdB+Mg+h8r46Dj5MilnoUjQM/8hmsPptYfyr3cTNGgilHNOIt6sZOUnNG
X-Received: by 10.140.171.197 with SMTP id r188mr3386309qhr.93.1447151803725; 
	Tue, 10 Nov 2015 02:36:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Tue, 10 Nov 2015 02:36:24 -0800 (PST)
In-Reply-To: <1447114335-32437-1-git-send-email-schnitzeltony@googlemail.com>
References: <1447114335-32437-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Nov 2015 10:36:24 +0000
Message-ID: <CAJTo0LbJ-VExiBRNeeQgdZ0C=Ex8g6UUcVGyJbRnjRSmrvE++g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glew: set correct version in our configuration
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
X-List-Received-Date: Tue, 10 Nov 2015 10:36:44 -0000
Content-Type: multipart/alternative; boundary=001a113a7dfa328d0105242d495d

--001a113a7dfa328d0105242d495d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 November 2015 at 00:12, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> -+AC_INIT([glew], [1.9.0], [BUG-REPORT-ADDRESS])
> ++AC_INIT([glew], [1.12.0], [BUG-REPORT-ADDRESS])
>

This is going to get tedious quickly, can we have a patch postfunc to sed
in the right version at build time?

Ross

--001a113a7dfa328d0105242d495d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 00:12, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":1yp" class=3D"a3s" style=3D"overflow:hidden">-+AC_INIT([glew], [1=
.9.0], [BUG-REPORT-ADDRESS])<br>
++AC_INIT([glew], [1.12.0], [BUG-REPORT-ADDRESS])<br></div></blockquote></d=
iv><br>This is going to get tedious quickly, can we have a patch postfunc t=
o sed in the right version at build time?</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a7dfa328d0105242d495d--
