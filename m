Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4434579472
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 22:27:32 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id b15-v6so5927223oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=FM+nfU/+/mFSjXYUvrTt84SW30A4EMw3DxKJA1LswgQ=;
	b=PhPranfU1h7sXigucITCm0FvrkTO/xPWKVQpY1eSYgWv90DWCPegMr89kEHf+8Xjy4
	L2lyCN6NHgGMh0a6h8n8sgeGniMuuK7nuxBWZvTItSCN0a5l98Y8PeYeqOuBdcPHE/L+
	cvfRe0QDzn9GSBMKDueD8+ZRWR7CEBgk+OSDimf3wlEQFxyvHEV+MzsRsHgUPcVI9ADM
	JQMB3D1afFI/fuU0lN4fU8gPvnTIOSTNH6ucjAPeM8hmw9sr1M7o1KZze7tpFnRSTGZT
	5x4JyziVlyWB4yDApx6xjyye4PwVSH6+EIjShsmxkiUYNYYZQRyyPNZ8VBCewiOaPCQw
	379A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=FM+nfU/+/mFSjXYUvrTt84SW30A4EMw3DxKJA1LswgQ=;
	b=FVxRgpX5RQMNiPusZfCSGyupMKUPVHVuAJDjSXSZXEwTzYZIWPpx9DQoFomFQkZ0zN
	22tkuMlOk8jLdezRfn34qNbMMEJSB+B56A0yD0/gYobSBFBg+ovLedUopOaFyzKPhrqm
	JKitCNAi9i7yjmHU1w0kX9vKbJ4fr6tuObjaQVLQXh3oYYOi0iTzoAUWqPdJwFYCjFSN
	hTdIIMMFny7rr5HMx6hDjQ5/lzaHWghwtDw5I6fWm8FwfgNd61yWtv/56EdN628TkKri
	MXE7Xni1NOiTrOWjoxO7Y0J9fllI8qbQPzG01zwOuMh9lx0iWpnULiR6hRHnjW6kxN6N
	UPMg==
X-Gm-Message-State: APzg51DkXoVUjO8YXyHnOvXm1XVt2orcj3COHnK0grDLWlnBPkIKzFm9
	syZAaxe25zqytfOLU/d+kVMShdCiceQYeAU2FHXtwudW
X-Google-Smtp-Source: ANB0VdaOYXZRFAlGrgjYYbMkKlAdFIBbsn2BIo1T/bIuxTFypSPG6xP/UrCO2LmNr6T/f8imgFZNoeZfEtFhYLgeDkA=
X-Received: by 2002:aca:4e4d:: with SMTP id
	c74-v6mr6239468oib.16.1534976852862; 
	Wed, 22 Aug 2018 15:27:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 15:27:32
	-0700 (PDT)
In-Reply-To: <CALbNGRRML_TnWOCC_=XTGB7dHe4bAk_YMw-GXZG97SwgpkJNzQ@mail.gmail.com>
References: <CALbNGRRML_TnWOCC_=XTGB7dHe4bAk_YMw-GXZG97SwgpkJNzQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 Aug 2018 00:27:32 +0200
Message-ID: <CALbNGRSZHzFS-EbBVYhKSvUjRq2dHjyEZzPLqr6_-uky1RRCwA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Face some linker errors recently
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
X-List-Received-Date: Wed, 22 Aug 2018 22:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2018 at 12:17 AM, Andreas M=C3=BCller
<schnitzeltony@gmail.com> wrote:
> Hi,
>
> to test my patches, I moved my layers from sumo to recent master and
> see similar linker (=3Dgold) errors in different recipes. Up to now
> there are:
>
And

meta-qt5-extra/krita:
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexe=
c/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld:
warning: discarding version information for __cxa_finalize@GLIBC_2.4,
defined in unused shared library <...>/recipe-sysroot/lib/libc.so.6
(linked with --as-needed)
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexe=
c/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld:
error: treating warnings as errors
collect2: error: ld returned 1 exit status

won't post further - promised :)

Andreas

