Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 89061732B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 15:15:29 +0000 (UTC)
Received: by qgep100 with SMTP id p100so47964111qge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ghlx+VHbLBKEnqTqtykw9qGtQaynvg2GrbQV0CywwHo=;
	b=HebbBu1TY0CMiqAFxlvSHDgQs8VrLLAUjX9ojkUR0NxcRXsLVtSIUIWzh/UinTPMHV
	zny1ayjOzuHxQCy1MjEvT+85/3BaClRWZmBUQ4pJePY7reecIlFzgmsDfFa+FA6+ap/N
	+ZKKpciQpnMa5fGpEABEf2lNF/sDgZTd/LXJ3i+h6L6Z8eEe4FRKPbXrIPMrfNcXx+Ry
	3NyD9F3MKzfCUBrR76RigtORfknHYST0qZDE/QqwGDVut20HfWoCOD8XOESqfZJ4XgrW
	PUKqaKRTX773OdaXltmLww9QaWsET+VXpqbqB/4Sd3PdlO5e0ARNllYYH+zsQnU+X8zS
	clGw==
X-Gm-Message-State: ALoCoQn4AC7cXaIww1xT1+YR8IZzWZr3km4dCq6HkyXnCxW6HG6KBOPNfKv0DTa8gJ15jzhpTOQ1
X-Received: by 10.55.40.18 with SMTP id o18mr33408694qkh.58.1433776530141;
	Mon, 08 Jun 2015 08:15:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 8 Jun 2015 08:15:09 -0700 (PDT)
In-Reply-To: <1433354849-16843-8-git-send-email-juro.bystricky@intel.com>
References: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
	<1433354849-16843-8-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Jun 2015 16:15:09 +0100
Message-ID: <CAJTo0LbT2pH3HBQz0RXkf_UqVj4oCv8TthkvGRTC8LtgU=2LCw@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] core-image-minimal-vms: new recipe to build images for VM
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
X-List-Received-Date: Mon, 08 Jun 2015 15:15:32 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8c44be20518031c18

--001a11440fb8c44be20518031c18
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 19:07, Juro Bystricky <juro.bystricky@intel.com> wrote:

> Simple recipe that builds core-image-minimal in both supported VM formats:
> VDI (VirtualBox) and VMDK (VM player)
>

I'm not convinced we need this in oe-core as it's just a IMAGE_FSTYPES
assignment in local.conf for the end user.

Ross

--001a11440fb8c44be20518031c18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 19:07, Juro Bystricky <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1yg" cla=
ss=3D"a3s" style=3D"overflow:hidden">Simple recipe that builds core-image-m=
inimal in both supported <span class=3D"il">VM</span> formats:<br>
VDI (VirtualBox) and VMDK (<span class=3D"il">VM</span> player)</div></bloc=
kquote></div><br>I&#39;m not convinced we need this in oe-core as it&#39;s =
just a IMAGE_FSTYPES assignment in local.conf for the end user.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11440fb8c44be20518031c18--
