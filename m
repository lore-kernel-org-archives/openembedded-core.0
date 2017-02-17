Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 209D671A72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 15:59:22 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id k15so43783005qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YOmwBcCRpa9uwnJpdxQrYwiH5+ySJqAlIlepnbT98f0=;
	b=cBJCNnf7IViNW6xOrQddxAfwUcMJFzCTlwsS2ea2/zrMgFreQXgfOOxYZGYTG52AfX
	czrit0pah2DQrPoQigvgnP73GYfNgxTveHzLN+e6D4n0AiZ+DYaoWs/qZE3JI436hf/Y
	6XpUa/vqGNq8u6JTH4hsq7ht6/nQLmS1WfKNVsn9x+NVKYEhlOhjIQwoLGWQFXidIlUm
	lVtMyTIQuVLe2G8m0h6zvIENGghXH+WPzfvBA5RZcI9n3rQpcD5wTE7MkaAHfzuPvOeT
	yCSRIECBu894LVsApWWHTzSPFNlgQD1BKc0gX4MB+sbahYtaPQQtxj75W3TxNwQIlgVD
	MwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YOmwBcCRpa9uwnJpdxQrYwiH5+ySJqAlIlepnbT98f0=;
	b=mirzHdSiNfbzrrGHe1N24dOq+LqrzMM5HXSk7BlFFDOclSlUcXvtoU1PYg5SY0MsDP
	cilzCtk8IJsKVb/TMpBeV7fAx9QIQ0J1B7BqxrTTy2lap94BufKpnohGMtu2f7mHH3L2
	C0ASGTy71o1CWItQnPlcGRvZPeIDg1ElRDIc20cZqehnndgjhRI/zZ4lviR7p92GlzMY
	Q7AlnqxtW3eUi+GPt8K3oq6z1cSu7RZSmVNWmP2ztpQG/9899lewpSMEJZyyqqyllAT/
	hvsCXuVaLn3cTBExsY+5J8EyW3DKiW2gV4pT3QWHN7/F8mQLQg4R4/+ajL94m4tZtyR2
	cdsA==
X-Gm-Message-State: AMke39nD3YZGi7bAMYRdQfe9VAV7tQzjwuEUTmDHpMtiQ38tEDZoXCQ/ENBCL44Gs0EsKLrLKGM1hKbwINnuOTt3
X-Received: by 10.237.62.232 with SMTP id o37mr7705852qtf.188.1487347162756;
	Fri, 17 Feb 2017 07:59:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 07:59:02 -0800 (PST)
In-Reply-To: <1f3643c5e63b1771dc73c89b8f69e794944bf284.1487329062.git.Qi.Chen@windriver.com>
References: <cover.1487329062.git.Qi.Chen@windriver.com>
	<1f3643c5e63b1771dc73c89b8f69e794944bf284.1487329062.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 15:59:02 +0000
Message-ID: <CAJTo0LZp8hqN6huAWAJmjhmBnpvO9FCTAm7_renpBN8OocVO_w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] sudo: upgrade to 1.8.19p2
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
X-List-Received-Date: Fri, 17 Feb 2017 15:59:23 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e4b60800548bbff22

--001a11406f0e4b60800548bbff22
Content-Type: text/plain; charset=UTF-8

On 17 February 2017 at 10:59, Chen Qi <Qi.Chen@windriver.com> wrote:

> -LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=c16e542408abda013d672be8eb88d174
> \
> +LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=f600a47c2a2cdde5899e449607810ed1
> \
>

Please remember to explain why this was changed.

Also, this changing on an upgrade kind of makes the point of the .inc/.bb
split meaningless, so feel free to merge them.

Ross

--001a11406f0e4b60800548bbff22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 February 2017 at 10:59, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4xk" class=3D"a3=
s aXjCH m15a4bba4f7c12d92">-LIC_FILES_CHKSUM =3D &quot;file://doc/LICENSE;m=
d5=3D<wbr>c16e542408abda013d672be8eb88d1<wbr>74 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://doc/LICENSE;md5=3D<wbr>f600a47c2a2cdde58=
99e449607810e<wbr>d1 \<br></div></blockquote></div><br>Please remember to e=
xplain why this was changed.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Also, this changing on an upgrade kind of makes the =
point of the .inc/.bb split meaningless, so feel free to merge them.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a11406f0e4b60800548bbff22--
