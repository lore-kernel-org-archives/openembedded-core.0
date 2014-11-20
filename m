Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8112265D4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:17:38 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q107so1921843qgd.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 04:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DzJZRpiy0PoYnIsnReNINmb1VYta10oGHxVJHUAJY/o=;
	b=L3DVVWa772pDE6EJubmRiBgS61fvv/hgX7r4vDBGHsf5EprTQIyDw6JJuXg/CWn305
	nrewUKfCKa027RMaHWVyVT6EmK8RSCzz8Lju2OaihgAKBxenLcJDBkutoUTL3y6Ublrq
	zb9HQcpLRMqnunzIqrhM1JKMmn/HR53aJQYZ3gIisQlH6s8LdHMVdv/QVRKxbjtO74jI
	LHM0fa4bWcaQUetlDGwT+/2bxCpq3Qn95Uq/jjPLswa3ywVSfybWiHT3Evv6BrfPWeI7
	DQ49NF0ZPOjbmAc2XWuEa5Y+523NdPUhmv5gj55Se3Udt1nFFBBmAzYhKk1C3aq681qE
	NOqA==
X-Gm-Message-State: ALoCoQmZuMq/Ml30JYdb38VprgSZ3XDXBdD7FH93eyLTXlpdd4e4wfvWEtyojM0/BIBuAuQVPeAn
X-Received: by 10.224.2.135 with SMTP id 7mr61151404qaj.64.1416485859152; Thu,
	20 Nov 2014 04:17:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 04:17:18 -0800 (PST)
In-Reply-To: <1416452807-22721-1-git-send-email-jian.liu@windriver.com>
References: <1416452807-22721-1-git-send-email-jian.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 12:17:18 +0000
Message-ID: <CAJTo0LYe=+ACx9FqPUQcVLB-YWQGtuiUYY_aG7RZ-y18E3O5SQ@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsof: the compiler version fault
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
X-List-Received-Date: Thu, 20 Nov 2014 12:17:46 -0000
Content-Type: multipart/alternative; boundary=001a11c3defa76ef2b0508495079

--001a11c3defa76ef2b0508495079
Content-Type: text/plain; charset=UTF-8

On 20 November 2014 03:06, Jian Liu <jian.liu@windriver.com> wrote:

> When using cross compiler to build the package "lsof" on a host,
> the value of LSOF_CCV in version.h genegrated by the Makefile
> is the version of the compiler on the host while it should be
> the version of cross compiler.
>

There's a better version of this patch on the list already - it's not yet
been merged which is mostly my fault.

Ross

--001a11c3defa76ef2b0508495079
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 November 2014 03:06, Jian Liu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:jian.liu@windriver.com" target=3D"_blank">jian.liu@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3v8" class=3D"a3=
s" style=3D"overflow:hidden">When using cross compiler to build the package=
 &quot;<span class=3D"il">lsof</span>&quot; on a host,<br>
the value of LSOF_CCV in version.h genegrated by the Makefile<br>
is the version of the compiler on the host while it should be<br>
the version of cross compiler.</div></blockquote></div><br>There&#39;s a be=
tter version of this patch on the list already - it&#39;s not yet been merg=
ed which is mostly my fault.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a11c3defa76ef2b0508495079--
