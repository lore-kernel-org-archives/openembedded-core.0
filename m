Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id ACFB07C080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 23:07:07 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id p197so1946306itp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YLfsx3YQXUfBc92vo7zUtv4FVidib4P7rZleB2WvsbU=;
	b=bdiWuj0VKWn7iSJW4fgUqxKTyocYo2FrSrzdQ0FXne/DAZJtNXEBcbTiI+KMM7fNeB
	ifn0fTNhLZPg0dC845qjMCykheey6LEtosZhBkRDWxwMB6D7NB1PQj9YyMDfwgws7FH0
	oPjAIigh3dkqHRA4PVwpRQIr0QxxytwIKrdb8kS6FdJlYLNDGlM7iQco3lvRjNvQbOIk
	yOTotRSEp1+F+fQliVzI2Lvjx8WsSGSPiQYGLm8hfu0YXHJ42U2M1XzjLxJuHBZjbqrc
	eubdfntPOSyXW0cbLlDNOneRydxEnEvawysJ004w4P5W8/r0KO2G2mo3YO9AJNQvwrj3
	pvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YLfsx3YQXUfBc92vo7zUtv4FVidib4P7rZleB2WvsbU=;
	b=o1pvzIUK08Zn+xoA5XucszBdzBsU/9YI7Bb2DGIf3yK1EtljpZcLW+fw7Hr1kvg/Xt
	SiheIlLQRS/zHvaspia0nQMM9PhkhtnAjl8L4NRVq4dcDPEhTuwXVRiHkeA8IWjdBq4G
	MkpP4yDEinPRHcSvcS159KjlUEDKBzvbogOe5eR9w31HV8yaJxpwfImKcsgmVjbJNLkt
	p9++w+16tugidLIvsWoHbBnfrvmTd/ZcY0oNKbsLWPJOUF22+0UdYwZ4x0LMzTUpUrFA
	frLrloAUHL2aMfcn8r53TYEniKYKCw2LZ6rCbypLfDa66hXzS9EcnQUogcLhBYEcjH/+
	Zkqw==
X-Gm-Message-State: AJcUukfbkYXWe7t8s24Qhza0g/wc2/XZqextZfH6ezoUzOxXKOc5MLEb
	SnsvNZQr5ITIESrqcblSvbNzYHtfAEw+sPAHsi+3coN5
X-Google-Smtp-Source: ALg8bN4dzaEuPSZJxvOomdsqesQxHwYwvr6lF6u/cIfKqM1mvvDZUyVSMlyt8CSKf4qkJdrXT82IpC8XJLzqQvH39nk=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr903920itj.62.1547507228637;
	Mon, 14 Jan 2019 15:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20190114230432.22116-1-richard.purdie@linuxfoundation.org>
	<20190114230432.22116-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190114230432.22116-2-richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2019 23:06:57 +0000
Message-ID: <CAJTo0LYr5NaV1RR=99kJfdNWG7=jx1Z1nJ+sET1Kd4UAnco6ig@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] meta: Fix python code quoting issues
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
X-List-Received-Date: Mon, 14 Jan 2019 23:07:07 -0000
Content-Type: multipart/alternative; boundary="000000000000a69934057f731aa7"

--000000000000a69934057f731aa7
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jan 2019 at 23:04, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> -    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo
> 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" %
> d.getVar('KCONFIG_CONFIG_COMMAND'),
> +    oe_terminal("${SHELL} -c \"make %s; if [ \\$? -ne 0 ]; then echo
> 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" %
> d.getVar('KCONFIG_CONFIG_COMMAND'),
>

Would it be neater to use r"" here?

Ross

--000000000000a69934057f731aa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 14 Jan 2019 at 23:04, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);pad=
ding-left:1ex">-=C2=A0 =C2=A0 oe_terminal(&quot;${SHELL} -c \&quot;make %s;=
 if [ \$? -ne 0 ]; then echo &#39;Command failed.&#39;; printf &#39;Press a=
ny key to continue... &#39;; read r; fi\&quot;&quot; % d.getVar(&#39;KCONFI=
G_CONFIG_COMMAND&#39;),<br>
+=C2=A0 =C2=A0 oe_terminal(&quot;${SHELL} -c \&quot;make %s; if [ \\$? -ne =
0 ]; then echo &#39;Command failed.&#39;; printf &#39;Press any key to cont=
inue... &#39;; read r; fi\&quot;&quot; % d.getVar(&#39;KCONFIG_CONFIG_COMMA=
ND&#39;),<br></blockquote><div><br></div><div>Would it be neater to use r&q=
uot;&quot; here?</div><div><br></div><div>Ross</div></div></div>

--000000000000a69934057f731aa7--
