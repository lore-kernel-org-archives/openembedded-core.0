Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6662CC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 11:31:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10277.1753356705109195044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 04:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JZdvkl8R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD113430D5;
	Thu, 24 Jul 2025 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753356702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPYSWbHRab4ah4QKDURYgiXKgb/vyPvF1MjvaseyT/Q=;
	b=JZdvkl8RT9QPRVgmGGQbNiL24f29uv7M2If3j0BgMjVaAjF0GJg6hO51fvjERcmLFjRj9v
	r6Vmy3QkpeNybKiSuI388H97e7rt9Wdp/8hwLUxpD7A3faALQZsQKsyPh5Fq6VwyHLs/7o
	+56cxac79jiZQcMvVavnEdqywATrB4J8/tWCq3YkyOsQ/xnV4ul68odV2bpEkChFFCNU98
	zsz9TUasUh06rxYduzSG9VqzQyDN3l9Bc9PyVhLyh+n7GmKfi9lKlnwfiL/zIbwTiT5LX9
	Y3Xu0iP74rlXL4OPGvuXd1iAHTYQg4dxjiADqE5vtoFA6tJ3kj7BvmNFbu1SEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 13:31:41 +0200
Message-Id: <DBK92SO5MCU9.32B6IBVN2OYFW@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mingli.yu@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/4] babeltrace2: Enable python plugins
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250724092814.4183226-1-mingli.yu@eng.windriver.com>
 <20250724092814.4183226-2-mingli.yu@eng.windriver.com>
In-Reply-To: <20250724092814.4183226-2-mingli.yu@eng.windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeuiefghfeuueetheetjeekfefgiedtteegkeehjeetgeduheelveegfffhveejnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdplhhtthhnghdrohhrghdpfhhivghluggplhhotggrthhiohhnrdhphidpghhrrghphhdrphihpdhphigpphhluhhgihhnrdhphidptghlohgtkhgptghlrghsshdrphihpdgvvhgvnhhtrdhphidpmhgvshhsrghgvgdrphihpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmehfuggrvdemugekfegrmeehtggrvgemjeejudgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmehfuggrvdemugekfegrmeehtggrvgemjeejudgspdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmr
 ghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhinhhglhhirdihuhesvghnghdrfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220835

On Thu Jul 24, 2025 at 11:28 AM CEST, Mingli via lists.openembedded.org Yu =
wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * The lttng-tools test fails as below as it needs bt2 module.
> ERROR: ust/high-throughput/test_high_throughput_snapshot.py
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Traceback (most recent call last):
>   File "/usr/lib/lttng-tools/ptest/tests/regression/./ust/high-throughput=
/test_high_throughput_snapshot.py", line 26, in <module>
>     import bt2
> ModuleNotFoundError: No module named 'bt2'
>
> Enable python plugins for babeltrace2 to provide the above support.
>
> * Add swig-native to DEPENDS to fix the below configure error.
>  | configure: error: SWIG 2.0.0 or newer is required to build the python =
bindings
>
> * There are some ptest failed cases after enable python plugins and
> track the failed ptest as https://bugs.lttng.org/issues/1430.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---

Sorry, forgot some errors: we also have packaging issues at build time:

ERROR: babeltrace2-2.1.1-r0 do_package: QA Issue: babeltrace2: Files/direct=
ories were installed but not shipped in any package:
  /usr/lib/python3.13/site-packages/bt2-2.1.1-py3.13.egg-info
  /usr/lib/python3.13/site-packages/bt2/stream.py
  /usr/lib/python3.13/site-packages/bt2/field_location.py
  /usr/lib/python3.13/site-packages/bt2/graph.py
  /usr/lib/python3.13/site-packages/bt2/py_plugin.py
  /usr/lib/python3.13/site-packages/bt2/clock_class.py
  /usr/lib/python3.13/site-packages/bt2/event.py
  /usr/lib/python3.13/site-packages/bt2/message.py
  /usr/lib/python3.13/site-packages/bt2/local_typing.py
  ...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2088
https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/2089


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


