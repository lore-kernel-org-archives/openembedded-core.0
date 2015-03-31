Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE3E73C86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:50:26 +0000 (UTC)
Received: by qcay5 with SMTP id y5so13688196qca.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 06:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QiH4YyZJsHDmLjSB7My5gbamSyX7M7LUf5PONMwk9Q8=;
	b=VrVF/8jJFlDnar4fmWpNS41WwI65MmoXGWJvzbePSDlzkZ5Y17LLI7bpoKNJ4CdX/Q
	9/uZMxphV4w0ENSZ5i0wHj4Y8zpGE61WLvxPCSwGR1LxdChg0sS5GI8d8ggjPkXFSwsI
	VYbCalQNfggSyx/jiPWTUVh+Jz9FNAZs3zJ8uknU3HfU5ZXHjSXv26WbudmgUzYtFJC3
	zZJoow7eZ/dLBH0mKI2gA+KV2wShlX3sgV38uR4otr+NbvT7BCmNZiEvUzNrgVJqleoA
	XixSURsvKwHhFmJKkVEGisTkWuoYEP5Q4JOXcfE6gg7t00Vr4Rjlc4Ap0pw6YqU4R+nQ
	09yw==
X-Gm-Message-State: ALoCoQkdGvaHrl6GxjtUTYLs0p3qToThEscX2Iu2vXDpa+60mv7XNkzpIJNWCfsa6fL7IDZc3VLm
X-Received: by 10.229.96.194 with SMTP id i2mr49674111qcn.1.1427809827749;
	Tue, 31 Mar 2015 06:50:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 06:50:06 -0700 (PDT)
In-Reply-To: <87d23uibxw.fsf@email.parenteses.org>
References: <87d23uibxw.fsf@email.parenteses.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 14:50:06 +0100
Message-ID: <CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Tue, 31 Mar 2015 13:50:27 -0000
Content-Type: multipart/alternative; boundary=001a1133b6b4971bf1051295e1c5

--001a1133b6b4971bf1051295e1c5
Content-Type: text/plain; charset=UTF-8

On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br>
wrote:

> Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
> the recipe, ./usr/lib/foo/ in the package is owned by root.
> However, its content has the right ownership.
>

Looks like a bug in pseudo to me, can you file a bug for that?

Ross

--001a1133b6b4971bf1051295e1c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 March 2015 at 17:31, Mario Domenech Goulart <span dir=3D"ltr">&lt;<a =
href=3D"mailto:mario@ossystems.com.br" target=3D"_blank">mario@ossystems.co=
m.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2a=
l" class=3D"a3s" style=3D"overflow:hidden">Note that, although I run &quot;=
chown -R foo:foo ${D}${libdir}/foo&quot; in<br>
the recipe, ./usr/lib/foo/ in the package is owned by root.<br>
However, its content has the right ownership.</div></blockquote></div><br>L=
ooks like a bug in pseudo to me, can you file a bug for that?</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1133b6b4971bf1051295e1c5--
