Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id ADDF672CAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:42:04 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so8750844qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ezq1rDSXYPKPCW9axf5okPQTLXLeC6FEx99hVeMCd5M=;
	b=mUVjtQuMzpHUGQJII2ICTtQAzwDhCE0sK9EySKmwozTSDnEt0WUGwm573M4haTlpMC
	iV8vgt4tgjftJggSJFD7rNaEvzng/qgX8ovAC1z9P7rQeqEPk8kEuWtecu7AhI3Z4lUZ
	NeIUJnzUwa1vg2IrJW4ZaalEt/mAvlJpu8qjoX1ZeH0GERTEDnKB/+5edieuup+HoKcU
	L6a2sGSvLsKxcbXo+6tjy1ZM1cea7d7hiz4WmFOsJKUdY/KN6ToFOvq39Ezk0D3VlZM5
	dl3yLjiQ9MYzeUYuKaUWhwoZBZndPEG5VHZqjBEalmZIe9XO5zzcs9PCydV6CFfe2m7N
	VF9Q==
X-Gm-Message-State: ALoCoQkgptQwHzwcIWRpKiMZvjixK4S2okai8ypkw/47EYrUpqTn7ziGEpDtmMtQ7Z4mMHWnHLJ2
X-Received: by 10.224.92.205 with SMTP id s13mr59643509qam.52.1421772124537;
	Tue, 20 Jan 2015 08:42:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 08:41:44 -0800 (PST)
In-Reply-To: <54BE7EC4.2080000@mlbassoc.com>
References: <1421677219-27316-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaKbxT+9p=Er9wQvy_4Agd9R6vCoCJKaTdx+qH2vwhWqg@mail.gmail.com>
	<54BE7EC4.2080000@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 16:41:44 +0000
Message-ID: <CAJTo0LYRKLypohXXFfAS_+3XLYyvCSCB5kE1WRFrpW670LbXTQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl: Backport fix for bug #123591
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
X-List-Received-Date: Tue, 20 Jan 2015 16:42:13 -0000
Content-Type: multipart/alternative; boundary=089e015375e46f615c050d181ecf

--089e015375e46f615c050d181ecf
Content-Type: text/plain; charset=UTF-8

On 20 January 2015 at 16:13, Gary Thomas <gary@mlbassoc.com> wrote:

> This needs to be Signed-off-by.
>>
>
> By whom?  There is no Signed-off-by in the perl commit.


By you, along with the Upstream-Status.  We like to know in five years time
who added a patch.

Ross

--089e015375e46f615c050d181ecf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2015 at 16:13, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D""><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">This needs to be Signed-off-by.<br>
</blockquote>
<br></span>
By whom?=C2=A0 There is no Signed-off-by in the perl commit.</blockquote><d=
iv><br></div><div>By you, along with the Upstream-Status.=C2=A0 We like to =
know in five years time who added a patch.</div><div><br></div><div>Ross</d=
iv></div></div></div>

--089e015375e46f615c050d181ecf--
