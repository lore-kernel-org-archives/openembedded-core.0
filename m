Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id D7007606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 16:14:12 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id j124so19716659ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l31e6v29TJD/zKllLFLiwr8TKyrklbVoqG5dNpr98Z0=;
	b=Z9sMN9NK8H/EtBW4mXQ4XCKdfoW2YJFpq9AMQ0z0E56sJvVJad3IIB9qIq//tndXE4
	/x7RlOPCKXAvt9KHq5WrREdaom+rx2TYdrV+OCUlQnufxpkND98cAtrZ07xIra3+aaJL
	n53KO17OAFmv/D/d2hNRJkq7/GkZOpthGKrkaB1EbvdCP6F0r5hFjPxrWcxz/cg1eAuM
	5dJBobVFmsUirzmsWudcQSGJe/ijvvU4TVy58dAIzTaa2+4ccPyyInCF7h11+Pix2krH
	2KzHQJWBCNQo8KM1ygrDjGUi7GoLsobKkPR4xn0ZJInk5NIlqcO5TSTQ9rXGmBbFEJcS
	DBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l31e6v29TJD/zKllLFLiwr8TKyrklbVoqG5dNpr98Z0=;
	b=ir+/kD0JAD+Un/j8RV298Hl4BQju+sAfTcRLMw4VJzXT4tb7yaQ2wA2BvD/QN+pHIf
	5gL98AqSAH+hGxCdwBYkfUnJ+kkdsSEdGd//irXZKdAKQOjccmO/W70bUxAJF+ya0uoE
	ZSvE9looTVRxxtrrRjCV9ea+3lW8bD/uMjPB+zqroFRgXcIwB9OYDJ20CuqUQJB9DSA0
	ssg1yB3QxsEdeVbasgTaS78osGLVqs4GYBaQzDmG9u9RK334yWZqJL5DiV9Fzy9ci1c7
	TSbTewv/jlvQs3gfe84gL5eX8r8x107dVSlvYJDNwFCPty05IEjr5mhKgplcAmlpeQCS
	MMXw==
X-Gm-Message-State: AEkoouvkrZdDoS58zJT+W4q+P+w8ycwgc6RX6sY94OR+IeM0qI9p+aZxsGHVGK0qqp8ql2C3G9Ya0wV3sPyHiFMc
X-Received: by 10.36.87.140 with SMTP id u134mr28557286ita.38.1469549652722;
	Tue, 26 Jul 2016 09:14:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 26 Jul 2016 09:13:53 -0700 (PDT)
In-Reply-To: <e87916a7973816a5310ca4b4574c6aac61a86741.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
	<e87916a7973816a5310ca4b4574c6aac61a86741.1469518569.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 17:13:53 +0100
Message-ID: <CAJTo0LZ_xcHiNGjWs7bJ7G9Tm6Zn5PDyPK5ppXHCdC7fekSk0g@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] oeqa/utils/commands.py: Add oeqa_copy function
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
X-List-Received-Date: Tue, 26 Jul 2016 16:14:13 -0000
Content-Type: multipart/alternative; boundary=001a1135018c080cd105388c31fc

--001a1135018c080cd105388c31fc
Content-Type: text/plain; charset=UTF-8

On 26 July 2016 at 08:39, <mariano.lopez@linux.intel.com> wrote:

> +def oeqa_copy(src, dst):
> +    """
> +    Copy files and symlinks trying to preserve metadata.
> +    """
> +
> +    shutil.copy2(src, dst, follow_symlinks=False)
>

Why not just use shutil directly instead of having a wrapper function?

Ross

--001a1135018c080cd105388c31fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 July 2016 at 08:39,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mariano.=
lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":26q" class=
=3D"a3s aXjCH m15627e33faca692c">+def oeqa_copy(src, dst):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Copy files and symlinks trying to preserve metadata.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 shutil.copy2(src, dst, follow_symlinks=3DFalse)</div></block=
quote></div><br>Why not just use shutil directly instead of having a wrappe=
r function?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a1135018c080cd105388c31fc--
