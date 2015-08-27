Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 96E5576D96
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 17:13:32 +0000 (UTC)
Received: by iodt126 with SMTP id t126so65095276iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=eJDDlhffJ8OTnmqvQ9iKgH1wDOQbwBiwl2CZSKQ/6Nk=;
	b=lEjmMPNqxtuyCqlcDImCnai5F+pG6qNszcc3IdHRX+ZhOif39WCPReXPWjXxjyeefj
	luH4mEX7eYtzrZJD+L4mXVUZclASrhtTZAbVGT/3a7qFfdaTh+NpSkc758kQICA0xJcS
	1oZQsd8vD2MaT+vMchbvaoE5cb7d9zaysnlw4CXDaLsenYbdmw5SbZ4w24zSvjjgFQDu
	Cg70ZDGv2INDUHFfFssEPjIqiJBfEyh3zwiFWdOJ07w3zzQk8a4asYIy51g+K1xJaoH2
	+wUqxgrKzeyF8wc8I/fASt4d3HSbY3vStWf2fVcK8qIcs2Xbp2cybPnwsgOiZAXNSJw7
	1XRA==
X-Received: by 10.107.40.200 with SMTP id o191mr10166887ioo.83.1440695612213; 
	Thu, 27 Aug 2015 10:13:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Thu, 27 Aug 2015 10:13:12 -0700 (PDT)
In-Reply-To: <1b1addab8587973a984b477e271e3fd4df9d88a5.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
	<ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<1b1addab8587973a984b477e271e3fd4df9d88a5.1440680489.git.jussi.kukkonen@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 27 Aug 2015 10:13:12 -0700
X-Google-Sender-Auth: 19a8aVcPYePYETGC3TZ5zGHth74
Message-ID: <CABcZANncHYDHixOW7Ri9DmTURNk3JjFJKAZxnNOaZ5b6iU5yCQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] mirrors.bbclass: Update gnutls mirrors
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
X-List-Received-Date: Thu, 27 Aug 2015 17:13:35 -0000
Content-Type: multipart/alternative; boundary=001a1141cf8c321268051e4e16e4

--001a1141cf8c321268051e4e16e4
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 6:06 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> * Remove mirror sites that no longer exist
> * Update the gnutls.org path so the gnupg mirror gets used
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>

Hmm, I can't help but wonder if these app-specific mirrors should be moved
to the recipes or classes that need them, rather than in the global default
MIRRORS..
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141cf8c321268051e4e16e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 27, 2015 at 6:06 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
qe" class=3D"a3s" style=3D"overflow:hidden">* Remove mirror sites that no l=
onger exist<br>
* Update the <a href=3D"http://gnutls.org" rel=3D"noreferrer" target=3D"_bl=
ank">gnutls.org</a> path so the gnupg mirror gets used<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;</div></blockquote></div><br>Hmm, I can&=
#39;t help but wonder if these app-specific mirrors should be moved to the =
recipes or classes that need them, rather than in the global default MIRROR=
S..<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson =
at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mainta=
iner - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1141cf8c321268051e4e16e4--
