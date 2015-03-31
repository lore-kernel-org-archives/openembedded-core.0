Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id DE6B773C86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:14:26 +0000 (UTC)
Received: by qgep97 with SMTP id p97so26718957qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 14:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LIBeiLRgJt/57BygqbTI4BoFBOzdZ4q3+MkDTchE880=;
	b=gH0J4/cyiBTLrW1Y7PYMd9ywkUKNdHR5mCcObPe1VSM8IvWccuqmvrM4ZfZb0nodpX
	HIumIqAndGs4e1PLVxH8sM2+BYU5ezG47c58QLKSQt1N6z0EYejYTC97IwcbMRiM94xk
	Z1p0EPLvnzn/eTToOQ1M0yFxYwmSPTEuKGThlJKnvaGeVAUQwJ4joMufMBqoF55C6cD0
	1PoaoSuLsQqCfV4KW+cjqYfxs63R673vLHfyVAWtGyL3Z4kHSCSar49NWcdhAY4F5PZG
	2j5tk8lnSnOAelKR9XtWBYkLkDGVcE2Mt5LzzwjdYTTCzoXAdN0/FigJQXRPUZVBnrqA
	OCJA==
X-Gm-Message-State: ALoCoQmZmhopgJjYqW5tCf35gun/4QYLuD2NPPIyHrjb0qc9pwK8819oyqQGV6wNomiQqv+VFcNp
X-Received: by 10.55.31.10 with SMTP id f10mr83499278qkf.58.1427836467616;
	Tue, 31 Mar 2015 14:14:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 14:14:07 -0700 (PDT)
In-Reply-To: <87ego6e4ou.fsf@weregild.amer.corp.natinst.com>
References: <1418864567-9676-1-git-send-email-rich.tollerton@ni.com>
	<CAJTo0LYWAET6K0zr8ALGByjryEe8zV_kmTkkdVjXV-aTwxajFA@mail.gmail.com>
	<87ego6e4ou.fsf@weregild.amer.corp.natinst.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 22:14:07 +0100
Message-ID: <CAJTo0LZ6hgVt0gsgNfd_rvtn_gn2syUPugx+f00eVPN2x0-uzw@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal: Disable shopt errexit
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
X-List-Received-Date: Tue, 31 Mar 2015 21:14:29 -0000
Content-Type: multipart/alternative; boundary=001a1147ebda7332c005129c151c

--001a1147ebda7332c005129c151c
Content-Type: text/plain; charset=UTF-8

On 30 March 2015 at 19:11, Richard Tollerton <rich.tollerton@ni.com> wrote:

> Running `false` interactively doesn't test this behavior because `sh -e`
> explicitly excludes interactive shells from consideration [1] [2].
> You'll need to inject a `false` into run.do_terminal in order to
> reproduce this.
>

I'm clearly not understanding how this behaviour is a problem then.  What
broke?

Ross

--001a1147ebda7332c005129c151c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2015 at 19:11, Richard Tollerton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1dv" cla=
ss=3D"a3s" style=3D"overflow:hidden">Running `false` interactively doesn&#3=
9;t test this behavior because `sh -e`<br>
explicitly excludes interactive shells from consideration [1] [2].<br>
You&#39;ll need to inject a `false` into run.do_terminal in order to<br>
reproduce this.</div></blockquote></div><br>I&#39;m clearly not understandi=
ng how this behaviour is a problem then.=C2=A0 What broke?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147ebda7332c005129c151c--
