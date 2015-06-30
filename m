Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 24CA475C54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 09:45:09 +0000 (UTC)
Received: by qkei195 with SMTP id i195so2220544qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 02:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t1T40kiZZkA4fPdZYoMKY++JqRIMfTbaWhjfo4bxEbg=;
	b=PlfeKxKQCEex71Oic48bhL+CM0a77o5MCPBwvutoB/02ZmWwauEhTe6s3/X7cw8aqT
	ca4vyb9n7wxxdEIRu2oCh5jCDlYDoY7ErMsgI6Tl3RAo+vIlzVXCuX5x8VB5v0mVM4+y
	uIrzq/JKDa0hjg3JUvks0GaQC/vR6/1iMArtmN1Yam8HAd37Bpsg0b66uWMvn9lr3t64
	9RnFGqYl4BRBCjwwERXZM4UqhOpr/E3HduEGTWt1Z4aT3/GUIpin1/UBMKnwCWrRyCl+
	0j5sUeZhheRkcFk4/Z5+KIQ+FGJWyJ9BRwEKEu58pYh5AyMYWHCY1iqcbKPma9/8+TEc
	zQTg==
X-Gm-Message-State: ALoCoQnyD0ZN0y1/ui2ztBUdgoNT3veRlmB5VycXAQ5f/udvsyyyZQ/SYROe1iYuzx2PIHzv+NnG
X-Received: by 10.55.23.86 with SMTP id i83mr41046154qkh.100.1435657510652;
	Tue, 30 Jun 2015 02:45:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 02:44:50 -0700 (PDT)
In-Reply-To: <5591E548.8090706@gmail.com>
References: <5591E548.8090706@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 10:44:50 +0100
Message-ID: <CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 09:45:11 -0000
Content-Type: multipart/alternative; boundary=001a11470c8af123050519b90f61

--001a11470c8af123050519b90f61
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 01:39, akuster808 <akuster808@gmail.com> wrote:

> eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke mariadb in
> meta-oe.
>
> DOes  the person who updated cmake need to fix this or the person who is
> feeling the pain will be fixing it ?
>

Depends on what the breakage is really.  Can you provide build logs?

Ross

--001a11470c8af123050519b90f61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2015 at 01:39, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1kd" class=3D"a3s" =
style=3D"overflow:hidden">eo-core commit f8661aa &quot;cmake: Upgrade 2.8.1=
2.2 -&gt; 3.2.2&quot; broke mariadb in meta-oe.<br>
<br>
DOes=C2=A0 the person who updated cmake need to fix this or the person who =
is feeling the pain will be fixing it ?<br></div></blockquote></div><br>Dep=
ends on what the breakage is really.=C2=A0 Can you provide build logs?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a11470c8af123050519b90f61--
