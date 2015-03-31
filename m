Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6F5724DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:03:39 +0000 (UTC)
Received: by qgep97 with SMTP id p97so27738937qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2gYOPclCBz7lUcE+I3XywZmgwJjFHN/fS8GVj7ZF6fI=;
	b=m5zbUAx8UP2MixNj5Qt8XImuPvyau4IJA7awhL0E04QnqbLhuhn2BBD70+0pvdm0Ph
	vYForJqq8wJ/cpidhfwPO+WT7h/TR6o7h4cKRhHHhTkFcXPyWQbBx+IG64knNQFWHxzg
	9tl4lzS4MQqABNTh5nS6Jm+KejOA/EPD9FHcARwRCf0SbdkIAInF2j7LJczsPpRIRYww
	o0Uu/Fqkmom+diWiH71pKiqe+CgoqI0VR6y4WaI0oLajIArkxA7Ih6EYM8xqsNC/C0I7
	oWg6WTsiC5C7RVsRu3ZXIxuO0RydaTvFXjqN6dskYrzAGg3N45wCBFZnGRWKBtOaO81M
	YHrQ==
X-Gm-Message-State: ALoCoQmHOpKvNlM9CEz24PNOmCD8yQiQBOedsXaUGfnMDSw1DL4VfVEs03Lu5ohYdg9EbCSnZBKP
X-Received: by 10.55.15.30 with SMTP id z30mr82215724qkg.87.1427839420797;
	Tue, 31 Mar 2015 15:03:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 15:03:20 -0700 (PDT)
In-Reply-To: <17800ae49667ee311ccc15a539dae026674efc35.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
	<17800ae49667ee311ccc15a539dae026674efc35.1427832505.git.elizabeth.flanagan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 23:03:20 +0100
Message-ID: <CAJTo0LaiuNTsn6h0pZWeOtpX8Ph4XMz3WoCRG1w2WYqK-ronOA@mail.gmail.com>
To: Beth Flanagan <elizabeth.flanagan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] distrodata.bbclass/distro_check.py: Fix splits
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
X-List-Received-Date: Tue, 31 Mar 2015 22:03:40 -0000
Content-Type: multipart/alternative; boundary=001a113ad6487947f305129cc569

--001a113ad6487947f305129cc569
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 21:11, Beth Flanagan <elizabeth.flanagan@intel.com>
wrote:

> +        if pnstripped.find("-native") != -1:
>

Shouldn't this be .endswith() or .startswith() to prevent false-positives?

Ross

--001a113ad6487947f305129cc569
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2015 at 21:11, Beth Flanagan <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:elizabeth.flanagan@intel.com" target=3D"_blank">elizabeth.flanagan@in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:42r" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if pnstripped.find(&quot;-native&quot;) !=3D -1:<br></div></blockquote></di=
v><br>Shouldn&#39;t this be .endswith() or .startswith() to prevent false-p=
ositives?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a113ad6487947f305129cc569--
