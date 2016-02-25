Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4AE77310
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 00:44:52 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id z135so72935398iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=65EqEZSh+TPo/rt22Jp7Soa92hyw45Wgt9VmWbE58wI=;
	b=yD6bo594zYytnBJdBUw2H2ikFBr3ongmPL3cgXI+EE3UMxLTkfO+/Q9p6DORgLLo7a
	ulKAlnPXuVmrDPYZ6EweEkZ/jeDb2fWTQrdxSO9NBhcvqkffTZIUfDRrxbwqe83eAMzq
	/5ql2fW4Eoc5GSvZdtWdqe2O16z92nYZ9oruNCBDfjbWGkg1bqghUODTA5PWpTJdxsWg
	iYyAkc4TWtjLs9iGKgcinv0nMasJyWs1/p5C1eSuIB7HCjNB6yyqMiXsZB2uF0aT3tFC
	EfQvO5awOs57hneQJ/sLABnal1pjb3sa3gSg9wrGYEK+ilBnLztlutbsPTI19zVbsAmz
	9mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=65EqEZSh+TPo/rt22Jp7Soa92hyw45Wgt9VmWbE58wI=;
	b=JEJScyt+SUMlFlLIAluQwTMsrERCgyZdTAy9F/FdlWaC6O7IGzrxPnuLnbrMlxIUG2
	x18p0+d0U3sMS6AVExQNdqiC1FMhnPZZe/Wv/3+p7OXSSwtoMsrQGCFk4scpgiBcxkuT
	POUirDVfM73BnTuh7m/SXRNwuTHPUQ3qUWxPmtKkOIOys6nVDGVN8CgFROv6J+CgH6xD
	DwUBEiEwDRsFZkj9B1pwVdaVbHtjoA+zZFpbFFGs45v5JqGXBGEfzgtdeZOKs28HwIfj
	ShhwZvIvjClFIzgzKqETGybwlKR1CI8NiGAXsOiHckIDHfsgjpYRO62exb263HfezW8t
	Hikg==
X-Gm-Message-State: AG10YORG2Kzu6VTT/5pP65oIS4nItCSr7WZWG5mBEMoNmuGkY2PiCvGWDL+wscEtIUPe8UGbzJ+5vn9lZHX4J/3F
X-Received: by 10.107.164.15 with SMTP id n15mr352605ioe.148.1456361093462;
	Wed, 24 Feb 2016 16:44:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 24 Feb 2016 16:44:34 -0800 (PST)
In-Reply-To: <d027b2178315a8b1832aeaf042e211b2974063f2.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<d027b2178315a8b1832aeaf042e211b2974063f2.1456327117.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 00:44:34 +0000
Message-ID: <CAJTo0LbGNmcreguSsX+1m_9cQRnbZHTYtq5-MbDQHK4qA_jLMA@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] cve-check-tool: Add recipe
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
X-List-Received-Date: Thu, 25 Feb 2016 00:44:53 -0000
Content-Type: multipart/alternative; boundary=001a11377682a410a7052c8d7dbb

--001a11377682a410a7052c8d7dbb
Content-Type: text/plain; charset=UTF-8

On 24 February 2016 at 15:27, <mariano.lopez@linux.intel.com> wrote:

> +python () {
> +    # If the cve-check class is inherited it is needed to populate the
> +    # CVE database before checking the CVEs for all recipes.
> +    pn = d.getVar("PN", True)
> +    if pn.endswith("-native") and bb.data.inherits_class('cve-check', d):
> +        bb.build.addtask("do_populate_cve_db", "do_build",
> "do_populate_sysroot", d)
> +}
>

Wouldn't this be better done as an explicit dependency of the class task?

Ross

--001a11377682a410a7052c8d7dbb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2016 at 15:27,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mari=
ano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ecv" cl=
ass=3D"a3s" style=3D"overflow:hidden">+python () {<br>
+=C2=A0 =C2=A0 # If the cve-check class is inherited it is needed to popula=
te the<br>
+=C2=A0 =C2=A0 # CVE database before checking the CVEs for all recipes.<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&quot;PN&quot;, True)<br>
+=C2=A0 =C2=A0 if pn.endswith(&quot;-native&quot;) and bb.data.inherits_cla=
ss(&#39;cve-check&#39;, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&quot;do_populate_cve_db&quot=
;, &quot;do_build&quot;, &quot;do_populate_sysroot&quot;, d)<br>
+}</div></blockquote></div><br>Wouldn&#39;t this be better done as an expli=
cit dependency of the class task?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a11377682a410a7052c8d7dbb--
