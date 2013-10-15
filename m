Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 55D516CBAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 09:44:13 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id p14so54125vbm.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 02:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0mqoptRN3zB4s8Nmt45J2bUrk4ooZDoJaTXe09/sVDc=;
	b=Sfqoug78cvD/dMdssl1WZcCUQGjJb/o+L3D/kQNG4sKqIUTmJG30atmMJAvzcznWk2
	jKv7ojqdgMZ+vb8xFzK74KsyRiQa5LiAeVyujvWD0izIMrnst+NM0/JqnuMi4taBTSCI
	7smA8hnGPGZpYq4X6ZKLIyNcqBsIfi/zIoLGi8Y7mmOa3TjvSmkv1HOdV7l0hKyh5Xdp
	eVB0/Gdlsva2l0d39c2qqBcSfkFIJezsKxS7v5w2piYciNjGWtlTa5Y3RZtd7BF3Ufzs
	BK8Mb52WVKYH0OxESk+KzXAJji4maykVt+ggzo22a3/4qX+nElWMa0RNoA64090jtoDP
	uzEA==
X-Gm-Message-State: ALoCoQkiD4yp/pR+cTn2mpxl2CnSkFSqxer6YyeG2WDveS4gxui8eIM2fHgMTCmYh/5UlsYRv0yy
X-Received: by 10.58.254.200 with SMTP id ak8mr11504938ved.12.1381830254893;
	Tue, 15 Oct 2013 02:44:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 15 Oct 2013 02:43:54 -0700 (PDT)
In-Reply-To: <CAGNsrLAXyqZn38bY5WU=YcpOF4xhn0B+OA4Lr55cD=iQmKza4w@mail.gmail.com>
References: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
	<1381168150-25518-2-git-send-email-ross.burton@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C495AA@IRSMSX105.ger.corp.intel.com>
	<CAGNsrLAXyqZn38bY5WU=YcpOF4xhn0B+OA4Lr55cD=iQmKza4w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Oct 2013 10:43:54 +0100
Message-ID: <CAJTo0LYLUmi7_sL2zgveVhS3RaKJ90roc7HccATJ8mGca1pSQg@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
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
X-List-Received-Date: Tue, 15 Oct 2013 09:44:15 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2013 09:37, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> it fails to build on Aarch64:
> | gdbusprivate.c: In function 'write_message_print_transport_debug':
> | gdbusprivate.c:2164:12: error: format '%lu' expects argument of type
> 'long unsigned int', but argument 2 has type 'gssize'
> [-Werror=format=]
> |             g_type_name (G_TYPE_FROM_INSTANCE
> (g_io_stream_get_output_stream (data->worker->stream))));
> |             ^

I don't have any aarch64 hardware to test on, can you work with
upstream to get a fix and submit it here?

Ross

