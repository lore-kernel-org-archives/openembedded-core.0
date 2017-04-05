Return-Path: <sadlife1990@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 462EB77AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:05:10 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 100so929227uaj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CJ4OUVH/ktAk/nZt0etS3FAxVCpOUyHtEYLHKAnE8Ps=;
	b=qgvfbq1PnIa/eCjiJ0zgknJeKIrDgZyMDTwrKh+OlVI+EOkTRRn/3fsl7TuRa3g4hR
	dBDRCSVDSS7fzp6qM1pA54sJS8Jk1BgStTKjDNtgyZWMXBgN4zyqm2lQYBRVZTfaKD9R
	Dw0vL0+euszECRsY+nPnblVAgOV9YtRqEMW/4ovTqdOO0XrPPlNMcPipRj69V8rskgSv
	v5kK3sdYlzbFlKkpQ/VFKFe9U2jbXwPzobAh5AbNS7wX7JlMX/rMhD3KeMVWRZSGemV6
	WB6x/dTR2UgFXUqmDJWNgxdB/dg3ybN2co+iSgJN91LSVMuvmG2rGSdblGhqStEDnoap
	L1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CJ4OUVH/ktAk/nZt0etS3FAxVCpOUyHtEYLHKAnE8Ps=;
	b=jtLF0RVlWDfdMW2ZMfMrBbFLPNNmpwx/qSYoQoOlZ/Mv0MCegglCLZhkwu7+uuZS/u
	HuvLMQ4tInW0W4mY+jpltLgPxS3NrT4BFEthytX9rzP3y+57rFRQf+1FjSQ//kpM9sM5
	+NL92gU4iJvsLSjQvbYCp7QzDDJmzUoJ4sRwYpB6BQ9PMKdjHw73v/Ba3qPEdN4Zus+7
	DoOBrK72+NXuQ/Sp0AdBwTlP1E5MTr3VQaxcqyTV/dCRJxiPJRVgT1fj9Hb68N39CkFO
	lRDBvLVKyd7sXdejKEx6Ei21HV6hl9kcKOD+8e0F1pjWl46YBYKrwsnL0QMHLw9/DWDX
	+NHQ==
X-Gm-Message-State: AFeK/H3r21ZD+52nCvAf2QoFSa6tt6x+YvR1RulRD62CSEJfEu9dC9n6Uf6dmXN/msl0hTQOP2XFrLylwrx6Tw==
X-Received: by 10.176.67.97 with SMTP id k88mr11036742uak.5.1491397511827;
	Wed, 05 Apr 2017 06:05:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.32.105 with HTTP; Wed, 5 Apr 2017 06:05:11 -0700 (PDT)
In-Reply-To: <CAAHuHfwiL_Uep8oSh1yEV7an2hoYStfsztFE+LZcPVLAedaL4A@mail.gmail.com>
References: <CAAHuHfwiL_Uep8oSh1yEV7an2hoYStfsztFE+LZcPVLAedaL4A@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
Date: Wed, 5 Apr 2017 16:05:11 +0300
Message-ID: <CAAHuHfx+0_aS5CER_+H5mRtx7Ur1yWOJwkNnOzqvTt-uk9aB+g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Adding Static Library Support to the SDK or Rootfs
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
X-List-Received-Date: Wed, 05 Apr 2017 13:05:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c19b6e9631f054c6b0aa5

--94eb2c0c19b6e9631f054c6b0aa5
Content-Type: text/plain; charset=UTF-8

Hello,

I'm try to build static library for SDK.

Update the *build*/local.conf file with the following information

SDKIMAGE_FEATURES = "staticdev-pkgs dev-pkgs"

*INHERIT += "buildhistory"
BUILDHISTORY_COMMIT = "0"
 BUILDHISTORY_FEATURES = "sdk"*

*But cannot create static library for SDK. *


*Thanks.*

--94eb2c0c19b6e9631f054c6b0aa5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><br><br><div dir=3D"ltr">Hello,=
<div><br></div><div>I&#39;m try to build static library for SDK.</div><div>=
<br></div><div><span style=3D"color:rgb(51,51,51);font-family:arial,sans-se=
rif,verdana,tahoma;font-size:14px">Update the <i>build</i></span><span clas=
s=3D"m_7974944336534841523gmail-ph m_7974944336534841523gmail-filepath" sty=
le=3D"border:0px;margin:0px;padding:0px;font-size:14px;font-weight:bold;col=
or:rgb(51,51,51);font-family:arial,sans-serif,verdana,tahoma">/local.conf</=
span><span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif,verdan=
a,tahoma;font-size:14px">=C2=A0file with the following information</span><b=
r></div><div><pre class=3D"m_7974944336534841523gmail-pre m_797494433653484=
1523gmail-codeblock m_7974944336534841523gmail-cli" style=3D"margin-top:0px=
;margin-bottom:10px;margin-left:0pt;padding:0.5em 1em 0px 0em;border:none;f=
ont-size:8pt;color:black;font-family:&quot;courier new&quot;,courier,monosp=
ace;line-height:12pt;background-color:rgb(238,238,238);word-wrap:normal;ove=
rflow:auto"><code class=3D"m_7974944336534841523gmail-ph m_7974944336534841=
523gmail-userinput" style=3D"font-weight:bold;line-height:inherit;border:0p=
x;margin:inherit;padding:inherit;font-size:inherit;font-family:inherit">SDK=
IMAGE_FEATURES =3D &quot;staticdev-pkgs dev-pkgs&quot;</code></pre></div><d=
iv><pre class=3D"m_7974944336534841523gmail-pre m_7974944336534841523gmail-=
codeblock m_7974944336534841523gmail-cli" style=3D"margin-top:0px;margin-bo=
ttom:10px;margin-left:0pt;padding:0.5em 1em 0px 0em;border:none;line-height=
:12pt;background-color:rgb(238,238,238);word-wrap:normal;overflow:auto"><fo=
nt color=3D"#000000" face=3D"courier new, courier, monospace"><span style=
=3D"font-size:10.6667px"><b>INHERIT +=3D &quot;buildhistory&quot;
BUILDHISTORY_COMMIT =3D &quot;0&quot;
 BUILDHISTORY_FEATURES =3D &quot;sdk&quot;</b></span><span style=3D"font-si=
ze:8pt"><br></span></font></pre><pre class=3D"m_7974944336534841523gmail-pr=
e m_7974944336534841523gmail-codeblock m_7974944336534841523gmail-cli" styl=
e=3D"margin-top:0px;margin-bottom:10px;margin-left:0pt;padding:0.5em 1em 0p=
x 0em;border:none;line-height:12pt;background-color:rgb(238,238,238);word-w=
rap:normal;overflow:auto"><font color=3D"#000000" face=3D"courier new, cour=
ier, monospace"><span style=3D"font-size:10.6667px"><b>But cannot create st=
atic library for SDK. </b></span></font></pre><pre class=3D"m_7974944336534=
841523gmail-pre m_7974944336534841523gmail-codeblock m_7974944336534841523g=
mail-cli" style=3D"margin-top:0px;margin-bottom:10px;margin-left:0pt;paddin=
g:0.5em 1em 0px 0em;border:none;line-height:12pt;background-color:rgb(238,2=
38,238);word-wrap:normal;overflow:auto"><font color=3D"#000000" face=3D"cou=
rier new, courier, monospace"><span style=3D"font-size:10.6667px"><b><br></=
b></span></font></pre><pre class=3D"m_7974944336534841523gmail-pre m_797494=
4336534841523gmail-codeblock m_7974944336534841523gmail-cli" style=3D"margi=
n-top:0px;margin-bottom:10px;margin-left:0pt;padding:0.5em 1em 0px 0em;bord=
er:none;line-height:12pt;background-color:rgb(238,238,238);word-wrap:normal=
;overflow:auto"><font color=3D"#000000" face=3D"courier new, courier, monos=
pace"><span style=3D"font-size:10.6667px"><b>Thanks.</b></span></font></pre=
></div></div>
</div><br></div>

--94eb2c0c19b6e9631f054c6b0aa5--
