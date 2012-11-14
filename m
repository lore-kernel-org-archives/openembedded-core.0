Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYec8-0007il-GV
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:10:53 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Nov 2012 06:56:50 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so1883196oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 06:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=4WUUSmDiwlv5tTiruXkttlxvvLobedom18cAhCaafHw=;
	b=fE+D2yTp1sgJtxJl08h3Xs36k6ozEKnsuM+fK5Y4Bo71azoezr3baTdB+XrhWlWOvc
	BgjmYX3fw57RoxNLToFfdnYHctnhJ0Eldeb/kMSKDPIaG1x9jx0pR6esI9QZHE9BGB8Q
	aMxGss3xOOHNLN+TusZpwTZ8YH0ARE9XY3xzAXoTIdT66gIfs1mP35x511zQFS4l3bb7
	26xtAUuMU9RewAABOt+TaCtCoEPParvfgYXQnIq0mBbr9Xj6i+S0T9cBed6Lqwt2ilBx
	Yd59yvNgecIi7PuC42qMWOZisN3JalYOWMhY8Kj4ONhc9nb9007F88It1VRaa08XKpzO
	LR7A==
Received: by 10.182.31.13 with SMTP id w13mr21298841obh.29.1352905009053;
	Wed, 14 Nov 2012 06:56:49 -0800 (PST)
Received: by 10.182.31.13 with SMTP id w13mr21298829obh.29.1352905008785; Wed,
	14 Nov 2012 06:56:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Wed, 14 Nov 2012 06:56:27 -0800 (PST)
In-Reply-To: <f819ea4994858356c0f33c7b754ae85a11b764b9.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<f819ea4994858356c0f33c7b754ae85a11b764b9.1352898505.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2012 14:56:27 +0000
Message-ID: <CAJTo0LafpqVfYPSmO4aYDKZyenrr+w5WQvPOhRMRyZ4wRXjYJA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQn2K1yNr2H78DdGym+qdoLKC654FbgCMtgOOwDxgnEqgKeHSEXp11Q1qg59UG78adL2w6jEZq4MY4hgIfAOA3/I84ccDfwgyffCTiXH3lA81sWS3sKtwfuc7eJceDg9fgPfBnUXKR178iLjWgnbBoQHinME/UGPeO1kRT1pF4MKYaAlCgyhNDuxwWVT7VA0Sqkt45Eo
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 07/12] libdrm: upgrade to 2.4.40
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 15:10:53 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 13:21, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Other changes:
>  * removed a backported patch;
>  * activated libdrm-omap helper layer which is needed by the latest
>    xf86-video-omap xorg driver;
>  * split libdrm-drivers package into libdrm-radeon, libdrm-nouveau and
>    libdrm-omap;
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

Acked-By: Ross Burton <ross.burton@intel.com>


