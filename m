Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.7689.1626960176865434529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 06:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qIC29VEA;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id a17-20020a17090abe11b0290173ce472b8aso4282105pjs.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=RUiNpexCrgwKVGg66ufLtKaTj4AAbyXJhzZ0AJK7A44=;
        b=qIC29VEAwcF/tIdFy+hGSINoawG1TqNokBBt6cLEDEk6nrYb+aBgjLFburU+kcQnM/
         EyI3wp9VNQ+pH4DqqGBndCPHL2JAvqBvDZd1lUQKxh0YEvE+WjRATGk/mzAFdt4kvWM9
         xlFx775To+gqlFaH1RLhL0Ozbrj+Zv8x6V0gPvygtNtOZuB8ok6E/ny7w94fHazXwu7A
         A/Wzp/RHu/5cfvyZsXlombz/j8isJieXh5AiOqXYUIKdvXxPFx4h2qot4Gxqn7KrvAA9
         dzUGS26GGFUaSzDn0TUsO59gfEuIADAvXW69k06mKVbcltfaJ9ohjBtYBHDQmiTsCFym
         SY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RUiNpexCrgwKVGg66ufLtKaTj4AAbyXJhzZ0AJK7A44=;
        b=RrU4hApvN/x5BRAn/gMsDC2tf9nswfLyvmOnjmdJCrwEEyNGnwEPxEbUoeYrD0EUMY
         RZVC/QdT12YeFSKOxN7NBfOo6j/S4NFOmVZNNyBqUfYYmhRB5fvP0Xrj8yn6QFYEj37m
         2Vd3F1T7FQBsufeKPy2CghM9dD+dnCnjDdFJP0iwVXGo8J2uKUVXMXxngthwlbrX1kan
         ThBAZ3wRjDkkjODRyrdKfWT0zs1A97++CoW5a3T+YzccbsTqSHqJWtSkhUkoKKWdXL3y
         SaqC0zNFLfq3TEAslIR5tg+wDZsCIAT7+eFlIqstr1lslmkhQ35oBfJjAQhNaMjynLPR
         IrIg==
X-Gm-Message-State: AOAM532RherU1HAM7UPFcbs7rqVaz1Yr0krJuUmX/Og9IHniMmHsEvkC
	A95t+iUioVscbBVITNed0v5kWTmHgf0=
X-Google-Smtp-Source: ABdhPJz/k+/rijXb5TQsD/FGn07VuOQPNmRtKUQX9BDIk53BaSRGl6d8BAXgkY0vGBqtbwNak3WU4A==
X-Received: by 2002:a63:f556:: with SMTP id e22mr40991543pgk.189.1626960175979;
        Thu, 22 Jul 2021 06:22:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:246c:f330:abd1:7add? ([2601:202:4180:a5c0:246c:f330:abd1:7add])
        by smtp.gmail.com with ESMTPSA id 78sm22315091pfw.189.2021.07.22.06.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 06:22:55 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 4/4] yocto-check-layer: ensure that all layer dependencies are tested too
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
 <20210722124644.19962-5-nicolas.dechesne@linaro.org>
 <CADkTA4MfOnbxF5c9MyfD79r_pmN0Yw4KH6Gx5mjSR1nYkA9Wgg@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <f18aa33a-6ebb-8f1a-e047-6d97d441773c@gmail.com>
Date: Thu, 22 Jul 2021 06:22:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MfOnbxF5c9MyfD79r_pmN0Yw4KH6Gx5mjSR1nYkA9Wgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/22/21 6:16 AM, Bruce Ashfield wrote:
>
>
> On Thu, Jul 22, 2021 at 8:47 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@linaro.org>> wrote:
>
>     In order to be compliant with the YP compatible status, a layer also
>     needs to ensure that all its dependencies are compatible
>     too. Currently yocto-check-layer only checks the requested layer,
>     without testing any dependencies.
>
>
> Is that actually written into our compliance statements ? (that
> dependency layers must also be compliant)
>
> I had never heard that before, and in my opinion, that will actively
> encourage people to copy recipes if they want to be compliant but a
> dependent layer is problematic.

Yes it is. 

-Armin
>  
>
>
>     With this change, all dependencies are also checked by default, so the
>     summary printed at the end will give a clear picture whether all
>     dependencies pass the script or not. 
>
>     Using --no-auto-dependency can be used to skip that.
>
>
> I'd actually prefer the opposite, to make the compliance runs faster
> by default, versus someone having to find out about this option later.
> We already get complaints about check layer speed, and doing more by
> default won't help on that front.
>
> Bruce
>
>  
>
>     Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org
>     <mailto:nicolas.dechesne@linaro.org>>
>     ---
>      scripts/yocto-check-layer | 19 ++++++++++++++++++-
>      1 file changed, 18 insertions(+), 1 deletion(-)
>
>     diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
>     index a179240fd0..e3a4c940ec 100755
>     --- a/scripts/yocto-check-layer
>     +++ b/scripts/yocto-check-layer
>     @@ -24,7 +24,7 @@ import scriptpath
>      scriptpath.add_oe_lib_path()
>      scriptpath.add_bitbake_lib_path()
>
>     -from checklayer import LayerType, detect_layers, add_layers,
>     add_layer_dependencies, get_signatures, check_bblayers
>     +from checklayer import LayerType, detect_layers, add_layers,
>     add_layer_dependencies, get_layer_dependencies, get_signatures,
>     check_bblayers
>      from oeqa.utils.commands import get_bb_vars
>
>      PROGNAME = 'yocto-check-layer'
>     @@ -51,6 +51,8 @@ def main():
>                  help='File to output log (optional)', action='store')
>          parser.add_argument('--dependency', nargs="+",
>                  help='Layers to process for dependencies',
>     action='store')
>     +    parser.add_argument('--no-auto-dependency', help='Disable
>     automatic testing of dependencies',
>     +            action='store_true')
>          parser.add_argument('--machines', nargs="+",
>                  help='List of MACHINEs to be used during testing',
>     action='store')
>          parser.add_argument('--additional-layers', nargs="+",
>     @@ -121,6 +123,21 @@ def main():
>          if not layers:
>              return 1
>
>     +    # Find all dependencies, and get them checked too
>     +    if not args.no_auto_dependency:
>     +        depends = []
>     +        for layer in layers:
>     +            layer_depends = get_layer_dependencies(layer,
>     dep_layers, logger)
>     +            if layer_depends:
>     +                for d in layer_depends:
>     +                    if d not in depends:
>     +                        depends.append(d)
>     +
>     +        for d in depends:
>     +            if d not in layers:
>     +                logger.info <http://logger.info>("Adding %s to
>     the list of layers to test, as a dependency", d['name'])
>     +                layers.append(d)
>     +
>          shutil.copyfile(bblayersconf, bblayersconf + '.backup')
>          def cleanup_bblayers(signum, frame):
>              shutil.copyfile(bblayersconf + '.backup', bblayersconf)
>     -- 
>     2.29.2
>
>
>
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> 
>

