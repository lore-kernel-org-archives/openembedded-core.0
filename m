Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4605765C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 17:35:01 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id dc16so11927947qab.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XlnlCcNhcjJ3PBS23ViK0kPbW1U27CvEV7zQP961nJE=;
	b=Or9XkyCeJ260Iyom1BcTokaLtzFhwW1jcmJzPu+EsyQQJuhbzfP6UsvAUvw4e+SDQ6
	DW1c5ZRfNuV8nQIIOs1n8nDu13UVXgd3Ibmffud/CsgzNbDnHSq9eXef49UTD5Z79Dub
	2OvD4iMnSldPzLvozypJTBqcWgnyCaWE4lLcr5G0J1YTCfpFwhOkvRdpffo2CBzWqJpX
	/4j+2dRMo0YHAZiYpQxgUDqyGvViiHsKJiaGgwBaBK2HaHy2uzMfrVJKLo7eFWO87Dkb
	oO6EEvnFLJGxa8gfSJa6TbizNIph/XdbEh1f4Q+k61ELDWtbROcfg0DkbkPKGa6t2i3J
	MgIA==
X-Gm-Message-State: ALoCoQmBzq2IodNDSws2NMRVMN3S9IgzoHBPLZgwblXUqU5FSE9KpKfA0OqNgDiH0N2Tk5q7FC+C
X-Received: by 10.140.94.246 with SMTP id g109mr12763489qge.77.1415986502306; 
	Fri, 14 Nov 2014 09:35:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 14 Nov 2014 09:34:42 -0800 (PST)
In-Reply-To: <54663213.9030709@pabigot.com>
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>
	<1414861479-5493-2-git-send-email-pab@pabigot.com>
	<CAJTo0LZMvL-7bTvf_ou6PHmMpZXa81GWb3murA6t5EfceQXOow@mail.gmail.com>
	<54663213.9030709@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Nov 2014 17:34:42 +0000
Message-ID: <CAJTo0LanDSZdnmxx9hBJsdrug2JHr_Ln2VeDQGXvPzb3JUp0RA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] pseudo: default --without-passwd-fallback
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
X-List-Received-Date: Fri, 14 Nov 2014 17:35:07 -0000
Content-Type: multipart/alternative; boundary=001a113a81d67a26d70507d50cfa

--001a113a81d67a26d70507d50cfa
Content-Type: text/plain; charset=UTF-8

On 14 November 2014 16:47, Peter A. Bigot <pab@pabigot.com> wrote:

> Interesting.  I have several theories.
>
> Can you tell me where to find the exact configurations and scripts
> necessary to replicate what the autobuilder is doing?
>

The yocto-autobuilder git repository has the autobuilder configurations (in
buildset.controller, iirc), which should be enough to tell you want the key
variables were.

Thanks,
Ross

--001a113a81d67a26d70507d50cfa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2014 16:47, Peter A. Bigot <span dir=3D"ltr">&lt;<a href=3D"=
mailto:pab@pabigot.com" target=3D"_blank">pab@pabigot.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":5qy" class=3D"a3s" style=
=3D"overflow:hidden">Interesting.=C2=A0 I have several theories.<br>
<br>
Can you tell me where to find the exact configurations and scripts necessar=
y to replicate what the autobuilder is doing?</div></blockquote></div><br>T=
he yocto-autobuilder git repository has the autobuilder configurations (in =
buildset.controller, iirc), which should be enough to tell you want the key=
 variables were.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</div></div>

--001a113a81d67a26d70507d50cfa--
