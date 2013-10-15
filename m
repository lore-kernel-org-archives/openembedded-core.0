Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 371276CABC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 08:37:28 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ev20so6497241lab.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 01:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=7NKyPL3hfJl2eBJ6uIW0QH1jFEnZX8zv3o/QNnsf7jM=;
	b=YD21CuIpMXDRY7bRD0crEDJfUDpAZNRfDkmY8pIGA0yzTmvJ8kN7TyVGCovmC/FEST
	4nAB0x18aBfo/IT7DKdQhZEmgErRFGhuNwXbF0wIOpW1Yg4rOUa+n1rQsaqO3VGui/sM
	mc/5w/Y5e4krErG8+iJIi7atMI+Fk161QeiBkPVrF6WCKHmyj3RaLVHPVIEKZjr7xs3l
	ph7TChhTJ0FuW7MlAjJgLVutcPW6rT6vJfxZECEMy8Cv0SIOTYBCN4U1HJOBU+q6hpHP
	2QqPHeAqASIHui8veL2JZMuWQWIF5bEEkivR5G2fzwFXPEXkBGL71GvxOKPARSLVSEDU
	tKZA==
X-Gm-Message-State: ALoCoQlIfOYKcW+1C3Jx6AJlzOIXxcrpf9fo6DGeyaOBXT8QT8+pD5FG3CbsoF1HgfO4hJWj2aqQ
MIME-Version: 1.0
X-Received: by 10.152.3.201 with SMTP id e9mr35284734lae.24.1381826248942;
	Tue, 15 Oct 2013 01:37:28 -0700 (PDT)
Received: by 10.112.173.66 with HTTP; Tue, 15 Oct 2013 01:37:28 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C495AA@IRSMSX105.ger.corp.intel.com>
References: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
	<1381168150-25518-2-git-send-email-ross.burton@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C495AA@IRSMSX105.ger.corp.intel.com>
Date: Tue, 15 Oct 2013 11:37:28 +0300
Message-ID: <CAGNsrLAXyqZn38bY5WU=YcpOF4xhn0B+OA4Lr55cD=iQmKza4w@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] glib-2.0: upgrade to 2.28.0
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
X-List-Received-Date: Tue, 15 Oct 2013 08:37:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 October 2013 09:31, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> Hello,
>
> This patch has been merged with incorrect version in commit description.
> Upgraded to version 2.38.0, not version 2.28.0, as in description.
> Regards,
> Cristian
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ross Burton
> Sent: Monday, October 07, 2013 8:49 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/5] glib-2.0: upgrade to 2.28.0
>
> Drop the ptest patches and instead use --enable-installed-tests, updating run-ptest to invoke gnome-desktop-testing-runner.
>
> Drop the x32 build patch, upstream has integrated a similar fix.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

it fails to build on Aarch64:
| gdbusprivate.c: In function 'write_message_print_transport_debug':
| gdbusprivate.c:2164:12: error: format '%lu' expects argument of type
'long unsigned int', but argument 2 has type 'gssize'
[-Werror=format=]
|             g_type_name (G_TYPE_FROM_INSTANCE
(g_io_stream_get_output_stream (data->worker->stream))));
|             ^

