Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8284C731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 20:21:14 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 9so103761707iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 12:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BCDQfMCy50t5KwVY4EulnFz3gEVv8fU6cIxUtVJI4l4=;
	b=j/PRRmN9wQw2qj22cl+j3fhWr185cWk3BheT0Xbg1jzCCEo0oYQIhnWNVx0Nld6YQg
	oS88wYZmfwU3/P8+X8h0D8N9P8DiRfrkPu1QNz1gwfXTP5MCo9NX6Rr7E1VyV0ryBuNO
	yiZnEB8Vxg9JmvKknSMl4pj554QN31NlGc5iiSLQXDnba5IQWVAQCu6F5XVdQav+tP+n
	wpMdjrK5ftyTfANZgcLQdmFXprUqLKYN4X1a5Sm7UQEsnWPK0cwZwHsbu9xbM4f/K44r
	6quCLr5aFFdjqqSURzBLLX4+E08KSOAluFq6aayvWmRv/JtPLoizQUYBCL47ktVXgOcQ
	Y8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BCDQfMCy50t5KwVY4EulnFz3gEVv8fU6cIxUtVJI4l4=;
	b=DCEFna2p+AJBm/91UicPHUX2h0tbbqk60dOLOAX9TjiTn8bWcb92N5zeGEI3OKRNiO
	++TITp1cHK7zJsO2sdt5igW70tLnbc4l79F/xJO+UfUKh7UUzqwufURgvborXITLF6OP
	hqNweG/mfFURyBF11AJOUvvCpIHn34ebioSDQVnaQ03/OGAQuKdG+jEW/3OG1L9u9lRF
	KSDXKXYuqlF3l61qzdoq4oTHxwWjXDvLqprWs1oLnA8n7w+4AUD8i0eiGJXIFAN0J57+
	3re97D0X7u8M5k9pswgiiQmFIeA/FIGxeIOQ27YPUGYJerE6P8JC/HWH4rgftjfi8qt/
	wZvA==
X-Gm-Message-State: AG10YOTGMREtiYzqaU3eAXybgfa6rLrqQPhFBJ+rf2E2uCHF1t71KRBHp5XHodBCJtcDi3sJmLXKYTcmNGdYmCOV
X-Received: by 10.107.164.15 with SMTP id n15mr4508833ioe.148.1455308475407;
	Fri, 12 Feb 2016 12:21:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 12 Feb 2016 12:20:55 -0800 (PST)
In-Reply-To: <1455303337-2957-1-git-send-email-sgw@linux.intel.com>
References: <1455303337-2957-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Feb 2016 20:20:56 +0000
Message-ID: <CAJTo0LZranpyfJcLeBotuBSL_J71hzXHxQAsz8R5Mtsthpk0iw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] rng-tools: Import recipe from meta-openembedded
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
X-List-Received-Date: Fri, 12 Feb 2016 20:21:15 -0000
Content-Type: multipart/alternative; boundary=001a11377682b73703052b986837

--001a11377682b73703052b986837
Content-Type: text/plain; charset=UTF-8

On 12 February 2016 at 18:55, Saul Wold <sgw@linux.intel.com> wrote:

> +# As the recipe doesn't inherit systemd.bbclass, we need to set this
> variable
> +# manually to avoid unnecessary postinst/preinst generated.
> +python () {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,
> d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
>

Can't help but think that stealing a unit from Fedora would clean this and
the do_install_append logic up (conditionals are not required if systemd is
inherited as it removes those for you).

Ross

--001a11377682b73703052b986837
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 12 February 2016 at 18:55, S=
aul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" targe=
t=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ad" class=3D"a3s" sty=
le=3D"overflow:hidden">+# As the recipe doesn&#39;t inherit systemd.bbclass=
, we need to set this variable<br>
+# manually to avoid unnecessary postinst/preinst generated.<br>
+python () {<br>
+=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sys=
vinit&#39;, True, False, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;INHIBIT_UPDATERCD_BBCLASS&quot;=
, &quot;1&quot;)<br>
+}</div></blockquote></div><br>Can&#39;t help but think that stealing a uni=
t from Fedora would clean this and the do_install_append logic up (conditio=
nals are not required if systemd is inherited as it removes those for you).=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11377682b73703052b986837--
