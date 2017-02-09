Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 559CB71DAB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 08:46:41 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id l19so101345500ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 00:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kMKXghiDJm+rRAE9U71skYbmLKpI4XPT18LkWPCmUZg=;
	b=LSOBhhJSN/zzTMyZIYh0PmfhUUdKLEf5//+shLyGl4dWkbl2x+OJgYv2zjzAydQt0d
	3zVee08euGR10MRhmnPFq3t76kszDoydt+JEUe3lZ4ojfyzOOKo1BUtdEE6JgDgrKsW0
	4YCLGgTN5Jvm+zZ96I18otyXMMOz4rH8wnvkWk779NrpY/FxzZGznjdc6iTpjhZaWmz/
	UkQq7cMIDeUu3Tc5i75FZBCcW3Zg1sMkJ3Qvwq8BWPO91bLg9D4hWrboJgByVPY0qEtI
	r87Fyl1YPc8x52lRcXthZ6lN1qd1n/ex8M/Ldf+0QoRKKO8+L2PfTjo24pdTVSu87OLx
	Dc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kMKXghiDJm+rRAE9U71skYbmLKpI4XPT18LkWPCmUZg=;
	b=RY9mNOJFut9P0lR+vELg0YZaDz8kOE+9dvV0gXHzlQQR+BGSFvcQxLsVv2epOOaZEr
	M5MZePI0fKEAAnNRUDhGc7qCyMTKUMMWYOm6Wq/WCvTaX+2wXVWClp8Rh0ObBIwHfgQH
	OOsLrsAh5qW6AKRdQN444tB6P0JVmq7NfpOQUY5HCmg1/vYE9Xqed5tCSVyBnf6F43Bp
	b6bVIk4kvkf4DypMTCXGuTr30VvjHF1yo7mrF5n9VfYANRdvuopCC9aRFxWUvmQxwjsJ
	iB/FEtx3l7unujUzg2aXTRHycgMw+1TEkJR/A+Vh9rvcfjWftxNFZQRjOWQUiftXFnoo
	aJEQ==
X-Gm-Message-State: AMke39kduhaHmQuUbSiqMvaizadCfh+lBs6/rYWuNKeitz3jVMcAIcxjRTZzyFZAUC3FEoYlFsFSYN25L0qPYv6d
X-Received: by 10.13.243.135 with SMTP id c129mr1451423ywf.315.1486630001632; 
	Thu, 09 Feb 2017 00:46:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Thu, 9 Feb 2017 00:46:11 -0800 (PST)
In-Reply-To: <CAFSKS=NDQ_EDXishOScHEFt_Uf6s2vq8P7YooBM513CWbHFmTw@mail.gmail.com>
References: <cover.1481043778.git.george.mccollister@gmail.com>
	<CAFSKS=NDQ_EDXishOScHEFt_Uf6s2vq8P7YooBM513CWbHFmTw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 9 Feb 2017 10:46:11 +0200
Message-ID: <CAHiDW_GkT7n200+B2WnAb8QxvWi0bj_JZP0gnN-Ki1NkyJ9T1Q@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 0/2] Resolve gdb-cross-canadian dependency on imp
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
X-List-Received-Date: Thu, 09 Feb 2017 08:46:47 -0000
Content-Type: multipart/alternative; boundary=94eb2c035a1c2917e1054815053e

--94eb2c035a1c2917e1054815053e
Content-Type: text/plain; charset=UTF-8

On 8 February 2017 at 22:06, George McCollister <
george.mccollister@gmail.com> wrote:

> Any chance we can get this applied to morty?
>

You should add [morty] tag to subject and CC the maintainer (
akuster808@gmail.com) to improve chances of this happening. I'm sure Armin
would also appreciate explicit confirmation that the patches apply to morty
branch.

Before that some review though (sorry I missed this in Dec) ... it looks
like the "Add imp to importlib" commit only modified manifest.inc: this is
a generated file and your changes will be overwritten next time someone
runs the generator. You should modify scripts/contrib/python/
generate-manifest-3.5.py and run that to generate the new manifest.inc file.

It would be nice if we did not store noth the source and the generated
files in git but that's how it's currently setup...

Jussi

--94eb2c035a1c2917e1054815053e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 February 2017 at 22:06, George McCollister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:george.mccollister@gmail.com" target=3D"_blank">george.mccollist=
er@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Any chance we can get this applied to morty?<br></blockquote><=
div><br></div><div>You should add [morty] tag to subject and CC the maintai=
ner (<span style=3D"color:rgb(0,0,0);font-family:sans-serif;font-size:12.7p=
x;background-color:rgb(249,249,249)"><a href=3D"mailto:akuster808@gmail.com=
">akuster808@gmail.com</a></span>) to improve chances of this happening. I&=
#39;m sure Armin would also appreciate explicit confirmation that the patch=
es apply to morty branch.</div><div><br></div><div>Before that some review =
though (sorry I missed this in Dec) ... it looks like the &quot;Add imp to =
importlib&quot; commit only modified manifest.inc: this is a generated file=
 and your changes will be overwritten next time someone runs the generator.=
 You should modify=C2=A0scripts/contrib/python/<a href=3D"http://generate-m=
anifest-3.5.py">generate-manifest-3.5.py</a> and run that to generate the n=
ew manifest.inc file.</div><div><br></div><div>It would be nice if we did n=
ot store noth the source and the generated files in git but that&#39;s how =
it&#39;s currently setup...</div><div><br></div><div>Jussi</div></div></div=
></div>

--94eb2c035a1c2917e1054815053e--
