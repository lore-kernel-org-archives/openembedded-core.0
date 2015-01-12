Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id AC68A60601
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 17:48:32 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id c9so19006253qcz.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HcscxW6mqYH3stNgmVXESPTJQIu+Le6ciCrIr9GAhGE=;
	b=NnGSGBsp1zluH7kWFTKdh277Wbnv6hPMeuByIJZndRNkOm4O39rFFYf70qCybclgeK
	aljj8sxYAKDg7Bzx+IyOeow9nfyAW+fJKET5wsnDM8dszamDTbOUWuanlJOG1eupz6d7
	2cD98LNeiqFt3/ThNS6Zy84EN3i5CDtylwv0CaeUT/nl0SHg3L6sZ+FXyoz4KyXji6lF
	fHk2cefBBcpZe3lmjysEK2hMrNlcPS53Zzg6khlxxamnz8PYJyQzhTzDgiDOtpxQIF9z
	+/ulDLr7WaB3Scj238nAmYzSyUYD11SwCwCIWm1P2DIEo9HJwCkXYm5z/011tDxJmyjH
	JoBw==
X-Gm-Message-State: ALoCoQkbIsk/D95xuMyrNRUguUR6iD+cShSUFKSzi0HNH5+Eei2NbmlurYlmWTee+U7kNg1yoPMO
X-Received: by 10.140.92.138 with SMTP id b10mr48493269qge.59.1421084912518;
	Mon, 12 Jan 2015 09:48:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 12 Jan 2015 09:48:12 -0800 (PST)
In-Reply-To: <08467c89129431bc4873964cf09e7ff865e74ae2.1421021113.git.liezhi.yang@windriver.com>
References: <cover.1421021113.git.liezhi.yang@windriver.com>
	<08467c89129431bc4873964cf09e7ff865e74ae2.1421021113.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Jan 2015 17:48:12 +0000
Message-ID: <CAJTo0LbrY6CRJWJOif8F1hxfHxfkdjZXqMe7x-KjcoYNV3ob7Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gnu-efi: upgrade to 3.0.1
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
X-List-Received-Date: Mon, 12 Jan 2015 17:48:43 -0000
Content-Type: multipart/alternative; boundary=001a113a5d5e681ca2050c781d04

--001a113a5d5e681ca2050c781d04
Content-Type: text/plain; charset=UTF-8

On 12 January 2015 at 00:06, Robert Yang <liezhi.yang@windriver.com> wrote:

> * Use the official src rather than debian.
> * It doesn't have a general license file, the license is embedded in the
>   files, which are GPLv2+ & BSD.
> * Supported aarch64 and arm.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

Both you and Saul have submitted this upgrade, but they're both different:
Saul drops patches that don't need to be applied anymore, and Robert
changes the COMPATIBLE_HOST assignment.  Can one of you create a One
Upgrade To Rule Them All and re-submit? :)

Ross

--001a113a5d5e681ca2050c781d04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 January 2015 at 00:06, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1im" clas=
s=3D"a3s" style=3D"overflow:hidden">* Use the official src rather than debi=
an.<br>
* It doesn&#39;t have a general license file, the license is embedded in th=
e<br>
=C2=A0 files, which are GPLv2+ &amp; BSD.<br>
* Supported aarch64 and arm.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>Both you and=
 Saul have submitted this upgrade, but they&#39;re both different: Saul dro=
ps patches that don&#39;t need to be applied anymore, and Robert changes th=
e COMPATIBLE_HOST assignment.=C2=A0 Can one of you create a One Upgrade To =
Rule Them All and re-submit? :)</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a113a5d5e681ca2050c781d04--
