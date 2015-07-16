Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 98E0E75FB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:47:36 +0000 (UTC)
Received: by qgep37 with SMTP id p37so37739576qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 12:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=H3hLJ3CWeEWIdos4/tCz6I526+DGk2nuOk9eWcaBM3E=;
	b=VvCd/Zb62TRd4cBrx1yDo0LGnpGCLYkiqgYt9RKIX1qm+TCPe3UM2e9TU7XrajlG98
	D1ZK0UamjHmGTqFEddh9zBrIKbLJVVYSamdyLihAKc21SagwLNnDi8iUg5r+EEPuAwjM
	jq6umOaMl/sT2R1n+QD37g6r4IUOWf0JbGwFlIQOJtMbHc6ucld2Mj07xRZxNrWT+tby
	bSRckXdCBoVMBxvMkxbpCM70Zuzs2THdAZTLsDM4X3mKQlD+1eOt8pQXIBieJHij55yZ
	RBBUCP3YL7rkhboBHWXMaBIe+g0Qayh4psTqdNlNYecIvtzIRTnz1fLIt4AsHjsYxmNI
	T8Mg==
X-Gm-Message-State: ALoCoQkKEMlX7yytkhFTL6r4Z9sr3h0wZC/AZ6xPFXV5YrAo0SBvSwYijp6mBQgzT+YPsHxDv4VE
X-Received: by 10.55.18.197 with SMTP id 66mr20249360qks.13.1437076056313;
	Thu, 16 Jul 2015 12:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 16 Jul 2015 12:47:16 -0700 (PDT)
In-Reply-To: <55A7EE13.50203@linux.intel.com>
References: <1436970934-4635-1-git-send-email-daniel.alexandrux.istrate@intel.com>
	<55A7EE13.50203@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jul 2015 20:47:16 +0100
Message-ID: <CAJTo0Lb_-LCaPyiRAE5n3DNMerGvDZz=J=qfKG3+KChJbi_h3w@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added one runtime testcase in connman.
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
X-List-Received-Date: Thu, 16 Jul 2015 19:47:42 -0000
Content-Type: multipart/alternative; boundary=001a11474faada240c051b035796

--001a11474faada240c051b035796
Content-Type: text/plain; charset=UTF-8

On 16 July 2015 at 18:46, Randy Witt <randy.e.witt@linux.intel.com> wrote:

> If multiple instances of connmand can run, is that not a bug it connmand
> rather than in our configuration? I'm asking because it seems like this
> would be more suited as a connman test that would be part of ptest.
>

The test doubles as "did connman start" (for images in which connman is
expected to be present).  With sufficiently broken kernels, connman will
exit on startup (this test exists for a reason...)

Ross

--001a11474faada240c051b035796
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 July 2015 at 18:46, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2u8=
" class=3D"a3s" style=3D"overflow:hidden">If multiple instances of connmand=
 can run, is that not a bug it connmand rather than in our configuration? I=
&#39;m asking because it seems like this would be more suited as a connman =
test that would be part of ptest.<br></div></blockquote></div><br>The test =
doubles as &quot;did connman start&quot; (for images in which connman is ex=
pected to be present).=C2=A0 With sufficiently broken kernels, connman will=
 exit on startup (this test exists for a reason...)</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11474faada240c051b035796--
