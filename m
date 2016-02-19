Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 110EE731E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 23:52:47 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id 5so47500875igt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 15:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Iz+q9F8hpyBbQhVOXYzQgjAtEuySMZRYvkgS+YWUys=;
	b=PpVwtfH3n2FTtEO6wHXnESrTV+o5IDLPYj29mt+uIRXeyCwlsHis0g7j/b4E2qTQM2
	3GgGupqhY6m4o5noaRonDykB5zc3MJAvE3rNgF+6X7/YXsGUHWj0SoXt8XJCWFdKvK17
	MHQdfRJYMcNs/DFfJykXT6wnNoey8d5KFMiwoolASmhf3zsQcQx4UDL8aUtqhe03z7uj
	2t7BTg2MGr9UrzVnD6uSvdG0/ildxc8MOgl3s/W7p/4tcKs9/8RrR8Na25GeqE367tOh
	7gvUmbve2US/nHC+ZBFyBXl8sopSE03DJLK++GOkjeuBM4RJ48+VRSm1Hw/neaHZaDiY
	OVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Iz+q9F8hpyBbQhVOXYzQgjAtEuySMZRYvkgS+YWUys=;
	b=dNptV94ZM2ed4w8WKBo0PD0VKK+Zn0QrLXHK+0qMvXVSsPjTMAcLl4Cd0YYNoxTbtN
	e+sSlvZjSRGc++/gYTIfBC9rDVUlizeEv6SVeL+PkgiyeIGLl60i67VOmcNo2RLgjlMq
	l42DaLdCdSR+0Cr7luaQgB28VObiVS3IQlNk9CfoNPRH9R/UFOUREGRXLXZYKLVvNbyx
	GQya8oUOQzH/oRP36DAYGBx704IMpynM1WsmNVF/zg/j42zpcE9GE5IvU/m+6WpJBa8v
	topvomVl+YLQ4bifcZo6066K7xU2xNtI22rwcjvRv1qJAHPtd7DwRg1nBiNJESZpAgue
	yRGg==
X-Gm-Message-State: AG10YORjJbB3dSu7pW33fxwmxVK+B/96HkV97ft+MeYlPDcaxe8NLnSGUfw7+pxZVmmTRd2MhV5VkfvsejiQ667n
X-Received: by 10.50.59.146 with SMTP id z18mr457649igq.52.1455925968522; Fri,
	19 Feb 2016 15:52:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 19 Feb 2016 15:52:29 -0800 (PST)
In-Reply-To: <1455919542-28863-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1455919542-28863-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1455919542-28863-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Feb 2016 23:52:29 +0000
Message-ID: <CAJTo0LZnRa69w4XOx4pZMerjm6Y9KhdocHci14rUg+r0Z21bgg@mail.gmail.com>
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/2] oeqa/selftest/prservice: Added new TC: check pr-server starts and stop correctly on localhost.
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
X-List-Received-Date: Fri, 19 Feb 2016 23:52:48 -0000
Content-Type: multipart/alternative; boundary=047d7bea3dfc2c6a70052c282e98

--047d7bea3dfc2c6a70052c282e98
Content-Type: text/plain; charset=UTF-8

On 19 February 2016 at 22:05, Francisco Pedraza <
francisco.j.pedraza.gonzalez@intel.com> wrote:

> +        runCmd('bitbake-prserv --host localhost --port %s
> --loglevel=DEBUG --start' % port)
> +        ret = runCmd('bitbake-prserv --host localhost --port %s
> --loglevel=DEBUG --stop' % port)
> +
> +        self.assertEqual(ret.status, 0)
>

Probably best to be defensive here and check that bitbake started correctly
too.

Ross

--047d7bea3dfc2c6a70052c282e98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 February 2016 at 22:05, Francisco Pedraza <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:francisco.j.pedraza.gonzalez@intel.com" target=3D"_blank">fran=
cisco.j.pedraza.gonzalez@intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div id=3D":1d6" class=3D"a3s" style=3D"overflow:hidden">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 runCmd(&#39;bitbake-prserv --host localhost --p=
ort %s --loglevel=3DDEBUG --start&#39; % port)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(&#39;bitbake-prserv --host loca=
lhost --port %s --loglevel=3DDEBUG --stop&#39; % port)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ret.status, 0)<br></div></blo=
ckquote></div><br>Probably best to be defensive here and check that bitbake=
 started correctly too.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--047d7bea3dfc2c6a70052c282e98--
