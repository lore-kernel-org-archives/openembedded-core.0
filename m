Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 223FF7D6F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 10:08:38 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id b29so1372825lfq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 03:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=cMaSxmSxI31sdlTmrmqye7Z1VC/Rmw1GckjBCWiTwy4=;
	b=hI9hsv9Ek/arUbOmzTfY7kS+sdSRGIMrzw9hXT1/PDKfwYwz4rcMzhgpPLnshYT50h
	iTkpn1xr8FTSrxFvlRcFbvw8BMqseVO5aj4ZV1Om/8mlmA8v1tkOCGa2OSnqwT/nzDrV
	V80rNnDUQTV3VAY5N4VrlZJSXFN/iBmpW5NTe+9RwUAafSRGU8oXlsLZAEoM/riPd+e5
	nOEBbufbUHsJFu9wan5MJmrla6TDbXMTy0jsOmBYYP6WcAxDlgqbf6S/ZJUy2viW5Pf9
	iZnC1FoJKXWfB0Gq1FHrU5eauOfThta8DYaT22kcnuc31QwxaCdCbrlHBUumzIvEzaK+
	1XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=cMaSxmSxI31sdlTmrmqye7Z1VC/Rmw1GckjBCWiTwy4=;
	b=e8xv+BrrmzH6a/OTFG5bHpUQZcgRVKEg7yzvf3B0WpzdZ5MsD2ggfxdLP52U2DgCiI
	4vYGLYZvUizCa4lafxQlvI8fTLEUz4aj5n038p2KCYY/33p7UkDQHEXfdPuK8GpODHfW
	FF5nxbxbQCyiKWSwFBj1EBOXDrIJP/Da/rT+89AwNXaShw+UrLdBImM0TuYCMTEz3B53
	nLoSdI+fatWoKTssMmk1ElUaGGoM+iym3H9rybYd9AhlZa8VfkeCw7bz/RHBE+2WZ9SF
	851JzNRl4Ik4xVyWbbwub98FajjP4Cojs/1XB52I48mfqX8NaMxmrie8dCRk2jm524vz
	d7DQ==
X-Gm-Message-State: APjAAAX4wLc4EwmJP/WgDPL+5IBOzyol47w+8cc+b0RHRlYtuVsHZWB2
	hFvikzP2ydFvGOtfMLMbpha8vbo+8E65bo1Uz2Q/X6EV
X-Google-Smtp-Source: APXvYqx2GEIgVaeX9i25pcSiiMJX/PnYiKL3Io4G1VQYfGsAFjALyYVkwnHPGZYKuN20LrM3atl1xvtA3PmZnUlMsao=
X-Received: by 2002:a19:6b05:: with SMTP id d5mr1411763lfa.24.1562148519131;
	Wed, 03 Jul 2019 03:08:39 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 3 Jul 2019 22:08:34 +1200
Message-ID: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Wed, 03 Jul 2019 10:08:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to setup sstate-cache in Artifactory so that multiple
Linux host systems can share it.

Once build finished in one Linux machine, I uploaded all of
sstate-cache directory to Artifactory

Then I configured sstate mirrors in local.conf
SSTATE_MIRRORS ?= "\
file://.* https://artifactory.com/yocto/sstate-cache/PATH;downloadfilename=PATH
\
"
But when the build started, it didn't used anything from the sstate
mirror and ended up building everything

Am I missing something?

Thanks
Ankur

