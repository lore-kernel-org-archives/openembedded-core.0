Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id D02F765CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 10:00:07 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id x130so8608585ite.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 03:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+eRVBNI4UbLtofhGZXWJo19WWkEIF2I6GwkPRKnT04M=;
	b=kIgspdMFtwi8np7e0Fes2R4qfC3iC4/PeRItVYuMdZPgTcwkQQlhxkwyj81FN4fubT
	sCz/4qVHXx9jrRDCng0SawZaWajB+IS+P5JjlxwL3bn5tkbB/Jad86Tm2U6Jz4BiQjI+
	V4rQKBTrtiEqc8pqfCggX1OZxY4VBTyfiuDk7Cp1sjVPUNqB980ImXdFpAyrdD4Mhcig
	td3u28pulJfXfNcRTjsNtm3cny5HhyUOgnCHdNKYZMQHd8+d7tPGmAYzkHVLdBl4WHG2
	RGWLSha00tKdtfLZiQ+f/teCjlXcwDeSq/b8IbCJjCpjdcNXYnCw21VgpUt33Gmc7LM3
	YoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+eRVBNI4UbLtofhGZXWJo19WWkEIF2I6GwkPRKnT04M=;
	b=l5zEd35+WVlZE+7I1/cMKzmINAsN9Iok1evTLrQtvbTBUN/KEVIrTojvlGAl76hpDa
	K/Mc4iwNGXacHtGjEdvOacn9m4SchCEjdrqYdc6VTh6QVo/YXb6fn5/XBeQLdyeOFnB1
	0tRMzcdmBhpC/xsiNpZkM437veEnytkvN91PH9TjcHCyFC4b73+o7dlgKfFc/PWJrsY9
	Q25hE8qvsaTZsf5Zz/ccZCZVdn7NWQzZf/H4vymAv2dAL+uLRW09iekZ57NOLcGuZm2c
	Vt+S5W2sc5D9zdB4bmmYgYL2OeCCXbG+iTRvTPCXYUDbq+aRhSbXl5bSgYcuXMKuiWd/
	zgMA==
X-Gm-Message-State: AEkoouunX63xf/J7NDDv1EDaLHSCfoMPPnz3SNk6SWhNkUrf4M5hlOTV/kIDKmlGtLmMkZEnGt7rTn8ol/McyC0Z
X-Received: by 10.36.20.75 with SMTP id 72mr22615672itg.83.1470736807750; Tue,
	09 Aug 2016 03:00:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 9 Aug 2016 02:59:47 -0700 (PDT)
In-Reply-To: <1470170722-9101-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1470170722-9101-1-git-send-email-humberto.ibarra.lopez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 10:59:47 +0100
Message-ID: <CAJTo0LaaHoJgHC40zoNTkXuG6CpcELmmQz6XRm_pQgCSTTcJ0w@mail.gmail.com>
To: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-selftest: reorganize syntax to use subcommands
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
X-List-Received-Date: Tue, 09 Aug 2016 10:00:08 -0000
Content-Type: multipart/alternative; boundary=001a11446942fc14540539a09888

--001a11446942fc14540539a09888
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 21:45, Humberto Ibarra <humberto.ibarra.lopez@intel.com>
wrote:

> The current syntax of oe-selftest is messy. This patch reorganizes it in a
> clearer way by grouping all functions in a 'run' subcommand and a 'list'
> subcommand.
>

This breaks the AB as the commands it invokes don't work anymore.  Is there
a plan to migrate the autobuilder to support both the old and new commands?

Ross

--001a11446942fc14540539a09888
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 August 2016 at 21:45, Humberto Ibarra <span dir=3D"ltr">&lt;<a href=3D=
"mailto:humberto.ibarra.lopez@intel.com" target=3D"_blank">humberto.ibarra.=
lopez@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":37c" class=3D"a3s aXjCH m1564d0002bf6b6a6">The current syntax of o=
e-selftest is messy. This patch reorganizes it in a clearer way by grouping=
 all functions in a &#39;run&#39; <span class=3D"il">subcommand</span> and =
a &#39;list&#39; <span class=3D"il">subcommand</span>.</div></blockquote></=
div><br>This breaks the AB as the commands it invokes don&#39;t work anymor=
e.=C2=A0 Is there a plan to migrate the autobuilder to support both the old=
 and new commands?</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a11446942fc14540539a09888--
