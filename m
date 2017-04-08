Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id E5420601A5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Apr 2017 10:14:40 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id y18so5969361itc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Apr 2017 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=khj52lNKxSxg0VsOFO/VKDjZsfM0o4AUSCCZ0hmDp7k=;
	b=tHYYh5aVIitJIVzy6Zvj5hN+nXYcndO4PkITqSnrwamwRM68/uK1c0ta0lIaGF0ry4
	7TQEUr72vMaMI5H81/LSSkVosUGObagiRb6e7/F78RmhjKafjpItUaxEBKJNzp87CTOM
	3NnW+HGql81cM+Tlz9xcMtbr3hNEmTAdUfvPqLKJy9i3Ymjk9m9jdetkvu/O/xGJFQFg
	6ZTNFJIbnmz/LqquAcDJsWuu2wYNS6LoGaVB2Cy7McenXrj+2bQFRRXbCEU6bhz6s+kO
	UbcQ3TovNlOSk/KCGKD3fchzBCP2FkXc+Eh3lbmv1GDp6wfM2hPff+Ebl1NEXpy6XHQe
	9HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=khj52lNKxSxg0VsOFO/VKDjZsfM0o4AUSCCZ0hmDp7k=;
	b=PkLuFgeNHSBCHDPMAVv/cgiCVSm+2pQ6x4w2E36Gm/Kg9Lf5yicmVeUKftLhxEqnNu
	pxIogQhU8HxCJwVfSaCCksxqhgPp7FyRnM0hYjmU367UOZQUN/rSPR3wxzeg3zERa1d6
	W4jZ9jlJWtVJ/43QapogXVYSR10bYl5UK/K59usesORiT8Z4HYOx0nDMmSEBNmXH1ivR
	gUtM9LBw32Kv96BESmCA/YVu/8/Vr6hRp7kFVlxvpNZNjiw+QLn5M6DmUuczjB9DleJH
	dgf63hgNNAPyFsdLWaC0cUtX8pyhQMAlvO9iAjrytj4/6N3R0V7SIlRiw849XU0svsiT
	Pj9Q==
X-Gm-Message-State: AN3rC/5evSCEVTyS9Fhi6xIGtjpT817aoS1wDmp5ejnF6Vy0/4nSJj/C
	6UH79JzOjiVbOlfO5FQ=
X-Received: by 10.36.47.142 with SMTP id j136mr3528322itj.29.1491646481255;
	Sat, 08 Apr 2017 03:14:41 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E696.dip0.t-ipconnect.de. [93.232.230.150])
	by smtp.gmail.com with ESMTPSA id m71sm812546itg.14.2017.04.08.03.14.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Apr 2017 03:14:39 -0700 (PDT)
Message-ID: <1491646475.10884.82.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 08 Apr 2017 12:14:35 +0200
In-Reply-To: <ad9558050d220e86e62faabc3439132d272b5ac1.1491583077.git-series.patrick.ohly@intel.com>
References: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
	<ad9558050d220e86e62faabc3439132d272b5ac1.1491583077.git-series.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 5/5] yocto-compat-layer: test signature differences when setting MACHINE
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
X-List-Received-Date: Sat, 08 Apr 2017 10:14:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-07 at 18:38 +0200, Patrick Ohly wrote:
> +    parser.add_argument('--additional-layers', nargs="+",
> +            help='List of additional layers to add during testing',
> action='store')
>      parser.add_argument('-n', '--no-auto', help='Disable auto layer
> discovery',
>              action='store_true')
>      parser.add_argument('-d', '--debug', help='Enable debug output',
> @@ -82,6 +86,7 @@ def main():
>      if not layers:
>          logger.error("Fail to detect layers")
>          return 1
> +    additional_layers = detect_layers(args.additional_layers,
> args.no_auto)
>      if args.dependency:
>          dep_layers = detect_layers(args.dependency, args.no_auto)
>          dep_layers = dep_layers + layers
> @@ -128,7 +133,15 @@ def main():
>  
>          shutil.copyfile(bblayersconf + '.backup', bblayersconf)
>  
> -        if not add_layer_dependencies(bblayersconf, layer,
> dep_layers, logger):
> +        missing_dependencies = not
> add_layer_dependencies(bblayersconf, layer, dep_layers, logger)
> +        if not missing_dependencies:
> +            for additional_layer in additional_layers:
> +                if not add_layer_dependencies(bblayersconf,
> additional_layer, dep_layers, logger):
> +                    missing_dependencies = True
> +                    break
> +        if not add_layer_dependencies(bblayersconf, layer,
> dep_layers, logger) or \
> +           any(map(lambda additional_layer: not
> add_layer_dependencies(bblayersconf, additional_layer, dep_layers,
> logger),
> +                   additional_layers)):
>              logger.info('Skipping %s due to missing dependencies.' %
> layer['name'])
>              results[layer['name']] = None
>              results_status[layer['name']] = 'SKIPPED (Missing
> dependencies)'
> @@ -140,8 +153,11 @@ def main():
>          logger.info('Getting initial signatures ...')
>          td['builddir'] = builddir
>          td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
> +        td['machines'] = args.machines
>  
> -        if not add_layer(bblayersconf, layer, dep_layers, logger):
> +        if not add_layer(bblayersconf, layer, dep_layers, logger) or
> \
> +           any(map(lambda additional_layer: not
> add_layer(bblayersconf, additional_layer, dep_layers, logger),
> +                   additional_layers)):

Note to myself: this --additional-layers argument should be in its own
commit, and the additional layers need to be added before obtaining the
initial signatures. Otherwise the test_signatures does not test the
changes introduced by the layer under testing, but also all these
additional layers.

That's not the intention - the additional layers basically represents
what's already in a distro before adding the new layer.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




