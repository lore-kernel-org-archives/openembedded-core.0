Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 94543758F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:20:23 +0000 (UTC)
Received: by qkhp85 with SMTP id p85so8358897qkh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 04:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EyRPS2XKoA/t53hm573G1YfXodooB4l5f3SBS7T+Oi0=;
	b=eES9rSZaT/bf//qu5RzX+H1o9zHMLwBIIQ9XpPuZlL/unwQmw2ytfu5AI8eEyCKbIK
	ucizxleEjQnoxVCDs/oDmAvDeuEQNy/de1hyQWlpP2H20Jdyepnmt5QreLZzpGypMvCi
	id2taQiwnn1R2OxF0oH9eFycUjkyo2unTUn5jIqrJ0MFU37K+O4KwkfDBJWOO4wjmbJ1
	Md6xyo2kyPDv0Zb7ZLk4o1KXzfzivfSmgqya0lJmYupU1/Sql+VHbhhoPSLcEsOawn7T
	p2rzJzC1RExXgs+4oODn4MTiHkWm20LWokvlCsw4NJDf8r9rBkGtnqvERnArU/Mg+u4z
	5wXQ==
X-Gm-Message-State: ALoCoQnqE/xOdoP9cnaFiVzAaiic4VNd52ozGf6x+IpMmOQn1cmT0tL+3N06vAA/ZP07dWLajh8a
X-Received: by 10.55.18.155 with SMTP id 27mr29566117qks.36.1434108024936;
	Fri, 12 Jun 2015 04:20:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 12 Jun 2015 04:20:04 -0700 (PDT)
In-Reply-To: <1434089587-1641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1434089587-1641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jun 2015 12:20:04 +0100
Message-ID: <CAJTo0LYBLLf9oBJdc=Yzabs=aMWdXkpJk2pobi=Wg=8QJ2-msQ@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: Modify it to support for gdbreplay.
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
X-List-Received-Date: Fri, 12 Jun 2015 11:20:26 -0000
Content-Type: multipart/alternative; boundary=001a114737966586af0518504b7d

--001a114737966586af0518504b7d
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 07:13, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> gdbreplay is not installed by default,so install it.
>

As upstream don't install it, and from what I can tell from google it's an
aid for debugging gdbserver itself, why should we install it?

Ross

--001a114737966586af0518504b7d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2015 at 07:13, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
xin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2po" class=3D=
"a3s" style=3D"overflow:hidden">gdbreplay is not installed by default,so in=
stall it.<br></div></blockquote></div><br>As upstream don&#39;t install it,=
 and from what I can tell from google it&#39;s an aid for debugging gdbserv=
er itself, why should we install it?</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a114737966586af0518504b7d--
