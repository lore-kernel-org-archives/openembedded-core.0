Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 57FCE7716D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 14:56:41 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 2so21805051ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wtsUffC/p8Wh44pvRNjP0GwYv7fHZy6wXA4L6QSRKDo=;
	b=hgxdxYEKzSNo4V1nnoXz7craliHPXbgw42yjwkbZc5vVTGRjfwIJQqtc5D5jUE+AZY
	OxWo4RIxwAJcM3R+v+8wjy64fTrSmcd9WJu1a2FDRlak9TXD0D0kbElp+yEF9oroe767
	Med/xkAg3CcszVfl9FWBmzvJVUXx7YX0oSui19kPqR12XIet+6EzeN4dwIPOlikoqvYu
	H+5w9+PUxHPhPxNc1aro3g9Wa1Dm+Qov7Rfg4BdmwJu4XOXsJI/TY3keHJZ1FT4mR1S2
	Ztv8CPFwy8Da6iM5WkiKbQcd+idOBPgwYpcfAm/H2d12m0W2sSGm6cBeSdGRnqHwHZs6
	lTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wtsUffC/p8Wh44pvRNjP0GwYv7fHZy6wXA4L6QSRKDo=;
	b=TyxXGq9nYI5quGyTjH5OpcBXr1XkbMvOgRctRdudYt8b4gcSYn9ay3vHXBlM++Zl0u
	7AjMDUgbvaGeOVRUB6C5vUEceRPGKY06VImcX9BlpD2VxZT9PZKz8/XyRAYdy01vrvQB
	eM6apTpqDxN/QX4T61q2F3djlQmzu1vnQA4murZumTAUMuGzBAi5KgZDP2npxHYU5aC+
	CWQhlOL66VWY3msaP5GZ6GyxLBIPZ7k+mUYGVIM29tCSaO5AkE5hBkiO/2TAUmT5Eu+I
	rc4mny+YFTojDV3PPGOduY4nR0l8JnxCzphMPZeO1caYREr0rSSuZKzEkr1hAiFko5QG
	tuww==
X-Gm-Message-State: AD7BkJIMcSRpcxPUzaNIkrdCkaHvdZFWi+Tw2bEfFrwrRd/17MJHzaVkf87qFXIlGs0XE0bhV8cOqvx6nG+GmLOQ
X-Received: by 10.107.135.74 with SMTP id j71mr16354592iod.133.1459868202550; 
	Tue, 05 Apr 2016 07:56:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Tue, 5 Apr 2016 07:56:23 -0700 (PDT)
In-Reply-To: <8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
References: <cover.1459438792.git.laurent.bonnans@hikob.com>
	<8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Apr 2016 15:56:23 +0100
Message-ID: <CAJTo0LYnkMORa=qY7wVruxYEmzD6mQZYeJENJz-vm3XRNnEYcw@mail.gmail.com>
To: Laurent Bonnans <laurent.bonnans@hikob.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: remove tests and sqlite3-tests modules
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
X-List-Received-Date: Tue, 05 Apr 2016 14:56:43 -0000
Content-Type: multipart/alternative; boundary=001a113f9218a1dae3052fbe0d8b

--001a113f9218a1dae3052fbe0d8b
Content-Type: text/plain; charset=UTF-8

On 31 March 2016 at 17:15, Laurent Bonnans <laurent.bonnans@hikob.com>
wrote:

> If present in manifests, they are shipped in 'python-modules'. This
> commit keeps them avalaible in the 'python-misc' package.
>

python-modules depends on python-misc, so this won't really achieve
anything.

Ross

--001a113f9218a1dae3052fbe0d8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2016 at 17:15, Laurent Bonnans <span dir=3D"ltr">&lt;<a href=3D=
"mailto:laurent.bonnans@hikob.com" target=3D"_blank">laurent.bonnans@hikob.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":b8q=
" class=3D"a3s" style=3D"overflow:hidden">If present in manifests, they are=
 shipped in &#39;python-modules&#39;. This<br>
commit keeps them avalaible in the &#39;python-misc&#39; package.<br></div>=
</blockquote></div><br>python-modules depends on python-misc, so this won&#=
39;t really achieve anything.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a113f9218a1dae3052fbe0d8b--
