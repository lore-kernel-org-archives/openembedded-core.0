Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5A46872A23
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Apr 2015 21:41:15 +0000 (UTC)
Received: by qkx62 with SMTP id 62so12095381qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Apr 2015 14:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CfqGJVzXNfW2rC0UinvrVP3/6pCeSErHVXYhk74itn8=;
	b=P9nHtsJBKbpZmLbForbK25zy+VN7LhM6g1n+nDqF7diHh/qyBXSroZ6bgLrv3Y/Yds
	aaPQlumvyHTOBpddKDIPCmmYXbmb4slG2IpCfrq451mW4eVJTqHkXJNZFts//DgXj31C
	IkZ7lInS6GYa3rFnfrYtPjwLT5PN2pH9gMqG5HTi0mqQ7RmXpCLxrbzX2lbBsP2dEfUi
	0YIaya3aP/9rsBIRLPIhRFIrwj6EnoAp37T67T0VaeMngjhhkncUj/SF4j/WHobr4eYw
	lZXdjH5WcUADtnhnRdb84UBA2VgvhSFlQUvIVb8G6AL5XS9cIBuwyw1Sid/y3h4tJOWe
	zeuQ==
X-Gm-Message-State: ALoCoQmqqu89A7U6YAlRr86h9mCjoqsWj052/J+9BkQweu6O43MA9iLwDz5QE7h1vsLCNh/0VDne
X-Received: by 10.140.149.150 with SMTP id 144mr14262092qhv.16.1428270076718; 
	Sun, 05 Apr 2015 14:41:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Sun, 5 Apr 2015 14:40:56 -0700 (PDT)
In-Reply-To: <90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 5 Apr 2015 22:40:56 +0100
Message-ID: <CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Sun, 05 Apr 2015 21:41:18 -0000
Content-Type: multipart/alternative; boundary=001a113577e29106ef0513010ab6

--001a113577e29106ef0513010ab6
Content-Type: text/plain; charset=UTF-8

On 3 April 2015 at 15:13, Cristian Iorga <cristian.iorga@intel.com> wrote:

> -# Define a variable that expands to the recipe (package) providing core
> -# bluetooth support on the platform:
> +# Define a variable that expands to the recipe (package) providing
> +# core bluetooth support on the platform:
>  # "" if bluetooth is not in DISTRO_FEATURES
> -# else "bluez5" if bluez5 is in DISTRO_FEATURES
> -# else "bluez4"
> +# else "bluez4" if bluez4 is in DISTRO_FEATURES
> +# else "bluez5"
>

That wasn't the behaviour that 1.8 sets.  We think we should continue to
respect the bluez5 DISTRO_FEATURE and add it to DISTRO_FEATURES_BACKFILL.

Ross

--001a113577e29106ef0513010ab6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 April 2015 at 15:13, Cristian Iorga <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":98" cla=
ss=3D"a3s" style=3D"overflow:hidden">-# Define a variable that expands to t=
he recipe (package) providing core<br>
-# bluetooth support on the platform:<br>
+# Define a variable that expands to the recipe (package) providing<br>
+# core bluetooth support on the platform:<br>
=C2=A0# &quot;&quot; if bluetooth is not in DISTRO_FEATURES<br>
-# else &quot;bluez5&quot; if bluez5 is in DISTRO_FEATURES<br>
-# else &quot;bluez4&quot;<br>
+# else &quot;bluez4&quot; if bluez4 is in DISTRO_FEATURES<br>
+# else &quot;bluez5&quot;</div></blockquote></div><br>That wasn&#39;t the =
behaviour that 1.8 sets.=C2=A0 We think we should continue to respect the b=
luez5 DISTRO_FEATURE and add it to DISTRO_FEATURES_BACKFILL.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113577e29106ef0513010ab6--
