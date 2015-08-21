Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5D46060557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:23:52 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so47701096qge.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=P0RxHW1EiYEubBrxnszWfyjWtHuGuG9xmovZvbUERuE=;
	b=mTShPOWplWSN4vV5/p0EJg5nAKbTzVPswIsRXR8Y5ijeMIRpEydCxOMF6H+xnIK1FS
	hvXKME6H4VrcrFIQ6ba0hUC/95eDePyhVQxVQiPQn9aJj0NCebs+tofZMS/cJFFfTiTW
	1TOUQHukZiQLzH7zAfDXUN2WcxvwlDgi7TRUcARviR87bZfVICV2GRx0YRDoJyNkMCYV
	bBilC7+VvWvC319XHqARS20F5Yr1F3hXM7eRSZw4g0P9YAcg1sALRh8J2SK0ySQngq+M
	0ipixMD4z1HNwQlW0Ln5H8MZUUsWiwjCVjyw7ByMjo3rf7Ts1v5mWHuc8K28ktSb/lSr
	euqg==
X-Gm-Message-State: ALoCoQkc0cdMORxqVE53DAFiQxlhxUpzBfrOkusGxhPZC7peBEli3oM6FBPQhXr82bREs0WW08HI
X-Received: by 10.140.194.145 with SMTP id p139mr19466019qha.84.1440167032856; 
	Fri, 21 Aug 2015 07:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 21 Aug 2015 07:23:33 -0700 (PDT)
In-Reply-To: <1440164504.12105.235.camel@linuxfoundation.org>
References: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
	<CAJTo0LaUCLZdZZU8R6qo6N=a3h2o2ZYbQB-c2P3DMS4en2+UMg@mail.gmail.com>
	<1440164504.12105.235.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 15:23:33 +0100
Message-ID: <CAJTo0LakzBcU_V-6_Biuck4vdbX9+iUxB4hWNKCemBNzWxX7qQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Try to fix qemu freezing due to full socket buffers
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
X-List-Received-Date: Fri, 21 Aug 2015 14:23:54 -0000
Content-Type: multipart/alternative; boundary=001a114323f0693c37051dd304dd

--001a114323f0693c37051dd304dd
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 14:41, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> It was meant to fix the issue where qemu hangs and stops responding to
> network requests. Its a useful datapoint that the systemd issues remain
> though. Was there a systemd upgrade in mut out of interest (as another
> data point)?
>

There's still plenty of builds so lets see what happens...

There wasn't a systemd in that MUT, no.

Ross

--001a114323f0693c37051dd304dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 August 2015 at 14:41, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D=
"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdi=
e@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":9cw" class=3D"a3s" style=3D"overflow:hidden">It was meant to=
 fix the issue where qemu hangs and stops responding to<br>
network requests. Its a useful datapoint that the systemd issues remain<br>
though. Was there a systemd upgrade in mut out of interest (as another<br>
data point)?</div></blockquote></div><div class=3D"gmail_extra"><br></div>T=
here&#39;s still plenty of builds so lets see what happens...</div><div cla=
ss=3D"gmail_extra"><br>There wasn&#39;t a systemd in that MUT, no.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a114323f0693c37051dd304dd--
