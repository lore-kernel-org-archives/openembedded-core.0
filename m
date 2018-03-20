Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id E7E7A78699
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 23:35:12 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id r30-v6so3738513otr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 16:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6y24r0Nj2NpKUizUPQ9bs3OndqKR0OlxSi5IotPJ7fI=;
	b=JW0D3X33Bcjm2g0RqWa5rQY2KZrP8jmrDKHXqR8JhTzYPLT433CWOV1ecNMqwdXnoq
	M/CiSldNurUW/tcUem9BYM2bEnM2t2HrL0bpqsvg28m3mYg3/9UoyIY0SVa4QyejEpH7
	9FXxjDcx8HiZpT4NelVP1706VV9q+ByXR675hNoDgC+jz05jAoIRic1smBrl1PIWvwa2
	c4Dj5vAopD6MOvZ6VCKzJaA82MYE7p3rYHp00VA6f2A6dkd0ofptAfU5K5pNDYvgKVcF
	acvS7v6SSZJg8ADNmPh/U4PLjmtLpnYWe47XMfNBX18xzd+x2sMa4SPkNNAoQOAWaw1C
	oW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6y24r0Nj2NpKUizUPQ9bs3OndqKR0OlxSi5IotPJ7fI=;
	b=DcgYrlOwimT6v/URrhpuH4AktyA2iKh6SoHDGBhf82dyZZHk3r46904Tl0b+IQgvbM
	HhIHQoLBgklvOiUoPMWKNvFIwS/BHP2DZ72pEMUpla9dKNpgjTHiQB6oerNYPNGxY3by
	FNMN3acI6yT1/lMr4BnpTflcE7ig4NLAt+49hcj1/KFZtjVtwQET2Ld5bawtar6mRTxP
	7Jy3nmR54rR4/lVrREimxkKa4pAw9HDSeayd2MSQXVZMUWxIUfpf/nPKF4xh0XyPIgAo
	EkNVcdi5/alg4JLf/vVVWUBGrGzd9Pf+6LT1YUAI7WCY2l0JN1JU5hcBeIeL4T3vYE9H
	H1UQ==
X-Gm-Message-State: AElRT7HSCHM66RhYwiqyRTHI071W1meS3kEmIpppTtrhppxZvljnfPK3
	da7ED7fzfVV7G2TKD8p9jFngPYnzVQk76F4wkzo=
X-Google-Smtp-Source: AG47ELs5SSxjjs82bXsaC+URYx/rZQmyQhUWLLsj88YBY/5PuulHRKzmVxt9lebSSqwVWZEVNAYdSvnjTjJDAOqAm7c=
X-Received: by 2002:a9d:4a41:: with SMTP id
	d1-v6mr12643248otj.341.1521588913878; 
	Tue, 20 Mar 2018 16:35:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2221:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 16:35:13
	-0700 (PDT)
Received: by 2002:a9d:2221:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 16:35:13
	-0700 (PDT)
In-Reply-To: <3d59c4dd2b19c529ede09d2bbd10d39f2d56190a.1521587166.git.amanda.r.brindle@intel.com>
References: <cover.1521587166.git.amanda.r.brindle@intel.com>
	<3d59c4dd2b19c529ede09d2bbd10d39f2d56190a.1521587166.git.amanda.r.brindle@intel.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 20 Mar 2018 18:35:13 -0500
Message-ID: <CAJdd5GagnDEbkMOmPvXODx3LXBiKR08EFS5x1vCQLnUJVh7ZuQ@mail.gmail.com>
To: Amanda Brindle <amanda.r.brindle@intel.com>
Cc: stephano.cetola@intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] waf.bbclass: Warn if waf doesn't exist
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
X-List-Received-Date: Tue, 20 Mar 2018 23:35:13 -0000
Content-Type: multipart/alternative; boundary="000000000000b4b95a0567e08605"

--000000000000b4b95a0567e08605
Content-Type: text/plain; charset="UTF-8"

On Mar 20, 2018 18:08, "Amanda Brindle" <amanda.r.brindle@intel.com> wrote:

Before, waf.bbclass would fail to catch FileNotFoundError. Now, it will
catch this error and warn that waf doesn't exist.

Fixes [YOCTO 12553]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 meta/classes/waf.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index f9a851d..5bd5913 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -15,6 +15,8 @@ python waf_preconfigure() {
             d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
--libdir=${libdir}")
     except subprocess.CalledProcessError as e:
         bb.warn("Unable to execute waf --version, exit code %d. Assuming
waf version without bindir/libdir support." % e.returncode)
+    except FileNotFoundError:
+        bb.warn("waf does not exist in %s" % subsrcdir)
 }


FWIW, this looks good to me


 do_configure[prefuncs] += "waf_preconfigure"
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--000000000000b4b95a0567e08605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mar 20, 2018 18:08, &quot;Amanda Brindle&quot; &lt;<a href=3D"=
mailto:amanda.r.brindle@intel.com">amanda.r.brindle@intel.com</a>&gt; wrote=
:<br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Before, waf.bbclass woul=
d fail to catch FileNotFoundError. Now, it will<br>
catch this error and warn that waf doesn&#39;t exist.<br>
<br>
Fixes [YOCTO 12553]<br>
<br>
Signed-off-by: Amanda Brindle &lt;<a href=3D"mailto:amanda.r.brindle@intel.=
com">amanda.r.brindle@intel.com</a>&gt;<br>
---<br>
<div class=3D"quoted-text">=C2=A0meta/classes/waf.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
</div>diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index f9a851d..5bd5913 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -15,6 +15,8 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;WAF_EXTRA_CO=
NF&quot;, &quot;--bindir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
=C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Unable to execute waf --ver=
sion, exit code %d. Assuming waf version without bindir/libdir support.&quo=
t; % e.returncode)<br>
+=C2=A0 =C2=A0 except FileNotFoundError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;waf does not exist in %s&quot; %=
 subsrcdir)<br>
=C2=A0}<br></blockquote></div></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">FWIW, this looks good to me</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
=C2=A0do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
<div class=3D"elided-text">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></blockquote></div><br></div></div></div>

--000000000000b4b95a0567e08605--
