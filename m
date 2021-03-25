Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.56.1616691107131772259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 09:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ds/gb/Mf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so3477466wmd.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+/kIsMddA8T/jlDuBNb8B+dPkZazGc2XYQ04+svXD8M=;
        b=ds/gb/Mfr144Dr44GnEYfuQo1I1OPF122h8Kp5xAk/WNQH+v0Bcdxnr1xVEj8d0Gml
         Dy7wnYyAnypt1eLYCfcEy6o0waTdH7Vx7AntmkiMi5SDp0yLt+0aeWH+79fZEGVPbyLP
         Ne8km6IVyd4Op3aaxbTvCa9CBWZ2fMc117OYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+/kIsMddA8T/jlDuBNb8B+dPkZazGc2XYQ04+svXD8M=;
        b=hY+YvZqmPWR59goDrvTwhLR7n17mS4v3rScz750LO3qEaLW30et1OszGpoSF+of2A+
         iRUWTPWo/PViMUNZSpraUQtFrgF5yFyrCB5vroxYdG756LCQ+af8vmUuQm4Qx+AwKuTH
         XLyDjvH1gLdM2olhuXvbMhqJDZNZtdrSvH2gF7MbyrmMk1EZYqPTKXq99uCiV+eZSHn+
         UCmytu/m0KGjUFt35XepqLtxcUWJ/PHTWaFneMqJPNyqByVhUhN2o3BhDv6ODZxTd2ix
         PJsfyZjiYVufy90WaUwoRljb10LxlvtE7t8G8DsIjygNZL0ztiiCQFM10hgsZYTsxDg1
         p+1w==
X-Gm-Message-State: AOAM533NTqrGeHqWgSqm4kkcUNbbZp6lm/MS2wjEnYU29ygqgbq7dyDG
	gGxNZnXkjPpgJSULqr458s7vnQ==
X-Google-Smtp-Source: ABdhPJzV1uyQoH0jqVZf9farAEpKfXR+XSJTAw9rU42j71z7epC5Y9VVNljJtkNkIg3RUDn4GQt9ZQ==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr9077373wml.147.1616691105455;
        Thu, 25 Mar 2021 09:51:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id r11sm8198103wrm.26.2021.03.25.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:51:44 -0700 (PDT)
Message-ID: <4b0c1bc6bb1ae476cdba3ce5848b0bf7008de1d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "Oleksiy Obitotskyi
	-X (oobitots - GLOBALLOGIC INC at Cisco)"
	 <oobitots@cisco.com>, Luca Bocassi <luca.boccassi@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, 
	Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 16:51:41 +0000
In-Reply-To: <bffd569338fe4f9f9e5671443d6cdbc6@XBOX03.axis.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 ,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
	 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
	 <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com>
	 <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
	 <bffd569338fe4f9f9e5671443d6cdbc6@XBOX03.axis.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-25 at 16:19 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 25 mars 2021 15:27
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Oleksiy Obitotskyi -
> > X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>; Luca Bocassi
> > <luca.boccassi@gmail.com>; openembedded-core@lists.openembedded.org
> > Cc: bluelightning@bluelightning.org; Khem Raj <raj.khem@gmail.com>
> > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > recipe to allow bootstrapping
> > 
> > On Thu, 2021-03-25 at 14:22 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Sent: den 25 mars 2021 10:34
> > > > To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)
> > > > <oobitots@cisco.com>; Luca Bocassi <luca.boccassi@gmail.com>;
> > > > openembedded-core@lists.openembedded.org
> > > > Cc: bluelightning@bluelightning.org; Peter Kjellerstedt
> > > > <peter.kjellerstedt@axis.com>; Khem Raj <raj.khem@gmail.com>
> > > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > > > recipe to allow bootstrapping
> > > > 
> > > > On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots -
> > > > GLOBALLOGIC INC at Cisco) wrote:
> > > > > Could you look into this warning.
> > > > > 
> > > > > WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-linux-
> > dev
> > > > rdepends on util-linux-libuuid-dev, but it isn't a build dependency?
> > > > [build-deps]
> > > > > 
> > > > > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226
> > > > 
> > > > That failure was my fault when testing some fixes.
> > > > 
> > > > I've sent out a patch which renames util-linux-uuid to util-linux-
> > libuuid
> > > > and sorts out the license issue Peter reported.
> > > 
> > > I don't mind the recipe being renamed and cleaned up, but I would prefer
> > > to see my entire patch for the license parts being either integrated
> > before
> > > this or squashed into it, whichever you prefer. It does not make sense
> > to
> > > use the same LIC_FILES_CHKSUM for util-linux-libuuid as for util-linux,
> > > and setting the other LICENSE variables in util-linux.inc no longer
> > makes
> > > sense as they are only relevant for util-linux.
> > 
> > I'm torn on that. Code with the other licenses is present, just not used
> > in the final output and I personally suspect that having one LIC_FILES_CHKSUM
> > is going to be easier to maintain in the future rather than two separate
> > ones.
> 
> I actually checked all the files that go into -dev and -src before suggesting 
> this change, and all files are either marked as public domain or use a 
> BSD-3-Clause license.

There is a difference between what ends up in ${S} and what ends up in the 
binary packages. LICENSE clearly governs the latter. Its the scope of 
LIC_FILES_CHECKSUM which there are differences of opinion on.

Cheers,

Richard

